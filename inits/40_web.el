(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))

(defun web-mode-custom-hook ()
  "Web mode hook"
  ; インデント
  (setq web-mode-html-offset 2)
  (setq web-mode-css-offset 2)
  (setq web-mode-script-offset 2)
  (set (make-local-variable 'tab-width) 2)
)
(add-hook 'web-mode-hook 'web-mode-custom-hook)
(add-hook 'web-mode-hook 'highlight-indentation-mode)
