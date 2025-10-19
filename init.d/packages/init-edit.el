(use-package lin
  :ensure t
  :config
  (setq lin-face 'lin-blue)
  ;; check doc string for alternative styles
  ;; You can use this to live update the face
  ;; (customize-set-variable 'lin-face 'lin-green)
  (setq lin-mode-hooks
	'(bongo-mode-hook
	  dired-mode-hook
	  elfeed-search-mode-hook
	  git-rebase-mode-hook
	  grep-mode-hook
	  ibuffer-mode-hook
	  ilist-mode-hook
	  ledger-report-mode-hook
	  log-view-mode-hook
	  magit-log-mode-hook
	  mu4e-headers-mode-hook
	  notmuch-search-mode-hook
	  notmuch-tree-mode-hook
	  occur-mode-hook
	  org-agenda-mode-hook
	  pdf-outline-buffer-mode-hook
	  proced-mode-hook
	  tabulated-list-mode-hook))

  (lin-global-mode 1)
  )

(use-package avy :ensure t)
(use-package consult :ensure t)

(use-package ivy
  :ensure t
  :config
  (ivy-mode)
  ;; ---- 设置两个变量为 True，还有一个可选的 ---
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  ;; enable this if you want `swiper' to use it
  ;; (setq search-default-mode #'char-fold-to-regexp)
  ;; ---- 绑定快捷键 ----
  (global-set-key "C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
  (global-set-key (kbd "<f1> l") 'counsel-find-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
  ;; Enable Vertico.
  (use-package vertico
    :custom
    ;; (vertico-scroll-margin 0) ;; Different scroll margin
    ;; (vertico-count 20) ;; Show more candidates
    ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
    ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
    :init
    (vertico-mode))

  ;; Persist history over Emacs restarts. Vertico sorts by history position.
  (use-package savehist
    :init
    (savehist-mode))

  ;; Emacs minibuffer configurations.
  (use-package emacs
    :custom
    ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
    ;; to switch display modes.
    (context-menu-mode t)
    ;; Support opening new minibuffers from inside existing minibuffers.
    (enable-recursive-minibuffers t)
    ;; Hide commands in M-x which do not work in the current mode.  Vertico
    ;; commands are hidden in normal buffers. This setting is useful beyond
    ;; Vertico.
    (read-extended-command-predicate #'command-completion-default-include-p)
    ;; Do not allow the cursor in the minibuffer prompt
    (minibuffer-prompt-properties
     '(read-only t cursor-intangible t face minibuffer-prompt)))  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history))

(use-package amx
  :ensure t
  :init (amx-mode))

(use-package ace-window
  :ensure t
  :bind (("C-x o" . 'ace-window)))

(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil))

(use-package good-scroll
  :ensure t
  :if window-system
  :init (good-scroll-mode))

(provide 'init-edit)
