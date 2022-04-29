(defun my-org-screenshot ()
  "Take a screenshot into a time stamped unique-named file in the
   same directory as the org-buffer and insert a link to this file."  
   (interactive)
   (setq filename
     (concat
       (make-temp-name
         (concat (buffer-file-name)
              "_"
              (format-time-string "%Y%m%d_%H%M%S_")) ) ".png"))
   ;(shell-command "snippingtool /clip")
   (shell-command (concat "powershell -command \"Add-Type -AssemblyName System.Windows.Forms;if ($([System.Windows.Forms.Clipboard]::ContainsImage())) {$image = [System.Windows.Forms.Clipboard]::GetImage();[System.Drawing.Bitmap]$image.Save('" filename "',[System.Drawing.Imaging.ImageFormat]::Png); Write-Output 'clipboard content saved as file'} else {Write-Output 'clipboard does not contain image data'}\""))
   (insert (concat "[[file:" filename "]]"))
   (org-display-inline-images))

(global-set-key (kbd "<insert>") 'my-org-screenshot)



(defvar rogue-dark-theme 'gruvbox-dark-soft)
(defvar rogue-light-theme 'spacemacs-light)

(defvar rogue-current-theme rogue-dark-theme
  "Currently active color scheme")

(setq org-startup-indented t
      org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
      org-ellipsis "  " ;; folding symbol
      org-pretty-entities t
      org-hide-emphasis-markers t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t)

(load (concat user-emacs-directory "/src/org-pretty-table.el"))

(defun rogue-light ()
  "Switch to light theme"
  (interactive)
  (setq line-spacing 0.1)
  (setq header-line-format " ")
  (lambda () (progn
  (setq left-margin-width 2)
  (setq right-margin-width 2)
  (set-window-buffer nil (current-buffer))))
   (font-lock-add-keywords 'org-mode
                          '(("^ *\\([-]\\) "
                             (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
   

  (setq org-hide-emphasis-markers t)
  (setq org-bullets-bullet-list '(" "))
)

(add-hook 'org-mode-hook (lambda ()
                              (electric-indent-local-mode -1)))

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
 (custom-theme-set-faces
   'user
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))

  (let* ((variable-tuple
          (cond ((x-list-fonts "Georgia")         '(:font "Georgia"))
                ((x-list-fonts "Times New Roman") '(:font "Times New Roman"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))


    (setq writeroom-width 140
          writeroom-mode-line nil
          writeroom-global-effects '(writeroom-set-bottom-divider-width
                                     writeroom-set-internal-border-width
                                     (lambda (arg)
                                       (let ((langs '("python"
                                                      "emacs-lisp"
                                                      "common-lisp"
                                                      "js"
                                                      "ruby"
						      )))
                                         (cond
                                          ((= arg 1)
                                           (progn
                                             (setq org-src-block-faces
                                                   (mapcar (lambda (lang) (list lang '(:family "Source Code Pro" :height 0.8))) langs))
                                             (normal-mode)
                                             (variable-pitch-mode)))
                                          ((= arg -1)
                                           (progn
                                             (setq org-src-block-faces
                                                   (mapcar (lambda (lang) (list lang '(:family "Source Code Pro" :height 1.0))) langs))
                                             (normal-mode)
                                             (variable-pitch-mode)
                                             (variable-pitch-mode))))))))


(set-default 'preview-scale-function 1.3)
(load (concat user-emacs-directory "/src/org-fragtog.el"))
(add-hook 'org-mode-hook 'org-fragtog-mode)

(add-hook 'org-mode-hook 'org-pretty-table-mode)
