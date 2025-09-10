(define-module (chiko packages localsend)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (guix deprecation)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gcc)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public localsend-x86-bin
  (package
    (name "localsend-x86-bin")
    (version "1.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/localsend/localsend/releases/download/"
             version "/LocalSend-" version
             "-linux-x86-64.tar.gz"))
       (sha256
        (base32 "10ccgycq1c6m0wkakfkqc8pv4kf3c5d6ni6kck3smgidnx8yh1bg"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("../data" "share/localsend/data")
          ("../lib" "share/localsend/lib")
          ("../localsend_app" "share/localsend/localsend_app"))))
    (inputs
     (list xdg-desktop-portal
           gtk
           pango
           cairo
           harfbuzz
           atk
           gdk-pixbuf
           glib
           fontconfig
           libepoxy
           `(,gcc "lib")
           libindicator
           libdbusmenu))
    (home-page "https://localsend.org/")
    (synopsis " An open-source cross-platform alternative to AirDrop")
    (description "LocalSend is a free, open-source app that allows you to securely share files and messages with nearby devices over your local network without needing an internet connection.")
    (license license:asl2.0)))

(list localsend-x86-bin)
