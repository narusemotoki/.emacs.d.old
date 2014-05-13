;http://jyukutyo.hatenablog.com/entry/20110405/1302009829
(when (require 'twittering-mode nil t)
  ; アイコンを表示する
  ;(setq twittering-icon-mode t)
  ; タイムラインを300秒ごとに更新する
  (setq twittering-timer-interval 300)
  ; OAuth, xAuthで取得した認証済みaccess tokenを暗号化して保存する
  (setq twittering-use-master-password t)
)


; multi-termでは行末のスペースを強調しない
; yasnipetを無効にする
; streamingを有効にする
; streaming用のバッファを作る
(add-hook
  'twittering-mode-hook
  '(lambda()
    (setq show-trailing-whitespace nil)
    (setq yas-minor-mode nil)
  )
)

; 自動的に開くタイムライン
; http://www.emacswiki.org/emacs/TwitteringMode-ja#toc26
(setq twittering-initial-timeline-spec-string
      '(
        ":favorites"
        ":replies"
        ":home"
;        ":direct_messages"
;        ":search/emacs/"
;        "user_name/list_name"
))

