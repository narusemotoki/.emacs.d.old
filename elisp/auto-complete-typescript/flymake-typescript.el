(require 'flymake)
(require 'typescript)

(defun flymake-typescript-make-error (obj)
  (mapcar (lambda (ent)
			(let* ((file (cdr (assoc 'file ent)))
				   (start (cdr (assoc 'start ent)))
				   (line (cdr (assoc 'line start)))
				   (col (cdr (assoc 'col start)))
				   (text (cdr (assoc 'text ent))))
			  (format "%s (%d,%d): %s" file line col text)))
		  obj))

(defun flymake-typescript-check-error ()
  "Show syntax errors."
  (interactive)
  (when typescript-tss-debug-mode
	(message "flymake-typescript-check-error"))
  (let ((file-name (expand-file-name (buffer-file-name))))
	(setq flymake-last-change-time nil)
	(save-restriction
	  (setq flymake-check-start-time (flymake-float-time))
	  (widen)
	  (let ((result (typescript-tss-errors)))
		(when (arrayp result)
		  (let ((lines (flymake-typescript-make-error result)))
			(setq flymake-new-err-info
				  (flymake-parse-err-lines
				   flymake-new-err-info lines)))
		  ;; (message "lines %s" lines)
		  ;; (message "new err %s" flymake-new-err-info))
		  (flymake-post-syntax-check 0 "tss")
		  (setq flymake-is-running nil))))))

(when (load "flymake" t)  
  (defun flymake-typescript-init ()
    (run-at-time 0.1 nil 'flymake-typescript-check-error)
    nil)
  
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.ts\\'" flymake-typescript-init))

  (setq flymake-err-line-patterns
        (cons '("\\(^[^\\.]+.ts\\)[^(]*(\\([0-9]+\\),\\([0-9]+\\)): \\(.+\\)" 1 2 3 4)
              flymake-err-line-patterns)))
