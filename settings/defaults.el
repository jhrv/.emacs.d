;; default global keybindings
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x c") nil)

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

;; backup and auto-save files
(defvar my/backup-directory (concat user-emacs-directory "backups"))

(if (not (file-exists-p my/backup-directory))
        (make-directory my/backup-directory t))

(setq backup-directory-alist
          `((".*" . ,my/backup-directory)))
(setq auto-save-file-name-transforms
          `((".*" ,my/backup-directory t)))

;; go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; show matching parens
(show-paren-mode 1)

;; always always use utf-8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

;; tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)

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

;; stop annoying 'directory is unsafe' error
(require 'server)
(and (>= emacs-major-version 23)
     (defun server-ensure-safe-dir (dir) "Noop" t))

(provide 'defaults)
