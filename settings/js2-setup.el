(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))

(setq-default js2-strict-missing-semi-warning nil)

(provide 'js2-setup)
