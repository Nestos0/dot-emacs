(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)

(setq-default mojor-mode 'text-mode)
(setopt selection-coding-system 'utf-8)
(setq use-dialog-box nil)
(setq inhibit-startup-message t)

(setq default-input-method nil)
(setq use-default-font-for-symbols t)
(setq pgtk-use-im-context-on-new-connection nil)

(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "init.d")))
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "packages")))
(require 'core)
(require 'configure)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("5c7720c63b729140ed88cf35413f36c728ab7c70f8cd8422d9ee1cedeb618de5"
     "fffef514346b2a43900e1c7ea2bc7d84cbdd4aa66c1b51946aade4b8d343b55a"
     "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19"
     "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a"
     "93011fe35859772a6766df8a4be817add8bfe105246173206478a0706f88b33d"
     "4990532659bb6a285fee01ede3dfa1b1bdf302c5c3c8de9fad9b6bc63a9252f7"
     "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93"
     "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8"
     "d481904809c509641a1a1f1b1eb80b94c58c210145effc2631c1a7f2e4a2fdf4"
     "9b9d7a851a8e26f294e778e02c8df25c8a3b15170e6f9fd6965ac5f2544ef2a9"
     "0325a6b5eea7e5febae709dab35ec8648908af12cf2d2b569bedc8da0a3a81c1"
     "8c7e832be864674c220f9a9361c851917a93f921fedb7717b1b5ece47690c098"
     default))
 '(package-selected-packages
   '(ace-jump-mode ace-window all-the-icons amx consult corfu dashboard
		   default-text-scale dired-sidebar dirvish
		   doom-modeline doom-themes good-scroll ivy kind-icon
		   lin lsp-mode lsp-treemacs magit meow minions mwim
		   nerd-icons-corfu orderless org-modern
		   page-break-lines paredit paredit-everywhere
		   paredit-menu transient-posframe ultra-scroll
		   undo-tree use-package-hydra vscode-icon
		   xwwp-follow-link-ivy zoxide))
 '(warning-suppress-log-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
