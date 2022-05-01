(easy-menu-define my-menu2 global-map "Preferences"
  '("Menu Options"
    ["t: Change Theme" (my-theme) t]
    ["f: Edit Face" (my-face) t]
    ["n: Edit Font" (my-font) t]
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

(defun my-face ()
    (call-interactively 'customize-face)
)

(defun my-font ()

    (call-interactively 'menu-set-font)
)

;; keyboard shortcut for preference bar
(define-key global-map (kbd "C-c C-z") 'my-preferences)




