;; custom button to select theme
(defun change-theme-button-pressed (button)
  (other-window -1)
  (my-theme)
    )
(define-button-type 'change-theme-button
  'action 'change-theme-button-pressed
  'follow-link t
  'face 'dashboard-heading)


;; create preferences buffer
(switch-to-buffer "*preferences*")  
    (insert-button "1. Change Theme" :type 'change-theme-button)
        (execute-kbd-macro "M-x custom-themes")


;;(insert-button "2. Change Font" :type 'change-font-button)

   ;; (execute-kbd-macro (read-kbd-macro "<return>"))



(defun open-preferences ()
    (interactive)
    ;; perferences temporary buffer
    (setq eshell-directory default-directory)
    (popwin:display-buffer "*preferences*")
    
    )

;;keyboard shortcut for user preferences menu
(define-key global-map (kbd "C-c C-p") 'my-theme)


