(provide 'init-custom)

(defcustom sagittarius-completion-style 'childframe
  "Completion display style."
  :group 'sagittarius
  :type '(choice (const :tag "Minibuffer" minibuffer)
                 (const :tag "Child Frame" childframe)))
