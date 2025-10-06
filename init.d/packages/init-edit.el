(provide 'packages/init-edit)

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

(use-package ace-jump-mode
  :ensure t
  :defer t
  )

(use-package meow
  :ensure t
  :config
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-colemak)  ; Colemak 布局

  (setq meow-use-cursor-position-hack t)
  (defun meow-setup ()
    ;; Motion 状态：自定义移动键 u n e i
    (meow-motion-overwrite-define-key
     '("u" . meow-prev)
     '("i" . meow-right)
     '("n" . meow-left)
     '("e" . meow-next)
     ;; 可选：添加行首/行尾
     '("0" . meow-line-start)
     '("$" . meow-line-end))

    ;; Leader 键 (SPC)：数字参数 + 移动回退 + 常见命令
    (meow-leader-define-key
     ;; 移动键回退到 motion 状态，避免冲突
     '("n" . "h-u")  ; left
     '("i" . "h-i")  ; right
     '("e" . "h-n")  ; next
     '("u" . "h-e")  ; prev
     ;; 数字参数
     '("1" . meow-digit-argument)
     '("2" . meow-digit-argument)
     '("3" . meow-digit-argument)
     '("4" . meow-digit-argument)
     '("5" . meow-digit-argument)
     '("6" . meow-digit-argument)
     '("7" . meow-digit-argument)
     '("8" . meow-digit-argument)
     '("9" . meow-digit-argument)
     '("0" . meow-digit-argument)
     ;; 帮助
     '("/" . meow-keypad-describe-key)
     '("?" . meow-cheatsheet)
     ;; 其他常见
     '("f" . find-file)
     '("b" . switch-to-buffer)
     '("w" . save-buffer)
     '("W" . meow-open-above)
     '("q" . kill-this-buffer))

    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("1" . meow-expand-1)
     '("2" . meow-expand-2)
     '("3" . meow-expand-3)
     '("4" . meow-expand-4)
     '("5" . meow-expand-5)
     '("6" . meow-expand-6)
     '("7" . meow-expand-7)
     '("8" . meow-expand-8)
     '("9" . meow-expand-9)
     '(")" . meow-forward-slurp)
     '("(" . meow-forward-barf)
     '("{" . meow-backward-slurp)
     '("}" . meow-backward-barf)
     '("-" . negative-argument)
     '(";" . meow-reverse)
     '("," . meow-inner-of-thing)
     '("." . meow-bounds-of-thing)
     '("[" . meow-beginning-of-thing)
     '("]" . meow-end-of-thing)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("c" . meow-change)
     '("d" . meow-kill)
     '("g" . meow-join)
     '("G" . meow-grab)
     '("o" . meow-open-below)
     '("O" . meow-open-above)
     '("p" . meow-yank)
     '("r" . meow-replace)
     '("s" . meow-grab)
     '("t" . meow-till)
     '("U" . undo-redo)
     '("v" . meow-block)
     '("V" . meow-to-block)
     '("x" . meow-line)
     '("y" . meow-save)
     '("Y" . meow-sync-grab)
     '("z" . meow-pop-selection)
     '("n" . meow-left)
     '("N" . meow-left-expand)
     '("i" . meow-right)
     '("I" . meow-right-expand)
     '("e" . meow-next)
     '("E" . meow-next-expand)
     '("u" . meow-prev)
     '("U" . meow-prev-expand)
     '("b" . meow-back-word)
     '("B" . backward-word)
     '("s" . ace-jump-mode)
     '("w" . meow-insert)
     '("W" . meow-open-above)
     '("k" . meow-next-word)
     '("K" . meow-next-symbol)
     '("m" . meow-mark-word)
     '("M" . meow-mark-symbol)
     '("f" . meow-find)
     '("m" . avy-goto-char-timer)
     '("Q" . meow-goto-line)
     '("%" . meow-query-replace)
     '("j" . consult-line)
     '("'" . repeat)
     '("<escape>" . meow-cancel-selection)
     '("?" . comment-dwim)))

    (setq meow-selection-command-fallback
        '((meow-change . meow-change-char)
          (meow-kill . meow-delete)
          (meow-cancel-selection . ignore)
          (meow-pop-selection . meow-pop-grab)
          (meow-beacon-change . meow-beacon-change-char)))

    (setq meow-cursor-type-normal 'box
        meow-cursor-type-insert 'bar
        meow-cursor-type-motion 'hbar)

  (meow-setup)
  (meow-global-mode 1))

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

;; Optionally use the `orderless' completion style.
(use-package orderless
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring
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
  :if window-system          ; 在图形化界面时才使用这个插件
  :init (good-scroll-mode))

(use-package d
  :config
  (setq dired-listing-switches
        "-l --almost-all --human-readable --group-directories-first --no-group")
  ;; this command is useful when you want to close the window of `dirvish-side'
  ;; automatically when opening a file
  (put 'dired-find-alternate-file 'disabled nil))

(use-package dirvish
  :ensure t
  :init
  (dirvish-override-dired-mode)
  :custom
  (dirvish-quick-access-entries ; It's a custom option, `setq' won't work
   '(("h" "~/"                          "Home")
     ("d" "~/Downloads/"                "Downloads")
     ("m" "/mnt/"                       "Drives")
     ("s" "/ssh:my-remote-server")      "SSH server"
     ("e" "/sudo:root@localhost:/etc")  "Modify program settings"
     ("t" "~/.local/share/Trash/files/" "TrashCan")))
  :config
  ;; (dirvish-peek-mode)             ; Preview files in minibuffer
  ;; (dirvish-side-follow-mode)      ; similar to `treemacs-follow-mode'
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-attributes           ; The order *MATTERS* for some attributes
        '(vc-state subtree-state nerd-icons collapse git-msg file-time file-size)
        dirvish-side-attributes
        '(vc-state nerd-icons collapse file-size))
  ;; open large directory (over 20000 files) asynchronously with `fd' command
  (setq dirvish-large-directory-threshold 20000)
  :bind ; Bind `dirvish-fd|dirvish-side|dirvish-dwim' as you see fit
  (("C-c f" . dirvish)
   :map dirvish-mode-map               ; Dirvish inherits `dired-mode-map'
   (";"   . dired-up-directory)        ; So you can adjust `dired' bindings here
   ("?"   . dirvish-dispatch)          ; [?] a helpful cheatsheet
   ("a"   . dirvish-setup-menu)        ; [a]ttributes settings:`t' toggles mtime, `f' toggles fullframe, etc.
   ("f"   . dirvish-file-info-menu)    ; [f]ile info
   ("o"   . dirvish-quick-access)      ; [o]pen `dirvish-quick-access-entries'
   ("s"   . dirvish-quicksort)         ; [s]ort flie list
   ("r"   . dirvish-history-jump)      ; [r]ecent visited
   ("l"   . dirvish-ls-switches-menu)  ; [l]s command flags
   ("v"   . dirvish-vc-menu)           ; [v]ersion control commands
   ("*"   . dirvish-mark-menu)
   ("y"   . dirvish-yank-menu)
   ("N"   . dirvish-narrow)
   ("^"   . dirvish-history-last)
   ("TAB" . dirvish-subtree-toggle)
   ("M-f" . dirvish-history-go-forward)
   ("M-b" . dirvish-history-go-backward)
   ("M-e" . dirvish-emerge-menu)))
