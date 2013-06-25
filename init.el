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

; 変換候補を表示する位置
; 入力中のすぐ下に表示はelscreenと相性が悪く、縦に並んでいたのが横に並んでしまい見にくい 
; (setq mozc-candidate-style 'overlay)
; 候補をエコーエリアに表示する
(setq mozc-candidate-style 'echo-area)
; C-oでmozcの有効、無効を切り替える
(global-set-key (kbd "C-o") 'toggle-input-method)

;------------------------------------------------------------------------------
; バックアップファイルを作らない
;------------------------------------------------------------------------------
; .*~
(setq make-backup-files nil)
; .#*
(setq auto-save-default nil)

;------------------------------------------------------------------------------
; elscreen
; Emacs内でGnu Screenのような状態を作る
;------------------------------------------------------------------------------
(require 'elscreen)
(elscreen-start)
