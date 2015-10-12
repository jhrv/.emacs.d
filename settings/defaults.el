;; default global keybindings
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)

;; seamless copy paste with os
(setq x-select-enable-clipboard t)

;; changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; auto-update file-buffers on change
(global-auto-revert-mode t)

;; no need for ~ files when editing
(setq create-lockfiles nil)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; backup files
(defvar --backup-directory (concat user-emacs-directory "backups"))

(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))

(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      temporary-file-directory --backup-directory
      auto-save-interval 200)            ; number of keystrokes between auto-saves (default: 300)

;; go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; show matching parens
(show-paren-mode 1)

;; always always use utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; no tabs for me tyvm
(setq-default indent-tabs-mode nil)

;; Enhances M-x to allow easier execution of commands. Provides
;; a filterable list of possible commands in the minibuffer
;; http://www.emacswiki.org/emacs/Smex
(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(defmacro rename-modeline (package-name mode new-name)
  `(eval-after-load ,package-name
     '(defadvice ,mode (after rename-modeline activate)
        (setq mode-name ,new-name))))

(rename-modeline "js2-mode" js2-mode "JS2")


(provide 'defaults)
