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
  #:use-module (gnu packages xml)
  #:use-module (gnu packages node)
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
    (version "0.27.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	      (url "https://github.com/ahyatt/llm")
	      (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15hsfsmaq5miqra6yrlpwnzniab9jhzrj9vg74f2879lp96fbzpy"))))
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
    (propagated-inputs (list emacs-compat emacs-f emacs-editorconfig node))
    (home-page "https://github.com/copilot-emacs/copilot.el")
    (synopsis
     "An unofficial Copilot plugin for Emacs. ")
    (description
     "This plugin is unofficial, however it makes use of the official @github/copilot-language-server provided by Microsoft.")
    (license license:expat)))

(define-public emacs-copilot-chat
  (package
    (name "emacs-copilot-chat")
    (version "3.0.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	      (url "https://github.com/chep/copilot-chat.el")
	      (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1llj5513k3dqch7lfrxmv4rjbmk267hv8pq6zapa2k5y06h28gx2"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list emacs-compat emacs-f emacs-editorconfig node emacs-mcp emacs-magit emacs-polymode emacs-request emacs-markdown-mode
                             emacs-shell-maker))
    (home-page "https://github.com/chep/copilot-chat.el")
    (synopsis
     " Chat with Github copilot in Emacs ! ")
    (description
     "This plugin allows you to chat with GitHub copilot.")
    (license license:expat)))

;; (define-public emacs-codeium
;;   (package
;;     (name "emacs-codeium")
;;     (version "0.12.1")
;;     (source
;;      (origin
;;        (method git-fetch)
;;        (uri (git-reference
;; 	      (url "https://github.com/Exafunction/codeium.el")
;; 	      (commit "d815912878becffda76c1c6b41294604629e0e10")))
;;        (file-name (git-file-name name version))
;;        (sha256
;;         (base32 "0j5ym3b6b862w8r8nn6lbln4pdi1sr2a2g2il8fil2himwpyxhhm"))))
;;     (build-system emacs-build-system)
;;     (propagated-inputs (list emacs-compat))
;;     (home-page "https://github.com/Exafunction/codeium.el")
;;     (synopsis
;;      " Free, ultrafast Copilot alternative for Emacs  ")
;;     (description
;;      "Codeium autocompletes your code with AI in all major IDEs. We launched this implementation of the Codeium plugin for Emacs to bring this modern coding superpower to more developers. Check out our playground if you want to quickly try out Codeium online.
;; codeium.el provides a completion-at-point-functions backend. It is designed to be use with a front-end, such as company-mode, corfu, or the built-in completion-at-point.

;; codeium.el is an open source client and (mostly) written by Alan Chen. It uses a proprietary language server binary, currently downloaded (automatically, with confirmation) from here. Use M-x codeium-diagnose to see apis/fields that would be sent to the local language server, and the command used to run the local language server. Customize codeium-api-enabled, codeium-fields-regexps and codeium-command to change them.

;; Contributions are welcome! Feel free to submit pull requests and issues related to the package.")
;;     (license license:expat)))

(define-public emacs-codex
  (package
    (name "emacs-codex")
    (version "0.1.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	      (url "https://github.com/mayphus/codex.el")
	      (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "078sa66pbr750h2y3rgf0544d732zsnv0rjzdwg0429w8ldzk69z"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list emacs-compat))
    (home-page "https://github.com/mayphus/codex.el")
    (synopsis
     "Minimal helpers for launching the Codex CLI")
    (description
     "Minimal helpers for launching the Codex CLI from Emacs. Provides codex-run, which opens the Codex CLI inside a vterm buffer.")
    (license license:expat)))

(define-public emacs-claude-code-ide
  (package
    (name "emacs-claude-code-ide")
    (version "main")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	      (url "https://github.com/manzaltu/claude-code-ide.el")
	      (commit "32d853e20b9d245a6ee89c4a153a4e568250c62c")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ba33pqrzllfnwc87ql9cisqmwlhci741x871b4jhipajm8jgdrs"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list emacs-compat))
    (home-page "https://github.com/manzaltu/claude-code-ide.el")
    (synopsis
     "Claude Code IDE integration for Emacs")
    (description
     "Claude Code IDE for Emacs provides native integration with Claude Code CLI through the Model Context Protocol (MCP). Unlike simple terminal wrappers, this package creates a bidirectional bridge between Claude and Emacs, enabling Claude to understand and leverage Emacs’ powerful features—from LSP and project management to custom Elisp functions. This transforms Claude into a true Emacs-aware AI assistant that works within your existing workflow and can interact with your entire Emacs ecosystem.")
    (license license:expat)))

(define-public emacs-company-box-chiko
  (package
    (name "emacs-company-box-chiko")
    (version "0.1.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
	      (url "https://github.com/sebastiencs/company-box")
	      (commit "c4f2e243fba03c11e46b1600b124e036f2be7691")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08bqg65zjpfk5raa0yd2p3v5h35yq1ksr62dx4wdznjc2zb3drk4"))))
    (build-system emacs-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list emacs-compat emacs-company emacs-all-the-icons emacs-dash emacs-frame-local))
    (home-page "https://github.com/sebastiencs/company-box")
    (synopsis
     "A company-mode frontend with icons and documentation")
    (description
     "A company-mode frontend with icons and documentation. Company-box is a modern and fast company-mode frontend that displays completion candidates in a child frame with icons, annotations, and documentation. It supports all backends and is highly customizable.")
    (license license:gpl3+)))

(define-public emacs-vecdb
  (let ((commit "5430f014076d305120e8cd0eca64d6ce8d19e167")
        (revision "0"))
    (package
      (name "emacs-vecdb")
      (version (git-version "0.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/ahyatt/vecdb")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "041f001749hc1ly32zd8drw721php8m5fwq918ii5mrv1g1ykbvs"))))
      (build-system emacs-build-system)
      (arguments
       (list #:tests? #f))
      (propagated-inputs (list emacs-compat emacs-llm emacs-pg))
      (home-page "https://github.com/ahyatt/vecdb")
      (synopsis
       "A simple vector database for Emacs")
      (description
       "vecdb is a simple vector database implementation for Emacs. It provides functionality for storing and querying high-dimensional vectors using various similarity metrics. This is particularly useful for applications involving embeddings, such as semantic search, recommendation systems, and working with Large Language Models (LLMs). The package supports efficient nearest neighbor search and can be used as a backend for various AI-powered Emacs applications.")
      (license license:gpl3+))))

