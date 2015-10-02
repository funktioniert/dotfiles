;; utf8
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; no annoying gui stuff
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1))

;; moving between windows with M-left ...
(windmove-default-keybindings 'meta)

;; smooth scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

(show-paren-mode 1)
(global-hl-line-mode 1)

;; font
(set-face-attribute 'default nil :font "Hack-10")

;; no tabs
(setq-default indent-tabs-mode nil)

;; no backups
(setq make-backup-files nil)

;; packages
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(use-package evil-leader
  :ensure t
  :config
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

(use-package evil
  :ensure t
  :config
  (evil-mode))

(use-package diminish
  :ensure t
  :init
  (eval-after-load "undo-tree" '(diminish 'undo-tree-mode " ⓤ")))

(use-package vi-tilde-fringe
  :ensure t
  :config
  (global-vi-tilde-fringe-mode))

(use-package solarized-theme
  :ensure t
  :init
  (setq x-underline-at-descent-line t
        solarized-high-contrast-mode-line t)
  :config
  (load-theme 'solarized-light t))

(use-package powerline
  :ensure t
  :init
  (setq powerline-default-separator 'wave
        powerline-default-separator-dir '(right . left)
        powerline-height 20)
  :config
  (powerline-center-evil-theme))

(use-package fill-column-indicator
  :ensure t
  :init
  (setq fci-rule-column 90)
  :config
  (fci-mode))

(use-package expand-region
  :ensure t
  :init
  (evil-leader/set-key
    "v" 'er/expand-region))

(use-package helm
  :ensure t
  :commands (helm-buffers-list
             helm-colors
             helm-find-files
             helm-for-files
             helm-google-suggest
             helm-mini
             helm-help
             helm-show-kill-ring
             helm-org-keywords
             helm-org-headlines
             helm-projectile
             helm-M-x
             helm-occur)
  :init
  (evil-leader/set-key
    "h b" 'helm-buffers-list
    "h e" 'helm-find-files
    "h f" 'helm-for-files
    "h g" 'helm-google-suggest
    "h k" 'helm-show-kill-ring
    "h o" 'helm-org-headlines
    "h p" 'helm-projectile
    "h x" 'helm-M-x
    "SPC" 'helm-M-x
    "h /" 'helm-occur
    "/"   'helm-occur)
  :config
  (setq helm-M-x-fuzzy-match t)
  (require 'helm-config)
  (use-package helm-projectile
    :ensure t)
  (define-key helm-map (kbd "C-j") 'helm-next-line)
  (define-key helm-map (kbd "C-k") 'helm-previous-line))

(use-package flycheck
  :ensure t
  :diminish " ⓢ"
  :config
  (evil-leader/set-key
    "ec" 'flycheck-clear
    "eh" 'flycheck-describe-checker
    "en" 'flycheck-next-error
    "ep" 'flycheck-previous-error)
  (global-flycheck-mode))

(use-package flycheck-pos-tip
  :ensure t
  :init
  (setq flycheck-display-errors-function 'flycheck-pos-tip-error-messages))
