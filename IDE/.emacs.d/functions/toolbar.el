(defun close-and-kill-this-pane ()
      "If there are multiple windows, then close this pane and kill the buffer in it also."
      (interactive)
      (kill-this-buffer)
      (if (not (one-window-p))
          (delete-window)))

    (defun eshell-other-window ()
  "Open an `eshell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

;; ~~~~~~~~~~~~~~~~~~~~~~~ Buttons ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ;; custom button to open a shell window
(defun open-terminal-button-pressed (button)
  (other-window -1)
  (setq eshell-directory default-directory)
  (other-window 1)
      (eshell-other-window)
      (cd eshell-directory)
      (execute-kbd-macro (read-kbd-macro "<return>"))
    )
(define-button-type 'open-terminal-button
  'action 'open-terminal-button-pressed
  'follow-link t
  'face 'dashboard-heading)

;; custom button to open a file
(defun open-file-button-pressed (button)
;(execute-kbd-macro (kbd "C-g"))
					;(other-window (- 1))
  (popwin:close-popup-window)
  (direx:jump-to-directory-other-window)
    )
(define-button-type 'open-file-button
  'action 'open-file-button-pressed
  'follow-link t
  'face 'dashboard-heading)





(push '("*toolbar*" :position top :dedicated t)
      popwin:special-display-config)



;; create toolbar buffer

(switch-to-buffer "*toolbar*")
    
    
    (insert-button "Open Terminal" :type 'open-terminal-button)

    (previous-buffer)

    (execute-kbd-macro (read-kbd-macro "<return>"))
    (execute-kbd-macro (read-kbd-macro "<return>"))


(insert-button "Open File" :type 'open-file-button)





(defun open-toolbar ()
    (interactive)
  ;; toolbar temporary buffer
    (popwin:display-buffer "*toolbar*")

    )

;; keyboard shortcut for toolbar

(define-key global-map (kbd "C-t") 'open-toolbar)