(require 'go-mode-autoloads)

(eval-after-load 'go-mode
  '(define-key go-mode-map (kbd "C-M-l") 'gofmt))

(provide 'go-setup)
