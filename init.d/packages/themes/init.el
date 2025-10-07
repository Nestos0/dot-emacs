(provide 'themes/init)

(use-package all-the-icons
  :if (display-graphic-p))

(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title "Welcome to Emacs!") ;; 个性签名，随读者喜好设置
  (setq dashboard-icon-type 'all-the-icons) ;; use `all-the-icons' package
  (setq dashboard-center-content t
   dashboard-set-init-info t
   dashboard-projects-backend 'project-el    
   dashboard-startup-banner (expand-file-name "art.txt" user-emacs-directory))
    (setq dashboard-items '((recents  . 5)
			    (bookmarks . 5)
			    (agenda . 5)
			    (projects . 5)))
  (setq dashboard-set-navigator t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-heading-icons '((recents  . "history")
				 (bookmarks . "bookmark")
				 (agenda    . "calendar")
				 (projects  . "rocket"))) 
  (dashboard-setup-startup-hook))
