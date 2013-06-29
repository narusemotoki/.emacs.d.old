; http://www11.atwiki.jp/s-irie/pages/18.html
; やり直し
(require 'redo+)
(global-set-key (kbd "C-+") 'redo)

; 過去のundoがredoされないようにする
(setq undo-no-redo t)

; 大量のundoに耐えられるようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)
