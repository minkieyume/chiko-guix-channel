(define-module (chiko services ai)
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
  #:export (qdrant-configuration
            qdrant-service-type))

(define %qdrant-accounts
  (list (user-account
          (name "qdrant")
          (group "docker")
          (system? #t)
          (home-directory "/var/empty")
          (shell (file-append shadow "/sbin/nologin")))))

(define-configuration/no-serialization qdrant-configuration
  (image
   (string "qdrant/qdrant:latest")
   "")
  (ports
   (list '(6333 6334))
   "")
  (data-directory
   (string "/var/lib/qdrant")
   "")
  (time-zone
   (string "Asia/Shanghai")
   "")
  (log-file
   (string "/var/log/qdrant.log")
   ""))

(define qdrant-activation
  (match-record-lambda <qdrant-configuration>
      (data-directory log-file)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "qdrant")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))
          (let ((sub-dirs '("/storage")))
            (for-each (lambda (sub)
                        (unless (file-exists? (string-append #$data-directory sub))
                          (mkdir-p (string-append #$data-directory sub))
                          (chown (string-append #$data-directory sub) (passwd:uid user) (passwd:gid user))))
                      sub-dirs))))))

(define qdrant-oci-container
  (match-record-lambda <qdrant-configuration>
      (image log-file ports data-directory time-zone)
    (list (oci-container-configuration
            (user "qdrant")
            (group "docker")
            (image image)
            (provision "qdrant")
            (log-file log-file)
            (respawn? #t)
            (ports `((,(number->string (car ports)) . "6333")
                     (,(number->string (cadr ports)) . "6334")))
            (environment `(("TZ" . ,time-zone)))
            (volumes
             `((,(string-append data-directory "/storage") . "/qdrant/storage")))))))

(define qdrant-service-type
  (service-type
    (name 'qdrant)
    (extensions
     (list (service-extension account-service-type
                              (const %qdrant-accounts))
           (service-extension log-rotation-service-type
                              (compose list qdrant-configuration-log-file))
           (service-extension activation-service-type
                              qdrant-activation)
           (service-extension oci-container-service-type
                              qdrant-oci-container)))
    (default-value (qdrant-configuration))
    (description "运行Qdrant服务")))
