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
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages emacs-build)
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
		"0d9c7i3x4vfl7k4vi29zyrz1d2cx7kfdnir8slqdjbapyacrl4s0"))
              (file-name (git-file-name "emacs-dirvish" version))))))

(define-public emacs-llm
  (package
    (name "emacs-llm")
    (version "0.27.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	      (url "https://github.com/ahyatt/llm")
	      (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0nx6rwv6ay061nvyik0m4b633jnkwscz6k4nr03h8fdq8930mdif"))))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #f))
    (propagated-inputs (list emacs-compat
			     emacs-plz
			     emacs-plz-event-source))
    (home-page "https://github.com/ahyatt/llm")
    (synopsis
     "A package abstracting llm capabilities for emacs.")
    (description
     "This library provides an interface for interacting with Large Language Models (LLMs). It allows elisp code to use LLMs while also giving end-users the choice to select their preferred LLM. This is particularly beneficial when working with LLMs since various high-quality models exist, some of which have paid API access, while others are locally installed and free but offer medium quality. Applications using LLMs can utilize this library to ensure compatibility regardless of whether the user has a local LLM or is paying for API access.")
    (license license:gpl3+)))

(define-public emacs-triples
  (let ((commit "5e17182a5374a1656761bb26832fd21c6f168685")
	(revision "0"))
    (package
      (name "emacs-triples")
      (version (git-version "0" revision commit))
      (source
       (origin
	 (method git-fetch)
	 (uri (git-reference
		(url "https://github.com/ahyatt/triples")
		(commit commit)))
	 (file-name (git-file-name name version))
	 (sha256
          (base32 "12vi4m7gns2769z8sxs13b76av2ygaw990m9k47hsq67lq8qai0k"))))
      (build-system emacs-build-system)
      (arguments
       (list #:tests? #f))
      (propagated-inputs (list emacs-compat))
      (home-page "https://github.com/ahyatt/triples")
      (synopsis
       " An emacs module to manage a generic database of triples: subject, predicate, object data. This can be used for a variety of applications. ")
      (description
       "The triples package is a standard database package designed for use in other emacs modules. It works with either the builtin sqlite in Emacs 29 or the emacsql package, and provides a simple way of storing entities and their associated schema. The triples package is well suited to graph-like applications, where links between entities are important. The package has wrappers for most common operations, but it is anticipated that occasionally client modules would need to make their own sqlite calls. Many different database instances can be handled by the triples package. It is expected that clients supply the database connection. However, a standard triples database can be used, which is defined in triples-default-database-filename, and used when no filename is used to connect to by clients of the triples library.

This package is useful for simple applications that don’t want to write their own SQL calls, as well as more complicated applications that want to store many different kinds of objects without having to set up and manage a variety of tables, especially when there is a graph-like relationship between the entities. It also is suited for applications where different packages want to store different data about the same set of entities, or store the same data about very different sets of entities. For example, having everything that has a creation time be treated uniformly, regardless of the type of entity, is something that would be require more advanced solutions in normal SQL but is standard and easy in a Triple database. These benefits are due to the fact that the storage is extremely regular and flexible, with a schema defining multiple types that are independent of each other, and with all the schema being software-managed, but installed in the database itself. The disadvantage is that it can be significantly more inefficient. However, for the kind of applications that emacs typically uses, the inefficiencies typically are not significant.")
      (license license:gpl3+))))

(define-public emacs-ekg
  (package
    (name "emacs-ekg")
    (version "0.8.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	      (url "https://github.com/ahyatt/ekg")
	      (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0qlg1lksj6cy9fj0ag4c5vr0561j8p52si5hbm571xh40f4pjays"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list emacs-compat
			     emacs-llm
			     emacs-triples
			     emacs-denote
			     emacs-org-roam))
    (home-page "https://github.com/ahyatt/ekg")
    (synopsis
     "The emacs knowledge graph, app for notes and structured data. ")
    (description
     "The ekg module is a simple but opinionated note taking application, for emacs. It is a substitute for such other emacs applications such as org-roam or denote. ekg stands for emacs knowledge graph.

All of ekg’s data is stored in a sqlite database. Notes are organized around tags, and you can view many notes by looking at one or more tags.")
    (license license:gpl3+)))

(define-public emacs-copilot
  (package
    (name "emacs-copilot")
    (version "0.2.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	      (url "https://github.com/copilot-emacs/copilot.el")
	      (commit "6a2ad80489b8a0d021df95293eb7ac370aea140b")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1f2gxzg9vz6pwzaygqq99z5ii3ccpcv3031qnm03mql7zdwm29ba"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list emacs-compat emacs-f emacs-editorconfig))
    (home-page "https://github.com/copilot-emacs/copilot.el")
    (synopsis
     "An unofficial Copilot plugin for Emacs. ")
    (description
     "This plugin is unofficial, however it makes use of the official @github/copilot-language-server provided by Microsoft.")
    (license license:gpl3+)))

;; 测试用：
(list emacs-dirvish-unstable emacs-llm emacs-triples emacs-ekg emacs-copilot)

