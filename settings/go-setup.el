(require 'go-mode-autoloads)

(eval-after-load 'go-mode
  '(define-key go-mode-map (kbd "C-M-l") 'gofmt))

(setenv "PATH" (concat (getenv "PATH") ";C:\\Users\\H129009\\go\\bin"))

(provide 'go-setup)
