;;; init.el --- My Emacs Setting

;;; Commentary:
;;

;;; Code:

(require 'cl)
(require 'package)
(require 'init-loader)

;; package initialize
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; package management
(defvar installing-package-list
  '(
    cider
    queue
    dash
    clojure-mode
    coffee-mode
    smex
    dash-at-point
    ensime
    popup
    company
    auto-complete
    popup
    feature-mode
    init-loader
    lispxmp
    magit
    git-rebase-mode
    git-commit-mode
    markdown-mode
    open-junk-file
    ox-reveal
    org
    paredit
    popup
    projectile-rails
    rake
    f
    s
    auto-complete
    inf-ruby
    inflections
    projectile
    pkg-info
    epl
    queue
    rake
    sbt-mode
    scala-mode2
    yasnippet
    rust-mode
    exec-path-from-shell
    ))
(let ((not-installed (loop for x in installing-package-list
			   when (not (package-installed-p x))
			   collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

;; init-loader
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

(provide 'init)
;;; init.el ends here
