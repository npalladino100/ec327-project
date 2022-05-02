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
(define-key ivy-minibuffer-map (kbd "<return>") 'my-ivy-autocomp)


(defun my-ivy-autocomp ()
  (interactive)
    (ivy-alt-done)

  )
  


(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

(push '("*toolbar*" :position top :height 5 :dedicated t)
      popwin:special-display-config)
(push '("*eshell*" :position bottom :dedicated t)
      popwin:special-display-config)


;; company mode and backends

; No delay in showing suggestions.
(setq company-idle-delay 0.01)
; Show suggestions after entering one character.
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
  )

; Use tab key to cycle through suggestions.
; ('tng' means 'tab and go')
(company-tng-configure-default)
;(add-hook 'java-mode-hook #'lsp)
;(add-hook 'python-mode-hook #'lsp)
(setq lsp-inhibit-message t)
;(setq lsp-ui-sideline-enable t
;	lsp-ui-sideline-show-symbol t
;	lsp-ui-sideline-show-hover t
;	lsp-ui-sideline-showcode-actions t
;	lsp-ui-sideline-update-mode 'point)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'after-init-hook #'global-flycheck-mode)
;(add-hook 'python-mode-hook #'lsp-ui-mode)
;(add-hook 'python-mode-hook #'lsp-ui-sideline-mode)
;(add-hook 'after-init-hook #'lsp-ui-mode)
;(add-hook 'after-init-hook #'lsp-ui-sideline-mode)

;(add-hook 'emacs-startup-hook
;  (lambda ()
;    (setq lsp-ui-sideline-enable t)
;  ))
(setq lsp-java-completion-enabled nil)
(setq lsp-prefer-capf t)
(add-hook 'java-mode-hook 'smartparens-mode)
(add-hook 'python-mode-hook 'smartparens-mode)
(add-hook 'cc-mode-hook 'smartparens-mode)
(add-hook 'c++-mode-hook 'smartparens-mode)
(add-hook 'c-mode-hook 'smartparens-mode)
(add-hook 'objc-mode-hook 'smartparens-mode)
(add-hook 'elisp-mode-hook 'smartparens-mode)

(with-eval-after-load 'smartparens
  (sp-with-modes
      '(c++-mode objc-mode cc-mode c-mode java-mode python-mode elisp-mode)
    (sp-local-pair "{" nil :post-handlers '(:add ("||\n[i]" "RET")))))
;(setq lsp-idle-delay 0.500)


(with-eval-after-load 'treemacs
(define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
  (treemacs-define-doubleclick-action 'file-node-closed #'treemacs-visit-node-ace)
  (treemacs-define-doubleclick-action 'file-node-open #'treemacs-visit-node-ace)
  (setq treemacs-default-visit-action 'treemacs-visit-node-close-treemacs)
  )

  

(add-hook 'prog-mode-hook 'company-mode)

    (add-hook 'emacs-lisp-mode-hook
              (lambda ()
                ;; Use spaces, not tabs.
                (setq indent-tabs-mode nil)
                ;; Pretty-print eval'd expressions.
                (define-key emacs-lisp-mode-map
                            "\C-x\C-e" 'pp-eval-last-sexp)
                ;; Recompile if .elc exists.
                (add-hook (make-local-variable 'after-save-hook)
                          (lambda ()
                            (byte-force-recompile default-directory)))
                (define-key emacs-lisp-mode-map
                  "\r" 'reindent-then-newline-and-indent)))


(yas-global-mode)


(setq lsp-completion-provider :capf)

(add-to-list 'company-backends 'company-anaconda)

(global-undo-tree-mode)
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-S-z") 'undo-tree-redo)
(global-set-key (kbd "C-y") 'undo-tree-redo)
