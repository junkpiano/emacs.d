;;; init.el --- My Emacs Setting

;;; Commentary:

;;; Code:

(require 'cl)
(require 'package)

;; package initialize
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; package management
(defvar installing-package-list
  '(
    sr-speedbar
    go-mode
    go-autocomplete
    swift-mode
    typescript-mode
    tide
    git-gutter
    php-mode
    wdired
    zenburn-theme
    helm
    sbt-mode
    racer
    elixir-mode
    scala-mode2
    clojure-mode
    coffee-mode
    markdown-mode
    yaml-mode
    rust-mode
    web-mode
    dockerfile-mode
    feature-mode
    cider
    queue
    dash
    w3m
    smex
    dash-at-point
    ensime
    init-loader
    company
    auto-complete
    popup
    init-loader
    lispxmp
    gist
    magit
    undo-tree
    open-junk-file
    js2-mode
    ox-reveal
    org
    paredit
    projectile
    projectile-rails
    flycheck
    inf-ruby
    inflections
    pkg-info
    yasnippet
    exec-path-from-shell
    evil
    evil-rails
    evil-nerd-commenter
    evil-leader
    ))

(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

;; set environmental path
;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

(provide 'init)
;;; init.el ends here
