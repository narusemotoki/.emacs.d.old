(defun launch-filer-from-current-directory ()
  "launch finder from current directory"
  (interactive)
  (shell-command "gnome-open ."))
(define-key global-map (kbd "C-x f") 'launch-filer-from-current-directory)
