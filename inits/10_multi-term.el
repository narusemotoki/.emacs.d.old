;------------------------------------------------------------------------------
; shell
;------------------------------------------------------------------------------
(require 'multi-term)
(setq multi-term-program "/usr/bin/zsh")

(global-set-key (kbd "C-c C-t") 'multi-term)

; byobuのためにC-z C-zでC-zを送る
(defun term-send-c-z ()
  (interactive)
  (term-send-raw-string "\C-z"))

; multi-termでは行末のスペースを強調しない
; yasnipetを無効にする
(add-hook
  'term-mode-hook
  '(lambda()
     (setq show-trailing-whitespace nil)
     (setq yas-minor-mode nil)
     ; elscreend以外でもC-zを使えるようにする
     (define-key term-raw-map "\C-z" (lookup-key (current-global-map) "\C-z"))
     (define-key term-raw-map (kbd "C-z C-z") 'term-send-c-z)
     (define-key term-raw-map (kbd "C-\\") 'other-window)
     (define-key term-raw-map (kbd "C-y") 'term-paste)
     (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
     (define-key term-raw-map (kbd "M-d") 'term-send-forward-kill-word)
     (define-key term-raw-map (kbd "M-<backspace>") 'term-send-backward-kill-word)
     (define-key term-raw-map (kbd "M-DEL") 'term-send-backward-kill-word)
     (define-key term-raw-map (kbd "ESC ESC") 'term-send-raw)
     )
  )

; global-linum-modeを特定のmodeでのみ無効にする
; http://stackoverflow.com/questions/3875213/turning-on-linum-mode-when-in-python-c-mode
(setq linum-mode-inhibit-modes-list '(eshell-mode
                                      shell-mode
                                      erc-mode
                                      jabber-roster-mode
                                      jabber-chat-mode
                                      gnus-group-mode
                                      gnus-summary-mode
                                      gnus-article-mode
                                      term-mode
                                      twittering-mode))

(defadvice linum-on (around linum-on-inhibit-for-modes)
  "Stop the load of linum-mode for some major modes."
    (unless (member major-mode linum-mode-inhibit-modes-list)
      ad-do-it))

(ad-activate 'linum-on)

; 白抜きになってしまう対策Xを使っているときは透明にしている
(cond ((equal window-system 'x)
  (progn
    (custom-set-variables
    '(term-default-bg-color "#00000000")
    '(term-default-fg-color "#00000000")
    )
  )
))

;http://sleepboy-zzz.blogspot.jp/2012/12/multi-termhelmshell-history.html
(eval-when-compile (require 'cl))

(setq multi-term-program shell-file-name)

(custom-set-faces
 '(term-color-blue ((t (:background "dodger blue" :foreground "dodger blue")))))
(lexical-let
    ((emacs24.3
      [term term-color-black
            term-color-red
            term-color-green
            term-color-yellow
            term-color-blue
            term-color-magenta
            term-color-cyan
            term-color-white])
     (old-emacs
      [unspecified
       "black" "red3" "green3" "yellow3"
       "DeepSkyBlue" ; directory
       "magenta1" "cyan3" "white"]))
  (setq ansi-term-color-vector
        (if (version< "24.3" emacs-version)
            emacs24.3
          old-emacs)))

(add-hook 'term-mode-hook
          '(lambda ()
             (define-key term-raw-map (kbd "C-h") 'term-send-backspace)
             (define-key term-raw-map (kbd "C-y") 'term-paste)
             ))
