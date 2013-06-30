; http://yak-shaver.blogspot.jp/2013/06/emacs-json-flymake.html
(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(require 'flymake-json)
(add-hook 'json-mode-hook 'flymake-json-load)
