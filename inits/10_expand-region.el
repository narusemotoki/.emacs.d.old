(require 'expand-region)
; リージョンを広げる
(global-set-key (kbd "C-@") 'er/expand-region)
; リージョンを狭める
(global-set-key (kbd "C-M-@") 'er/contract-region)

(transient-mark-mode t)
