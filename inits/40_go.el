(add-hook 'go-mode-hook
          '(lambda ()
             (setq tab-width 4)
             ))
(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)))
