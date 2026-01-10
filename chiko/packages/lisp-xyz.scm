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

(define-public sbcl-cl-wavefront
  (let ((commit "421c3400b26a1ab44945785e6c931f3b06248d0e")
        (revision "0"))
    (package
      (name "sbcl-cl-wavefront")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://codeberg.org/shirakumo/cl-wavefront")
               (commit commit)))
         (file-name (git-file-name "cl-wavefront" version))
         (sha256
          (base32 "1h6w5nz9kxhyrr4mvcrflrnbjg7xs3rjik52p17wbc8fq0686fhg"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:tests? #f
         #:asd-systems '("cl-wavefront")))
      (inputs
       (list sbcl-cl-ppcre
             sbcl-parse-float
             sbcl-documentation-utils))
      (home-page "https://shirakumo.org/docs/cl-wavefront")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public sbcl-manifolds
  (let ((commit "eaecb0f25b0abc6ba765a24a46cc8d815d03cbaa")
        (revision "0"))
    (package
      (name "sbcl-manifolds")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://codeberg.org/shirakumo/manifolds")
               (commit commit)))
         (file-name (git-file-name "cl-manifolds" version))
         (sha256
          (base32 "1jzlii61fhnkiwybrnwcd7y00sfjhqfxfzf93qvz4f2fbmpxr6lb"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:asd-systems '("manifolds")))
      (inputs
       (list sbcl-3d-math
             sbcl-3d-spaces
             sbcl-documentation-utils
             sbcl-cl-wavefront))
      (home-page "https://shirakumo.org/docs/manifolds")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public sbcl-quickhull
  (let ((commit "20a36dee90d65ae68c3eb674e058087d2b42a0c2")
        (revision "0"))
    (package
      (name "sbcl-quickhull")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shirakumo/quickhull")
                (commit commit)))
         (file-name (git-file-name "cl-quickhull" version))
         (sha256
          (base32 "1r77zdxww69xfhgs37yfvmlf1py7cidkbs4k38x7m5nrxwg9188v"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:asd-systems '("quickhull")))
      ;; (native-inputs
      ;;  (list sbcl-trivial-features))
      (inputs
       (list sbcl-3d-math
             sbcl-documentation-utils))
      (home-page "https://shirakumo.org/docs/quickhull")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public cl-quickhull
  (sbcl-package->cl-source-package sbcl-quickhull))

(define-public sbcl-convex-covering
  (let ((commit "b2d5799c54cc2afed050bb4d81d76c481b3000ee")
        (revision "0"))
    (package
      (name "sbcl-convex-covering")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shirakumo/convex-covering")
                (commit commit)))
         (file-name (git-file-name "cl-convex-covering" version))
         (sha256
          (base32 "1pl03w6w2pq2ib1af3gfdpaj35v3ls7bzrdg4vp3r63hsscbbkb4"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:tests? #f
         #:asd-systems '("convex-covering"
                         "convex-covering/test"
                         "convex-covering/visualization")))
      (native-inputs
       (list sbcl-trivial-features))
      (inputs
       (list sbcl-3d-spaces
             sbcl-manifolds
             sbcl-quickhull
             sbcl-damn-fast-priority-queue
             sbcl-lparallel
             sbcl-machine-state
             sbcl-documentation-utils
             sbcl-parachute
             sbcl-alexandria
             sbcl-cl-wavefront
             sbcl-cl-dot
             sbcl-inferior-shell))
      (home-page "https://shirakumo.org/docs/convex-covering")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public cl-convert-covering
  (sbcl-package->cl-source-package sbcl-convex-covering))

;; (define-public sbcl-imagine
;;   (let ((commit "e11ec0aa5710256767dc75eb3820293d3fbb4e0d")
;;         (revision "0"))
;;     (package
;;       (name "sbcl-imagine")
;;       (version (git-version "1.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://codeberg.org/shirakumo/imagine")
;;                (commit commit)))
;;          (file-name (git-file-name "imagine" version))
;;          (sha256
;;           (base32 "1h6w5nz9kxhyrr4mvcrflrnbjg7xs3rjik52p17wbc8fq0686fhg"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:tests? #f
;;          #:asd-systems '("imagine")))
;;       (inputs
;;        (list sbcl-closer-mop
;;              sbcl-nibbles
;;              sbcl-documentation-utils))
;;       (home-page "https://shirakumo.org/docs/imagine")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

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
;;                 (url "https://codeberg.org/shirakumo/trial")
;;                 (commit commit)))
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
;;              sbcl-3d-math
;;              sbcl-3d-spaces
;;              sbcl-convex-covering
;;              sbcl-depot
;;              sbcl-filesystem-utils
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

(list sbcl-cl-wavefront
      sbcl-manifolds
      sbcl-quickhull
      sbcl-convex-covering
      ;; sbcl-trial-chiko
      )
