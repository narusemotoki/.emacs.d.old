(require 'mozc)
(setq default-input-method "japanese-mozc")

; �Ѵ������ɽ���������
; ������Τ�������ɽ����elscreen���������������⤷��ʤ�
; elscreen�Ȥε�ư��ǲ�褹�뤫��
; ���䤬�����¤�Ǥ��ޤ����ˤ�����硢�����ͭ���ˤ��Ƹ���򥨥������ꥢ��ɽ��
; (setq mozc-candidate-styleh 'echo-area)

; C-o��mozc��ͭ����̵�����ڤ��ؤ���
(global-set-key (kbd "C-o") 'toggle-input-method)
