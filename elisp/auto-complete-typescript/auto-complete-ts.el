;;; auto-complete-ts.el --- Auto Completion source for typescript for GNU Emacs
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

(provide 'auto-complete-ts)
(require 'auto-complete)
(require 'json)
(require 'typescript-tss)

(defvar ac-ts-debug-mode nil)

(defun ac-ts-document (item)
  (if (stringp item)
      (let (s)
        (setq s (get-text-property 0 'ac-ts-help item))
		s))
  ;; (popup-item-property item 'ac-clang-help)
  )

(defface ac-ts-candidate-face
  '((t (:background "lightgray" :foreground "navy")))
  "Face for ts candidate"
  :group 'auto-complete)

(defface ac-ts-selection-face
  '((t (:background "navy" :foreground "white")))
  "Face for the ts selected candidate."
  :group 'auto-complete)

(defsubst ac-in-string/comment ()
  "Return non-nil if point is in a literal (a comment or string)."
  (nth 8 (syntax-ppss)))

(defun ac-ts--get-completions (info)
  (let ((member-entries (cdr (assoc 'entries info))))
	(mapcar (lambda (ent)
			  (let ((name (cdr (assoc 'name ent)))
					(kind (cdr (assoc 'kind ent)))
					(type (cdr (assoc 'type ent))))
				(propertize name 'ac-ts-help
							(concat kind ":" type))))
			member-entries)))

(defun ac-ts-candidate ()
  (when ac-ts-debug-mode
	(message "ac-ts-candidate '%s'" ac-prefix))
  (unless (ac-in-string/comment)
	(let ((file-name (expand-file-name (buffer-file-name))))
	  (prog1
		  (save-restriction
			(widen)
			(let* ((point (- (point) (length ac-prefix)))
				   (member (eq  ?\. (char-before ac-point)))
				   (result (typescript-tss-completions file-name
													   point member)))
			  (if (listp result)
				  (ac-ts--get-completions result)
				nil)))))))

(defun ac-ts-prefix ()
  (or (ac-prefix-symbol)
      (let ((c (char-before)))
        (when (or (eq ?\. c))
          (point)))))

(ac-define-source ts
  '((candidates . ac-ts-candidate)
    (candidate-face . ac-ts-candidate-face)
    (selection-face . ac-ts-selection-face)
	(prefix . ac-ts-prefix)
    (requires . 0)
	(document . ac-ts-document)
    ;; (action . ac-ts-action)
    (cache)
    (symbol . "t")))
