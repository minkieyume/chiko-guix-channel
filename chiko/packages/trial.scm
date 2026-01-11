(define-module (chiko packages trial)
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

(define-public sbcl-memory-regions
  (let ((commit "9bdbc67f388b37aa111fcc3fa0cbea6f55372be4")
        (revision "0"))
    (package
      (name "sbcl-memory-regions")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shinmera/memory-regions")
                (commit commit)))
         (file-name (git-file-name "cl-memory-regions" version))
         (sha256
          (base32 "16l4jxypxva1pg5gcncpk7v7zp3nrb64qw7zf2vpfyhl9jjvm0m9"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:tests? #f
         #:asd-systems '("memory-regions/region"
                         "memory-regions/allocator"
                         "memory-regions/sequence"
                         "memory-regions/stream"
                         "memory-regions/object"
                         "memory-regions/pathname"
                         "memory-regions/static-vector")))
      (inputs
       (list sbcl-trivial-extensible-sequences
             sbcl-cffi
             sbcl-trivial-gray-streams
             sbcl-closer-mop
             sbcl-static-vectors
             sbcl-mmap
             sbcl-documentation-utils))
      (home-page "https://shirakumo.org/docs/memory-regions")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

;; TODO 根据以下包和对应仓库的路径，按照本文件的格式自动生成对应的包定义，不要加多余的东西：
;; cl-bmp  https://codeberg.org/shinmera/cl-bmp
;; cl-devil https://github.com/zkat/cl-devil
;; skippy-renderer https://github.com/phoe/skippy-renderer
;; 3b-hdr https://github.com/3b/3b-hdr/
;; cl-jpeg https://github.com/sharplispers/cl-jpeg
;; cl-turbojpeg https://codeberg.org/shirakumo/cl-turbojpeg
;; cl-ktx https://codeberg.org/shinmera/cl-ktx
;; cl-ktx2 https://codeberg.org/shinmera/cl-ktx2
;; cl-sf3 https://codeberg.org/shirakumo/cl-sf3

(define-public sbcl-imagine
  (let ((commit "e11ec0aa5710256767dc75eb3820293d3fbb4e0d")
        (revision "0"))
    (package
      (name "sbcl-imagine")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shirakumo/imagine")
                (commit commit)))
         (file-name (git-file-name "cl-imagine" version))
         (sha256
          (base32 "1r2vr00vzvvv6fvh953bhfb4s16gmd5glmy9h7c3n0pl2hpgwrw9"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:tests? #f
         #:asd-systems '("imagine"                         
                         "imagine/foreign-pointer"
                         "imagine/memory-region"
                         "imagine/raw"
                         "imagine/depot"
                         ;; "imagine/bmp"
                         ;; "imagine/devil"
                         ;; "imagine/gif"
                         ;; "imagine/hdr"
                         ;; "imagine/jpeg"
                         ;; "imagine/jpeg-turbo"
                         ;; "imagine/ktx"
                         ;; "imagine/png"
                         ;; "imagine/qoi"
                         ;; "imagine/sf3"
                         ;; "imagine/svg"
                         "imagine/terragen"
                         ;; "imagine/tga"
                         ;; "imagine/tiff"
                         ;; "imagine/formats"
                         ;; "imagine/test"
                         )))
      (inputs
       (list sbcl-closer-mop
             sbcl-nibbles
             sbcl-documentation-utils
             sbcl-cffi
             sbcl-depot
             sbcl-cl-jpeg
             sbcl-pngload
             sbcl-zpng
             sbcl-retrospectiff
             sbcl-memory-regions
             sbcl-terrable
             ;; sbcl-cl-bmp
             ;; sbcl-skippy-renderer
             ;; sbcl-3b-hdr
             ))
      (home-page "https://shirakumo.org/docs/imagine")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public sbcl-lru-cache
  (let ((commit "53d0f846103ad7df690fc01ccd8d5a0a26220079")
        (revision "0"))
    (package
      (name "sbcl-lru-cache")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shinmera/lru-cache")
                (commit commit)))
         (file-name (git-file-name "cl-lru-cache" version))
         (sha256
          (base32 "10nclq68k17kx6fr7vmwxci5i9bqsh32jiflfmzd9yzzc6rqvaxv"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:tests? #f
         #:asd-systems '("lru-cache")))
      (inputs
       (list sbcl-documentation-utils))
      (home-page "https://codeberg.org/shinmera/lru-cache")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public sbcl-precise-time
  (let ((commit "93ea6aea74aa2ea8860e8581e67997636320e841")
        (revision "0"))
    (package
      (name "sbcl-precise-time")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shinmera/precise-time")
                (commit commit)))
         (file-name (git-file-name "cl-precise-time" version))
         (sha256
          (base32 "0gj98hvmzvay27rbdjnz65izcs0dr0rq1g11aac04c0w12xp1rq5"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:asd-systems '("precise-time" "precise-time/test")))
      (inputs
       (list sbcl-documentation-utils
             sbcl-cffi
             sbcl-parachute))
      (home-page "https://codeberg.org/shinmera/precise-time")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public sbcl-random-state-chiko
  (let ((commit "cef6ce2c99b5f132b912d396eac25daebe8abb83")
        (revision "0"))
    (package
      (name "sbcl-random-state-chiko")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shinmera/random-state")
                (commit commit)))
         (file-name (git-file-name "cl-random-state" version))
         (sha256
          (base32 "0pml2l7q4j6hq9ikr7dhxdswn8dpyvnnxbdf6h1j0xalj33ga55b"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:tests? #f #:asd-systems '("random-state" "random-state/test" "random-state/viewer")))
      (inputs
       (list sbcl-documentation-utils
             sbcl-zpng
             sbcl-trivial-features
             sbcl-parachute))
      (home-page "https://codeberg.org/shinmera/random-state")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public sbcl-random-sampling
  (let ((commit "c8bbcb069566fae7a2cae00e7b63a1d0f4f38045")
        (revision "0"))
    (package
      (name "sbcl-random-sampling")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shinmera/random-sampling")
                (commit commit)))
         (file-name (git-file-name "cl-random-sampling" version))
         (sha256
          (base32 "0xc1a4fsb87a686ll16qgjrw6qyijzjv9v6j5ikap2skz6yq0xhf"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:asd-systems '("random-sampling" "random-sampling/test")))
      (inputs
       (list sbcl-documentation-utils
             sbcl-random-state-chiko
             sbcl-3d-math
             sbcl-parachute))
      (home-page "https://codeberg.org/shinmera/random-sampling")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public sbcl-random-noise
  (let ((commit "a069aa97c1a8ac2d33893666ddc9479b2ba2f045")
        (revision "0"))
    (package
      (name "")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shinmera/random-noise")
                (commit commit)))
         (file-name (git-file-name "cl-random-noise" version))
         (sha256
          (base32 "0yjkvyhmk2qbgcm8kzmbfbgwc8rznf1rl70pvk71ip6k3kj3zl1c"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:asd-systems '("random-noise" "random-noise/test")))
      (inputs
       (list sbcl-documentation-utils
             sbcl-zpng
             sbcl-parachute))
      (home-page "https://codeberg.org/shinmera/random-noise")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

(define-public sbcl-trial-chiko
  (let ((commit "966051b503223024daeb76982028ff275b69c560")
        (revision "2"))
    (package
      (name "sbcl-trial-chiko")
      (version (git-version "1.2.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://codeberg.org/shirakumo/trial")
                (commit commit)))
         (file-name (git-file-name "cl-trial" version))
         (sha256
          (base32 "0ypx0a2dvav6swpsilprag4bp7742x57j39ra3gghq04ch442c65"))))
      (build-system asdf-build-system/sbcl)
      (arguments
       `(#:asd-systems '("trial")))
      (native-inputs
       (list sbcl-trivial-features))
      (inputs
       (list sbcl-3d-math
             sbcl-3d-spaces
             sbcl-alexandria
             sbcl-atomics
             sbcl-bordeaux-threads
             sbcl-cl-gamepad
             sbcl-cl-opengl
             sbcl-cl-ppcre
             sbcl-closer-mop
             sbcl-jzon
             sbcl-convex-covering
             sbcl-deploy
             sbcl-depot
             sbcl-documentation-utils
             sbcl-filesystem-utils
             sbcl-float-features
             sbcl-for
             sbcl-form-fiddle
             sbcl-glsl-toolkit
             sbcl-ieee-floats
             sbcl-imagine
             sbcl-lambda-fiddle
             sbcl-language-codes
             sbcl-lquery
             sbcl-lru-cache
             sbcl-machine-state
             sbcl-manifolds
             sbcl-memory-regions
             sbcl-messagebox
             sbcl-nibbles
             sbcl-open-with
             sbcl-pathname-utils
             sbcl-precise-time
             sbcl-promise
             sbcl-quickhull
             sbcl-random-sampling
             sbcl-random-state-chiko
             sbcl-random-noise
             ;; sha3
             ;; simple-tasks
             ;; system-locale
             ;; text-draw
             ;; trivial-deprecate
             sbcl-trivial-extensible-sequences
             sbcl-trivial-garbage
             sbcl-trivial-indent
             sbcl-verbose
             sbcl-zpng))
      (home-page "https://shirakumo.org/docs/trial")
      (synopsis "Common Lisp game engine")
      (description
       "Trial is a game engine written in Common Lisp.  Unlike many other
engines, it is meant to be more of a loose connection of components that can be
fit together as required by any particular game.")
      (license license:zlib))))

;; (define-public cl-trial-chiko
;;   (sbcl-package->cl-source-package sbcl-trial-chiko))

(list sbcl-cl-wavefront
      sbcl-manifolds
      sbcl-quickhull
      sbcl-convex-covering      
      sbcl-memory-regions
      sbcl-imagine
      sbcl-lru-cache
      sbcl-precise-time
      sbcl-random-state-chiko
      sbcl-random-sampling
      sbcl-random-noise
      ;; sbcl-trial-chiko
      )
