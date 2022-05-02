(easy-menu-define my-menu global-map "Toolbar"
  '("Menu Options"
    ["f: Open File" (open-file) t]
    ["s: Save File" (save-buffer) t]
    ["S: Save As" (write-file) t]
    ["t: Terminal" (open-terminal) t]
    ["c: Compile" (my-compile) t]
    ["r: Run" (my-run) t]
    ["z: Undo" (undo-tree-undo) t]
    ["y: Redo" (undo-tree-redo) t]
    ["o: Share Session" (my-share) t]

    ("w: Window Options" ;; this is a sub-menu
     [ "o: Switch Window" (switch-window) ]
       [ "h: Split Horizontally" (split-window-horizontally) ]
       [ "v: Split Vertically" (split-window-vertically) ]
       [ "p: Stick Popup Window" (popwin:stick-popup-window) ]
       [ "k: Close Window" (delete-window) ]
       )
    ("b: Buffer Options" ;; this is a sub-menu
     [ "b: Buffer Window" (switch-to-buffer) ]
       [ "k: Close Buffer" (delete-buffer) ]
       )
    ("d: Cd" ;; this is a sub-menu
    ["h: Home Directory" (my-cd-home) t]
    ["i: IDE Directory" (my-cd-ide) t]
       )
  )
)

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
  ""
  :type '(choice string (const nil)))
;;; ~~~~~~~~~~~~~~~~~~~~~~~ Buttons ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defun open-terminal ()
      (eshell)
      ;(cd eshell-directory)
      ;(execute-kbd-macro (read-kbd-macro "<return>"))
      ;(eshell/clear)
      )
(defun open-file ()
   ;(execute-kbd-macro (read-kbd-macro "C-x C-f"))
  (call-interactively 'counsel-find-file)
    )

(defun my-share ()
    (call-interactively 'crdt-share-buffer)
    )

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

(defun my-cd-home ()
  (cd user-home-directory)
  ;(execute-kbd-macro (read-kbd-macro "<return>"))
  )

(defun my-cd-ide ()
  (cd (concat user-emacs-directory "/../.."))
  ;(execute-kbd-macro (read-kbd-macro "<return>"))
  )
