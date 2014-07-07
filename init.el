;------------------------------------------------------------------------------
; elpaとelisp以下にパスを通す
; http://d.hatena.ne.jp/sandai/20120304/p2
;------------------------------------------------------------------------------
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

(add-to-load-path "elpa" "elisp")

;------------------------------------------------------------------------------
; init-loaderの設定
; initファイルを複数に分割する
;------------------------------------------------------------------------------
(require 'init-loader)
(setq init-loader-show-log-after-init `error-only)
(init-loader-load "~/.emacs.d/inits")
