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
    popup
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
    projectile-rails
    auto-complete
    flycheck
    inf-ruby
    inflections
    projectile
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

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;; TODO: move this to subdir later.
(load-theme 'zenburn t)
(global-undo-tree-mode)
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(helm-mode t)
(global-set-key (kbd "C-c C-f") 'projectile-find-file)
(require 'generic-x)
(require 'org)
(setq org-log-done t)

;; This gives you a tab of 2 spaces
(custom-set-variables '(coffee-tab-width 4))

(provide 'init)
;;; init.el ends here
