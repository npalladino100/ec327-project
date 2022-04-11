(defun eshell-other-window ()
  "Open a `shell' in a new window."
  (interactive)
  (let ((buf (eshell)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))


(defun compile-java ()
    (interactive)
    (setq eshell-directory default-directory)
      (eshell)
      (cd eshell-directory)
      (execute-kbd-macro (read-kbd-macro "<return>"))
    ;(popwin:stick-popup-window)
    ;(execute-kbd-macro (read-kbd-macro "C-c C-c"))
    (insert "javac ")
    (insert program-file-name)
    (execute-kbd-macro (read-kbd-macro "<return>"))
    ;(other-window -1)
					;(popwin:popup-buffer "*eshell*" :noselect t :stick t)
    ;(setq prog-language "java")
    )
    

(defun run-java ()
  (interactive)
  ;(switch-to-buffer java-file-name)
  (eshell)
  (delete-window)
  (eshell)
    (insert "java ")
    (insert java-file-name-no-extension)
    (execute-kbd-macro (read-kbd-macro "<return>"))
    )

(define-key global-map (kbd "C-c C-j C-c") 'compile-java)
(define-key global-map (kbd "C-c C-j C-r") 'run-java)

;(add-hook 'java-mode-hook
;          (lambda () (local-set-key (kbd "C-c C-c") 'compile-java)))

;(global-set-key (kbd "C-c C-r") 'run-java)



;(define-minor-mode my-execute-mode
;  "Smart program execution"
;  :keymap (let ((map (make-sparse-keymap)))
;            (define-key map (kbd "C-c C-x C-r") 'my-execute)
;            map))

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

;(add-hook 'eshell-mode-hook 'my-execute-mode)
;(add-hook 'python-mode-hook 'my-execute-mode)
;(add-hook 'fundamental-mode-hook 'my-execute-mode)
;(add-to-list 'auto-mode-alist '("\\.py\\'" . my-execute-mode))
;(add-to-list 'auto-mode-alist '("\\.java\\'" . my-execute-mode))


(defun set-prog-lang (lang)
  (interactive)
  (setq prog-lang lang)
  ;(if (equal prog-lang "python")
  ;    (elpy-enable)
					;  )

  )


(add-hook 'java-mode-hook (lambda () (set-prog-lang "java")))
(add-hook 'python-mode-hook (lambda () (set-prog-lang "python")))


