;; move like the vimd
(global-set-key (kbd "C-w") nil)
(global-set-key (kbd "C-w h") 'windmove-left)
(global-set-key (kbd "C-w j") 'windmove-down)
(global-set-key (kbd "C-w k") 'windmove-up)
(global-set-key (kbd "C-w l") 'windmove-right)
(global-set-key (kbd "C-w s") 'split-window-below)
(global-set-key (kbd "C-w v") 'split-window-right)
(global-set-key (kbd "C-w q") 'delete-window)

;; one size doesnt fit all
(global-set-key (kbd "C-w -") 'shrink-window)
(global-set-key (kbd "C-w C--") 'shrink-window-horizontally)
(global-set-key (kbd "C-w +") 'enlarge-window)
(global-set-key (kbd "C-w C-+") 'enlarge-window-horizontally)


(provide 'navigation)
