(defun eshell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(defun compile-java ()
    (interactive)
    (setq java-file-name (file-name-nondirectory buffer-file-name))
    (setq java-file-name-no-extension (replace-regexp-in-string ".java" "" java-file-name))
    (eshell-other-window)
    (insert "javac ")
    (insert java-file-name)
    (execute-kbd-macro (read-kbd-macro "<return>"))
    )
    

(defun run-java ()
    (interactive)
    (insert "java ")
    (insert java-file-name-no-extension)
    (execute-kbd-macro (read-kbd-macro "<return>"))
    )

(define-key global-map (kbd "C-c C-j C-c") 'compile-java)
(define-key global-map (kbd "C-c C-j C-r") 'run-java)
