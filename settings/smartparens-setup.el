(require 'smartparens)
(require 'evil-smartparens)

(require 'smartparens-config)
(smartparens-global-mode t)
(smartparens-strict-mode t)

(add-hook 'clojure-mode-hook #'evil-smartparens-mode)
(add-hook 'emacs-lisp-mode-hook #'evil-smartparens-mode)

(provide 'smartparens-setup)
