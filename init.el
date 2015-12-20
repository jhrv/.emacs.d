;; Define package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(defvar my-packages
  '(smex
    magit
    evil
    org
    find-file-in-project
    js2-mode
    web-mode
    ace-jump-mode
    dockerfile-mode
    yaml-mode
    markdown-mode
    web-beautify
    expand-region
    yasnippet
    smartparens
    evil-smartparens
    ido-vertical-mode
    flx-ido))

(when is-mac
      (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; osx only:
;; - change meta to be cmd instead of alt
;; - set same path for eshell as for term
(when is-mac
  (progn
    (setq mac-option-modifier nil
	  mac-command-modifier 'meta)
    (exec-path-from-shell-initialize)))

(setq settings-dir (expand-file-name "settings" user-emacs-directory))

(add-to-list 'load-path settings-dir)

;; keep emacs custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(require 'appearance) ;; set up appearance early
(require 'defuns)
(require 'defaults)
(require 'ido-setup)
(require 'navigation)
(require 'eshell-setup)
(require 'ffip-setup)
(require 'js2-setup)
(require 'web-setup)
(require 'evil-setup)
(require 'org-setup)
(require 'yasnippet-setup)
(require 'magit-setup)
(require 'linum-setup)
(require 'ace-jump-setup)
(require 'expand-region-setup)
(require 'web-beautify-setup)
(require 'smartparens-setup)

;; packages with no extra config goes here
(require 'dockerfile-mode)
(require 'yaml-mode)
(require 'markdown-mode)

;; enable disabled keybindings (why bind it to a key in the first place?)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
