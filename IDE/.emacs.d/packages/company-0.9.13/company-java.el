(require 'company)
(global-company-mode t)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)

(custom-set-faces
 ;; ...
 '(company-preview ((t (:background "black" :foreground "red"))))
 '(company-preview-common ((t (:foreground "red"))))
 '(company-preview-search ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "brightwhite"))))
 '(company-scrollbar-fg ((t (:background "red"))))
 '(company-template-field ((t (:background "magenta" :foreground "black"))))
 '(company-tooltip ((t (:background "brightwhite" :foreground "black"))))
 '(company-tooltip-annotation ((t (:background "brightwhite" :foreground "black"))))
 '(company-tooltip-annotation-selection ((t (:background "color-253"))))
 '(company-tooltip-common ((t (:background "brightwhite" :foreground "red"))))
 '(company-tooltip-common-selection ((t (:background "color-253" :foreground "red"))))
 '(company-tooltip-mouse ((t (:foreground "black"))))
 '(company-tooltip-search ((t (:background "brightwhite" :foreground "black"))))
 '(company-tooltip-selection ((t (:background "color-253" :foreground
 "black"))))
 ;; ...
)

(provide 'company-java)

