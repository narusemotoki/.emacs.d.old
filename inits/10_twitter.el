;http://jyukutyo.hatenablog.com/entry/20110405/1302009829
(when (require 'twittering-mode nil t)
  ; アイコンを表示する
  (setq twittering-icon-mode t)
  ; タイムラインを300秒ごとに更新する
  (setq twittering-timer-interval 300)
  ; OAuth, xAuthで取得した認証済みaccess tokenを暗号化して保存する
  (setq twittering-use-master-password t)
)


; multi-termでは行末のスペースを強調しない
; yasnipetを無効にする
; streamingを有効にする
(load "twittering-stream")
(add-hook
  'twittering-mode-hook
  '(lambda()
    (setq show-trailing-whitespace nil)
    (setq yas-minor-mode nil)
    (twittering-stream-mode t)
  )
)








