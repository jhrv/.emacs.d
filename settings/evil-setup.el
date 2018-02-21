(require 'evil)

(setq evil-modes
      '(fundamental-mode
        conf-mode
        text-mode
        css-mode
        dockerfile-mode
        groovy-mode
        yaml-mode
        markdown-mode
        web-mode
        prog-mode))

(defun set-appropriate-state ()
  (if (apply 'derived-mode-p evil-modes)
      (turn-on-evil-mode)
    (evil-emacs-state)))

(add-hook 'after-change-major-mode-hook #'set-appropriate-state)

;; empty method with right signature to stop annoying error
(defun evil-without-input-method-hooks(x y z a))

(provide 'evil-setup)
