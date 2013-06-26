;------------------------------------------------------------------------------
; �䴰
;------------------------------------------------------------------------------
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)
(setq ac-ignore-case 'smart)

; ���YASnippet���䴰�����
(add-to-list 'ac-sources 'ac-source-yasnippet)

; C-n/C-p�Ǹ��������ǽ
(setq ac-use-menu-map t)

; ��ư��ư������
(setq ac-auto-start 0)

;------------------------------------------------------------------------------
; ��ñ����䴰
; http://d.hatena.ne.jp/kitokitoki/20101205/p2
;------------------------------------------------------------------------------
(defun my-ac-look ()
  "look ���ޥ�ɤν��Ϥ�ꥹ�Ȥ��֤�"
  (interactive)
  (unless (executable-find "look")
    (error "look ���ޥ�ɤ�����ޤ���"))
  (let ((search-word (thing-at-point 'word)))
    (with-temp-buffer
      (call-process-shell-command "look" nil t 0 search-word)
      (split-string-and-unquote (buffer-string) "\n"))))

(defun ac-complete-look ()
  (interactive)
  (let ((ac-menu-height 50)
        (ac-candidate-limit t))
  (auto-complete '(ac-source-look))))

; ɽ�������¤��ѹ����ʤ�
; ���¤�����Ϥ����򥳥��ȥ����Ȥ���
(defun ac-complete-look ()
  (interactive)
  (auto-complete '(ac-source-look)))

; 2ʸ���ʾ夢����ˤΤ��б�������
(defvar ac-source-look
  '((candidates . my-ac-look)
    (requires . 2)))

; �����ɽ����ˡ
; ��ư(�Ť�
;(push 'ac-source-look ac-sources)
; Ǥ�դΥ����ߥ󥰤ǵ�ư
(global-set-key (kbd "M-h") 'ac-complete-look)
