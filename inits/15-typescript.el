;;; 15-typescript --- typescript configuration

;;; Commentary:

;;; Code:
(require 'tide)
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode t)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode t)
            (company-mode-on)))

(provide '15-typescript)
;;; 15-typescript.el ends here

