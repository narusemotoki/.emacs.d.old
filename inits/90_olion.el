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
