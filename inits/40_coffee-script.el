(add-hook 'coffee-mode-hook 'highlight-indentation-mode)

; http://qiita.com/aki77@github/items/a8d96ae95a1838500e37
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2)
 (setq coffee-tab-width 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))
