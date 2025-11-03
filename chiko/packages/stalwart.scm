(define-module (chiko packages stalwart)
  #:use-module (guix build-system cargo)
  #:use-module (guix deprecation)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages c)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages rust)
  #:use-module (chiko packages rust-crates))

(define-public stalwart
  (package
    (name "stalwart")
    (version "0.14.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/stalwartlabs/stalwart")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pa4vcylfrvgxw1nl60w2z9sc1xx2w7izyc6qmhh2f6bm2gkijas"))))
    (build-system cargo-build-system)
    (arguments
     `(#:install-source? #f))
    (inputs (cargo-inputs 'stalwart))
    (home-page "https://github.com/stalwartlabs/stalwart")
    (synopsis "All-in-one Mail & Collaboration server.")
    (description
     "All-in-one Mail & Collaboration server. Secure, scalable and fluent in every protocol (IMAP, JMAP, SMTP, CalDAV, CardDAV, WebDAV). ")
    (license license:agpl3+)))

(list stalwart)
