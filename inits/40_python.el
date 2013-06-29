; flymake
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

; http://qiita.com/yuu116atlab/items/2a62cb880ac863dcc8ef
; 補完
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
; これを入れるとjediを手動<C-tab>で立ち上げないといけない。
; (setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook 'highlight-indentation-mode)
