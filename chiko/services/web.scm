(define-module (chiko services web)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix store)
  #:use-module (guix packages)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages docker)
  #:use-module (gnu services)
  #:use-module (gnu services admin)
  #:use-module (gnu packages admin)
  #:use-module (gnu services configuration)
  #:use-module (gnu services databases)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (gnu services docker)
  #:use-module (gnu services containers)
  #:use-module (srfi srfi-13)
  #:use-module (web uri)
  #:export (kavita-configuration
            kavita-service-type
            calibre-web-configuration
            calibre-web-service-type
            etherpad-configuration
            etherpad-service-type
            hedgedoc-configuration
            hedgedoc-service-type
            authentik-configuration
            authentik-service-type))

(define %kavita-accounts
  (list (user-account
          (name "kavita")
          (group "docker")
          (system? #t)
          (home-directory "/var/empty")
          (shell (file-append shadow "/sbin/nologin")))))

;; (define %netbird-postgresql-role
;;   (list (postgresql-role
;;          (name "netbird")
;;          (create-database? #t))))

(define-configuration/no-serialization kavita-configuration
  (image
   (string "jvmilazz0/kavita:latest")
   "")
  (port
   (number 5000)
   "")
  (data-directory
   (string "/var/lib/kavita")
   "")
  (time-zone
   (string "Asia/Shanghai")
   "")
  (log-file
   (string "/var/log/kavita.log")
   ""))

(define kavita-activation
  (match-record-lambda <kavita-configuration>
      (data-directory log-file)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "kavita")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))
          (let ((sub-dirs '("/manga"
                            "/comics"
                            "/books"
                            "/config")))
            (for-each (lambda (sub)
                        (unless (file-exists? (string-append #$data-directory sub))
                          (mkdir-p (string-append #$data-directory sub))
                          (chown (string-append #$data-directory sub) (passwd:uid user) (passwd:gid user))))
                      sub-dirs))))))

(define kavita-oci-container
  (match-record-lambda <kavita-configuration>
      (image log-file port data-directory time-zone)
    (list (oci-container-configuration
            (user "kavita")
            (group "docker")
            (image image)
            (provision "kavita")
            (log-file log-file)
            (respawn? #t)
            (ports `((,(number->string port) . "5000")))
            (environment `(("TZ" . ,time-zone)))
            (volumes
             `((,(string-append data-directory "/manga") . "/manga")
               (,(string-append data-directory "/comics") . "/comics")
               (,(string-append data-directory "/books") . "/books")
               (,(string-append data-directory "/config") . "/kavita/config")))))))

(define kavita-service-type
  (service-type
    (name 'kavita)
    (extensions
     (list (service-extension account-service-type
                              (const %kavita-accounts))
           (service-extension log-rotation-service-type
                              (compose list kavita-configuration-log-file))
           (service-extension activation-service-type
                              kavita-activation)
           (service-extension oci-container-service-type
                              kavita-oci-container)))
    (default-value (kavita-configuration))
    (description "运行Kavita服务")))

(define %calibre-accounts
  (list (user-account
          (name "calibre")
          (group "docker")
          (system? #t)
          (home-directory "/var/empty")
          (shell (file-append shadow "/sbin/nologin")))))

(define-configuration/no-serialization calibre-web-configuration
  (image
   (string "linuxserver/calibre-web")
   "")
  (port
   (number 8083)
   "")
  (data-directory
   (string "/var/lib/calibre")
   "")
  (time-zone
   (string "Asia/Shanghai")
   "")
  (log-file
   (string "/var/log/calibre-web.log")
   ""))

(define calibre-activation
  (match-record-lambda <calibre-web-configuration>
      (data-directory log-file)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "calibre")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))
          (let ((sub-dirs '("/books"
                            "/config")))
            (for-each (lambda (sub)
                        (unless (file-exists? (string-append #$data-directory sub))
                          (mkdir-p (string-append #$data-directory sub))
                          (chown (string-append #$data-directory sub) (passwd:uid user) (passwd:gid user))))
                      sub-dirs))))))

(define calibre-oci-container
  (match-record-lambda <calibre-web-configuration>
      (image log-file port data-directory time-zone)
    (list (oci-container-configuration
            (user "calibre")
            (group "docker")
            (image image)
            (provision "calibre-web")
            (log-file log-file)
            (respawn? #t)
            (ports `((,(number->string port) . "8083")))
            (environment `(("TZ" . ,time-zone)))
            (volumes
             `((,(string-append data-directory "/config") . "/config")
               (,(string-append data-directory "/books") . "/books")))))))

(define calibre-web-service-type
  (service-type
    (name 'calibre-web)
    (extensions
     (list (service-extension account-service-type
                              (const %calibre-accounts))
           (service-extension log-rotation-service-type
                              (compose list calibre-web-configuration-log-file))
           (service-extension activation-service-type
                              calibre-activation)
           (service-extension oci-container-service-type
                              calibre-oci-container)))
    (default-value (calibre-web-configuration))
    (description "运行Calibre Web服务")))

(define %webdav-accounts
  (list (user-account
          (name "webdav")
          (group "docker")
          (system? #t)
          (home-directory "/var/empty")
          (shell (file-append shadow "/sbin/nologin")))))

(define-configuration/no-serialization webdav-configuration
  (image
   (string "ghcr.io/hacdias/webdav")
   "")
  (port
   (number 6060)
   "")
  (data-directory
   (string "/var/lib/webdav")
   "")
  (time-zone
   (string "Asia/Shanghai")
   "")
  (config-file
   file-like
   "")
  (log-file
   (string "/var/log/webdav.log")
   ""))

(define webdav-activation
  (match-record-lambda <webdav-configuration>
      (data-directory log-file)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "webdav")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))))))

(define webdav-oci-container
  (match-record-lambda <webdav-configuration>
      (image log-file config-file port data-directory time-zone)
    (list (oci-container-configuration
            (user "webdav")
            (group "docker")
            (image image)
            (provision "webdav")
            (log-file log-file)
            (respawn? #t)
            (ports `((,(number->string port) . "6060")))
            (environment `(("TZ" . ,time-zone)))
            (volumes
             `((,(derivation->output-path config-file) . "/config.yml:ro")
               (,data-directory . "/data")))
            (command (list "-c" "/config.yml"))))))

(define webdav-web-service-type
  (service-type
    (name 'webdav)
    (extensions
     (list (service-extension account-service-type
                              (const %webdav-accounts))
           (service-extension log-rotation-service-type
                              (compose list webdav-configuration-log-file))
           (service-extension activation-service-type
                              webdav-activation)
           (service-extension oci-container-service-type
                              webdav-oci-container)))
    (description "运行WebDav服务服务")))

(define alist?
  (list-of pair?))

(define list-of-string?
  (list-of string?))

(define-maybe number)
(define-maybe string)

(define-configuration/no-serialization etherpad-configuration
  (etherpad
   (string "etherpad/etherpad")
   "")
  (uid
   maybe-number
   "")
  (gid
   maybe-number
   "")
  (port
   (number 9001)
   "")
  (environment
   (alist `())
   "")
  (plugins
   (list-of-string '("ep_author_neat" "ep_markdown" "ep_headings2"))
   "")
  (github-plugins
   (list-of-string '())
   "")
  (data-directory
   (string "/var/lib/etherpad")
   "")
  (time-zone
   (string "Asia/Shanghai")
   "")
  (log-file
   (string "/var/log/etherpad.log")
   "")
  (db-type
   (string "postgres")
   "")
  (db-host
   (string "172.17.0.1")
   "")
  (db-port
   (number 5432)
   "")
  (db-pass
   maybe-string
   "")
  (postgresql-password-file
   (string "/var/lib/etherpad/ppasu")
   "")
  (auto-start?
   (boolean #t)
   "")
  (restart?
   (boolean #t)
   ""))

(define etherpad-postgresql-role
  (match-record-lambda <etherpad-configuration>
      (postgresql-password-file)
    (list (postgresql-role
            (name "etherpad")
            (create-database? #t)
            (password-file postgresql-password-file)))))

(define etherpad-accounts
  (match-record-lambda <etherpad-configuration>
      (uid gid)
    (list (user-group
            (name "etherpad")
            (id (if (maybe-value-set? gid) gid #f))
            (system? #t))
          (user-account
            (name "etherpad")
            (group "etherpad")
            (uid (if (maybe-value-set? uid) uid #f))
            (system? #t)
            (comment "Etherpad")
            (home-directory "/var/empty")
            (shell (file-append shadow "/sbin/nologin"))))))

(define etherpad-activation
  (match-record-lambda <etherpad-configuration>
      (data-directory log-file etherpad)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "etherpad")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user))))
        (let ((sub-dirs '("/plugins"
                          "/var")))
          (for-each (lambda (sub)
                      (unless (file-exists? (string-append #$data-directory sub))
                        (mkdir-p (string-append #$data-directory sub))
                        (chown (string-append #$data-directory sub) (passwd:uid user) (passwd:gid user))))
                    sub-dirs)))))

(define etherpad-oci-service
  (match-record-lambda <etherpad-configuration>
      (etherpad auto-start? data-directory time-zone log-file plugins github-plugins
       port environment gid uid restart? db-host db-type db-port db-pass)
    (oci-extension
     (containers
      (list
       (oci-container-configuration
         (image etherpad)
         (network "host")
         (user "etherpad")
         (group "docker")
         (auto-start? #t)
         (provision "etherpad-plugins-update")
         (container-user (cond ((and (maybe-value-set? uid)
                                     (maybe-value-set? gid))
                                (string-append (number->string uid) ":" (number->string gid)))
                               ((maybe-value-set? uid) (string-append (number->string uid) ":etherpad"))
                               ((maybe-value-set? gid) (string-append "etherpad:" (number->string gid)))
                               (else "etherpad:etherpad")))
         (command
          `("pnpm" "run" "plugins" "i"
            ,@plugins
            ,@(if (null? github-plugins)
                  '()
                  (cons "--github" github-plugins))))
         (requirement '(networking dockerd))
         (respawn? #f)
         (log-file log-file)
         (environment `(("TZ" . ,time-zone)
                        ("DB_TYPE" . ,db-type)
                        ("DB_HOST" . ,db-host)
                        ("DB_PORT" . ,(number->string db-port))
                        ("DB_USER" . "etherpad")
                        ("DB_NAME" . "etherpad")
                        ,@(if (maybe-value-set? db-pass)
                              `(("DB_PASS" . ,(maybe-value db-pass)))
                              '())
                        ,@environment))
         (volumes
          `((,(string-append data-directory "/plugins") . "/opt/etherpad-lite/src/plugin_packages")
            (,(string-append data-directory "/var") . "/opt/etherpad-lite/var"))))
       (oci-container-configuration
         (image etherpad)
         (network "bridge")
         (user "etherpad")
         (group "docker")
         (ports `((,(number->string port) . "9001")))
         (container-user (cond ((and (maybe-value-set? uid)
                                     (maybe-value-set? gid))
                                (string-append (number->string uid) ":" (number->string gid)))
                               ((maybe-value-set? uid) (string-append (number->string uid) ":etherpad"))
                               ((maybe-value-set? gid) (string-append "etherpad:" (number->string gid)))
                               (else "etherpad:etherpad")))
         (auto-start? auto-start?)
         (provision "etherpad")
         (requirement '(networking dockerd))
         (respawn? restart?)
         (log-file log-file)
         (environment `(("TZ" . ,time-zone)
                        ("DB_TYPE" . ,db-type)
                        ("DB_HOST" . ,db-host)
                        ("DB_PORT" . ,(number->string db-port))
                        ("DB_USER" . "etherpad")
                        ("DB_NAME" . "etherpad")
                        ,@(if (maybe-value-set? db-pass)
                              `(("DB_PASS" . ,(maybe-value db-pass)))
                              '())
                        ,@environment))
         (volumes
          `((,(string-append data-directory "/plugins") . "/opt/etherpad-lite/src/plugin_packages")
            (,(string-append data-directory "/var") . "/opt/etherpad-lite/var")))))))))

(define etherpad-service-type
  (service-type
    (name 'etherpad)
    (extensions
     (list (service-extension account-service-type
                              etherpad-accounts)
           (service-extension postgresql-role-service-type
                              etherpad-postgresql-role)
           (service-extension log-rotation-service-type
                              (compose list etherpad-configuration-log-file))
           (service-extension activation-service-type
                              etherpad-activation)
           (service-extension oci-service-type
                              etherpad-oci-service)))
    (description "运行Etherpad服务")))

(define-configuration/no-serialization hedgedoc-configuration
  (image
   (string "quay.io/hedgedoc/hedgedoc:latest")
   "")
  (uid
   (number 991)
   "")
  (gid
   (number 991)
   "")
  (port
   (number 3000)
   "")
  (db-type
   (string "postgres")
   "")
  (db-host
   (string "172.17.0.1")
   "")
  (db-port
   (number 5432)
   "")
  (db-pass
   maybe-string
   "")
  (hostname
   string
   "")
  (environment
   (alist `())
   "")
  (data-directory
   (string "/var/lib/hedgedoc")
   "")
  (time-zone
   (string "Asia/Shanghai")
   "")
  (log-file
   (string "/var/log/hedgedoc.log")
   "")
  (postgresql-password-file
   string
   "")
  (auto-start?
   (boolean #t)
   "")
  (restart?
   (boolean #t)
   ""))

(define hedgedoc-postgresql-role
  (match-record-lambda <hedgedoc-configuration>
      (postgresql-password-file)
    (list (postgresql-role
            (name "hedgedoc")
            (create-database? #t)
            (password-file postgresql-password-file)))))

(define hedgedoc-accounts
  (match-record-lambda <hedgedoc-configuration>
      (uid gid)
    (list (user-group
            (name "hedgedoc")
            (id (if (maybe-value-set? gid) gid #f))
            (system? #t))
          (user-account
            (name "hedgedoc")
            (group "hedgedoc")
            (uid (if (maybe-value-set? uid) uid #f))
            (system? #t)
            (comment "Hedgedoc")
            (home-directory "/var/empty")
            (shell (file-append shadow "/sbin/nologin"))))))

(define hedgedoc-activation
  (match-record-lambda <hedgedoc-configuration>
      (data-directory)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "hedgedoc")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user))))
        (let ((sub-dirs '("/uploads"
                          "/config")))
          (for-each (lambda (sub)
                      (unless (file-exists? (string-append #$data-directory sub))
                        (mkdir-p (string-append #$data-directory sub))
                        (chown (string-append #$data-directory sub) (passwd:uid user) (passwd:gid user))))
                    sub-dirs)))))

(define hedgedoc-oci-service
  (match-record-lambda <hedgedoc-configuration>
      (image auto-start? data-directory time-zone log-file port environment gid uid restart?
       db-host db-port db-pass hostname db-type)
    (oci-extension
     (containers
      (list
       (oci-container-configuration
         (image image)
         (network "bridge")
         (user "hedgedoc")
         (group "docker")
         (ports `((,(number->string port) . "3000")))
         (auto-start? auto-start?)
         (provision "hedgedoc")
         (container-user (cond ((and (maybe-value-set? uid)
                                     (maybe-value-set? gid))
                                (string-append (number->string uid) ":" (number->string gid)))
                               ((maybe-value-set? uid) (string-append (number->string uid) ":911"))
                               ((maybe-value-set? gid) (string-append "911:" (number->string gid)))
                               (else "911:911")))
         (requirement '(networking dockerd))
         (respawn? restart?)
         (log-file log-file)
         (environment `(("TZ" . ,time-zone)
                        ("CMD_DOMAIN" . ,hostname)
                        ("CMD_URL_ADDPORT" . "false")
                        ("CMD_DB_URL" . ,(string-append "postgres://hedgedoc:"
                                                        (if (maybe-value-set? db-pass)
                                                            (uri-encode db-pass)
                                                            "")
                                                        "@" db-host
                                                        ":" (number->string db-port)
                                                        "/hedgedoc"))
                        ,@environment))
         (volumes
          `((,(string-append data-directory "/uploads") . "/uploads")))))))))

(define hedgedoc-service-type
  (service-type
    (name 'hedgedoc)
    (extensions
     (list (service-extension account-service-type
                              hedgedoc-accounts)
           (service-extension postgresql-role-service-type
                              hedgedoc-postgresql-role)
           (service-extension log-rotation-service-type
                              (compose list hedgedoc-configuration-log-file))
           (service-extension activation-service-type
                              hedgedoc-activation)
           (service-extension oci-service-type
                              hedgedoc-oci-service)))
    (description "运行Hedgedoc服务")))

(define %authentik-accounts
  (list (user-account
          (name "authentik")
          (group "docker")
          (system? #t)
          (home-directory "/var/empty")
          (shell (file-append shadow "/sbin/nologin")))))

(define-configuration/no-serialization authentik-configuration
  (image
   (string "ghcr.io/goauthentik/server")
   "Authentik Docker 镜像名称")
  (tag
   (string "2025.10.1")
   "Authentik 镜像标签版本")
  (http-port
   (number 9000)
   "HTTP 端口")
  (https-port
   (number 9443)
   "HTTPS 端口")
  (db-host
   (string "172.17.0.1")
   "PostgreSQL 数据库主机地址")
  (db-port
   (number 5432)
   "PostgreSQL 数据库端口")
  (db-name
   (string "authentik")
   "PostgreSQL 数据库名称")
  (db-user
   (string "authentik")
   "PostgreSQL 数据库用户名")
  (db-password
   maybe-string
   "PostgreSQL 数据库密码")
  (postgresql-password-file
   string
   "PostgreSQL 密码文件路径")
  (secret-key
   string
   "Authentik 密钥，用于加密会话等")
  (data-directory
   (string "/var/lib/authentik")
   "数据存储目录")
  (time-zone
   (string "Asia/Shanghai")
   "时区设置")
  (log-file
   (string "/var/log/authentik.log")
   "日志文件路径")
  (environment
   (alist '())
   "额外的环境变量，格式为关联列表")
  (auto-start?
   (boolean #t)
   "是否自动启动服务")
  (restart?
   (boolean #t)
   "容器是否自动重启"))

(define authentik-postgresql-role
  (match-record-lambda <authentik-configuration>
      (db-name db-user postgresql-password-file)
    (list (postgresql-role
            (name db-user)
            (create-database? #t)
            (password-file postgresql-password-file)))))

(define authentik-activation
  (match-record-lambda <authentik-configuration>
      (data-directory)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "authentik")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))
          (let ((sub-dirs '("/media"
                            "/custom-templates"
                            "/certs")))
            (for-each (lambda (sub)
                        (let ((dir-path (string-append #$data-directory sub)))
                          (unless (file-exists? dir-path)
                            (mkdir-p dir-path)
                            (chown dir-path (passwd:uid user) (passwd:gid user)))))
                      sub-dirs))))))

(define authentik-oci-service
  (match-record-lambda <authentik-configuration>
      (image tag http-port https-port db-host db-port db-name db-user db-password
       secret-key data-directory time-zone log-file environment auto-start? restart?)
    (oci-extension
     (containers
      (list
       ;; Server 容器
       (oci-container-configuration
         (image (string-append image ":" tag))
         (network "bridge")
         (user "authentik")
         (group "docker")
         (ports `((,(number->string http-port) . "9000")
                  (,(number->string https-port) . "9443")))
         (auto-start? auto-start?)
         (provision "authentik-server")
         (requirement '(networking dockerd))
         (respawn? restart?)
         (log-file log-file)
         (command '("server"))
         (environment `(("TZ" . ,time-zone)
                        ("AUTHENTIK_SECRET_KEY" . ,secret-key)
                        ("AUTHENTIK_POSTGRESQL__HOST" . ,db-host)
                        ("AUTHENTIK_POSTGRESQL__PORT" . ,(number->string db-port))
                        ("AUTHENTIK_POSTGRESQL__NAME" . ,db-name)
                        ("AUTHENTIK_POSTGRESQL__USER" . ,db-user)
                        ,@(if (maybe-value-set? db-password)
                              `(("AUTHENTIK_POSTGRESQL__PASSWORD" . ,(maybe-value db-password)))
                              '())
                        ,@environment))
         (volumes
          `((,(string-append data-directory "/media") . "/media")
            (,(string-append data-directory "/custom-templates") . "/templates"))))
       
       ;; Worker 容器
       (oci-container-configuration
         (image (string-append image ":" tag))
         (network "bridge")
         (user "authentik")
         (group "docker")
         (container-user "root")
         (auto-start? auto-start?)
         (provision "authentik-worker")
         (requirement '(networking dockerd authentik-server))
         (respawn? restart?)
         (log-file log-file)
         (command '("worker"))
         (environment `(("TZ" . ,time-zone)
                        ("AUTHENTIK_SECRET_KEY" . ,secret-key)
                        ("AUTHENTIK_POSTGRESQL__HOST" . ,db-host)
                        ("AUTHENTIK_POSTGRESQL__PORT" . ,(number->string db-port))
                        ("AUTHENTIK_POSTGRESQL__NAME" . ,db-name)
                        ("AUTHENTIK_POSTGRESQL__USER" . ,db-user)
                        ,@(if (maybe-value-set? db-password)
                              `(("AUTHENTIK_POSTGRESQL__PASSWORD" . ,(maybe-value db-password)))
                              '())
                        ,@environment))
         (volumes
          `(("/var/run/docker.sock" . "/var/run/docker.sock")
            (,(string-append data-directory "/media") . "/media")
            (,(string-append data-directory "/certs") . "/certs")
            (,(string-append data-directory "/custom-templates") . "/templates")))))))))

(define authentik-service-type
  (service-type
    (name 'authentik)
    (extensions
     (list (service-extension account-service-type
                              (const %authentik-accounts))
           (service-extension postgresql-role-service-type
                              authentik-postgresql-role)
           (service-extension log-rotation-service-type
                              (compose list authentik-configuration-log-file))
           (service-extension activation-service-type
                              authentik-activation)
           (service-extension oci-service-type
                              authentik-oci-service)))
    (description "运行 Authentik 认证服务，包括 server 和 worker 两个容器")))

(define %immich-accounts
  (list (user-account
          (name "immich")
          (group "docker")
          (system? #t)
          (home-directory "/var/empty")
          (shell (file-append shadow "/sbin/nologin")))))

(define-configuration/no-serialization immich-configuration
  (image
   (string "ghcr.io/immich-app/immich-server")
   "Immich Docker 镜像")
  (port
   (number 2283)
   "HTTP 端口")
  (db-host
   (string "172.17.0.1")
   "PostgreSQL 数据库主机地址")
  (db-port
   (number 5432)
   "PostgreSQL 数据库端口")
  (db-name
   (string "immich")
   "PostgreSQL 数据库名称")
  (db-user
   (string "immich")
   "PostgreSQL 数据库用户名")
  (db-password
   string
   "PostgreSQL 数据库密码")
  (postgresql-password-file
   string
   "PostgreSQL 密码文件路径")
  (data-directory
   (string "/var/lib/immich")
   "数据存储目录")
  (time-zone
   (string "Asia/Shanghai")
   "时区设置")
  (log-file
   (string "/var/log/immich.log")
   "日志文件路径")
  (environment
   (alist '())
   "额外的环境变量，格式为关联列表")
  (auto-start?
   (boolean #t)
   "是否自动启动服务")
  (restart?
   (boolean #t)
   "容器是否自动重启"))

(define immich-postgresql-role
  (match-record-lambda <immich-configuration>
      (db-name db-user postgresql-password-file)
    (list (postgresql-role
            (name db-user)
            (create-database? #t)
            (password-file postgresql-password-file)))))

(define immich-activation
  (match-record-lambda <immich-configuration>
      (data-directory)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "immich")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))))))

(define immich-oci-service
  (match-record-lambda <immich-configuration>
      (image port db-host db-port db-name db-user db-password
       data-directory time-zone log-file environment auto-start? restart?)
    (oci-extension
     (containers
      (list
       ;; Server 容器
       (oci-container-configuration
         (image (string-append image ":" tag))
         (network "bridge")
         (user "immich")
         (group "docker")
         (ports `((,(number->string port) . "2283")))
         (auto-start? auto-start?)
         (provision "immich")
         (requirement '(networking dockerd postgresql))
         (respawn? restart?)
         (log-file log-file)
         (environment `(("TZ" . ,time-zone)
                        ("DB_HOSTNAME" . ,db-host)
                        ("DB_PORT" . ,(number->string db-port))
                        ("DB_DATABASE_NAME" . ,db-name)
                        ("DB_USERNAME" . ,db-user)
                        ("DB_PASSWORD" . ,(maybe-value db-password))
                        ,@environment))
         (volumes
          `((,(string-append data-directory) . "/data")
            ("/etc/localtime" . "/etc/localtime:ro")))))))))

(define immich-service-type
  (service-type
    (name 'immich)
    (extensions
     (list (service-extension account-service-type
                              (const %immich-accounts))
           (service-extension postgresql-role-service-type
                              immich-postgresql-role)
           (service-extension log-rotation-service-type
                              (compose list immich-configuration-log-file))
           (service-extension activation-service-type
                              immich-activation)
           (service-extension oci-service-type
                              immich-oci-service)))
    (description "运行 Immich 服务。")))
