(require 'evil)
(evil-mode 1)

(defgroup dotemacs-evil nil
  "Configuration options for evil-mode."
  :group 'dotemacs
  :prefix 'dotemacs-evil)

(defcustom dotemacs-evil/evil-state-modes
  '(fundamental-mode
    text-mode
    prog-mode
    sws-mode
    dired-mode
    comint-mode
    log-edit-mode
    compilation-mode)
  "List of modes that should start up in Evil state"
  :type '(repeat (symbol))
  :group 'dotemacs-evil)

(defcustom dotemacs-evil/emacs-state-modes
  '(debugger-mode
    eshell-mode
    help-mode
    git-commit-mode
    git-rebase-mode)
  "List of modes that should start up in Evil Emacs state."
  :type '(repeat (symbol))
  :group 'dotemacs-evil)

(defcustom dotemacs-evil/emacs-cursor
  "red"
  "The color of the cursor when in Emacs state."
  :type 'color) 

(setq evil-emacs-state-cursor `(,dotemacs-evil/emacs-cursor box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(defun my-major-mode-evil-state-adjust ()
  (if (apply 'derived-mode-p dotemacs-evil/evil-state-modes)
      (turn-on-evil-mode)
    (set-cursor-color dotemacs-evil/emacs-cursor))
  (when (apply 'derived-mode-p dotemacs-evil/emacs-state-modes)
    (turn-off-evil-mode)
    (set-cursor-color dotemacs-evil/emacs-cursor)))
(add-hook 'after-change-major-mode-hook #'my-major-mode-evil-state-adjust)

(defun my-evil-modeline-change (default-color)
  "changes the modeline color when the evil mode changes"
  (let ((color (cond ((evil-insert-state-p) '("#002233" . "#ffffff"))
                     ((evil-visual-state-p) '("#330022" . "#ffffff"))
                     ((evil-normal-state-p) default-color)
                     (t '("#440000" . "#ffffff")))))
    (set-face-background 'mode-line (car color))
    (set-face-foreground 'mode-line (cdr color))))

(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook (lambda () (my-evil-modeline-change default-color))))
