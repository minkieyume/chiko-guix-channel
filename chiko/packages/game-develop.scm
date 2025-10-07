(define-module (chiko packages game-develop)
  #:use-module ((srfi srfi-1) #:hide (zip))
  #:use-module (ice-9 match)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix svn-download)
  #:use-module (guix utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages elf))

(define-public tiled-appimage
  (package
    (name "tiled-appimage")
    (version "1.11.2")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/mapeditor/tiled/releases/download/"
                    "v" version "/Tiled-" version "_Linux_Qt-6_x86_64.AppImage"))
              (sha256
               (base32
                "1bfk63yyi70yxknb4xfbm8rfdm8i604795pmp5iiqqgm38cb7ck4"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let* ((source (assoc-ref %build-inputs "source"))
                (out (assoc-ref %outputs "out"))
                (bin-dir (string-append out "/bin"))
                (share-dir (string-append out "/share"))
                (appimage-extract-dir (string-append out "/lib/tiled")))
           
           ;; 创建目录结构
           (mkdir-p bin-dir)
           (mkdir-p appimage-extract-dir)
           
           ;; 复制 AppImage 文件
           (copy-file source (string-append appimage-extract-dir "/tiled.appimage"))
           (chmod (string-append appimage-extract-dir "/tiled.appimage") #o755)
           
           ;; 创建启动脚本
           (call-with-output-file (string-append bin-dir "/tiled")
             (lambda (port)
               (format port "#!~a/bin/bash~%~a/tiled.appimage \"$@\"~%"
                       (assoc-ref %build-inputs "bash")
                       appimage-extract-dir)))
           (chmod (string-append bin-dir "/tiled") #o755)
           
           #t))))
    (native-inputs
     `(("bash" ,bash)))
    (home-page "https://www.mapeditor.org/")
    (synopsis "通用的瓦片地图编辑器")
    (description
     "Tiled 是一个通用的 2D 地图编辑器，用于创建游戏关卡和其他类型的地图。
它支持多种图层类型、瓦片集、对象组等功能，广泛应用于游戏开发中。
此包基于官方 AppImage 二进制发行版。")
    (license license:gpl2+)))

(list tiled-appimage)
