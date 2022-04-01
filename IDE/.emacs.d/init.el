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

;; function to adjust transparency with keybinding C-c t
(setq transparency_level 0) ;; transparency level when emacs starts up
(defun my:change_transparency ()
  "Toggles transparency of Emacs between 3 settings (none, mild, moderate)."
  (interactive)
  (if (equal transparency_level 0)
      (progn (set-frame-parameter (selected-frame) 'alpha '(75 . 85))
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

(setq backup-directory-alist `(("." . "~/.saves"))) ;; directory where file backups are saved to
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


