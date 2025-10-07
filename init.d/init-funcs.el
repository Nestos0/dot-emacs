(provide 'init-funcs)

(defun childframe-workable-p ()
  "Whether childframe is workable."
  (and (>= emacs-major-version 26)
       (not noninteractive)
       (not emacs-basic-display)
       (or (display-graphic-p)
           (featurep 'tty-child-frames))
       (eq (frame-parameter (selected-frame) 'minibuffer) 't)))


(defun childframe-completion-workable-p ()
  "Whether childframe completion is workable."
  (and (eq sagittarius-completion-style 'childframe)
       (childframe-workable-p)))
