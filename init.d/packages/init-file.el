(provide 'init-file)

(use-package neotree
  :bind ([f8] . neotree-toggle))

(use-package dired-x
  :config
  ;; Make dired-omit-mode hide all "dotfiles"
  (setq dired-omit-files
        (concat dired-omit-files "\\|^\\..*$")))

