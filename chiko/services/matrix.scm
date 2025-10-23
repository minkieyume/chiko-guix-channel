(define-module (chiko services matrix)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix store)
  #:use-module (guix packages)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages linux)
  #:use-module (gnu services)
  #:use-module (gnu services admin)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages matrix)
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (srfi srfi-13)
  #:export (synapse-configuration
            synapse-service-type))

(define-maybe file-like)

;; Synapse AI生成，未测试。
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
  (list (user-account
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
          (let ((sub-dirs '("/logs" "/media" "/uploads")))
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
            (chmod #$log-file #o640))))))

(define synapse-shepherd-service
  (match-record-lambda <synapse-configuration>
      (synapse server-name config-file data-directory log-file report-stats? auto-start?)
    (let ((config-path (if config-file
                           config-file
                           (string-append data-directory "/homeserver.yaml"))))
      (list (shepherd-service
              (documentation "Synapse Matrix homeserver")
              (provision '(synapse matrix-synapse))
              (requirement '(networking))
              (start #~(make-forkexec-constructor
                        (list #$(file-append synapse "/bin/python")
                              "-m" "synapse.app.homeserver"
                              "--server-name" #$server-name
                              "--config-path" #$config-path                              
                              #$(string-append "--report-stats=" 
                                               (if report-stats? "yes" "no"))
                              #$(if (file-exists? config-file)
                                    ""
                                    "--generate-config"))
                        #:user "synapse"
                        #:group "synapse"
                        #:directory #$data-directory
                        #:log-file #$log-file
                        #:environment-variables
                        (list (string-append "HOME=" #$data-directory)
                              (string-append "SYNAPSE_CONFIG_PATH=" #$config-path))))
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
