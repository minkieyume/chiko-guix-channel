(define-module (chiko packages ai)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (nonguix build-system binary)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages base))

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
       #:patchelf-plan `(("ollama" ("glibc" "gcc")))
       #:install-plan `(("ollama" "bin/ollama"))
       #:phases (modify-phases %standard-phases
                  (add-after 'binary-unpack 'chmod-to-allow-patchelf
                    (lambda _
                      (chmod "ollama" #o755))))))
    (inputs (list (list gcc "lib") glibc))
    (home-page "https://ollama.com")
    (synopsis "Get up and running with large language models")
    (description
     "Get up and running with large language models.
Run Llama 2, Code Llama, and other models. Customize and create your own.")
    (license license:expat)))

(list ollama-linux-amd64)
