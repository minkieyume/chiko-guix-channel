(define-module (chiko packages audio)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system meson)
  #:use-module (guix download)
  #:use-module (guix deprecation)
  #:use-module (guix gexp)
  #:use-module (guix i18n)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (srfi srfi-1)
  #:use-module (ice-9 match))

(define-public pwvucontrol
  (package
    (name "pwvucontrol")
    (version "0.4.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/saivert/pwvucontrol")
              (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ani2anfdksq0lj51sxw799m5sd1h3q4z8v8h7ayljgp9iaifqby"))))
    (build-system meson-build-system)
    (inputs
     (list adwaita-icon-theme
           glib
           gtk
           libadwaita
           wireplumber
           pipewire))
    (native-inputs
     (list
      rust
      pkg-config
      cmake
      `(,glib "bin")))
    (home-page "https://github.com/saivert/pwvucontrol")
    (synopsis " Pipewire Volume Control")
    (description
     "This is an attempt at making a volume control applet for Pipewire.

Current implemented features as of 2024-05-04:

    Volume control
    Mute
    Media name display
    Peak level meter
    Output device (Sink) drop down for playback streams
    Default output device
    Card profile selection
    Port selection for sinks and sources
")
    (license license:gpl3+)))

(list pwvucontrol)
