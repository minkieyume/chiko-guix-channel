(define-module (chiko services matrix)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-13)
  #:use-module (ice-9 match)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix store)
  #:use-module (guix packages)
  #:use-module (guix build utils)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages matrix)
  #:use-module (gnu services)
  #:use-module (gnu services admin)
  #:use-module (gnu packages admin)
  #:use-module (gnu services configuration)
  #:use-module (gnu services databases)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (gnu services docker)
  #:use-module (gnu services containers)
  #:export (synapse-configuration
            synapse-service-type))

(define-maybe file-like)
(define-maybe number)

(define-configuration/no-serialization synapse-configuration
  (synapse
   (string "matrixdotorg/synapse:latest")
   "Synapse 容器镜像")
  (server-name
   (string "matrix.example.com")
   "Matrix 服务器域名")
  (host-port
   (number 8008)
   "服务器监听端口")
  (uid
   (number 5018)
   "")
  (gid
   (number 5018)
   "")
  (config-file
   maybe-file-like
   "Synapse 配置文件，如果提供则使用此配置文件")
  (data-directory
   (string "/var/lib/synapse")
   "数据存储目录")
  (report-stats?
   (boolean #f)
   "是否向 matrix.org 报告匿名统计信息")
  (log-path
   (string "/var/log/synapse")
   "日志文件路径")
  (time-zone
   (string "Asia/Shanghai")
   "时区设置")
  (auto-start?
   (boolean #t)
   "是否自动启动服务")
  (postgresql-password-file
   (string "/var/lib/synapse/ppasu")
   "PostgreSQL 密码文件路径，用于数据库连接"))

(define synapse-postgresql-role
  (match-record-lambda <synapse-configuration>
      (postgresql-password-file)
    (list (postgresql-role
            (name "synapse")
            (create-database? #t)
            (password-file postgresql-password-file)))))

(define synapse-accounts
  (match-record-lambda <synapse-configuration>
      (uid gid)
    (list (user-group
            (name "synapse")
            (id gid)
            (system? #t))
          (user-account
            (name "synapse")
            (group "synapse")
            (system? #t)
            (uid uid)
            (comment "Synapse Matrix homeserver user")
            (home-directory "/var/lib/synapse")
            (shell (file-append shadow "/sbin/nologin"))))))

(define synapse-activation
  (match-record-lambda <synapse-configuration>
      (data-directory log-path server-name config-file synapse report-stats? uid gid)
    #~(begin
        (use-modules (guix build utils)
                     (ice-9 exceptions))
        
        (unless (file-exists? #$data-directory)
          (mkdir-p #$data-directory)
          (chown #$data-directory uid gid))
        
        ;; 创建子目录
        (let ((sub-dirs '("/data" "/config")))
          (for-each (lambda (sub)
                      (let ((dir (string-append #$data-directory sub)))
                        (unless (file-exists? dir)
                          (mkdir-p dir)
                          (chown dir uid gid))))
                    sub-dirs))
        
        ;; 创建日志目录
        (unless (file-exists? #$log-path)
          (mkdir-p #$log-path)
          (chown #$log-path uid gid))
        
        ;; 链接配置文件（仅当提供自定义配置时）
        (when #$(maybe-value-set? config-file)
          (let ((config-path (string-append #$data-directory "/config/homeserver.yaml")))
            (unless (file-exists? config-path)
              (install-file #$config-file config-path)
              (chown config-path uid gid)))))))

(define synapse-oci-service
  (match-record-lambda <synapse-configuration>
      (synapse server-name config-file data-directory log-path
               report-stats? auto-start? time-zone host-port uid gid)
    (oci-extension
     (containers
      (list
       (oci-container-configuration
         (network "host")
         (provision "synapse-generate-config")
         (image synapse)
         (user "synapse")
         (group "docker")
         (requirement '(user-homes))
         (command
          '("generate"))
         (container-user (string-append (number->string uid) ":"
                                        (number->string gid)))
         (log-file (string-append log-path "/synapse-generate-config.log"))
         (extra-arguments '("--rm"))
         (auto-start? (not (file-exists? (string-append data-directory "/config/homeserver.yaml"))))
         (environment `(("TZ" . ,time-zone)
                        ("SYNAPSE_SERVER_NAME" . ,server-name)
                        ("SYNAPSE_REPORT_STATS" . ,(if report-stats? "yes" "no"))
                        ("SYNAPSE_HTTP_PORT" . ,(number->string host-port))
                        ("SYNAPSE_CONFIG_DIR" . "/config")
                        ("SYNAPSE_CONFIG_PATH" . "/config/homeserver.yaml")
                        ("SYNAPSE_DATA_DIR" . "/data")
                        ("UID" . ,(number->string uid))
                        ("GID" . ,(number->string gid))))
         (volumes
          `((,(string-append data-directory "/data") . "/data")
            (,(string-append data-directory "/config") . "/config"))))
       (oci-container-configuration
         (image synapse)
         (network "host")
         (user "synapse")
         (group "docker")
         (auto-start? auto-start?)
         (provision "synapse")
         (requirement '(networking))
         (log-file (string-append log-path "/synapse.log"))
         (command
          '("run" "-m" "synapse.app.homeserver" "--config-path" "/config/homeserver.yaml"))
         (volumes
          `((,(string-append data-directory "/data") . "/data")
            (,(string-append data-directory "/config") . "/config")))))))))

(define synapse-service-type
  (service-type
    (name 'synapse)
    (extensions
     (list (service-extension account-service-type
                              synapse-accounts)
           (service-extension postgresql-role-service-type
                              synapse-postgresql-role)
           (service-extension activation-service-type
                              synapse-activation)
           (service-extension oci-service-type
                              synapse-oci-service)
           (service-extension log-rotation-service-type
                              (lambda (cfg)
                                (let ((log-path (synapse-configuration-log-path cfg)))
                                  (list (string-append log-path "/synapse.log")
                                        (string-append log-path "/synapse-generate-config.log")))))))
    (default-value (synapse-configuration))
    (description "运行 Synapse Matrix homeserver 服务")))

(define-configuration/no-serialization matrix-dimension-configuration
  (image
    (string "turt2live/matrix-dimension:latest")
    "Matrix Dimension 容器镜像")
  (uid
   (number 5028)
   "")
  (gid
   (number 5028)
   "")
  (config-file
   maybe-file-like
   "Dimension 配置文件 production.yaml，如未指定则需手动生成")
  (port
   (number 8184)
   "服务器监听端口")
  (log-file
   (string "/var/log/matrix-dimension.log")
   "日志文件路径")
  (data-directory
   (string "/var/lib/matrix-dimension")
   "数据存储目录")
  (postgresql-password-file
   (string "/var/lib/matrix/ppasu")
   "PostgreSQL 密码文件路径，用于数据库连接")
  (auto-start?
   (boolean #t)
   "是否自动启动服务"))

(define matrix-dimension-postgresql-role
  (match-record-lambda <matrix-dimension-configuration>
      (postgresql-password-file)
    (list (postgresql-role
            (name "matrix-dimension")
            (create-database? #t)
            (password-file postgresql-password-file)))))

(define matrix-dimension-accounts
  (match-record-lambda <matrix-dimension-configuration>
      (uid gid)
    (list (user-group
            (name "matrix-dimension")
            (system? #t))
          (user-account
            (name "matrix-dimension")
            (group "matrix-dimension")
            (system? #t)
            (comment "Matrix Dimension user")
            (home-directory "/var/lib/matrix-dimension")
            (shell (file-append shadow "/sbin/nologin"))))))

(define matrix-dimension-activation
  (match-record-lambda <matrix-dimension-configuration>
      (data-directory config-file uid gid)
    #~(begin
        (use-modules (guix build utils))
        (unless (file-exists? #$data-directory)
          (mkdir-p #$data-directory)
          (chown #$data-directory uid gid))
        (when #$(maybe-value-set? config-file)
          (let ((dst (string-append #$data-directory "/config.yaml")))
            (unless (file-exists? dst)
              (install-file #$config-file dst)
              (chown dst uid gid)))))))

(define matrix-dimension-oci-service
  (match-record-lambda <matrix-dimension-configuration>
      (image data-directory auto-start? port log-file)
    (oci-extension
     (containers
      (list
       (oci-container-configuration
         (image image)
         (network "bridge")
         (user "matrix-dimension")
         (group "docker")
         (auto-start? auto-start?)
         (provision "matrix-dimension")
         (requirement '(networking))
         (log-file log-file)
	 (ports `((,(number->string port) . "8184")))
         (volumes
          `((,data-directory . "/data")))))))))

(define matrix-dimension-service-type
  (service-type
    (name 'matrix-dimension)
    (extensions
     (list (service-extension account-service-type
                              matrix-dimension-accounts)
           (service-extension postgresql-role-service-type
                              matrix-dimension-postgresql-role)
           (service-extension activation-service-type
                              matrix-dimension-activation)
           (service-extension oci-service-type
                              matrix-dimension-oci-service)))
    (default-value (matrix-dimension-configuration))
    (description "运行 Matrix Dimension 服务（基于 Docker 容器）")))
