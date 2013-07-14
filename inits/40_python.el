; flymake
(require 'flymake-python-pyflakes)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)

; http://qiita.com/yuu116atlab/items/2a62cb880ac863dcc8ef
; 補完
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
; これを入れるとjediを手動<C-tab>で立ち上げないといけない。
; (setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

(add-hook 'python-mode-hook 'highlight-indentation-mode)

(add-hook 'python-mode-hook
    '(lambda ()
        ; インデントを考えてくれる
        (define-key (current-local-map) "\C-h" 'python-backspace)
    ))


; indentation
(defadvice python-calculate-indentation (around outdent-closing-brackets)
  "Handle lines beginning with a closing bracket and indent them so that
  they line up with the line containing the corresponding opening bracket."
(save-excursion
  (beginning-of-line)
  (let ((syntax (syntax-ppss)))
    (if (and (not (eq 'string (syntax-ppss-context syntax)))
             (python-continuation-line-p)
             (cadr syntax)
             (skip-syntax-forward "-")
             (looking-at "\\s)"))
        (progn
          (forward-char 1)
          (ignore-errors (backward-sexp))
          (setq ad-return-value (current-indentation)))
      ad-do-it))))

(ad-activate 'python-calculate-indentation)
