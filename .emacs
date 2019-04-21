;; Window customizations
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(display-time-mode 1)
(ido-mode 1)
(set-frame-font "Monaco 12" nil t)
(global-hl-line-mode +1)
(setq global-linum-mode t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)

;; Add Melpa
(require 'package)
(setq package-enable-at-starup nil)
(add-to-list 'package-archives
	     '("melpa" .  "https://melpa.org/packages/"))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(package-initialize)

;; Bootstrapping using `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; telephone mode-line
(use-package telephone-line
  :ensure t
  :config
  (telephone-line-mode 1))

;; Projectile
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode +1))

;; Give suggestions on shortcuts
(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Ez navigating with multi buffers
(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    )
  )

;; Jump to character (Decision-tree)
(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

;; Fuzzy autocomplete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;; python linting using pylint
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

;; Snippets
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

;; python autocompletion using jedi
(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

;; Nerd tree for emacs
(use-package neotree
  :ensure t
  :config
  (add-to-list 'load-path "/directory/containing/neotree/")
  )

;; Home page
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome to Meet's Emacs")
  (setq dashboard-center-content t))

;; symon for real time usage details
(use-package symon
  :ensure t
  :config
  (symon-mode))