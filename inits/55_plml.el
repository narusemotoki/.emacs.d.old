(load "preview-lightweight-markup-language")

(add-hook 'rst-mode-hook
          '(lambda ()
            (add-hook 'after-save-hook 'plml-rst-reload)))

(add-hook 'markdown-mode-hook
          '(lambda ()
            (add-hook 'after-save-hook 'plml-markdown-reload)))
