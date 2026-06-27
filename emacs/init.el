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


;; (setq treesit-language-source-alist
;;       '((odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")
;; 	(c "https://github.com/tree-sitter-tree-sitter-c")))

;;Set up package.el to work with MELPA
(require 'package)
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives
;;              (cons "nongnu" (format "http%s://elpa.nongnu.org/nongnu/"
;;                                     (if (gnutls-available-p) "s" ""))))
;; (package-refresh-contents)

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
(evil-define-key 'normal 'global (kbd "<leader>[") 'insert-scope)

;;IDO
 (unless (package-installed-p 'smex)
 	(package-install 'smex))
(require 'smex)
(global-set-key (kbd "M-x") 'smex)

(ido-mode 1)
(ido-everywhere 1)

(load-theme 'base16-apathy t)

;;Multi cursor
 (unless (package-installed-p 'multiple-cursors)
 	(package-install 'multiple-cursors))
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
;; (use-package chocolate-theme
;;   :ensure t
;;   :config
;;   (load-theme 'chocolate t))

(require 'odin-mode)
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(defun insert-scope ()
	(interactive)
	(insert "{")
	(insert "\n")
	(insert "}"))


(load-file custom-file)
