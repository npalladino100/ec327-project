;; load custom file
(setq custom-file (concat user-emacs-directory "/src/custom.el"))
(load custom-file)

;; load basic config
(load (concat user-emacs-directory "/src/basic-config.el"))

;; load package config
(load (concat user-emacs-directory "/src/package-config.el"))

;; load dashboard config
(load (concat user-emacs-directory "/src/dashboard-config.el"))

;; load toolbar
(load (concat user-emacs-directory "/src/toolbar.el"))

;; load user preferences menu
(load (concat user-emacs-directory "/src/user_preferences.el"))


;; load org-mode config

;; load python config (uncomment if using python)
(load (concat user-emacs-directory "/src/python-config.el"))

;; load compile_functions
(load (concat user-emacs-directory "/src/compile-functions.el"))


(cd user-home-directory) ;; default working environment

