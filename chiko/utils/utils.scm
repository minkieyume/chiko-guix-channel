(define-module (chiko utils utils)
  #:use-module (srfi srfi-1)
  #:use-module (guix channels)
  #:use-module (guix gexp)
  #:use-module (guix build utils)
  #:use-module (gnu system)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:export (make-sub-dirs
            chown-dirs))

(define-syntax-rule (make-sub-dirs root dirs)
  (for-each
      (lambda (dir)
        (mkdir-p (string-append root "/" dir)))
      dirs))

(define-syntax-rule (chown-dirs user group dirs)
  (for-each
      (lambda (dir)
        (chown dir (passwd:uid user) (group:gid group)))
      dirs))
