
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Determine if running a GNU/Linux distro or Mac OSX
(setq macosx-p (string-match "darwin" (symbol-name system-type)))
(setq linux-p (string-match "gnu/linux" (symbol-name system-type)))

(when macosx-p 
    (setq default-input-method "MacOSX")
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier 'none))

(tool-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode 1)

(setq tab-width 4)
(setq-default tab-width 4)
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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-vertical-define-keys (quote C-n-C-p-up-and-down))
 '(package-selected-packages
   (quote
    (markdown-mode smartparens projectile magit ido-vertical-mode flx-ido autopair))))

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
 
(setq projectile-indexing-method 'find projectile-enable-caching t)
 
(global-set-key "\C-p" 'projectile-find-file)

(require 'server)
(or (server-running-p) (server-start))

(require 'init-linum "~/.emacs.d/lisp/init-linum.el")

;; Vala Mode
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.service$" . conf-mode))

(global-linum-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
