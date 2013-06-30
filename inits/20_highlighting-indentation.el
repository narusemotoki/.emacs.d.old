(require 'highlight-indentation)

; http://blog.iss.ms/2012/03/17/095152
; highlight-indentation-mode が呼ばれたら highlight-indentation-current-column-mode も実行する
(add-hook 'highlight-indentation-mode-hook 'highlight-indentation-current-column-mode)

(set-face-background 'highlight-indentation-face "gray20")
(set-face-background 'highlight-indentation-current-column-face "#CC0066")
