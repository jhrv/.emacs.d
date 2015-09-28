(require 'linum-relative)

(defun cycle-linum-modes ()
    "cycles modes off -> on -> relative"
    (interactive)
    (if (not linum-mode)
          (linum-mode)
      (if (not (equal linum-mode 'relative))
	  (progn
	    (linum-relative-on)
	    (setq linum-mode 'relative))
	(progn
	  (linum-mode -1)
	  (linum-relative-off)))))
    
(global-set-key (kbd "C-x l") 'cycle-linum-modes)

(provide 'linum-setup)
