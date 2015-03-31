;------------------------------------------------------------------------------
; 自動保存
;------------------------------------------------------------------------------
(require 'auto-save-buffers-enhanced)
; ここで指定した秒数の間入力がないと自動保存する
(setq auto-save-buffers-enhanced-interval 30)
(auto-save-buffers-enhanced t)
