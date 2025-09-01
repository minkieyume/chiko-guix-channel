(define-module (chiko packages emacs-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system emacs)
  #:use-module (guix download)
  #:use-module (guix deprecation)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))


(define-public emacs-dirvish-unstable
  (package
   (inherit emacs-dirvish)
   (version "d877433f957a363ad78b228e13a8e5215f2d6593")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/alexluigit/dirvish")
                  (commit version)))
            (sha256
             (base32
              "1x79j3xlvhrvigh38vqhfrzqvdnpzaivbxsjzfi0pnx00y8czs5q"))
            (file-name (git-file-name "emacs-dirvish" version))))))

;; 测试用：
(list emacs-dirvish-unstable)

