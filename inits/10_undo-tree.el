; http://qiita.com/takc923/items/c3d64b55fc4f3a3b0838
; http://www11.atwiki.jp/s-irie/pages/18.html
; やり直し
(require 'undo-tree)
(global-undo-tree-mode t)

(global-set-key (kbd "C-+") 'undo-tree-redo)
(global-set-key (kbd "C-_") 'undo-tree-undo)

; 過去のundoがredoされないようにする
(setq undo-no-redo t)

; 大量のundoに耐えられるようにする
(setq undo-limit 600000)
(setq undo-strong-limit 900000)
