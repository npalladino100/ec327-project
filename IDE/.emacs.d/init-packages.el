(require 'package)
(setq package-user-dir (concat user-emacs-directory "/packages/")) ;; sets the directory where melpa packages are installed

(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")


; list the packages you want separated by spaces
(setq package-list
      '(elpy
	nord-theme
	direx
	popwin
	ivy
	switch-window
	workgroups2
	dashboard
	conda
	virtualenvwrapper
	counsel
        python-mode
	))


; activate all the packages
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
