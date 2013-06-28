;------------------------------------------------------------------------------
; カーソルのある桁をハイライトする
;------------------------------------------------------------------------------
(require 'col-highlight)

; 常にハイライトする
; (column-highlight-mode 1)

; 3秒間入力がないとハイライトする
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 3)

; 色を変更
(custom-set-faces
 '(col-highlight ((t (:background "#000000")))))