(define-public emacs-ellama
  (let ((commit "2857f85b8f10eb587afb8cb3da1d96cb236b2856")
        (revision "0"))
    (package
      (name "emacs-ellama")
      (version (git-version "1.8.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/s-kostyaev/ellama")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1q89z24vfj9r8x6rqcbif3nk987m7hh17n3jyk59q3iwivbgrpbd"))))
      (build-system emacs-build-system)
      (arguments
       (list #:tests? #f))
      (propagated-inputs (list emacs-compat
                               emacs-llm))
      (home-page "https://github.com/s-kostyaev/ellama")
      (synopsis
       "Tool for interacting with LLMs in Emacs")
      (description
       "Ellama is a tool for interacting with large language models from Emacs.
It allows users to ask questions, generate code, summarize text, and perform
various other AI-assisted tasks directly within their Emacs workflow. Ellama
uses the llm package as a backend, supporting multiple LLM providers including
Ollama, Open AI, Vertex, GPT4All, and others. The package provides an intuitive
interface for conversational AI interactions and can be customized to work with
different models and providers.")
      (license license:gpl3+))))

(define-public emacs-elisa
  (let ((commit "b655b59d371639d357dcabe48f1c2cd1694ee8de")
        (revision "0"))
    (package
      (name "emacs-elisa")
      (version (git-version "1.1.7" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
                (url "https://github.com/s-kostyaev/elisa")
                (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1jwv4blhf9021758g212q8cf68a4hipj8nqgad00f54dxrr4s2h5"))))
      (build-system emacs-build-system)
      (arguments
       (list #:tests? #f))
      (propagated-inputs (list emacs-compat
                               emacs-llm
                               emacs-async
                               emacs-plz
                               emacs-ellama))
      (home-page "https://github.com/s-kostyaev/elisa")
      (synopsis
       "Emacs Lisp Information System Assistant - RAG-powered AI assistant")
      (description
       "Elisa is a RAG (Retrieval-Augmented Generation) system for Emacs that allows
you to chat with your data.  It integrates with your documents, notes, and code
to provide contextually relevant answers powered by Large Language Models.

The package supports multiple embedding backends including local and cloud-based
solutions, and can work with various document formats.  Elisa uses vector
databases to efficiently retrieve relevant information and combines it with LLM
capabilities to generate accurate, context-aware responses.

Key features include:
+ Chat with your documents and codebase
+ Support for multiple embedding models (local and API-based)
+ Integration with various LLM providers through the llm package
+ Efficient vector similarity search for relevant context retrieval
+ Customizable indexing and retrieval strategies")
      (license license:gpl3+))))

;; 测试用：
(list emacs-dirvish-unstable emacs-llm emacs-triples emacs-ekg emacs-copilot emacs-codex emacs-claude-code-ide emacs-company-box-chiko emacs-copilot-chat emacs-vecdb emacs-ellama emacs-elisa)

