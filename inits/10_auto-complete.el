;------------------------------------------------------------------------------
; 補完
;------------------------------------------------------------------------------
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)
(setq ac-ignore-case 'smart)

; 常にYASnippetを補完候補に
(add-to-list 'ac-sources 'ac-source-yasnippet)

; C-n/C-pで候補選択可能
(setq ac-use-menu-map t)

; 自動起動させる
(setq ac-auto-start t)

(setq ac-auto-show-menu t)

;------------------------------------------------------------------------------
; 英単語の補完
; http://d.hatena.ne.jp/kitokitoki/20101205/p2
;------------------------------------------------------------------------------
(defun my-ac-look ()
  "look コマンドの出力をリストで返す"
  (interactive)
  (unless (executable-find "look")
    (error "look コマンドがありません"))
  (let ((search-word (thing-at-point 'word)))
    (with-temp-buffer
      (call-process-shell-command "look" nil t 0 search-word)
      (split-string-and-unquote (buffer-string) "\n"))))

(defun ac-complete-look ()
  (interactive)
  (let ((ac-menu-height 50)
        (ac-candidate-limit t))
  (auto-complete '(ac-source-look))))

; 表示数制限を変更しない
; 制限する場合はここをコメントアウトする
(defun ac-complete-look ()
  (interactive)
  (auto-complete '(ac-source-look)))

; 2文字以上ある場合にのみ対応させる
(defvar ac-source-look
  '((candidates . my-ac-look)
    (requires . 2)))

; 候補の表示方法
; 自動(重い
;(push 'ac-source-look ac-sources)
; 任意のタイミングで起動
(global-set-key (kbd "M-h") 'ac-complete-look)

; 部分一致の補完機能を使う
; p-bでprint-bufferとか
(partial-completion-mode t)
