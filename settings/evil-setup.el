(require 'evil)

(setq evil-modes
      '(fundamental-mode
	conf-mode
	text-mode
	prog-mode))

(defun set-appropriate-state ()
  (if (apply 'derived-mode-p evil-modes)
      (turn-on-evil-mode)
    ;;(set-cursor-color dotemacs-evil/emacs-cursor)
    (turn-off-evil-mode)))

(add-hook 'after-change-major-mode-hook #'set-appropriate-state)
;;(add-hook 'find-file-hook #'turn-on-evil-mode)


(provide 'evil-setup)
