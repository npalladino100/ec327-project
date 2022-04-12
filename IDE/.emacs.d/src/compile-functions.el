(defun set-prog-lang (lang)
  (interactive)
  (setq prog-lang lang)
  )

(defun my-compile ()
  (interactive)
    (setq program-file-name (file-name-nondirectory buffer-file-name))
  (setq java-file-name-no-extension (replace-regexp-in-string ".java" "" program-file-name))
  (setq python-file-name-no-extension (replace-regexp-in-string ".py" "" program-file-name))
  
  (if (equal prog-lang "java")
      (compile-java)
      )
  (if (equal prog-lang "python")
      (my-run-python)
    
    )
  )

(defun my-run ()
  (interactive)
    (setq program-file-name (file-name-nondirectory buffer-file-name))
  (setq java-file-name-no-extension (replace-regexp-in-string ".java" "" program-file-name))
  (setq python-file-name-no-extension (replace-regexp-in-string ".py" "" program-file-name))
  
  (if (equal prog-lang "java")
      (run-java)
      )
  (if (equal prog-lang "python")
      (my-run-python)
    
    )
  )


(add-hook 'java-mode-hook (lambda () (set-prog-lang "java")))
(add-hook 'python-mode-hook (lambda () (set-prog-lang "python")))



;; ~~~~~~~~~~~~~~~~~~~~~~~~ Python ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defun my-run-python ()
  (interactive)
  (setq eshell-directory default-directory)
  (eshell)
  
  (insert "quit()")
  (execute-kbd-macro (read-kbd-macro "<return>"))
  (sit-for 1)
      (cd eshell-directory)
      (execute-kbd-macro (read-kbd-macro "<return>"))
  (insert "ipython -i ")
    (insert program-file-name)
    (execute-kbd-macro (read-kbd-macro "<return>"))
    )
;; ~~~~~~~~~~~~~~~~~~~~~~~~~~ Java ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defun compile-java ()
    (interactive)
    (setq eshell-directory default-directory)
      (eshell)
      (cd eshell-directory)
      (execute-kbd-macro (read-kbd-macro "<return>"))
    (insert "javac ")
    (insert program-file-name)
    (execute-kbd-macro (read-kbd-macro "<return>"))
    )
    

(defun run-java ()
  (interactive)
  (eshell)
  (delete-window)
  (eshell)
    (insert "java ")
    (insert java-file-name-no-extension)
    (execute-kbd-macro (read-kbd-macro "<return>"))
    )
