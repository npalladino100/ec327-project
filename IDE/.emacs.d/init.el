;; load basic config
(load (concat user-emacs-directory "/src/basic-config.el"))

;; load package config
(load (concat user-emacs-directory "/src/package-config.el"))

;; load dashboard config
(load (concat user-emacs-directory "/src/dashboard-config.el"))

;; load toolbar
(load (concat user-emacs-directory "/src/toolbar.el"))

;; load compile_functions
(load (concat user-emacs-directory "/src/compile-functions.el"))

;; load org-mode config
  (load (concat user-emacs-directory "/src/org-mode-config.el"))

;; load python config (uncomment if using python)
;;(load "~/ec327-project/IDE/.emacs.d/src/python-config.el")




(cd user-home-directory) ;; default working environment

