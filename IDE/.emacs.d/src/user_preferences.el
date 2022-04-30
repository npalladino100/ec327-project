(easy-menu-define my-menu2 global-map "Preferences"
  '("Menu Options"
    ["t: Change Theme" (my-theme) t]
    ))
(defun my-preferences-gui ()
  (interactive)
  (x-popup-menu (list '(200 200) (selected-window)) my-menu2)
  )
(defun my-preferences ()
  (interactive)
(tmm-prompt my-menu2)
)
(defcustom tmm-completion-prompt
  "
"
  ""
  :type '(choice string (const nil)))




;; custom button to select theme
(defun my-theme ()
    
    (call-interactively 'customize-themes)
)

;; keyboard shortcut for preference bar
(define-key global-map (kbd "C-c C-z") 'my-preferences)




