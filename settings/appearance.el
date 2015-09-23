;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(load-theme 'monokai)

(set-default-font "Inconsolata 16"))

(when is-mac
  (set-default-font "Inconsolata 20"))


;; Disable toolbar
(tool-bar-mode -1)

;; Don't show native OS scroll bars for buffers because they're redundant
(scroll-bar-mode -1)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)



(provide 'appearance)
