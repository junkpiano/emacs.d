;;; 13-go.el --- golang configuration

;;; Commentary:
;; go get golang.org/x/tools/cmd/goimports

;;; Code:
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(provide '03-go)
;;; 13-go.el ends here

