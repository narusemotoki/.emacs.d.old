;------------------------------------------------------------------------------
; whitespaceの可視化
;------------------------------------------------------------------------------
; http://d.hatena.ne.jp/syohex/20110119/1295450495
(require 'whitespace)
; タブと全角スペースを可視化
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ; WARNING: the mapping below has a problem.
        ; When a TAB occupies exactly one column, it will display the
        ; character ?\xBB at that column followed by a TAB which goes to
        ; the next TAB column.
        ; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\xBB ?\t] [?\\ ?\t])))
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-foreground 'whitespace-tab "#adff2f")
(set-face-background 'whitespace-tab 'nil)
(set-face-underline  'whitespace-tab t)
(set-face-foreground 'whitespace-space "#7cfc00")
(set-face-background 'whitespace-space 'nil)
(set-face-bold-p 'whitespace-space t)
(global-whitespace-mode 1)
(global-set-key (kbd "C-x w") 'global-whitespace-mode)
