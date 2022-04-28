;; dashboard configuration
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-set-footer nil)
(setq dashboard-set-init-info t)

;; Set the title
(setq dashboard-banner-logo-title "Emacs IDE")
;; Set the banner
(setq dashboard-startup-banner (concat user-emacs-directory "/images/dragon.png"))
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



