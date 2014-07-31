(require 'cask "~/.cask/cask.el")
(cask-initialize)

(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(setq tab-width 4)
(setq-default tab-width 4)

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

(linum-mode)

(setq-default c-default-style "linux" c-basic-offset 4)
(setq-default indent-tabs-mode nil)

(setq backup-inhibited 1)
(setq-default backup-inhibited 1)
(setq auto-save-default nil)
(setq-default auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq-default auto-save-list-file-prefix nil)
(global-auto-revert-mode t)

(load-theme 'misterioso)

(when (fboundp 'global-font-lock-mode) 
  (global-font-lock-mode t)
  (setq font-lock-maximum-decoration t))

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

(setq inhibit-splash-screen t)

(defun kill-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

(global-set-key (kbd "C-x K") 'kill-all-buffers)

(require 'ido)
(ido-mode t)
(setq ido-enable-flexz-matching t
      redisplay-dont-pause t
      ido-use-faces nil)

(require 'flx-ido)
(flx-ido-mode 1)

(require 'ido-vertical-mode)
(ido-vertical-mode t)

(custom-set-variables
 '(ido-vertical-define-keys 'C-n-C-p-up-and-down))

(autoload 'magit-status "magit" nil t)
(global-set-key (kbd "C-c C-a") 'magit-status)

(require 'smartparens-config)
(smartparens-global-mode)
(show-smartparens-global-mode t)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(require 'projectile)
(projectile-global-mode)
 
(setq projectile-indexing-method 'find
projectile-enable-caching t)
 
(global-set-key "\C-p" 'projectile-find-file)

(server-start)

(require 'init-linum "~/.emacs.d/init-linum.el")
