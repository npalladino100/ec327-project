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

;; Disables shortcut "jump" indicators for each section
(setq dashboard-show-shortcuts nil)

;; Shows 7 recent files on the dashboard
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
