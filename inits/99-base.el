;------------------------------------------------------------------------------
; 文字コードの設定が拡張によって上書きされるので、最後にもう一度UTF-8指定
;------------------------------------------------------------------------------
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
