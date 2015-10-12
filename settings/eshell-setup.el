(setq eshell-directory-name (expand-file-name "eshell" user-emacs-directory))
(setq eshell-aliases-file (expand-file-name "alias" eshell-directory-name))

(global-set-key (kbd "<f12>") 'eshell)

(provide 'eshell-setup)
