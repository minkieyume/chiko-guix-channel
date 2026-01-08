(define-module (chiko packages guile-xyz)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages guile-xyz)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system guile)
  #:use-module (guix utils)
  #:use-module (ice-9 match))

(define-public guile-orgfile
  (let ((commit "19c77b842998fb46758c8af7ef72caeb32a2eba3")
        (revision "0"))
    (package
      (name "guile-orgfile")
      (version (git-version "0.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                       (url "https://github.com/minkieyume/guile-orgfile")
                       (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0izkw8zgw1bkcqcb8dm480vhnbcbs6vvc6dhisncg088rw1ksjgn"))))
      (build-system guile-build-system)
      (arguments
       (list #:source-directory "orgfile"))
      (inputs (list guile-3.0))
      ;; (propagated-inputs (list guile-hashing))
      (home-page "https://github.com/minkieyume/guile-orgfile")
      (synopsis " Small parser for Emacs Org files. Contains sxml converter")
      (description
       "guile-orgfile is a simple parser for documents written in Emacs Org mode (.org).

This was written for use as an exporter with Haunt, a static site generator written in Guile Scheme. It is not feature complete and is under active development.")
      (license license:gpl3+))))

;; 测试用：
(list guile-orgfile)
