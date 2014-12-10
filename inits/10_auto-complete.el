;------------------------------------------------------------------------------
; 補完
;------------------------------------------------------------------------------
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)
(setq ac-ignore-case 'smart)

; 常にYASnippetを補完候補に
(add-to-list 'ac-sources 'ac-source-yasnippet)

; C-n/C-pで候補選択可能
(setq ac-use-menu-map t)

; 自動起動させる
(setq ac-auto-start t)

(setq ac-auto-show-menu t)
