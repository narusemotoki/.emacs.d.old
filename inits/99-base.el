;------------------------------------------------------------------------------
; 文字コードの設定が拡張によって上書きされるので、最後にもう一度UTF-8指定
;------------------------------------------------------------------------------
(prefer-coding-system 'utf-8)
(setq default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

; なぜか無効化されるので最後にもう一度有効化
(global-anzu-mode t)
