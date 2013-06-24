;------------------------------------------------------------------------------
; base
;------------------------------------------------------------------------------
(prefer-coding-system 'utf-8)
(set-language-environment "Japanese")

(global-set-key "\C-h" 'delete-backward-char)

;------------------------------------------------------------------------------
; elpaのリポジトリ追加
;------------------------------------------------------------------------------
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;------------------------------------------------------------------------------
; Mozc
;------------------------------------------------------------------------------
(require 'mozc)
(setq default-input-method "japanese-mozc")

; 
(setq mozc-candidate-style 'overlay)

; 
(global-set-key (kbd "C-o") 'toggle-input-method)

(setq mozc-color "blue")

(defun mozc-change-cursor-color ()
  (if mozc-mode
      (set-buffer-local-cursor-color mozc-color)
    (set-buffer-local-cursor-color nil)))

(add-hook 'input-method-activate-hook
          (lambda () (mozc-change-cursor-color)))

(if (featurep 'key-chord)
    (defadvice toggle-input-method (after my-toggle-input-method activate)
      (mozc-change-cursor-color)))


;------------------------------------------------------------------------------
; バックアップファイルを作らない
;------------------------------------------------------------------------------
; .*~
(setq make-backup-files nil)
; .#*
(setq auto-save-default nil)
