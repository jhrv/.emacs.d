(require 'ido-vertical-mode)

;; InteractivelyDoThings
(ido-mode t)

(setq ido-everywhere t)

;; This allows partial matches, e.g. "bf" will match "Ballus Fransus".
;; flx matching (see https://github.com/lewang/flx)
(flx-ido-mode t)

;; ignore these
(add-to-list 'ido-ignore-directories "target")
(add-to-list 'ido-ignore-directories "node_modules")

;; I always always ALWAYS want to create a new buffer
(setq ido-create-new-buffer 'always)

(ido-vertical-mode t)

(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)

(provide 'ido-setup)
