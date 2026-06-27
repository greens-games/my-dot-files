(setq custom-file "~/.config/emacs/custom.el")
(package-initialize)
(add-to-list 'load-path "~/.config/emacs/modes/")
(menu-bar-mode 0)
(tool-bar-mode 0)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq js-indent-line 2)

(setq-default inhibit-splash-screen t
							tab-width 2
							make-backup-files nil)

;;Set up package.el to work with MELPA
;; (require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))

;; (package-refresh-contents)
;;  (add-to-list 'package-archives
;;              (cons "nongnu" (format "http%s://elpa.nongnu.org/nongnu/"
;;                                     (if (gnutls-available-p) "s" ""))))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>sf") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>c") 'compile)
;;NOTE: for some reason C-<key> removes M-x from being bound?
(evil-define-key 'normal 'evil-normal-state-map (kbd "<leader>[") 'insert-scope)

;;IDO
 (unless (package-installed-p 'smex)
 	(package-install 'smex))
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(ido-mode 1)
(ido-everywhere 1)

;;THEMES
(load-theme 'base16-apathy t)
;; (use-package chocolate-theme
;;   :ensure t
;;   :config
;;   (load-theme 'chocolate t))

;;LANGUAGES
(require 'odin-mode)
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;;LSPs
(require 'eglot)
(add-to-list 'eglot-server-programs
 						 '(odin-mode . ("/home/goots/tools/ols")))
(add-hook 'odin-mode-hook #'eglot-ensure)
(add-to-list 'eglot-server-programs
						 '(simpc-mode . ("clangd")))
(add-hook 'simpc-mode-hook #'eglot-ensure)
(eldoc-mode)

;;AUTO COMPLETION
;(unless (package-installed-p 'corfu)
; 	(package-install 'corfu))
;(require 'corfu)
;; (global-corfu-mode)
;; (setq corfu-auto t
;;       corfu-auto-delay 0.2
;;       corfu-auto-trigger "." ;; Custom trigger characters
;;       corfu-quit-no-match 'separator) ;; or t

(unless (package-installed-p 'company)
 	(package-install 'company))
(require 'company)
(global-company-mode)
(setq company-idle-delay 0.2)
(setq company-inhibit-inside-symbols t)

;;CUSTOM FUNCS
(defun insert-scope ()
	(interactive)
	(insert "{")
	(insert "\n")
	(insert "}"))


(load-file custom-file)
