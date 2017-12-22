;;; package --- miscellaneous setting

;;; Commentary:

;;; Code:
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


(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

(provide '100-misc)

;;; 100-misc.el ends here
