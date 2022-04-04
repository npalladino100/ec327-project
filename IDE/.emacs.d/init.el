
(setq-default cursor-type 'bar) 
(setq inhibit-startup-screen t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; default directory
(setq default-directory "~/" )

;; ignore cl deprecation warnings
(setq byte-compile-warnings '(cl-functions))

;; check for packages to install
(load (concat user-emacs-directory "/init-packages.el"))

;; load custom theme
(load-theme 'nord t)

;; always blink cursor
(setq blink-cursor-blinks 0)

;; start emacs in fullscreen
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

;; set word-wrapping default
(global-visual-line-mode t)

;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Don't show *Buffer list* when opening multiple files at the same time.
(setq inhibit-startup-buffer-menu t)

;; Show only one active window when opening multiple files at the same time.
(add-hook 'window-setup-hook 'delete-other-windows)

(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; function to adjust transparency with keybinding C-c t
(setq transparency_level 0) ;; transparency level when emacs starts up
(defun my:change_transparency ()
  "Toggles transparency of Emacs between 3 settings (none, mild, moderate)."
  (interactive)
  (if (equal transparency_level 0)
      (progn (set-frame-parameter (selected-frame) 'alpha '(95 . 85))
         (setq transparency_level 1))
    (if (equal transparency_level 1)
    (progn (set-frame-parameter (selected-frame) 'alpha '(50 . 85))
           (setq transparency_level 2))
      (if (equal transparency_level 2)
      (progn (set-frame-parameter (selected-frame) 'alpha '(100 . 85))
         (setq transparency_level 0)))
      )))
(define-key global-map (kbd "C-c t") 'my:change_transparency)
(funcall-interactively 'my:change_transparency) 

;; disable toolbar, menubar, and scrollbar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq backup-directory-alist `(("." . "~/.emacs.d/.saves"))) ;; directory where file backups are saved to
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; ~~~~~~~~~~~~~~~~~~~~~~ Packages ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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



;; dashboard configuration
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-set-footer nil)
(setq dashboard-set-init-info t)

;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs Dashboard")
;; Set the banner
(setq dashboard-startup-banner (concat user-emacs-directory "/images/stallman.png"))
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.gif", "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever gif/image/text you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)

(setq dashboard-items '((recents  . 7)
			))


;; custom button to open a file using direx
  (defun open-file-button-pressed (button)
  (funcall-interactively 'direx:jump-to-directory-other-window))

(define-button-type 'open-file-button
  'action 'open-file-button-pressed
  'follow-link t
  'face 'dashboard-heading)

(defun dashboard-insert-open-file (list-size)
  (insert-button "Open File" :type 'open-file-button))
(add-to-list 'dashboard-item-generators  '(open-file . dashboard-insert-open-file))
(add-to-list 'dashboard-items '(open-file) t)


;; custom button to open a shell window
  (defun open-terminal-button-pressed (button)
    (eshell)
    (eshell/clear)
    )

(define-button-type 'open-terminal-button
  'action 'open-terminal-button-pressed
  'follow-link t
  'face 'dashboard-heading)

(defun dashboard-insert-open-terminal (list-size)
  (insert-button "Open Terminal" :type 'open-terminal-button))
(add-to-list 'dashboard-item-generators  '(open-terminal . dashboard-insert-open-terminal))
(add-to-list 'dashboard-items '(open-terminal) t)


;; custom button to open tetris
  (defun open-tetris-button-pressed (button)
    (tetris)
    )

(define-button-type 'open-tetris-button
  'action 'open-tetris-button-pressed
  'follow-link t
  'face 'dashboard-heading)

(defun dashboard-insert-open-tetris (list-size)
  (insert-button "Open Tetris" :type 'open-tetris-button))
(add-to-list 'dashboard-item-generators  '(open-tetris . dashboard-insert-open-tetris))
(add-to-list 'dashboard-items '(open-tetris) t)





;; custom button to pull and apply changes from the project's github repo
  (defun open-git-button-pressed (button)

    (let ((default-directory user-emacs-directory)) 
      (eshell)
      (insert "echo \"Please restart emacs for changes to take effect.\"")
      (execute-kbd-macro (read-kbd-macro "<return>"))
      (insert "cd ...")
      (execute-kbd-macro (read-kbd-macro "<return>"))
      (insert "git pull")
      (execute-kbd-macro (read-kbd-macro "<return>"))
    )
  )

(define-button-type 'open-git-button
  'action 'open-git-button-pressed
  'follow-link t
  'face 'dashboard-heading)

(defun dashboard-insert-open-git (list-size)
  (insert-button "Pull from GitHub" :type 'open-git-button))
(add-to-list 'dashboard-item-generators  '(open-git . dashboard-insert-open-git))
(add-to-list 'dashboard-items '(open-git) t)


