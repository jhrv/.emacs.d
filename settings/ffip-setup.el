(require 'find-file-in-project)

(global-set-key (kbd "C-x f") 'find-file-in-project)

(defun ffip--create-exclude-find-options (names)
  (mapconcat (lambda (name)
               (concat "-not -regex \".*" name ".*\"")) names " "))

(setq-default ffip-find-options
              (ffip--create-exclude-find-options
               '("/node_modules"
                 "/bower_components"
                 "/target"
                 "/out"
                 "/build"
                 "/elpa"
                 "/dist"
                 "/vendor"
                 "/generated"
                 "/.tmp")))

(provide 'ffip-setup)
