;;; typescript-tss.el --- typescript-tools interface for GNU Emacs
;; Copyright (C) 2012 Kensuke Matsuzaki

;; Author: Kensuke Matsuzaki <knsk.mtzk@gmail.com>
;; Keywords: completion, convenience
;; Version: 0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; Many code are from Brian Jiang's auto-complete-clang.el

(provide 'typescript-tss)
(require 'json)

(defcustom typescript-tss-executable
  (executable-find "tss")
  "*Location of tss executable"
  :group 'auto-complete
  :type 'file)

(defcustom typescript-tss-auto-save t
  "*Determines whether to save the buffer when retrieving completions."
  :group 'auto-complete
  :type '(choice (const :tag "Off" nil)
                 (const :tag "On" t)))

(defvar typescript-tss-debug-mode nil)

(defvar typescript-tss-line-separator "\n")

(defconst typescript-tss-error-buffer-name "*tss error*")

;; connect to typescript-tools
(defvar typescript-tss-proc nil)
(make-variable-buffer-local 'typescript-tss-proc)
(defvar typescript-tss-result nil)
(make-variable-buffer-local 'typescript-tss-result)

(defun typescript-tss-ensure-tss (file-name)
  (unless (and typescript-tss-proc
			   (member (process-status typescript-tss-proc) '(run stop)))
	(let ((f (expand-file-name file-name)))
	  (when typescript-tss-debug-mode
		(message "tss:%s\nfile:%s" tss f))
	  (setq typescript-tss-proc (start-process "tss"
									  "*typescript-tss*"
									  typescript-tss-executable
									  f))
	  (set-process-filter typescript-tss-proc 'typescript-tss--proc-filter)
	  (add-hook 'kill-buffer-hook 'typescript-tss--delete-process nil t))))

(defun typescript-tss--delete-process ()
  (and typescript-tss-proc
       (delete-process typescript-tss-proc)))

(defun typescript-tss--wait-response ()
  (let ((n 0)
		(seconds 10))
    (while (and (not typescript-tss-result) (<= n (* 10 seconds)))
	  (setq n (+ 1 n))
	  (sleep-for 0.1))
	(unless typescript-tss-result
	  (message "tss timeout"))))

(defun typescript-tss--proc-filter (proc string)
  (let ((line))
	(when typescript-tss-debug-mode
	  (message "tss:proc-filter %s"  string))
	(with-current-buffer (process-buffer proc)
	  (let ((moving (= (point) (process-mark proc))))
		(save-excursion
		  ;; Insert the text, advancing the process marker.
		  (goto-char (process-mark proc))
		  (insert string)
		  (set-marker (process-mark proc) (point))
		  (when (= (point) (line-beginning-position))
			(beginning-of-line 0)
			(setq line (buffer-substring-no-properties (point) (point-at-eol)))))
		(if moving (goto-char (process-mark proc)))))
	(when line
	  (when typescript-tss-debug-mode
		(message "tss:parse %s" line))
	  (condition-case err
		  (cond ((string-match "^\\(loaded\\|reloaded\\|updated\\|TSS\\) .*" line)
				 (setq typescript-tss-result 1))
				(t
				 (setq typescript-tss-result (json-read-from-string line))))
		(json-error
		 (progn
		   (message "typescript-tss error %s" (error-message-string err))
		   (setq typescript-tss-result 1)))))))

(defun typescript-tss-current-pos ()
  (format "%d %d"
		  (line-number-at-pos)
		  (- (point) (line-beginning-position))))

(defsubst typescript-tss-build-location (file-name pos)
  (save-excursion
    (goto-char pos)
	(format "%d %d %s"
			(line-number-at-pos)
			(- (point) (line-beginning-position))
			(expand-file-name file-name))))

(defun typescript-tss-update (file-name)
  (setq typescript-tss-result nil)
  (if typescript-tss-auto-save
	  (progn (buffer-modified-p)
			 (basic-save-buffer)
			 (process-send-string typescript-tss-proc
								  (concat "reload"
										  typescript-tss-line-separator)))
	(progn
	  (let* ((contents (buffer-substring-no-properties (point-min) (point-max)))
			 (lines (line-number-at-pos (point-max)))
			 (cmd (format "update %d %s%s"
						  lines file-name
						  typescript-tss-line-separator)))
		(when typescript-tss-debug-mode
		  (message "tss update source:%s" cmd))
		(process-send-string typescript-tss-proc cmd)
		(save-excursion
		  (goto-char (point-min))
		  (while (not (eobp))
;			(message ">> %s" (buffer-substring-no-properties (point) (point-at-eol)))
			(process-send-string typescript-tss-proc
								 (concat (buffer-substring-no-properties (point) (point-at-eol))
										 typescript-tss-line-separator))
			(beginning-of-line 2))))))
  (typescript-tss--wait-response))

(defun typescript-tss-prepare ()
  (let ((file-name (expand-file-name (buffer-file-name))))
	(typescript-tss-ensure-tss file-name)
	(typescript-tss-update file-name)))

(defun typescript-tss-completions (file-name pos member)
  (typescript-tss-prepare)
  (setq typescript-tss-result nil)
  (let ((cmd (format "completions %s %s%s"
					 (if member "true" "false")
					 (typescript-tss-build-location file-name pos)
					 typescript-tss-line-separator)))
	(process-send-string typescript-tss-proc cmd)
	(typescript-tss--wait-response)
	typescript-tss-result))

(defun typescript-tss-errors ()
  (typescript-tss-prepare)
  (setq typescript-tss-result nil)
  (process-send-string typescript-tss-proc
					   (concat "showErrors"
							   typescript-tss-line-separator))
  (typescript-tss--wait-response)
  typescript-tss-result)

(defun typescript-tss-default-command (cmd)
  (typescript-tss-prepare)
  (setq typescript-tss-result nil)
  (let* ((file-name (expand-file-name (buffer-file-name)))
		 (pos (typescript-tss-build-location file-name (+ (point) 1)))
		 (str (format "%s %s%s" cmd pos typescript-tss-line-separator)))
	(process-send-string typescript-tss-proc str)
	(typescript-tss--wait-response)
	typescript-tss-result))

(defun typescript-tss-show-type ()
  (interactive)
  (message "Type: %s" (typescript-tss-default-command "type")))

(defun typescript-tss-show-symbol ()
  (interactive)
  (message "Symbol: %s" (typescript-tss-default-command "symbol")))

(defun typescript-tss-show-definition ()
  (interactive)
  (message "Definition: %s" (typescript-tss-default-command "definition")))

(defun typescript-tss-goto-definition ()
  (interactive)
  (let ((def (typescript-tss-default-command "definition")))
	(if def
	  (let* ((file (cdr (assoc 'file def)))
			 (min (cdr (assoc 'min def)))
			 (l (elt min 0))
			 (c (elt min 1)))
		(find-file file)
		(goto-line l)
		(beginning-of-line))
	  (message "Not found"))))
