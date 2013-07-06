;------------------------------------------------------------------------------
; 自作の小さな機能集
;------------------------------------------------------------------------------
; *olion*というバッファを作り、引数の内容を流し込む
(defun upsert-olion-buffer (text)
  (with-output-to-temp-buffer "*olion*"
    (set-buffer "*olion*")
    (insert text)))

; カーソル下のURLの内容を*olion*へ
(defun http-get ()
  (interactive)
  (upsert-olion-buffer
    (shell-command-to-string
      (format "python -c \"import sys, urllib;print(urllib.urlopen('%s').read())\""
              (thing-at-point 'url)))))

; 通知を出す
; sudo apt-get install python-notify2
(defun olion-notice (title message)
  (shell-command
   (format "python -c \"import pynotify;pynotify.init('emacs-olion-notice');pynotify.Notification('%s', '%s', 'dialog-information').show()\"" title message))
)

(defun notice ()
  (interactive)
  (olion-notice "a" "b")
)
