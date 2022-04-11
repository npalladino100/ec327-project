(push '("*toolbar*" :position top :dedicated t)
      popwin:special-display-config)
(push '("*eshell*" :position bottom :dedicated t)
      popwin:special-display-config)


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
  (popwin:close-popup-window)
      (eshell)
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


;; custom button to compile
(defun compile-button-pressed (button)
  (other-window -1)
  (my-compile)
    )
(define-button-type 'compile-button
  'action 'compile-button-pressed
  'follow-link t
  'face 'dashboard-heading)


;; custom button to run
(defun run-button-pressed (button)
  (other-window -1)
  (my-run)
    )
(define-button-type 'run-button
  'action 'run-button-pressed
  'follow-link t
  'face 'dashboard-heading)



;; create toolbar buffer

(switch-to-buffer "*toolbar*")
    
    
    (insert-button "1. Open Terminal" :type 'open-terminal-button)

    (previous-buffer)

    (execute-kbd-macro (read-kbd-macro "<return>"))


(insert-button "2. Open File" :type 'open-file-button)

    (execute-kbd-macro (read-kbd-macro "<return>"))


(insert-button "3. Compile" :type 'compile-button)

    (execute-kbd-macro (read-kbd-macro "<return>"))


(insert-button "4. Run" :type 'run-button)


(defun open-toolbar ()
    (interactive)
  ;; toolbar temporary buffer
    (popwin:display-buffer "*toolbar*")

    )

;; keyboard shortcut for toolbar

(define-key global-map (kbd "C-t") 'open-toolbar)
