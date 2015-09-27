(require 'magit)

;; don't ruin it for windmove
(define-key magit-mode-map (kbd "C-w") nil)

(global-set-key (kbd "C-x g") 'magit-status)

(provide 'magit-setup)
