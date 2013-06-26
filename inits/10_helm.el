(require 'helm-config)
(helm-mode 1)

; buffer��recentf��ɽ������
(global-set-key (kbd "C-c h") 'helm-mini)
; buffer���ڤ��ؤ���
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
; �ե�����������ɽ������
(global-set-key (kbd "C-x C-r") 'helm-recentf)
; kill-ring�����ɽ������
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

; TAB�򲡤��ȸ��ߥ������뤬�����Τˤʤ�
(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

; C-h�ǥХå����ڡ�����Ʊ���褦��ʸ������
(eval-after-load 'helm
  '(progn
     (define-key helm-map (kbd "C-h") 'delete-backward-char)))
(eval-after-load 'helm-files
  '(progn
     (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)))
