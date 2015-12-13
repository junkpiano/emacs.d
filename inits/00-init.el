(setq make-backup-files nil)
(show-paren-mode 1)
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

(setq-default indent-tabs-mode nil)
(setq tab-width 4) ; or any other preferred value

;; autocomplete paired brackets
(electric-pair-mode 1)
