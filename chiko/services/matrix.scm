(define-module (chiko services matrix)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix store)
  #:use-module (guix packages)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages matrix)
  #:use-module (gnu services)
  #:use-module (gnu services admin)
  #:use-module (gnu packages admin)
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (srfi srfi-13)
  #:export (synapse-configuration
            synapse-service-type))

(define-maybe file-like)

(define-configuration/no-serialization synapse-configuration
  (synapse
   (file-like synapse)
   "Synapse 包")
  (server-name
   (string "matrix.example.com")
   "Matrix 服务器域名")
  (config-file
   maybe-file-like
   "Synapse 配置文件，如果提供则使用此配置文件")
  (data-directory
   (string "/var/lib/synapse")
   "数据存储目录")
  (report-stats?
   (boolean #f)
   "是否向 matrix.org 报告匿名统计信息")
  (log-file
   (string "/var/log/synapse.log")
   "日志文件路径")
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
      (data-directory log-file server-name config-file synapse report-stats?)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "synapse"))
              (group (getgrnam "synapse")))
          ;; 创建数据目录
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (group:gid group)))
          
          ;; 创建子目录
          (let ((sub-dirs '("/data" "/workers" "/config")))
            (for-each (lambda (sub)
                        (let ((dir (string-append #$data-directory sub)))
                          (unless (file-exists? dir)
                            (mkdir-p dir)
                            (chown dir (passwd:uid user) (group:gid group)))))
                      sub-dirs))
          
          ;; 创建日志文件
          (unless (file-exists? #$log-file)
            (call-with-output-file #$log-file (lambda (port) #t))
            (chown #$log-file (passwd:uid user) (group:gid group))
            (chmod #$log-file #o640))
                    
          ;; 生成 homeserver 配置文件（仅当未提供自定义配置时）
          (let ((config-path (string-append #$data-directory "/config/homeserver.yaml")))
            (unless (or #$config-file (file-exists? config-path))
              (system* #$(file-append synapse "/bin/generate_config")
                       "--server-name" #$server-name
                       "--config-dir" #$(string-append data-directory "/config")
                       "--data-dir" #$(data-directory "/data")
                       "--report-stats" #$(if report-stats? "yes" "no")
                       "--generate-secrets"
                       "-o" config-path)
              (chown config-path (passwd:uid user) (group:gid group))))
          
          ;; 生成日志配置文件
          (let ((log-config-path (string-append #$data-directory "/config/" #$server-name ".log.config")))
            (unless (file-exists? log-config-path)
              (system* #$(file-append synapse "/bin/generate_log_config")
                       "-o" log-config-path
                       "-f" #$log-file)
              (chown log-config-path (passwd:uid user) (group:gid group))))

          ;; 生成签名密钥
          (let ((signing-key-path (string-append #$data-directory "/config/" #$server-name ".signing.key")))
            (unless (file-exists? signing-key-path)
              (system* #$(file-append synapse "/bin/generate_signing_key.py")
                       "-o" signing-key-path)
              (chown signing-key-path (passwd:uid user) (group:gid group))))))))

(define synapse-shepherd-service
  (match-record-lambda <synapse-configuration>
      (synapse server-name config-file data-directory log-file report-stats? auto-start?)
    (let ((config-path (if config-file
                           config-file
                           (string-append data-directory "/config/homeserver.yaml"))))
      (list (shepherd-service
              (documentation "Synapse Matrix homeserver")
              (provision '(synapse matrix-synapse))
              (requirement '(networking))
              (start #~(make-forkexec-constructor
                        (list #$(file-append synapse "/bin/synctl")
                              "-a" #$(string-append data-directory "/workers")
                              "--no-daemonize"
                              "start" #$(string-append #$config-path))
                        #:user "synapse"
                        #:group "synapse"))
              (stop #~(make-kill-destructor))
              (auto-start? auto-start?))))))

(define synapse-service-type
  (service-type
    (name 'synapse)
    (extensions
     (list (service-extension account-service-type
                              (const %synapse-accounts))
           (service-extension activation-service-type
                              synapse-activation)
           (service-extension shepherd-root-service-type
                              synapse-shepherd-service)
           (service-extension log-rotation-service-type
                              (compose list synapse-configuration-log-file))))
    (default-value (synapse-configuration))
    (description "运行 Synapse Matrix homeserver 服务")))
