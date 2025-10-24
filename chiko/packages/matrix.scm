(define-module (chiko packages matrix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages check)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages monitoring)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system go)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages package-management))

;; (define-public python-matrix-synapse-ldap3
;;   (package
;;     (name "python-matrix-synapse-ldap3")
;;     (version "0.3.0")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;              (url "https://github.com/matrix-org/matrix-synapse-ldap3")
;;              (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "1s3kpirjd8milj536k21nqj5bzxi3b77da227brl5zi4dj5hl1m1"))))
;;     (build-system pyproject-build-system)
;;     (arguments
;;      (list
;;       #:tests? #f     ; tests require synapse, creating a circular dependency.
;;       #:phases
;;       #~(modify-phases %standard-phases
;;           ;; Also, auth_provider.py attempts to import synapse.
;;           (add-before 'build 'disable-rust
;;             (lambda _
;;               (setenv "SYNAPSE_NO_RUST" "1")))
;;           (delete 'sanity-check))))
;;     (native-inputs (list python-setuptools))
;;     (propagated-inputs
;;      (list python-twisted python-ldap3 python-service-identity))
;;     (home-page "https://github.com/matrix-org/matrix-synapse-ldap3")
;;     (synopsis "LDAP3 auth provider for Synapse")
;;     (description
;;      "This package allows Synapse to use LDAP as a password provider.
;; This lets users log in to Synapse with their username and password from
;; an LDAP server.")
;;     (license license:asl2.0)))

;; (define-public synapse
;;   (package
;;     (name "synapse")
;;     (version "1.98.0")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;;               (url "https://github.com/matrix-org/synapse")
;;               (commit (string-append "v" version))))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "0fgw1wm0bw8k3643a8d7lg5h0vi4c4gdy6wx7vj0ih9bpz2w9cwa"))))
;;     (build-system pyproject-build-system)
;;     ;; TODO Run tests with ‘PYTHONPATH=. trial3 tests’.
;;     (propagated-inputs
;;      (list python-simplejson            ;not attested but required
;;            ;; requirements (synapse/python_dependencies.py)
;;            python-jsonschema
;;            python-frozendict
;;            python-unpaddedbase64
;;            python-canonicaljson
;;            python-signedjson
;;            python-pynacl
;;            python-idna
;;            python-service-identity
;;            python-twisted
;;            python-treq
;;            python-pyopenssl
;;            python-pyyaml
;;            python-pyasn1
;;            python-pyasn1-modules
;;            python-daemonize
;;            python-bcrypt
;;            python-pillow
;;            python-sortedcontainers
;;            python-pymacaroons
;;            python-msgpack
;;            python-phonenumbers
;;            python-six
;;            python-prometheus-client
;;            python-attrs
;;            python-netaddr
;;            python-jinja2
;;            python-bleach
;;            python-typing-extensions
;;            ;; conditional requirements (synapse/python_dependencies.py)
;;            ;; ("python-hiredis" ,python-hiredis)
;;            python-matrix-synapse-ldap3
;;            python-psycopg2
;;            python-jinja2
;;            python-txacme
;;            python-pysaml2
;;            python-lxml
;;            python-packaging
;;            ;; sentry-sdk, jaeger-client, and opentracing could be included, but
;;            ;; all are monitoring aids and not essential.
;;            python-pyjwt))
;;     (native-inputs (list poetry python-mock python-parameterized python-setuptools
;;                          python-wheel python-setuptools-rust rust (list rust "cargo")))
;;     (home-page "https://github.com/matrix-org/synapse")
;;     (synopsis "Matrix reference homeserver")
;;     (description
;;      "Synapse is a reference \"homeserver\" implementation of Matrix from the
;; core development team at matrix.org, written in Python/Twisted.  It is
;; intended to showcase the concept of Matrix and let folks see the spec in the
;; context of a codebase and let you run your own homeserver and generally help
;; bootstrap the ecosystem.")
;;     (license license:asl2.0)))

;; (list synapse)
