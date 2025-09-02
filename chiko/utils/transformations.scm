(define-module (chiko utils transformations)
  #:use-module (srfi srfi-1)
  #:use-module (guix channels)
  #:use-module (guix gexp)
  #:use-module (gnu system)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu packages package-management)
  #:export (chiko-transformation-guix))


(define* (chiko-transformation-guix #:key (substitutes? #t)
                                    (channel? #t)
                                    (guix-source? #f))

  (define %chiko-channel
    (channel
     (name 'chikochannel)
     (url "https://github.com/minkieyume/chiko-guix-channel.git")
     (branch "main")
     (introduction
      (make-channel-introduction
       "58c72b83e045c90bcef7edcc7b90b9b5fe875b03"
       (openpgp-fingerprint
        "F655 AB8D 8F94 0E9F 569C E97D 5DBC D441 1818 2F31")))))

  (lambda (os)
    (operating-system
     (inherit os)
     (services
      (modify-services (operating-system-user-services os)
		       (guix-service-type
			config => (guix-configuration
				   (inherit config)
				   (channels
				    (let ((configured-channels
					   (guix-configuration-channels config)))
				      (if channel?
					  (cons %chiko-channel
						(or configured-channels %default-channels))
					  configured-channels)))
				   (guix
				    (if guix-source?
					(guix-for-channels channels)
					(guix-configuration-guix config))))))))))
