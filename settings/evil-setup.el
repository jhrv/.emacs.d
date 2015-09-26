(require 'evil)

(setq evil-modes
      '(fundamental-mode
	conf-mode
	text-mode
	prog-mode))

(defun set-appropriate-state ()
  (if (apply 'derived-mode-p evil-modes)
      (turn-on-evil-mode)
    (turn-off-evil-mode)))

(add-hook 'after-change-major-mode-hook #'set-appropriate-state)

(provide 'evil-setup)
