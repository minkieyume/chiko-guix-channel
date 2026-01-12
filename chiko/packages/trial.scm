;; (define-module (chiko packages trial)
;;   #:use-module (gnu packages)
;;   #:use-module (guix gexp)
;;   #:use-module ((guix licenses) #:prefix license:)
;;   #:use-module (guix packages)
;;   #:use-module (guix download)
;;   #:use-module (guix git-download)
;;   #:use-module (guix build-system asdf)
;;   #:use-module (gnu packages audio)
;;   #:use-module (gnu packages autotools)
;;   #:use-module (gnu packages base)
;;   #:use-module (gnu packages pkg-config)
;;   #:use-module (gnu packages game-development)
;;   #:use-module (gnu packages libffi)
;;   #:use-module (gnu packages gl)
;;   #:use-module (gnu packages lisp)
;;   #:use-module (gnu packages lisp-xyz)
;;   #:use-module (gnu packages lisp-check)
;;   #:use-module (gnu packages bash)
;;   #:use-module (guix utils)
;;   #:use-module (ice-9 match)
;;   #:use-module (srfi srfi-1)
;;   #:use-module (srfi srfi-19))

;; (define sbcl-8g-wrapper
;;   (computed-file "sbcl-8g-wrapper"
;;     ;; 1. 使用 with-imported-modules 显式导入模块
;;     (with-imported-modules '((guix build utils))
;;       #~(begin
;;           ;; 2. 这才是在构建环境中真正加载它
;;           (use-modules (guix build utils))
;;           (let ((bin (string-append #$output "/bin")))
;;             (mkdir-p bin)
;;             (with-output-to-file (string-append bin "/sbcl")
;;               (lambda ()
;;                 (format #t "#!~a
;; exec ~a --dynamic-space-size 8192 \"$@\"~%"
;;                         #$(file-append bash-minimal "/bin/sh")
;;                         #$(file-append sbcl "/bin/sbcl"))))
;;             (chmod (string-append bin "/sbcl") #o755))))))

;; (define-macro (define-trial cl-name link cl-commit hash inputs arguments)
;;   `(define-public ,(string->symbol (string-append "sbcl-" (symbol->string cl-name) "-chiko"))
;;      (package
;;        (name ,(string-append "sbcl-" (symbol->string cl-name) "-chiko"))
;;        (version (git-version "1.4.0" "0" ,cl-commit))
;;        (source
;;         (origin
;;           (method git-fetch)
;;           (uri (git-reference
;;                  (url ,link)
;;                  (commit ,cl-commit)))
;;           (file-name (git-file-name ,(string-append "cl-" (symbol->string cl-name)) version))
;;           (sha256
;;            (base32 ,hash))))
;;        (build-system asdf-build-system/sbcl)
;;        (arguments ,arguments)
;;        (inputs
;;         (list ,@inputs))
;;        (home-page ,link)
;;        (synopsis "A trial dependency library by Shinmera")
;;        (description
;;         "This Library has auto spawned by a macro.You can see description in the home page.")
;;        (license license:zlib))))

;; (define-public sbcl-sha3
;;   (let ((commit "a4baa05e72ee05aba545152a2ffe2e46fbfa3d4b")
;;         (revision "0"))
;;     (package
;;       (name "sbcl-sha3")
;;       (version (git-version "1.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                 (url "https://github.com/pmai/sha3")
;;                 (commit commit)))
;;          (file-name (git-file-name "cl-sha3" version))
;;          (sha256
;;           (base32 "0jl59js4n1gc08j2bcwf0d1gy82lf7g53b639dwh6b0milbqh7gz"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:asd-systems '("sha3")))
;;       (home-page "https://github.com/pmai/sha3")
;;       (synopsis " Secure Hash Algorithm 3 (Keccak) Implementation in Common Lisp ")
;;       (description
;;        "This library is an implementation of the Secure Hash Algorithm 3 (SHA-3), also known as Keccak. The implementation is constrained to messages with an integral number of octets, i.e. sub-byte length messages are not supported.")
;;       (license license:zlib))))

;; (define-public sbcl-cffi-chiko
;;   (let ((commit "dad3520cd3b4d14fd494ce617c8394b48e027bb1")
;;         (revision "2"))
;;     (package
;;       (name "sbcl-cffi-chiko")
;;       (version (git-version "0.24.1" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://codeberg.org/shinmera/cffi")
;;                (commit commit)))
;;          (file-name (git-file-name "cl-cffi" version))
;;          (sha256
;;           (base32 "0kjxv955fdbax0rh9dz3fnqmlccx0kv58bb0g43xlpyk1260lfq0"))))
;;       (build-system asdf-build-system/sbcl)
;;       (inputs
;;        (list libffi
;;              sbcl-alexandria
;;              sbcl-babel
;;              sbcl-trivial-features))
;;       (native-inputs
;;        (list pkg-config
;;              sbcl-bordeaux-threads
;;              sbcl-rt))
;;       (arguments
;;        (list ;; Some tests will not work on riscv64 because a function of SBCL
;;              ;; is not implemented yet for riscv.
;;              ;; See <https://bugs.launchpad.net/sbcl/+bug/2069265>
;;              #:tests? (not (target-riscv64?))
;;              #:phases
;;              #~(modify-phases %standard-phases
;;                  (add-after 'unpack 'fix-paths
;;                    (lambda* (#:key inputs #:allow-other-keys)
;;                      (substitute* "libffi/libffi.lisp"
;;                        (("libffi.so.8" all)
;;                         (search-input-file inputs (string-append "/lib/" all))))
;;                      (substitute* "toolchain/c-toolchain.lisp"
;;                        (("\"cc\"")
;;                         (format #f "~S" (which "gcc"))))))
;;                  (add-after 'build 'install-headers
;;                    (lambda _
;;                      (install-file "grovel/common.h"
;;                                    (string-append #$output
;;                                                   "/include/grovel")))))
;;              #:asd-systems ''("cffi"
;;                               "cffi-libffi"
;;                               "cffi-uffi-compat")))
;;       (home-page "https://common-lisp.net/project/cffi/")
;;       (synopsis "Common Foreign Function Interface for Common Lisp")
;;       (description "The Common Foreign Function Interface (CFFI)
;; purports to be a portable foreign function interface for Common Lisp.
;; The CFFI library is composed of a Lisp-implementation-specific backend
;; in the CFFI-SYS package, and a portable frontend in the CFFI
;; package.")
;;       (license license:expat))))

;; (define-public sbcl-cl-opengl-chiko
;;   (let ((commit "1a690e95cc75ecc347f6144319f85d58a2b06f33")
;;         (revision "1"))
;;     (package
;;       (name "sbcl-cl-opengl")
;;       (version (git-version "0.1.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://github.com/3b/cl-opengl")
;;                (commit commit)))
;;          (file-name (git-file-name "cl-opengl" version))
;;          (sha256
;;           (base32 "16alk0nfg5alydm3gb4sn1hyg8akjmnxm9v67nqpk4363n37wwyk"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:asd-systems '("cl-opengl" "cl-glu" "cl-glut")
;;          #:phases
;;          (modify-phases %standard-phases
;;            (add-after 'unpack 'patch-lib-path
;;              (lambda* (#:key inputs #:allow-other-keys)
;;                (substitute* "gl/library.lisp"
;;                  (("libGL.so" all)
;;                   (search-input-file inputs "/lib/libGL.so")))
;;                (substitute* "glu/library.lisp"
;;                  (("libGLU.so" all)
;;                   (search-input-file inputs "/lib/libGLU.so")))
;;                (substitute* "glut/library.lisp"
;;                  (("libglut.so" all)
;;                   (search-input-file inputs "/lib/libglut.so"))))))))
;;       (inputs
;;        `(("alexandria" ,sbcl-alexandria)
;;          ("cffi" ,sbcl-cffi)
;;          ("float-features" ,sbcl-float-features)
;;          ("freeglut" ,freeglut)
;;          ("glu" ,glu)
;;          ("mesa" ,mesa)))
;;       (home-page "https://github.com/3b/cl-opengl")
;;       (synopsis "Common Lisp bindings to OpenGL, GLU and GLUT APIs")
;;       (description
;;        "This package provides a set of bindings and utilities for accessing the
;; OpenGL (Mesa), GLU and GLUT (FreeGLUT) APIs using CFFI.")
;;       (license license:bsd-3))))

;; (define-public sbcl-cl-wavefront
;;   (let ((commit "421c3400b26a1ab44945785e6c931f3b06248d0e")
;;         (revision "0"))
;;     (package
;;       (name "sbcl-cl-wavefront")
;;       (version (git-version "1.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                 (url "https://codeberg.org/shirakumo/cl-wavefront")
;;                 (commit commit)))
;;          (file-name (git-file-name "cl-wavefront" version))
;;          (sha256
;;           (base32 "1h6w5nz9kxhyrr4mvcrflrnbjg7xs3rjik52p17wbc8fq0686fhg"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:tests? #f
;;          #:asd-systems '("cl-wavefront")))
;;       (inputs
;;        (list sbcl-cl-ppcre
;;              sbcl-parse-float
;;              sbcl-documentation-utils))
;;       (home-page "https://shirakumo.org/docs/cl-wavefront")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

;; (define-public sbcl-manifolds
;;   (let ((commit "eaecb0f25b0abc6ba765a24a46cc8d815d03cbaa")
;;         (revision "0"))
;;     (package
;;       (name "sbcl-manifolds")
;;       (version (git-version "1.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                (url "https://codeberg.org/shirakumo/manifolds")
;;                (commit commit)))
;;          (file-name (git-file-name "cl-manifolds" version))
;;          (sha256
;;           (base32 "1jzlii61fhnkiwybrnwcd7y00sfjhqfxfzf93qvz4f2fbmpxr6lb"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:asd-systems '("manifolds")))
;;       (inputs
;;        (list sbcl-3d-math-chiko
;;              sbcl-3d-spaces
;;              sbcl-documentation-utils
;;              sbcl-cl-wavefront))
;;       (home-page "https://shirakumo.org/docs/manifolds")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

;; (define-public sbcl-quickhull
;;   (let ((commit "20a36dee90d65ae68c3eb674e058087d2b42a0c2")
;;         (revision "0"))
;;     (package
;;       (name "sbcl-quickhull")
;;       (version (git-version "1.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                 (url "https://codeberg.org/shirakumo/quickhull")
;;                 (commit commit)))
;;          (file-name (git-file-name "cl-quickhull" version))
;;          (sha256
;;           (base32 "1r77zdxww69xfhgs37yfvmlf1py7cidkbs4k38x7m5nrxwg9188v"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:asd-systems '("quickhull")))
;;       ;; (native-inputs
;;       ;;  (list sbcl-trivial-features))
;;       (inputs
;;        (list sbcl-3d-math-chiko
;;              sbcl-documentation-utils))
;;       (home-page "https://shirakumo.org/docs/quickhull")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

;; (define-public cl-quickhull
;;   (sbcl-package->cl-source-package sbcl-quickhull))

;; (define-public sbcl-convex-covering
;;   (let ((commit "b2d5799c54cc2afed050bb4d81d76c481b3000ee")
;;         (revision "0"))
;;     (package
;;       (name "sbcl-convex-covering")
;;       (version (git-version "1.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                 (url "https://codeberg.org/shirakumo/convex-covering")
;;                 (commit commit)))
;;          (file-name (git-file-name "cl-convex-covering" version))
;;          (sha256
;;           (base32 "1pl03w6w2pq2ib1af3gfdpaj35v3ls7bzrdg4vp3r63hsscbbkb4"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:tests? #f
;;          #:asd-systems '("convex-covering"
;;                          "convex-covering/test"
;;                          "convex-covering/visualization")))
;;       (inputs
;;        (list sbcl-3d-spaces
;;              sbcl-manifolds
;;              sbcl-quickhull
;;              sbcl-damn-fast-priority-queue
;;              sbcl-lparallel
;;              sbcl-machine-state
;;              sbcl-documentation-utils
;;              sbcl-parachute
;;              sbcl-alexandria
;;              sbcl-cl-wavefront
;;              sbcl-cl-dot
;;              sbcl-inferior-shell))
;;       (home-page "https://shirakumo.org/docs/convex-covering")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

;; (define-public cl-convert-covering
;;   (sbcl-package->cl-source-package sbcl-convex-covering))

;; (define-public sbcl-memory-regions
;;   (let ((commit "9bdbc67f388b37aa111fcc3fa0cbea6f55372be4")
;;         (revision "0"))
;;     (package
;;       (name "sbcl-memory-regions")
;;       (version (git-version "1.2.0" revision commit))
;;       (source
;;        (origin
;;          (method git-fetch)
;;          (uri (git-reference
;;                 (url "https://codeberg.org/shinmera/memory-regions")
;;                 (commit commit)))
;;          (file-name (git-file-name "cl-memory-regions" version))
;;          (sha256
;;           (base32 "16l4jxypxva1pg5gcncpk7v7zp3nrb64qw7zf2vpfyhl9jjvm0m9"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:tests? #f
;;          #:asd-systems '("memory-regions/region"
;;                          "memory-regions/allocator"
;;                          "memory-regions/sequence"
;;                          "memory-regions/stream"
;;                          "memory-regions/object"
;;                          "memory-regions/pathname"
;;                          "memory-regions/static-vector")))
;;       (inputs
;;        (list sbcl-trivial-extensible-sequences
;;              sbcl-cffi
;;              sbcl-trivial-gray-streams
;;              sbcl-closer-mop
;;              sbcl-static-vectors
;;              sbcl-mmap
;;              sbcl-documentation-utils))
;;       (home-page "https://shirakumo.org/docs/memory-regions")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

;; (define-trial memory-regions
;;   "https://codeberg.org/shinmera/memory-regions"
;;   "9bdbc67f388b37aa111fcc3fa0cbea6f55372be4"
;;   "16l4jxypxva1pg5gcncpk7v7zp3nrb64qw7zf2vpfyhl9jjvm0m9"
;;   (sbcl-trivial-extensible-sequences
;;    sbcl-cffi
;;    sbcl-trivial-gray-streams
;;    sbcl-closer-mop
;;    sbcl-static-vectors
;;    sbcl-mmap
;;    sbcl-documentation-utils)
;;   `(#:tests? #f
;;     #:asd-systems '("memory-regions/region"
;;                     "memory-regions/allocator"
;;                     "memory-regions/sequence"
;;                     "memory-regions/stream"
;;                     "memory-regions/object"
;;                     "memory-regions/pathname"
;;                     "memory-regions/static-vector")))

;; ;; TODO 根据以下包和对应仓库的路径，按照本文件的格式自动生成对应的包定义，不要加多余的东西：
;; ;; cl-bmp  https://codeberg.org/shinmera/cl-bmp
;; ;; cl-devil https://github.com/zkat/cl-devil
;; ;; skippy-renderer https://github.com/phoe/skippy-renderer
;; ;; 3b-hdr https://github.com/3b/3b-hdr/
;; ;; cl-jpeg https://github.com/sharplispers/cl-jpeg
;; ;; cl-turbojpeg https://codeberg.org/shirakumo/cl-turbojpeg
;; ;; cl-ktx https://codeberg.org/shinmera/cl-ktx
;; ;; cl-ktx2 https://codeberg.org/shinmera/cl-ktx2
;; ;; cl-sf3 https://codeberg.org/shirakumo/cl-sf3

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
;;                 (url "https://codeberg.org/shirakumo/imagine")
;;                 (commit commit)))
;;          (file-name (git-file-name "cl-imagine" version))
;;          (sha256
;;           (base32 "1r2vr00vzvvv6fvh953bhfb4s16gmd5glmy9h7c3n0pl2hpgwrw9"))))
;;       (build-system asdf-build-system/sbcl)
;;       (arguments
;;        `(#:tests? #f
;;          #:asd-systems '("imagine"                         
;;                          "imagine/foreign-pointer"
;;                          "imagine/memory-region"
;;                          "imagine/raw"
;;                          "imagine/depot"
;;                          ;; "imagine/bmp"
;;                          ;; "imagine/devil"
;;                          ;; "imagine/gif"
;;                          ;; "imagine/hdr"
;;                          ;; "imagine/jpeg"
;;                          ;; "imagine/jpeg-turbo"
;;                          ;; "imagine/ktx"
;;                          ;; "imagine/png"
;;                          ;; "imagine/qoi"
;;                          ;; "imagine/sf3"
;;                          ;; "imagine/svg"
;;                          "imagine/terragen"
;;                          ;; "imagine/tga"
;;                          ;; "imagine/tiff"
;;                          ;; "imagine/formats"
;;                          ;; "imagine/test"
;;                          )))
;;       (inputs
;;        (list sbcl-closer-mop
;;              sbcl-nibbles
;;              sbcl-documentation-utils
;;              sbcl-cffi
;;              sbcl-depot-chiko
;;              sbcl-cl-jpeg
;;              sbcl-pngload
;;              sbcl-zpng
;;              sbcl-retrospectiff
;;              sbcl-memory-regions-chiko
;;              sbcl-terrable
;;              ;; sbcl-cl-bmp
;;              ;; sbcl-skippy-renderer
;;              ;; sbcl-3b-hdr
;;              ))
;;       (home-page "https://shirakumo.org/docs/imagine")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

;; (define-trial lru-cache
;;   "https://codeberg.org/shinmera/lru-cache"
;;   "53d0f846103ad7df690fc01ccd8d5a0a26220079"
;;   "10nclq68k17kx6fr7vmwxci5i9bqsh32jiflfmzd9yzzc6rqvaxv"
;;   (sbcl-documentation-utils)
;;   `(#:tests? #f #:asd-systems '("lru-cache")))

;; (define-trial precise-time
;;   "https://codeberg.org/shinmera/precise-time"
;;   "93ea6aea74aa2ea8860e8581e67997636320e841"
;;   "0gj98hvmzvay27rbdjnz65izcs0dr0rq1g11aac04c0w12xp1rq5"
;;   (sbcl-documentation-utils
;;    sbcl-cffi
;;    sbcl-parachute)
;;   `(#:asd-systems '("precise-time" "precise-time/test")))

;; (define-trial random-state
;;   "https://codeberg.org/shinmera/random-state"
;;   "cef6ce2c99b5f132b912d396eac25daebe8abb83"
;;   "0pml2l7q4j6hq9ikr7dhxdswn8dpyvnnxbdf6h1j0xalj33ga55b"
;;   (sbcl-documentation-utils
;;    sbcl-zpng
;;    sbcl-trivial-features
;;    sbcl-parachute)
;;   `(#:tests? #f #:asd-systems '("random-state" "random-state/test" "random-state/viewer")))

;; (define-trial random-sampling
;;   "https://codeberg.org/shinmera/random-sampling"
;;   "c8bbcb069566fae7a2cae00e7b63a1d0f4f38045"
;;   "0xc1a4fsb87a686ll16qgjrw6qyijzjv9v6j5ikap2skz6yq0xhf"
;;   (sbcl-documentation-utils
;;    sbcl-random-state-chiko
;;    sbcl-3d-math-chiko
;;    sbcl-parachute)
;;   `(#:asd-systems '("random-sampling" "random-sampling/test")))

;; (define-trial random-noise
;;   "https://codeberg.org/shinmera/random-noise"
;;   "a069aa97c1a8ac2d33893666ddc9479b2ba2f045"
;;   "0yjkvyhmk2qbgcm8kzmbfbgwc8rznf1rl70pvk71ip6k3kj3zl1c"
;;   (sbcl-documentation-utils
;;    sbcl-zpng
;;    sbcl-parachute)
;;   `(#:asd-systems '("random-noise" "random-noise/test")))

;; (define-trial text-draw
;;   "https://codeberg.org/shinmera/text-draw"
;;   "4a98cedd7ad1d1e5c230be8f00aeb7d82bf43cf9"
;;   "15gnslf8arcknrv668aqf0n2s10lw8gchnvmgnafxv825w6q8vw1"
;;   (sbcl-documentation-utils)
;;   `(#:asd-systems '("text-draw")))

;; (define-trial trivial-deprecate
;;   "https://codeberg.org/shinmera/trivial-deprecate"
;;   "30a6385281d224760e687dc3fd7b9a0c276825a2"
;;   "0xp5wk7r2d9l896bsla2dhcidbgl5h0pvw40gdsjvjy1cbyqpri0"
;;   ()
;;   `(#:asd-systems '("trivial-deprecate")))

;; (define-trial 3d-spaces
;;   "https://codeberg.org/shirakumo/3d-spaces"
;;   "48b909d4416dc0a9b442e15a078775e84dc21b9f"
;;   "0jz1lwnkfs7cjaf2pgfpacx6frysd57cmhykkv7dsmw7mpj4n7q5"
;;   (sbcl-documentation-utils
;;    sbcl-text-draw-chiko
;;    sbcl-cl-wavefront
;;    sbcl-3d-math-chiko
;;    sbcl-for
;;    sbcl-nibbles
;;    sbcl-trivial-extensible-sequences
;;    sbcl-babel
;;    sbcl-parachute)
;;   `(#:asd-systems '("3d-spaces" "3d-spaces/test")))

;; (define-trial 3d-math
;;   "https://codeberg.org/shinmera/3d-math"
;;   "00527bb4d44c89a378eda740ef4a39c01d0b47d2"
;;   "0fl8byjl1icljgmqzbb0p1vg5s0i3rvfjn7n5fa10nxg4gn07gmc"
;;   (sbcl-documentation-utils
;;    sbcl-type-templates
;;    sbcl-parachute)
;;   `(#:lisp ,sbcl-8g-wrapper #:asd-systems '("3d-math" "3d-math-test")))

;; (define-trial deploy
;;   "https://codeberg.org/shinmera/deploy"
;;   "5d57fcce38b6156be951f3fed9fbbdacf4ba2912"
;;   "1f2sahr2k4d291hn7x7bcy4nxav4va3rrw2gcw122zsg97siqy8h"
;;   (sbcl-cffi
;;    sbcl-sha3
;;    sbcl-pathname-utils
;;    sbcl-trivial-features)
;;   `(#:asd-systems '("deploy")))

;; (define-trial glsl-toolkit
;;   "https://codeberg.org/shirakumo/glsl-toolkit"
;;   "5a2c15ebf2688dc7539a2a22fb7be56e674a2a3f"
;;   "0xd2dg83ndkqim0ihr8kw6gw4gf4zsn9aich7xmfp9yldp30z682"
;;   (sbcl-documentation-utils
;;    sbcl-parse-float
;;    sbcl-trivial-indent
;;    sbcl-cl-ppcre)
;;   `(#:asd-systems '("glsl-toolkit")))

;; (define-trial zippy
;;   "https://codeberg.org/shinmera/zippy"
;;   "abe4d5501e0b2f9ebbecb0cd27210bf14da3f8b4"
;;   "0fwfjap9xkrqqf7lvav3qwbz64sl1ypds4frgfjy40yjxy6rfgjy"
;;   (sbcl-documentation-utils
;;    sbcl-nibbles
;;    sbcl-file-attributes
;;    sbcl-pathname-utils
;;    sbcl-filesystem-utils
;;    sbcl-alexandria
;;    sbcl-3bz
;;    sbcl-salza2
;;    sbcl-babel)
;;   `(#:asd-systems '("zippy")))

;; (define-trial depot
;;   "https://codeberg.org/shinmera/depot"
;;   "6b46c7d85475bb3869589a73fa7dce8614e6f2f7"
;;   "0ka6lan77phinhw66jbzl4xpngyfwk67rhzaxf4vv13f5ajdi2gb"
;;   (sbcl-documentation-utils
;;    sbcl-trivial-gray-streams
;;    sbcl-trivial-features
;;    sbcl-zippy-chiko
;;    sbcl-atomics
;;    sbcl-babel)
;;   `(#:asd-systems '("depot" "depot-zip" "depot-virtual" "depot-in-memory")))

;; (define-trial machine-state
;;   "https://codeberg.org/shinmera/machine-state"
;;   "6c119f9e2f538c36a88039323cc05356a3ea92d2"
;;   "05599n3h8yjrza534s1jdfwn4b4yci0i53vjdfl8w07j3mhjsq60"
;;   (sbcl-documentation-utils
;;    sbcl-trivial-features
;;    sbcl-cffi
;;    sbcl-bordeaux-threads
;;    sbcl-pathname-utils
;;    sbcl-cl-opengl
;;    sbcl-parachute)
;;   `(#:asd-systems '("machine-state"
;;                     ;; "machine-state/opengl"
;;                     "machine-state/test")))

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
;;        `(#:asd-systems '("trial")))
;;       (native-inputs
;;        (list sbcl-trivial-features))
;;       (inputs
;;        (list sbcl-3d-math-chiko
;;              sbcl-3d-spaces-chiko
;;              sbcl-alexandria
;;              sbcl-atomics
;;              sbcl-bordeaux-threads
;;              sbcl-cl-gamepad
;;              sbcl-cl-opengl
;;              sbcl-cl-ppcre
;;              sbcl-closer-mop
;;              sbcl-jzon
;;              sbcl-convex-covering
;;              sbcl-deploy-chiko
;;              sbcl-depot-chiko
;;              sbcl-documentation-utils
;;              sbcl-filesystem-utils
;;              sbcl-float-features
;;              sbcl-flow
;;              sbcl-for
;;              sbcl-form-fiddle
;;              sbcl-glsl-toolkit-chiko
;;              sbcl-ieee-floats
;;              sbcl-imagine
;;              sbcl-lambda-fiddle
;;              sbcl-language-codes
;;              sbcl-lquery
;;              sbcl-lru-cache-chiko
;;              sbcl-machine-state
;;              sbcl-manifolds
;;              sbcl-memory-regions-chiko
;;              sbcl-messagebox
;;              sbcl-nibbles
;;              sbcl-open-with
;;              sbcl-pathname-utils
;;              sbcl-precise-time-chiko
;;              sbcl-promise
;;              sbcl-quickhull
;;              sbcl-random-sampling-chiko
;;              sbcl-random-state-chiko
;;              sbcl-random-noise-chiko
;;              sbcl-sha3
;;              sbcl-simple-tasks
;;              sbcl-system-locale
;;              sbcl-text-draw-chiko
;;              sbcl-trivial-deprecate-chiko
;;              sbcl-trivial-extensible-sequences
;;              sbcl-trivial-garbage
;;              sbcl-trivial-indent
;;              sbcl-verbose
;;              sbcl-zpng))
;;       (home-page "https://shirakumo.org/docs/trial")
;;       (synopsis "Common Lisp game engine")
;;       (description
;;        "Trial is a game engine written in Common Lisp.  Unlike many other
;; engines, it is meant to be more of a loose connection of components that can be
;; fit together as required by any particular game.")
;;       (license license:zlib))))

;; ;; (define-public cl-trial-chiko
;; ;;   (sbcl-package->cl-source-package sbcl-trial-chiko))

;; (list sbcl-cl-wavefront
;;       sbcl-manifolds
;;       sbcl-quickhull
;;       sbcl-convex-covering
;;       sbcl-memory-regions-chiko
;;       sbcl-imagine
;;       sbcl-lru-cache-chiko
;;       sbcl-precise-time-chiko
;;       sbcl-random-state-chiko
;;       sbcl-random-sampling-chiko
;;       sbcl-random-noise-chiko
;;       sbcl-sha3
;;       sbcl-text-draw-chiko
;;       sbcl-trivial-deprecate-chiko
;;       sbcl-deploy-chiko
;;       sbcl-3d-spaces-chiko
;;       sbcl-3d-math-chiko
;;       sbcl-glsl-toolkit-chiko
;;       sbcl-zippy-chiko
;;       sbcl-depot-chiko
;;       sbcl-machine-state-chiko
;;       sbcl-trial-chiko)
