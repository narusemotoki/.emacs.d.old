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

; 現在行を目立たせる
(global-hl-line-mode)

; 現在行の色
; http://www.happytrap.jp/blogs/2011/08/29/5877/
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "#333333"))
    (((class color)
      (background light))
     (:background "#CC0066"))
   (t
     ()))
  "*Face used by hl-line.");
(setq hl-line-face 'hlline-face)

; カーソルの色を変更する
(set-cursor-color "#CC0066")

; リージョンの色
(set-face-background 'region "navy")
