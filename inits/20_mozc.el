(require 'mozc)
(setq default-input-method "japanese-mozc")

; 変換候補を表示する位置
; 入力中のすぐ下に表示はelscreenと相性が悪いかもしれない
; elscreenとの起動順で解決するかも
; 候補が横に並んでしまい見にくい場合、これを有効にして候補をエコーエリアに表示
(setq mozc-candidate-style 'echo-area)

; C-oでmozcの有効、無効を切り替える
(global-set-key (kbd "C-o") 'toggle-input-method)

; auto-completeとの連携
; https://github.com/igjit/ac-mozc
(require 'ac-mozc)
(define-key ac-mode-map (kbd "M-o") 'ac-mozc-complete)
