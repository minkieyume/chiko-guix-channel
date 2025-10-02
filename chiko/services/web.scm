(define-module (chiko services web)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (guix gexp)
  #:use-module (guix records)
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
  #:export (kavita-configuration
            kavita-service-type
            calibre-web-configuration
            calibre-web-service-type))

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
   (number 5000)
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
            (provision "calibre")
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
