;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(load-theme 'monokai)

(if is-mac
    (set-frame-font "Inconsolata-20" t t)
  (set-frame-font "Inconsolata-16" t t))

;; Disable toolbar
(tool-bar-mode -1)

;; Don't show native OS scroll bars for buffers because they're redundant
(scroll-bar-mode -1)

;; Don't really need this either
(menu-bar-mode -1) 

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

(provide 'appearance)
