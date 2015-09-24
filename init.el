;; Define package repositories
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
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
   
;; osx only; change meta to be cmd instead of alt
(when is-mac
    (setq mac-option-modifier nil
	  mac-command-modifier 'meta))

(defvar my-packages
  '(smex
    magit))

(when is-mac
      (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq settings-dir (expand-file-name "settings" user-emacs-directory))

(add-to-list 'load-path settings-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Set up appearance early
(require 'appearance)
(require 'defaults)
(require 'navigation)

(eval-after-load 'magit '(require 'magit-setup))

;; enable disabled keybinding (why bind it to a key in the first place?)
(put 'upcase-region 'disabled nil)
