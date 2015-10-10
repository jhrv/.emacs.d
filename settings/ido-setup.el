;; InteractivelyDoThings
(ido-mode t)

;; This allows partial matches, e.g. "bf" will match "Ballus Fransus".
;;(setq ido-enable-flex-matching t)
;; try out flx (see https://github.com/lewang/flx)
(flx-ido-mode t)

(provide 'ido-setup)
