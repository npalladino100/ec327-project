(require 'company)

(setq python-shell-interpreter "/home/rafatieppo/anaconda3/bin/python3")

(global-company-mode t)

(setq company-idle-delay 0)

(setq company-minimum-prefix-length 3)

(company-quickhelp-mode 1)

(setq company-quickhelp-delay 0)

(defun my/python-mode-hook ())

(add-to-list 'company-backends 'company-jedi)

(add-hook 'python-mode-hook 'my/python-mode-hook)

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)

(provide 'company-python)
