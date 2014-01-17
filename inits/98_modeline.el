; http://d.hatena.ne.jp/syohex/20130131/1359646452
; モードラインをコンパクトに表示する
(defvar mode-line-cleaner-alist
  '( ;; For minor-mode, first char is 'space'
    (yas-minor-mode . " Ys")
    (paredit-mode . "")
    (anzu-mode . "")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . "")
    (elisp-slime-nav-mode . "")
    (helm-gtags-mode . "")
    (flymake-mode . " fly")
    (helm-mode . "")
    (git-gutter-mode . "")
    (highlight-indentation-current-column-mode . "")
    (highlight-indentation-mode . "")
    (global-whitespace-mode . "")
    (auto-highlight-symbol-mode . "")
    ;; Major modes
    (lisp-interaction-mode . "lisp")
    (python-mode . "py")
    (ruby-mode   . "rb")
    (emacs-lisp-mode . "el")
    (markdown-mode . "md")
    (typescript-mode . "ts")
    (coffee-mode . "coffee")))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
