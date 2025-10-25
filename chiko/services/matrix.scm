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
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (gnu services docker)
  #:use-module (gnu services containers)
  #:export (synapse-configuration
            synapse-service-type))

;; (define synapse-activation
;;   (match-record-lambda <synapse-configuration>
;;       (data-directory log-file server-name config-file synapse report-stats?)
;;     #~(begin
;;         (use-modules (guix build utils)
;;                      (ice-9 exceptions))
;;         (with-exception-handler
;;           (lambda (exn)
;;             (display "❌ 捕获到异常！\n")
;;             (display "类型: ") (write (exception-kind exn)) (newline)
;;             (display "消息: ") (write (exception-message exn)) (newline)
;;             (display "参数: ") (write (exception-args exn)) (newline)
;;             (display "调用栈:\n")
;;             (display (with-output-to-string (lambda () (print-exception exn))))
;;             (newline))
;;           (lambda ()
;;             (let ((user (getpwnam "synapse"))
;;                   (group (getgrnam "synapse")))
;;               ;; 创建数据目录
;;               (unless (file-exists? #$data-directory)
;;                 (mkdir-p #$data-directory)
;;                 (chown #$data-directory (passwd:uid user) (group:gid group)))
              
;;               ;; 创建子目录
;;               (let ((sub-dirs '("/data" "/workers" "/config")))
;;                 (for-each (lambda (sub)
;;                             (let ((dir (string-append #$data-directory sub)))
;;                               (unless (file-exists? dir)
;;                                 (mkdir-p dir)
;;                                 (chown dir (passwd:uid user) (group:gid group)))))
;;                           sub-dirs))
              
;;               ;; 创建日志文件
;;               (unless (file-exists? #$log-file)
;;                 (call-with-output-file #$log-file (lambda (port) #t))
;;                 (chown #$log-file (passwd:uid user) (group:gid group))
;;                 (chmod #$log-file #o640))
              
;;               ;; 生成 homeserver 配置文件（仅当未提供自定义配置时）
;;               (let ((config-path (string-append #$data-directory "/config/homeserver.yaml")))
;;                 (unless (or #$(maybe-value-set? config-file) (file-exists? config-path))
;;                   (system* #$(file-append synapse "/bin/generate_config")
;;                            "--server-name" #$server-name
;;                            "--config-dir" #$(string-append data-directory "/config")
;;                            "--data-dir" #$(string-append data-directory "/data")
;;                            "--report-stats" #$(if report-stats? "yes" "no")
;;                            "--generate-secrets"
;;                            "-o" config-path)
;;                   (chown config-path (passwd:uid user) (group:gid group))))
              
;;               ;; 生成日志配置文件
;;               (let ((log-config-path (string-append #$data-directory "/config/" #$server-name ".log.config")))
;;                 (unless (file-exists? log-config-path)
;;                   (system* #$(file-append synapse "/bin/generate_log_config")
;;                            "-o" log-config-path
;;                            "-f" #$log-file)
;;                   (chown log-config-path (passwd:uid user) (group:gid group))))

;;               ;; 生成签名密钥
;;               (let ((signing-key-path (string-append #$data-directory "/config/" #$server-name ".signing.key")))
;;                 (unless (file-exists? signing-key-path)
;;                   (system* #$(file-append synapse "/bin/generate_signing_key.py")
;;                            "-o" signing-key-path)
;;                   (chown signing-key-path (passwd:uid user) (group:gid group))))))))))

        ;; (define synapse-shepherd-service
        ;;   (match-record-lambda <synapse-configuration>
        ;;       (synapse server-name config-file data-directory log-file report-stats? auto-start?)
        ;;     (let ((config-path (if (maybe-value-set? config-file)
        ;;                            config-file
        ;;                            (string-append data-directory "/config/homeserver.yaml"))))
        ;;       (list (shepherd-service
        ;;               (documentation "Synapse Matrix homeserver")
        ;;               (provision '(synapse matrix-synapse))
        ;;               (requirement '(networking))
        ;;               (start #~(make-forkexec-constructor
        ;;                         (list #$(file-append synapse "/bin/synctl")
        ;;                               "--no-daemonize"
        ;;                               "start" #$config-path)
        ;;                         #:user "synapse"
        ;;                         #:group "synapse"))
        ;;               (stop #~(make-kill-destructor))
        ;;               (auto-start? auto-start?))))))

(define-maybe file-like)
(define-maybe number)

(define-configuration/no-serialization synapse-configuration
  ;; (synapse
  ;;  (file-like synapse)
  ;;  "Synapse 包")
  (synapse
   (string "matrixdotorg/synapse:latest")
   "Synapse 容器镜像")
  (server-name
   (string "matrix.example.com")
   "Matrix 服务器域名")
  (host-port
   (number 8008)
   "服务器监听端口")
  (fedi-port
   maybe-number
   "联邦通信端口")
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
   "是否自动启动服务"))

(define %synapse-accounts
  (list (user-group
          (name "synapse")
          (system? #t))
        (user-account
          (name "synapse")
          (group "synapse")
          (system? #t)
          (comment "Synapse Matrix homeserver user")
          (home-directory "/var/lib/synapse")
          (shell (file-append shadow "/sbin/nologin")))))

(define synapse-activation
  (match-record-lambda <synapse-configuration>
      (data-directory log-path server-name config-file synapse report-stats?)
    #~(begin
        (use-modules (guix build utils)
                     (ice-9 exceptions))
        (let ((user (getpwnam "synapse"))
              (group (getgrnam "synapse")))
          ;; 创建数据目录
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (group:gid group)))
              
          ;; 创建子目录
          (let ((sub-dirs '("/data" "/config")))
            (for-each (lambda (sub)
                        (let ((dir (string-append #$data-directory sub)))
                          (unless (file-exists? dir)
                            (mkdir-p dir)
                            (chown dir (passwd:uid user) (group:gid group)))))
                      sub-dirs))
              
          ;; 创建日志目录
          (unless (file-exists? #$log-path)
            (mkdir-p #$log-path)
            (chown #$log-path (passwd:uid user) (group:gid group)))
              
          ;; 链接配置文件（仅当提供自定义配置时）
          (when #$(maybe-value-set? config-file)
            (let ((config-path (string-append #$data-directory "/config/homeserver.yaml")))
              (unless (file-exists? config-path)
                (install-file #$config-file config-path)
                (chown config-path (passwd:uid user) (group:gid group)))))))))

(define synapse-oci-service
  (match-record-lambda <synapse-configuration>
      (synapse server-name config-file data-directory log-path
       report-stats? auto-start? time-zone host-port fedi-port)
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
         (container-user (string-append (number->string (passwd:uid (getpwnam "synapse"))) ":"
                                        (number->string (group:gid (getgrnam "synapse")))))
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
                        ("UID" . ,(number->string (passwd:uid (getpwnam "synapse"))))
                        ("GID" . ,(number->string (group:gid (getgrnam "synapse"))))))
         (volumes
          `((,(string-append data-directory "/data") . "/data")
            (,(string-append data-directory "/config") . "/config"))))
       (oci-container-configuration
         (image synapse)
         (network "bridge")
         (user "synapse")
         (group "docker")
         (container-user (string-append (number->string (passwd:uid (getpwnam "synapse"))) ":"
                                        (number->string (group:gid (getgrnam "synapse")))))
         (auto-start? auto-start?)
         (provision "synapse")
         (requirement '(networking))
         (log-file (string-append log-path "/synapse.log"))
         (command
          '("run" "-m" "synapse.app.homeserver" "--config-path" "/config/homeserver.yaml"))
         (ports
          `((,(number->string host-port) . "8008")
            ,@(if (maybe-value-set? fedi-port)
                  `((,(number->string (maybe-value-ref fedi-port)) . "8448"))
                  '())))
         (volumes
          `((,(string-append data-directory "/data") . "/data")
            (,(string-append data-directory "/config") . "/config")))))))))

(define synapse-service-type
  (service-type
    (name 'synapse)
    (extensions
     (list (service-extension account-service-type
                              (const %synapse-accounts))
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
