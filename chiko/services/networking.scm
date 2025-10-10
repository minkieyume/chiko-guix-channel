(define-module (chiko services networking)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu services)
  #:use-module (guix records)
  #:use-module (gnu services configuration)
  #:use-module (gnu packages admin)
  #:use-module (gnu services)
  #:use-module (gnu services admin)
  #:use-module (gnu system privilege)
  #:use-module (gnu system setuid)
  #:use-module (gnu system shadow)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-13)
  #:export (sing-box-service-type
            sing-box-configuration))

(define %sing-box-accounts
  (list (user-account
          (name "singbox")
          (group "nogroup")
          (system? #t)
          (home-directory "/var/empty/"))))

(define-configuration/no-serialization sing-box-configuration
  (sing-box
   file-like
   "")
  (config-file
   file-like
   "")
  (data-directory
   (string "/var/lib/sing-box")
   "")
  (log-file
   (string "/var/log/sing-box.log")
   ""))

(define sing-box-activation
  (match-record-lambda <sing-box-configuration>
      (data-directory log-file)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "sing-box")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))))))

(define sing-box-shepherd-service
  (match-record-lambda <sing-box-configuration>
      (sing-box log-file)
    (list
     (shepherd-service
       (documentation "Run sing-box singing listener.")
       (provision '(sing-box singbox))
       (requirement '(networking))
       (respawn-limit 100)
       (respawn-delay 20)
       (start #~(make-forkexec-constructor
                 (list "/run/privileged/bin/sing-box" "run" "-c" #$config-file)
                 #:log-file #$log-file
                 #:supplementary-groups '("netdev")
    		 #:user "singbox"
                 #:resource-limits '((nofile 100000 100000))))
       (stop #~(make-kill-destructor)))
     (shepherd-service
       (documentation "运行一个SingBox TCD，透明唱片播放程序")
       (provision '(singbox-tcd sing-box-tcd))
       (requirement '(sing-box))
       (respawn? #f)
       (start #~(lambda _
		  (let* ((ip #$(file-append (spec->pkg "iproute2") "/sbin/ip"))
			 (st1 (system* ip "route" "add" "local" "default" "dev" "lo" "table" "100"))
			 (st2 (system* ip "rule" "add" "fwmark" "1" "table" "100"))
			 (st3 (system* ip "-6" "route" "add" "local" "default" "dev" "lo" "table" "100"))
			 (st4 (system* ip "-6" "rule" "add" "fwmark" "1" "table" "100")))
		    (and (map (lambda (st)
				(= 0 (status:exit-val st)))
			      (list st1 st2 st3 st4))))))
       (stop #~(lambda _
		 (let* ((ip #$(file-append (spec->pkg "iproute2") "/sbin/ip"))
			(st1 (system* ip "rule" "del" "fwmark" "1" "table" "100"))
			(st2 (system* ip "route" "del" "local" "default" "dev" "lo" "table" "100"))
			(st3 (system* ip "-6" "rule" "del" "fwmark" "1" "table" "100"))
			(st4 (system* ip "-6" "route" "del" "local" "default" "dev" "lo" "table" "100")))
		   (and (map (lambda (st)
			       (= 0 (status:exit-val st)))
			     (list st1 st2 st3 st4))))))))))

(define sing-box-service-type
  (service-type
    (name 'sing-box)
    (extensions
     (list (service-extension account-service-type
                              (const %sing-box-accounts))
           (service-extension activation-service-type
                              sing-box-activation)
           (service-extension shepherd-root-service-type
                              sing-box-shepherd-service)
           (service-extension log-rotation-service-type
                              (compose list sing-box-configuration-log-file))
           (service-extension privileged-program-service-type
                              (const (list (privileged-program
                                             (program (file-append sing-box-configuration-sing-box "/bin/sing-box"))
                                             (capabilities "cap_net_admin,cap_net_bind_service,cap_net_raw+ep")))))))
    (description "")))
