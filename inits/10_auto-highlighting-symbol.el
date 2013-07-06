; http://d.hatena.ne.jp/yuheiomori0718/20111222/1324562208
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

; ハイライトするまでの時間
(ahs-set-idle-interval 0.5)

; | キー        | function                | 機能                                                                           |
; |-------------+-------------------------+--------------------------------------------------------------------------------|
; | M-<left>    | ahs-backward            | 前のシンボルへ移動                                                             |
; | M-<right>   | ahs-forward             | 次のシンボルへ移動                                                             |
; | M-s-<left>  | ahs-backward-difinition | ?                                                                              |
; | M-s-<right> | ahs-forward-definition  | ?                                                                              |
; | M--         | ahs-back-to-start       | 最初のカーソル位置のシンボルへ移動                                             |
; | C-x C-'     | ahs-change-range        | ハイライトする範囲を表示しているディスプレイの範囲かバッファ全体かを切り替える |
; | C-x C-a     | ahs-edit-mode           | ハイライトしているシンボルを一括でrenameする                                   |


