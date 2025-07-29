(define-module (chiko services doas)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (gnu services)
  #:use-module (guix records)
  #:use-module (gnu services admin)
  #:use-module (gnu services configuration)
  #:use-module (gnu services databases)
  #:use-module (gnu services docker)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system privilege)
  #:use-module (gnu system shadow)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-13)
  #:export (netbird-management-service-type
            netbird-management-configuration))

(define-configuration netbird-management-configuration
  (management-image
   (string "netbirdio/management:latest")
   "NetBird Management 服务的Docker仓库")
  (signal-image
    (string "netbirdio/signal:latest")
   "NetBird Signal 服务的Docker仓库")
  (dashbord-image
    (string "netbirdio/dashboard:main")
   "NetBird Signal 服务的Docker仓库")
  (management-ports
    (alist `(("33073" . "33073")))
    "管理器的端口绑定，第一个端口必须指定33073端口的映射。")
  (signal-ports
    (alist `(("10000" . "10000")))
    "信令服务器的端口绑定")
  (dashboard-ports
    (alist `(("443" . "443")
             ("80" . "80")))
    "控制面板的端口绑定")
  (auth-server
    alist
    "验证服务器，参数必须为键值对，会自动合并到enviroment")
  (doamin
    string
    "部署Netbird需要的域名。")
  (config-file
    file-like
    "配置文件")
  (data-directory
   (string "/var/lib/netbird")
   "用于netbird的数据文件夹。")
  (log-path
   (string "/var/log/netbird")
   "Log file to use.")
  (management?
   (boolean #t)
   "是否启用服务管理器？")
  (dashbord?
   (boolean #t)
   "是否启用服务管理器的控制面板？")
  (signal?
   (boolean #t)
   "是否启用Signal Service？")
  (no-serialization))

(define %netbird-accounts
  (list (user-account
          (name "netbird")
          (group "docker")
          (system? #t)
          (home-directory "/var/empty")
          (shell (file-append shadow "/sbin/nologin")))))

;; (define %netbird-postgresql-role
;;   (list (postgresql-role
;;          (name "netbird")
;;          (create-database? #t))))

(define netbird-management-activation
  (match-record-lambda <netbird-management-configuration>
      (data-directory log-path)
    #~(begin
        (use-modules (guix build utils))
        (let ((user (getpwnam "netbird")))
          (unless (file-exists? #$data-directory)
            (mkdir-p #$data-directory)
            (chown #$data-directory (passwd:uid user) (passwd:gid user)))
          (unless (file-exists? #$log-path)
            (mkdir-p #$log-path)
            (chown #$log-path (passwd:uid user) (passwd:gid user)))))))

(define netbird-management-oci-containers
  (match-record-lambda <netbird-management-configuration>
    (management-image signal-image dashbord-image
      data-directory doamin log-path management? dashbord? signal?
      management-ports dashboard-ports signal-ports config-file auth-server)
    `(,@(if management?
          (list (oci-container-configuration
                  (user "netbird")
                  (group "docker")
                  (image management-image)
                  (provision "netbird-management")
                  (log-file (string-append log-path "/management.log"))
                  (respawn? #t)
                  (ports management-ports)
                  (volumes
                    `((,data-directory . "/var/lib/netbird")
                       (,config-file . "/etc/netbird/config.json"))))) '())
       ,@(if signal?
           (list (oci-container-configuration
                   (user "netbird")
                   (group "docker")
                   (image signal-image)
                   (provision "netbird-signal")
                   (log-file (string-append log-path "/signal.log"))
                   (respawn? #t)
                   (ports signal-ports))) '())
       ,@(if dashbord?
           (list (oci-container-configuration
                   (user "netbird")
                   (group "docker")
                   (image dashbord-image)
                   (provision "netbird-dashboard")
                   (log-file (string-append log-path "/dashboard.log"))
                   (respawn? #t)
                   (environment `(,@auth-server
                                  ("NETBIRD_MGMT_API_ENDPOINT" . ,(string-append
                                                                    "http://127.0.0.1:"
                                                                    (caar management-ports)))))
                   (ports dashboard-ports))) '()))))

(define netbird-management-log-rotation
  (match-record-lambda <netbird-management-configuration>
    (log-path)
    (list (string-append log-path "/dashboard.log")
          (string-append log-path "/management.log")
          (string-append log-path "/signal.log"))))

(define netbird-management-service-type
  (service-type
    (name 'netbird-management)
    (extensions
      (list (service-extension account-service-type
              (const %netbird-accounts))
        (service-extension log-rotation-service-type
          (netbird-management-log-rotation))
        (service-extension activation-service-type
          netbird-management-activation)
        (service-extension oci-container-service-type
          netbird-management-oci-containers)))
    (default-value (netbird-management-configuration))
    (description "运行Netbird Management服务。")))
