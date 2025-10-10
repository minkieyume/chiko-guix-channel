(define-module (chiko packages ai)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (nonguix build-system binary)
  #:use-module (guix build utils)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base)
  #:use-module (nongnu packages nvidia))

(define-public ollama-linux-amd64
  (package
    (name "ollama-linux-amd64")
    (version "0.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/ollama/ollama/releases/download/v" version
             "/ollama-linux-amd64.tgz"))
       (sha256
        (base32 "0ab2i310armsbfpkqna0v2bj6b5wklvzdr0709jlyc127qzc76k4"))))
    (build-system binary-build-system)
    (supported-systems (list "x86_64-linux"))
    (arguments
     `(#:strip-binaries? #f
       #:patchelf-plan `(("ollama" ("glibc" "gcc-toolchain")))
       #:install-plan `(("ollama" "bin/ollama")
                        ("../lib" "lib"))
       #:validate-runpath? #f ;; 关掉验证，如果测试库支持需要打开。
       #:phases (modify-phases %standard-phases
                  (add-after 'install 'fix-rpath
                    (lambda* (#:key outputs inputs #:allow-other-keys)
                      (let* ((out (assoc-ref outputs "out"))
                             (lib (string-append out "/lib/ollama"))
                             (gcc (assoc-ref inputs "gcc-toolchain"))
                             (glibc (assoc-ref inputs "glibc"))
                             (nvidia-driver (assoc-ref inputs "nvidia-driver"))
                             (libdirs
                              (string-join
                               (list (string-append lib)
                                     (string-append lib "/cuda_v12")
                                     (string-append lib "/cuda_v13")
                                     (string-append gcc "/lib")
                                     (string-append glibc "/lib")
                                     (string-append nvidia-driver "/lib"))
                               ":")))
                        (for-each
                          (lambda (f)
                            (invoke "patchelf" "--set-rpath" libdirs f))
                          (append (find-files lib "\\.so$")
                                  (find-files lib "\\.so\\.[0-9]+")))
                        #t)))
                  (add-after 'binary-unpack 'chmod-to-allow-patchelf
                    (lambda _
                      (chmod "ollama" #o755))))))
    (inputs (list gcc-toolchain glibc nvidia-driver))
    (home-page "https://ollama.com")
    (synopsis "Get up and running with large language models")
    (description
     "Get up and running with large language models.
Run Llama 2, Code Llama, and other models. Customize and create your own.")
    (license license:expat)))

(list ollama-linux-amd64)
