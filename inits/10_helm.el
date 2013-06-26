(require 'helm-config)
(helm-mode 1)

; bufferやrecentfを表示する
(global-set-key (kbd "C-c h") 'helm-mini)
; bufferを切り替える
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
; ファイルの履歴を表示する
(global-set-key (kbd "C-x C-r") 'helm-recentf)
; kill-ringを一覧表示する
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

; TABを押すと現在カーソルがあるものになる
(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

; 自動補完を無効
; パスが勝手に補完されて不便なことがあるし、どうせTABで自分で補完するので無効化
(custom-set-variables '(helm-ff-auto-update-initial-value nil))

; C-hでバックスペースと同じように文字を削除
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))
(eval-after-load 'helm-files
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))

;------------------------------------------------------------------------------
; auto-completeの候補をhelmで絞り込む
;------------------------------------------------------------------------------
(require 'ac-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)
