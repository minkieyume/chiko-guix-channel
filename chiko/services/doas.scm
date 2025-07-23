(define-module (chiko services doas)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu services)
  #:use-module (guix records)
  #:use-module (gnu services configuration)  
  #:use-module (gnu packages admin)
  #:use-module (gnu system shadow)
  #:export (doas-service-type
             doas-configuration))

(define-record-type* <doas-rule>
  doas-rule make-doas-rule doas-rule?
  this-doas
  (permit doas-rule-permit (default #t))           ;允许或拒绝
  (users doas-rule-users (default '()))   ; 默认空列表
  (args doas-rule-args (default '()))     ; 默认空列表
  (options doas-rule-options (default '()))) ; 默认空列表

(define (list-of-doas-rules? lst)
  (every doas-rule? lst))

(define-configuration doas-configuration
  (config-file
    (file-like "/etc/doas.conf")
    "Path to doas configuration file.")
  (rules
    (list-of-doas-rules '())
    "doas-rule的规则列表")
  (no-serialization))

(define doas-service-type
  (service-type
    (name 'doas)
    (extensions
      (list
        ;; 把 doas.conf 安装到 /etc
        (service-extension etc-service-type
          (lambda (config)
            `(("doas.conf" ,(doas-configuration-config-file config)))))
        ;; 确保 doas 包被安装到系统 profile
        (service-extension profile-service-type (const (list opendoas)))
        (service-extension etc-service-type
          (lambda (config)
            `(("doas.conf" ,(doas-configuration-rules config)))))))
    (default-value (doas-configuration))))
