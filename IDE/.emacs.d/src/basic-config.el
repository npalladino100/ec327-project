(setq-default cursor-type 'bar) 
(setq inhibit-startup-screen t)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; default directory
(setq default-directory "~/" )
;; ignore cl deprecation warnings
(setq byte-compile-warnings '(cl-functions))
(defun display-startup-echo-area-message ()
  (message "Press C-x C-x to open the toolbar"))

;; better fullscreen
;(w32-send-sys-command ?\xf030)
(toggle-frame-fullscreen)
;; better scrolling
(setq mouse-wheel-scroll-amount '(0.01))
(setq mouse-wheel-progressive-speed nil)
(setq ring-bell-function 'ignore)
;; check for packages to install
(load (concat user-emacs-directory "/init-packages.el"))
;; load custom theme
(load-theme 'gruvbox-dark-soft t)
;; always blink cursor
(setq blink-cursor-blinks 0)
;; highlight the current line
(add-hook 'prog-mode-hook 'global-hl-line-mode)
;; show line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; hide the modeline
(setq mode-line-format nil)
(setq-default mode-line-format nil)
;; don't confirm kill process
(setq confirm-kill-processes nil)
;; start emacs in fullscreen
;(add-hook 'emacs-startup-hook 'toggle-frame-maximized)
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
      (progn (set-frame-parameter (selected-frame) 'alpha '(99 . 99))
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
;; manage backups
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves"))) ;; directory where file backups are saved to
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024)) ;; 1mb



;; by default, .h files are c++ header files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; open .m files in octave mode
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))



;; open shell function
(defun open-terminal ()
  (interactive)
    (setq eshell-directory default-directory)
      (eshell)
      (cd eshell-directory)
      (execute-kbd-macro (read-kbd-macro "<return>"))
      (eshell/clear)
      )


;; custom keybindings
(global-set-key (kbd "C-c s") 'open-terminal)

(global-set-key (kbd "C-c c") 'my-compile)

(global-set-key (kbd "C-c r") 'my-run)

(global-set-key (kbd "C-c f") 'counsel-find-file)

(global-set-key (kbd "C-c l") 'recentf-open-files)

(global-set-key (kbd "C-c h") (cd user-home-directory))



(load (concat user-emacs-directory "/src/power-mode.el"))

;; POWER MODE
(defun my-power-mode ()
  (interactive)
  (display-message-or-buffer "Activating Power Mode")
    (power-mode)
  )
(custom-set-faces
 '(dashboard-heading ((t (:inherit dashboard-footer))))
)

