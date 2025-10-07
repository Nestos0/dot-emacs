(provide 'core)

(add-to-list 'load-path (concat user-emacs-directory "init.d/packages/"))

(require 'init-const)
(require 'themes/init)
(require 'init-git)
(require 'init-edit)
(require 'init-file)
(require 'init-lsp)
(require 'init-custom)
(require 'init-funcs)
(require 'init-ui)
