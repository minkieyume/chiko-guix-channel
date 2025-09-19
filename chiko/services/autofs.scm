(define-module (chiko services autofs)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (guix packages)  
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages linux)  
  #:use-module (gnu services)
  #:use-module (gnu services admin)  
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system shadow)
  #:use-module (srfi srfi-13)
  #:export (autofs-configuration
            autofs-service-type))

(define-configuration/no-serialization autofs-configuration
  (autofs
   (file-like autofs)
   "")
  (config-file
   file-like
   "")
  (master-file
   file-like
   "")
  (extra-files
   (list '())
   "")
  (data-directory
   (string "/var/lib/sing-box")
   "")
  ;; Shepherd
  (shepherd-provision
   (list-of-symbols '(autofs automount))
   "")
  (shepherd-requirement
   (list-of-symbols '(file-systems))
   "")
  (log-file
   (string "/var/log/autofs.log")
   "")
  (auto-start?
   (boolean #t)
   ""))

(define autofs-activation
  (match-record-lambda <autofs-configuration>
      (data-directory)
    #~(begin
        (use-modules (guix build utils))
        (mkdir-p #$data-directory))))

(define autofs-etc-service
  (match-record-lambda <autofs-configuration>
      (config-file master-file extra-files)
    `(("autofs.conf" ,config-file)
      ("auto.master" ,master-file)
      ,@extra-files)))

(define autofs-shepherd-service
  (match-record-lambda <autofs-configuration>
      (autofs shepherd-provision shepherd-requirement log-file auto-start?)
    (list (shepherd-service
            (provision shepherd-provision)
            (requirement `(user-processes ,@shepherd-requirement))
            (start
             #~(make-forkexec-constructor
                (list #$(file-append autofs "/sbin/automount")
                      "-f"
                      "-d" "/etc/autofs/auto.master")
                #:log-file #$log-file))
            (stop #~(make-kill-destructor))
            (auto-start? auto-start?)))))

(define autofs-service-type
  (service-type
    (name 'autofs)
    (extensions
     (list (service-extension activation-service-type
                              autofs-activation)
           (service-extension etc-service-type
                              autofs-etc-service)
           (service-extension shepherd-root-service-type
                              autofs-shepherd-service)
           (service-extension log-rotation-service-type
                              (compose list autofs-configuration-log-file))))
    (description "")))
