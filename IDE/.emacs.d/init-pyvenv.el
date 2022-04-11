(setenv "WORKON_HOME" user-conda-env-directory)
(add-hook 'eshell-mode-hook 'pyvenv-mode)
(pyvenv-workon user-conda-env-name)
(venv-initialize-interactive-shells)
(venv-initialize-eshell)
(setq python-shell-interpreter "python")
;(defun my-eval-after-load-python()
;(add-to-list 'auto-mode-alist '("\\.py\\'" . elpy-mode))
;)
;(elpy-enable)
;(eval-after-load "python" '(my-eval-after-load-python))
(setq-default indent-tabs-mode t)

;(add-to-list 'auto-mode-alist '("\\.py\\'" . elpy-mode))
;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;(elpy-shell-switch-to-shell)
;(close-and-kill-this-pane)




;(setq elpy-shell-use-project-root t)
(setq elpy-shell-echo-input nil)
(setq python-shell-completion-native-enable nil)
(setq elpy-rpc-virtualenv-path 'current)
;(conda-env-initialize-eshell)
;(add-to-list 'auto-mode-alist '("\\.py\\'" . conda-env-autoactivate-mode))
;(conda-env-autoactivate-mode t)
;(setq conda-env-home-directory user-conda-env-directory)
;(custom-set-variables '(conda-anaconda-home user-conda-directory))
;(setq elpy-shell-display-buffer-after-send t)



;(switch-to-buffer "*Python*")

;(elpy-shell-switch-to-shell)

;(previous-buffer)
