;; seamless copy paste with os
(setq x-select-enable-clipboard t)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; No need for ~ files when editing
(setq create-lockfiles nil)
(setq make-backup-files nil) 

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; show matching parens
(show-parens-mode 1)

(provide 'defaults)
