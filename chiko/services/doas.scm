(define-module (chiko services doas)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu services)
  #:use-module (guix records)
  #:use-module (gnu services configuration)
  #:use-module (gnu packages admin)
  #:use-module (gnu system privilege)
  #:use-module (gnu system shadow)
  #:use-module (gnu system setuid)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-13)
  #:export (doas-service-type
             doas-configuration
             doas-rule))

(define-record-type* <doas-rule>
  doas-rule make-doas-rule doas-rule?
  this-doas
  (permit doas-rule-permit (default #t) (keyword #:permit))           ;允许或拒绝
  (user doas-rule-user (default "") (keyword #:user))
  (as-target doas-rule-as-target (default "") (keyword #:as-target))
  (command doas-rule-command (default "") (keyword #:command))
  (args doas-rule-args (default '()) (keyword #:args))
  (options doas-rule-options (default '()) (keyword #:options))) ; 默认空列表

(define (list-of-doas-rules? lst)
  (every doas-rule? lst))

(define doas-rule-etc
  (match-record-lambda <doas-rule>
    (permit user as-target command options args)
    (string-append
      (if permit "permit" "deny")
      (if (null? options) "" (string-append " " (string-join options " ")))
      (if (string-null? user) "" (string-append " " user))
      (if (string-null? as-target) "" (string-append " as " as-target))
      (if (string-null? command) "" (string-append " cmd " command))
      (if (null? args) "" (string-append " args " (string-join args " ")))
      "\n")))

(define-configuration doas-configuration
  ;; (config-file
  ;;   (file-like (plain-file "doas.conf" "permit persist keepenv :wheel"))
  ;;   "Path to doas configuration file.")
  (rules
    (list-of-doas-rules
      (list (doas-rule
              (permit #t)
              (user ":wheel")
              (options '("persist" "keepenv")))))
    "doas-rule的规则列表")
  (doas
    (package opendoas)
    "doas的包")
  (no-serialization))

(define doas-ruleset-etc
  (match-record-lambda <doas-configuration>
    (rules)
    (if (null? rules) '()
       `(("doas.conf"
        ,(plain-file
           "doas.conf"
           (string-join (map doas-rule-etc rules) "\n")))))))

(define doas-service-type
  (service-type
    (name 'doas)
    (extensions
      (list
        ;; 把 doas.conf 安装到 /etc
        ;; (service-extension etc-service-type
        ;;   (lambda (config)
        ;;     `(("doas.conf" ,(doas-configuration-config-file config)))))
        ;; 确保 doas 包被安装到系统 profile
        (service-extension profile-service-type
          (lambda (cfg) (list (doas-configuration-doas cfg))))
        (service-extension etc-service-type
          doas-ruleset-etc)
        (service-extension privileged-program-service-type
          (lambda (cfg) (list (privileged-program
                                (program (file-append opendoas "/bin/doas"))
                                (setuid? #t)))))))
    (default-value (doas-configuration))
    (description "Doas的服务器，可以自定义doas规则")))
