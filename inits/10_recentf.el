;------------------------------------------------------------------------------
; 開いたファイルの履歴を保存する
;------------------------------------------------------------------------------
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 10000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-save-timer
        (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))
