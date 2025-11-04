(define-module (chiko services email)
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
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (gnu services docker)
  #:use-module (gnu services containers)
  #:use-module (srfi srfi-13)
  #:export (docker-mailserver-service-type
            docker-mailserver-configuration))

(define alist?
  (list-of pair?))

(define-configuration/no-serialization docker-mailserver-configuration
  (docker-mailserver
   (string "mailserver/docker-mailserver:latest")
   "")
  (hostname
   string
   "")
  (uid
   (number 5000)
   "")
  (gid
   (number 5000)
   "")
  (ports
   (alist `(("443" . "443")
            ("8080" . "8080")
            ("25" . "25")
            ("587" . "587")
            ("465" . "465")
            ("143" . "143")
            ("993" . "993")
            ("4190" . "4190")
            ("110" . "110")
            ("995" . "995")))
   "")
  (environment
   (alist `())
   "")
  (data-directory
   (string "/var/lib/docker-mailserver")
   "")
  (time-zone
   (string "Asia/Shanghai")
   "")
  (log-file
   (string "/var/log/docker-mailserver.log")
   "")
  (auto-start?
   (boolean #t)
   ""))

(define docker-mailserver-accounts
  (match-record-lambda <docker-mailserver-configuration>
      (uid gid)
    (list (user-group
            (name "mailserver")
            (id gid)
            (system? #t))
          (user-account
            (name "mailserver")
            (group "mailserver")
            (uid uid)
            (system? #t)
            (comment "Docker-Mailserver Mail Server")
            (home-directory "/var/empty")
            (shell (file-append shadow "/sbin/nologin"))))))

(define docker-mailserver-activation
  (match-record-lambda <docker-mailserver-configuration>
      (data-directory log-file)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "mailserver")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user))))
        (let ((sub-dirs '("/config"
                          "/maildata"
                          "/mail-state"
                          "/log")))
          (for-each (lambda (sub)
                      (unless (file-exists? (string-append #$data-directory sub))
                        (mkdir-p (string-append #$data-directory sub))
                        (chown (string-append #$data-directory sub) (passwd:uid user) (passwd:gid user))))
                    sub-dirs)))))

(define docker-mailserver-oci-service
  (match-record-lambda <docker-mailserver-configuration>
      (docker-mailserver auto-start? data-directory time-zone log-file ports environment hostname)
    (oci-extension
     (containers
      (list
       (oci-container-configuration
         (image docker-mailserver)
         (network "bridge")
         (user "mailserver")
         (group "docker")
         (ports ports)
         (auto-start? auto-start?)
         (provision "mailserver")
         (container-user (string-append (number->string uid) ":" (number->string gid)))
         (requirement '(networking))
         (log-file log-file)
         (environment `(("TZ" . ,time-zone)
                        ("OVERRIDE_HOSTNAME" . hostname)
                        ("DMS_VMAIL_UID" . ,(number->string uid))
                        ("DMS_VMAIL_GID" . ,(number->string gid))
                        ,@environment))
         (volumes
          `((,(string-append data-directory "/config") . "/tmp/docker-mailserver/")
            (,(string-append data-directory "/maildata") . "/var/mail")
            (,(string-append data-directory "/mail-state") . "/var/mail-state")
            (,(string-append data-directory "/log") . "/var/log/mail")))))))))

(define docker-mailserver-service-type
  (service-type
    (name 'docker-mailserver)
    (extensions
     (list (service-extension account-service-type
                              docker-mailserver-accounts)
           (service-extension log-rotation-service-type
                              (compose list docker-mailserver-configuration-log-file))
           (service-extension activation-service-type
                              docker-mailserver-activation)
           (service-extension oci-service-type
                              docker-mailserver-oci-service)))
    (description "运行Docker Mailserver邮箱服务")))
