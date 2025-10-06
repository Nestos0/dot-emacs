(provide 'core)

(add-to-list 'load-path (concat user-emacs-directory "init.d/packages/"))

(require 'packages/themes/init)
(require 'packages/init-git)
(require 'packages/init-edit)
(require 'init-file)
