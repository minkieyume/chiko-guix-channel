(define-module (chiko packages lisp-xyz)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system asdf)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages game-development)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages lisp-xyz)
  #:use-module (gnu packages lisp-check)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-19))

;; (define-public sbcl-trial-chiko
;;   (let ((commit "966051b503223024daeb76982028ff275b69c560")
;;         (revision "2"))
;;     (package
;;       (name "sbcl-trial-chiko")
;;       (version (git-version "1.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://codeberg.org/shirakumo/trial")
;;                (commit commit)))
;;          (file-name (git-file-name "cl-trial" version))
;;          (sha256
;;           (base32 "0ypx0a2dvav6swpsilprag4bp7742x57j39ra3gghq04ch442c65"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:asd-systems '("trial"
;;                          "trial-alloy"
;;                          "trial-animation"
;;                          "trial-assimp"
;;                          ;; TODO: It requires a long packaging journey.
;;                          ;; "trial-feedback"
;;                          "trial-gif"
;;                          "trial-glfw"
;;                          ;; FIXME: Check why this system is failing:
;;                          ;; WARNING: Invalid qualifiers for APPEND method
;;                          ;; combination in method
;;                          ;; ...
;;                          ;; "trial-glop"
;;                          "trial-gltf"
;;                          "trial-harmony"
;;                          "trial-jpeg"
;;                          "trial-notify"
;;                          "trial-png"
;;                          ;; TODO: I'm not sure which QOI system to use here. There are two:
;;                          ;; - https://github.com/bpanthi977/qoi
;;                          ;; - https://github.com/mfiano/qoi
;;                          ;; "trial-qoi"
;;                          ;; TODO: It requires a long packaging journey.
;;                          ;; "trial-qt"
;;                          "trial-sdl2"
;;                          "trial-terragen"
;;                          "trial-tga"
;;                          "trial-tiff"
;;                          "trial-workbench")))
;;       (native-inputs
;;        (list sbcl-trivial-features))
;;       (inputs
;;        (list sbcl-3d-matrices
;;              sbcl-3d-quaternions
;;              sbcl-3d-transforms
;;              sbcl-3d-vectors
;;              sbcl-alexandria
;;              sbcl-alloy
;;              sbcl-atomics
;;              sbcl-bordeaux-threads
;;              sbcl-cl-gamepad
;;              sbcl-cl-glfw3
;;              sbcl-cl-gltf
;;              sbcl-cl-jpeg
;;              sbcl-cl-opengl
;;              sbcl-cl-ppcre
;;              sbcl-cl-tga
;;              sbcl-classimp
;;              sbcl-closer-mop
;;              sbcl-deploy
;;              sbcl-dns-client
;;              sbcl-fast-io
;;              sbcl-file-notify
;;              sbcl-flare
;;              sbcl-float-features
;;              sbcl-flow
;;              sbcl-for
;;              sbcl-form-fiddle
;;              sbcl-glop
;;              sbcl-glsl-toolkit
;;              sbcl-harmony
;;              sbcl-ieee-floats
;;              sbcl-jzon
;;              sbcl-lambda-fiddle
;;              sbcl-language-codes
;;              sbcl-lquery
;;              sbcl-messagebox
;;              sbcl-mmap
;;              sbcl-pathname-utils
;;              sbcl-pngload
;;              sbcl-promise
;;              sbcl-retrospectiff
;;              sbcl-sdl2
;;              sbcl-simple-tasks
;;              sbcl-static-vectors
;;              sbcl-system-locale
;;              sbcl-terrable
;;              sbcl-trivial-extensible-sequences
;;              sbcl-trivial-garbage
;;              sbcl-trivial-indent
;;              sbcl-trivial-main-thread
;;              sbcl-verbose
;;              sbcl-zpng))
;;       (home-page "https://shirakumo.org/docs/trial")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

;; (define-public cl-trial-chiko
;;   (sbcl-package->cl-source-package sbcl-trial-chiko))

;; (list sbcl-trial-chiko)
