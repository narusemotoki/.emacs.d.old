;------------------------------------------------------------------------------
; 基本的な設定
;------------------------------------------------------------------------------
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-coding-systems 'utf-8)
(setq file-name-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

; *GNU Emacs*バッファを作らない
(setq inhibit-startup-screen t)

; 画像ファイルを表示
(auto-image-file-mode t)

; メニューバーを非表示にする
(menu-bar-mode -1)

; ツールバーを非表示にする
(tool-bar-mode -1)

; スクロールバーを非表示にする
(toggle-scroll-bar nil)

; 対応する括弧を光らせる。
(show-paren-mode 1)

; ウィンドウ内に収まらないときだけ括弧内も光らせる。
(setq show-paren-style 'mixed)

; カーソルの位置が何文字目かを表示する
(column-number-mode t)

; カーソルの位置が何行目かを表示する
(line-number-mode t)

; カーソルの場所を保存する
(require 'saveplace)
(setq-default save-place t)

; 行の先頭でC-kを一回押すだけで行全体を消去する
;(setq kill-whole-line t)

; インデントにスペースを使う
(setq-default indent-tabs-mode nil)

; 前の行と同じインデント
(setq indent-line-function 'indent-relative-maybe)

; 行番号の表示
(global-linum-mode t)

; linum-modeを軽くする
; http://qiita.com/takc923/items/acebbdae04994de16c6d
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.1 nil #'linum-update-current))

; yes or noをy or nにする
(fset 'yes-or-no-p 'y-or-n-p)

; 行末の空白を表示
(setq-default show-trailing-whitespace t)

; シンボリックリンクはその先のファイルを開く
(setq vc-follow-symlinks t)

; バッファにあるファイルが変更された場合，自動でバッファに読み直す
(global-auto-revert-mode 1)

; Shift + 矢印でウィンドウを移動する
(setq windmove-wrap-around t)
(windmove-default-keybindings)

; Emacsの終了確認をする
(setq confirm-kill-emacs 'y-or-n-p)

;------------------------------------------------------------------------------
; キーバインドの変更
;------------------------------------------------------------------------------
(global-set-key "\C-h" 'delete-backward-char)

; Emacs外のiBusでC-\を使いたいので切る
(global-set-key (kbd "C-\\") nil)

;------------------------------------------------------------------------------
; バックアップファイルを作らない
;------------------------------------------------------------------------------
; .*~
(setq make-backup-files nil)
; .#*
(setq auto-save-default nil)

; 保存しようとしたファイルのディレクトリがなければ作成する
; http://stackoverflow.com/questions/6830671/how-to-make-emacs-create-intermediate-dirs-when-saving-a-file
(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))
