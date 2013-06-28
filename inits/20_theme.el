(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'molokai t)
(enable-theme 'molokai)

; 元罪業の
; http://www.happytrap.jp/blogs/2011/08/29/5877/
(defface hlline-face
  '((((class color)
      (background dark))
;     (:background "#CC0066"))
     (:background "#000000"))
    (((class color)
      (background light))
     (:background "#CC0066"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
