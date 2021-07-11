(setq inhibit-startup-message t)
(setq visible-bell t)
(scroll-bar-mode -1)
;;(tool-bar-mode -1)
;;(tooltip-mode -1)
;;(menu-bar-mode -1)
(set-fringe-mode 10)

(set-face-attribute 'default nil :family "Noto Mono")

;;(load-theme 'doom-dracula t)
(load-theme 'past t)

(column-number-mode t)
(global-display-line-numbers-mode t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; functions
(defun efs/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))
;; key bind

(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;; packages

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa". "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)
(use-package rainbow-delimiters
  :ensure t)
(use-package rainbow-mode
  :ensure t)
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))
(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-callable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package doom-themes)
(use-package all-the-icons)
(use-package general)
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))

(use-package autothemer
  :ensure t)
;; spelling
(use-package flyspell
  :ensure t
  :init
  (setq ispell-program-name "c:/Program Files (x86)/hunspell/bin/hunspell.exe")
  (setq ispell-local-dictionary "en_US"))
(use-package writegood-mode
  :ensure t
  :config
  (add-hook 'flyspell-mode-hook 'writegood-mode))
(use-package flyspell-correct
  :ensure t
  :config
  (add-hook 'LaTeX-mode-hook 'turn-on-flyspell)
  (add-hook 'org-mode-hook 'turn-on-flyspell)
  (evil-define-key 'normal 'global (kbd "<backspace>")
    'flyspell-correct-previous))
(use-package ivy)
(use-package flyspell-correct-ivy
  :ensure t
  :demand t
  :bind (:map flyspell-mode-map
	      ("C-c C-s" . flyspell-correct-at-point)))
;; LaTeX
(use-package pdf-tools)
(use-package auctex
  :defer t
  :ensure t
  :custom
  (TeX-auto-save t)
  (TeX-parse-self t)
  (TeX-master nil)
  :config
  (add-hook 'LaTeX-mode-hook 'TeX-fold-mode))
(use-package latex-math-preview)
(setq-default TeX-engine 'xetex)
(setq-default TeX-PDF-mode t)
;; Org
(use-package org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis "▼"
	org-hide-emphasis-markers t))
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◎" "○" "●" "□" "■" "◉" "◊")))
;; R
; run-ess-r-newest 
(use-package ess
  :ensure t)
;; Matlab
(use-package matlab
  :ensure matlab-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))
  (setq matlab-indent-function t)
  (setq matlab-shell-command "matlab"))
;; Auto-complete
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 1)
  (setq companty-minimum-prefix-length 2))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b7e460a67bcb6cac0a6aadfdc99bdf8bbfca1393da535d4e8945df0648fa95fb" "6b1abd26f3e38be1823bd151a96117b288062c6cde5253823539c6926c3bb178" default))
 '(exwm-floating-border-color "#242530")
 '(fci-rule-color "#6272a4")
 '(highlight-tail-colors
   ((("#2c3e3c" "#2a3b2e" "green")
     . 0)
    (("#313d49" "#2f3a3b" "brightcyan")
     . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(objed-cursor-color "#ff5555")
 '(package-selected-packages
   '(matlab-mode ess-R-data-view ess-r-insert-obj ess-smart-equals ess-smart-underscore ess-view ess-view-data company ess flyspell-correct-ivy langtool-ignore-fonts langtool pdf-tools-install pdf-tools writegood-mode flyspell-correct latex-math-preview preview-latex auctex rainbow-identifiers rainbow-mode autothemer org-bullets evil doom-themes helpful counsel which-key use-package rainbow-delimiters ivy doom-modeline command-log-mode))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil)
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
