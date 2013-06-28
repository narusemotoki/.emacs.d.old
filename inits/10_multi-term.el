;------------------------------------------------------------------------------
; shell
;------------------------------------------------------------------------------
(require 'multi-term)
(setq multi-term-program "/usr/bin/zsh")

; multi-termでは行末のスペースを強調しない
(add-hook
  'term-mode-hook
  '(lambda()
    (setq show-trailing-whitespace nil)
  )
)

