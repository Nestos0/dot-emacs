(provide 'init-lsp)

(use-package cape)

;; Optionally use the `orderless' completion style.
(use-package orderless
  :ensure t
  :demand t   ; <-- **CRITICAL FIX: Force immediate loading
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil) ;; Disable defaults, use our settings
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-completion-provider :none) ;; we use Corfu!

  :init
  (defun my/orderless-dispatch-flex-first (_pattern index _total)
    (and (eq index 0) 'orderless-flex))

  (defun my/lsp-mode-setup-completion ()
    (setf (alist-get 'styles (alist-get 'lsp-capf completion-category-defaults))
          '(orderless))
    ;; Optionally configure the first word as flex filtered.
    (add-hook 'orderless-style-dispatchers #'my/orderless-dispatch-flex-first nil 'local)
    ;; Optionally configure the cape-capf-buster.
    (setq-local completion-at-point-functions (list (cape-capf-buster #'lsp-completion-at-point))))

  :hook
  (lsp-completion-mode . my/lsp-mode-setup-completion))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)          ;; Enable auto completion
  ;; (corfu-separator ?_) ;; Set to orderless separator, if not using space
  :bind
  ;; Another key binding can be used, such as S-SPC.
  ;; (:map corfu-map ("M-SPC" . corfu-insert-separator))
  :init
  (global-corfu-mode))

;; `lsp-mode' and `treemacs' integration
(use-package lsp-treemacs
 :after lsp-mode
 :functions lsp-treemacs-sync-mode
 :bind (:map lsp-mode-map
        ("C-<f8>" . lsp-treemacs-errors-list)
        ("M-<f8>" . lsp-treemacs-symbols)
        ("s-<f8>" . lsp-treemacs-java-deps-list))
 :init (lsp-treemacs-sync-mode 1)
 :config
 (with-eval-after-load 'ace-window
   (when (boundp 'aw-ignored-buffers)
     (push 'lsp-treemacs-symbols-mode aw-ignored-buffers)
     (push 'lsp-treemacs-java-deps-mode aw-ignored-buffers)))

 (with-no-warnings
   (when (icons-displayable-p)
     (treemacs-create-theme "lsp-nerd-icons"
       :config
       (progn
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-repo" :face 'nerd-icons-blue))
          :extensions (root))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_boolean" :face 'nerd-icons-lblue))
          :extensions (boolean-data))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_class" :face 'nerd-icons-orange))
          :extensions (class))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_color"))
          :extensions (color-palette))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_constant"))
          :extensions (constant))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_file"))
          :extensions (document))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_misc" :face 'nerd-icons-orange))
          :extensions (enumerator))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_enum_member" :face 'nerd-icons-lblue))
          :extensions (enumitem))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_event" :face 'nerd-icons-orange))
          :extensions (event))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_field" :face 'nerd-icons-lblue))
          :extensions (field))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_misc"))
          :extensions (indexer))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_keyword"))
          :extensions (intellisense-keyword))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_interface" :face 'nerd-icons-lblue))
          :extensions (interface))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_variable" :face 'nerd-icons-lblue))
          :extensions (localvariable))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_method" :face 'nerd-icons-purple))
          :extensions (method))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_namespace" :face 'nerd-icons-lblue))
          :extensions (namespace))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_numeric"))
          :extensions (numeric))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_operator"))
          :extensions (operator))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_property"))
          :extensions (property))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_snippet"))
          :extensions (snippet))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_string"))
          :extensions (string))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_structure" :face 'nerd-icons-orange))
          :extensions (structure))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_snippet"))
          :extensions (template))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-chevron_right" :face 'nerd-icons-dsilver))
          :extensions (collapsed) :fallback "+")
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-chevron_down" :face 'nerd-icons-dsilver))
          :extensions (expanded) :fallback "-")
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-file_binary" :face 'nerd-icons-dsilver))
          :extensions (classfile))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder_opened" :face 'nerd-icons-blue))
          :extensions (default-folder-opened))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder" :face 'nerd-icons-blue))
          :extensions (default-folder))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder_opened" :face 'nerd-icons-green))
          :extensions (default-root-folder-opened))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder" :face 'nerd-icons-green))
          :extensions (default-root-folder))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-file_binary" :face 'nerd-icons-dsilver))
          :extensions ("class"))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-file_zip" :face 'nerd-icons-dsilver))
          :extensions (file-type-jar))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder_opened" :face 'nerd-icons-dsilver))
          :extensions (folder-open))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder" :face 'nerd-icons-dsilver))
          :extensions (folder))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder_opened" :face 'nerd-icons-orange))
          :extensions (folder-type-component-opened))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder" :face 'nerd-icons-orange))
          :extensions (folder-type-component))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder_opened" :face 'nerd-icons-green))
          :extensions (folder-type-library-opened))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder" :face 'nerd-icons-green))
          :extensions (folder-type-library))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder_opened" :face 'nerd-icons-pink))
          :extensions (folder-type-maven-opened))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder" :face 'nerd-icons-pink))
          :extensions (folder-type-maven))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder_opened" :face 'nerd-icons-orange))
          :extensions (folder-type-package-opened))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder" :face 'nerd-icons-orange))
          :extensions (folder-type-package))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-add" :face 'nerd-icons-dsilver))
          :extensions (icon-create))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-list_flat" :face 'nerd-icons-dsilver))
          :extensions (icon-flat))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-symbol_class" :face 'nerd-icons-blue))
          :extensions (icon-hierarchical))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-link" :face 'nerd-icons-dsilver))
          :extensions (icon-link))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-refresh" :face 'nerd-icons-dsilver))
          :extensions (icon-refresh))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-faicon "nf-fa-unlink" :face 'nerd-icons-dsilver))
          :extensions (icon-unlink))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-devicon "nf-dev-java" :face 'nerd-icons-orange))
          :extensions (jar))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-library" :face 'nerd-icons-green))
          :extensions (library))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder_opened" :face 'nerd-icons-lblue))
          :extensions (packagefolder-open))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-folder" :face 'nerd-icons-lblue))
          :extensions (packagefolder))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-archive" :face 'nerd-icons-dsilver))
          :extensions (package))
         (treemacs-create-icon
          :icon (format "%s " (nerd-icons-codicon "nf-cod-repo" :face 'nerd-icons-blue))
          :extensions (java-project))))

     (setq lsp-treemacs-theme "lsp-nerd-icons"))))
