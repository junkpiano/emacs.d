;;; init.el --- My Emacs Setting

;;; Commentary:

;;; Code:

(require 'cl)
(require 'package)

;; package initialize
(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")))


;; package management
(defvar installing-package-list
  '(
    lsp-mode
    lsp-ui
    vue-mode
    neotree
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 4)
 '(package-selected-packages
   (quote
    (exec-path-from-shell yasnippet pkg-info inflections inf-ruby flycheck projectile-rails projectile paredit ox-reveal js2-mode open-junk-file undo-tree magit gist lispxmp init-loader popup auto-complete company dash-at-point smex w3m dash queue cider feature-mode dockerfile-mode web-mode rust-mode yaml-mode markdown-mode coffee-mode clojure-mode elixir-mode racer sbt-mode helm zenburn-theme php-mode git-gutter tide typescript-mode swift-mode go-autocomplete go-mode sr-speedbar))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
