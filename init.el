;------------------------------------------------------------------------------
; base
;------------------------------------------------------------------------------
(prefer-coding-system 'utf-8)
(set-language-environment "Japanese")

(global-set-key "\C-h" 'delete-backward-char)

;------------------------------------------------------------------------------
; elisp以下にパスを通す
; http://d.hatena.ne.jp/sandai/20120304/p2
;------------------------------------------------------------------------------
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

; 複数指定する場合 => (add-to-load-path "elisp" "xxx" "xxx")
(add-to-load-path "elisp")

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

(require 'elscreen)
(elscreen-start)
