
(easy-menu-define my-menu global-map "Toolbar"
  '("Menu Options"
    ["File Open" (open-file) t]
    ["Terminal" (open-terminal) t]
    ["Compile" (my-compile) t]
    ["Run" (my-run) t]
    ))
(defun my-toolbar-gui ()
  (interactive)
  (x-popup-menu (list '(200 200) (selected-window)) my-menu)
  )
(defun my-toolbar ()
  (interactive)
(tmm-prompt my-menu)
)
(defcustom tmm-completion-prompt
  "
"
  "Help text to insert on the top of the completion buffer.
To save space, you can set this to nil,
in which case the standard introduction text is deleted too."
  :type '(choice string (const nil)))
;;; ~~~~~~~~~~~~~~~~~~~~~~~ Buttons ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;    ;; custom button to open a shell window
(defun open-terminal ()
      (eshell)
      (cd eshell-directory)
      (execute-kbd-macro (read-kbd-macro "<return>"))
      (eshell/clear)
      )
(defun open-file ()
   ;(execute-kbd-macro (read-kbd-macro "C-x C-f"))
  (call-interactively 'counsel-find-file)
    )
;; my-run
;; keyboard shortcut for toolbar
(define-key global-map (kbd "C-x C-x") 'my-toolbar)


(defun dired-mouse-find-file (event)
  "In Dired, visit the file or directory name you click on."
  (interactive "e")
  (let (window pos file)
    (save-excursion
      (setq window (posn-window (event-end event))
            pos (posn-point (event-end event)))
      (if (not (windowp window))
          (error "No file chosen"))
      (set-buffer (window-buffer window))
      (goto-char pos)
      (setq file (dired-get-file-for-visit)))
    (if (file-directory-p file)
        (or (and (cdr dired-subdir-alist)
                 (dired-goto-subdir file))
            (progn
              (select-window window)
              (dired-other-window file)))
      (select-window window)
      (find-alternate-file (file-name-sans-versions file t)))))
