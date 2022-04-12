;; popwin configuration
(popwin-mode 1)

;; direx configuration
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; ivy configuration
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
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
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

(push '("*toolbar*" :position top :dedicated t)
      popwin:special-display-config)
(push '("*eshell*" :position bottom :dedicated t)
      popwin:special-display-config)


;; company mode and backends

(add-hook 'after-init-hook 'global-company-mode)
; No delay in showing suggestions.
(setq company-idle-delay 0.01)
; Show suggestions after entering one character.
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
; Use tab key to cycle through suggestions.
; ('tng' means 'tab and go')
(company-tng-configure-default)
(add-hook 'java-mode-hook #'lsp)
(add-hook 'python-mode-hook #'lsp)
(setq lsp-inhibit-message t)
(setq lsp-ui-sideline-enable t
	lsp-ui-sideline-show-symbol t
	lsp-ui-sideline-show-hover t
	lsp-ui-sideline-showcode-actions t
	lsp-ui-sideline-update-mode 'point)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'after-init-hook #'global-flycheck-mode)
;(add-hook 'python-mode-hook #'lsp-ui-mode)
;(add-hook 'python-mode-hook #'lsp-ui-sideline-mode)
(add-hook 'after-init-hook #'lsp-ui-mode)
;(add-hook 'after-init-hook #'lsp-ui-sideline-mode)

(add-hook 'emacs-startup-hook
  (lambda ()
    (setq lsp-ui-sideline-enable t)
  ))

(setq lsp-prefer-capf t)
(add-hook 'java-mode-hook 'smartparens-mode)
(add-hook 'python-mode-hook 'smartparens-mode)

(with-eval-after-load 'smartparens
  (sp-with-modes
      '(c++-mode objc-mode c-mode java-mode python-mode)
    (sp-local-pair "{" nil :post-handlers '(:add ("||\n[i]" "RET")))))
(setq lsp-idle-delay 0.500)
