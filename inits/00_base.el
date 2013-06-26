;------------------------------------------------------------------------------
; ����Ū������
;------------------------------------------------------------------------------
(prefer-coding-system 'utf-8)
(set-language-environment "Japanese")

; �����ե������ɽ��
(auto-image-file-mode t)

; ��˥塼�С�����ɽ���ˤ���
(menu-bar-mode -1)

; �ġ���С�����ɽ���ˤ���
(tool-bar-mode -1)

; ��������С�����ɽ���ˤ���
(toggle-scroll-bar nil)

; �б������̤���餻�롣
(show-paren-mode 1)

; ������ɥ���˼��ޤ�ʤ��Ȥ�������������餻�롣
(setq show-paren-style 'mixed)

; ���߹Ԥ���Ω������
(global-hl-line-mode)

; ��������ΰ��֤���ʸ���ܤ���ɽ������
(column-number-mode t)

; ��������ΰ��֤������ܤ���ɽ������
(line-number-mode t)

; ��������ξ�����¸����
(require 'saveplace)
(setq-default save-place t)

; �Ԥ���Ƭ��C-k���󲡤������ǹ����Τ�õ��
(setq kill-whole-line t)

; ����ǥ�Ȥ˥��ڡ�����Ȥ�
(setq-default indent-tabs-mode nil)

; ���ιԤ�Ʊ������ǥ��
(setq indent-line-function 'indent-relative-maybe)

; ���ֹ��ɽ��
(global-linum-mode t)

; linum-mode��ڤ�����
; http://qiita.com/takc923/items/acebbdae04994de16c6d
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.1 nil #'linum-update-current))

; yes or no��y or n�ˤ���
(fset 'yes-or-no-p 'y-or-n-p)

; �����ζ����ɽ��
(setq-default show-trailing-whitespace t)

; ����ܥ�å���󥯤Ϥ�����Υե�����򳫤�
(setq vc-follow-symlinks t)

; �Хåե��ˤ���ե����뤬�ѹ����줿��硤��ư�ǥХåե����ɤ�ľ��
(global-auto-revert-mode 1)

; Shift + ����ǥ�����ɥ����ư����
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;------------------------------------------------------------------------------
; �����Х���ɤ��ѹ�
;------------------------------------------------------------------------------
(global-set-key "\C-h" 'delete-backward-char)

; Emacs����iBus��C-\��Ȥ������Τ��ڤ�
(global-set-key (kbd "C-\\") nil)

;------------------------------------------------------------------------------
; �Хå����åץե��������ʤ�
;------------------------------------------------------------------------------
; .*~
(setq make-backup-files nil)
; .#*
(setq auto-save-default nil)
