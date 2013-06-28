;------------------------------------------------------------------------------
; 見た目の設定
;------------------------------------------------------------------------------
; Theme
; http://d.hatena.ne.jp/syohex/20121211/1355231365
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'molokai t)
(enable-theme 'molokai)

; 透過
(add-to-list 'default-frame-alist '(alpha . 90))
