;--------------------------------------------------------------------------------
; モードラインを綺麗にする
;--------------------------------------------------------------------------------
(defpowerline powerline-vc-short
  (when (and (buffer-file-name (current-buffer))
             vc-mode)
    (setq branch (format-mode-line '(vc-mode vc-mode)))
    (setq len (min (length branch) 30))
    (substring branch 0 len)))

(defface powerline-active1-color '((t (:background "#0044CC" :inherit mode-line)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-active2-color '((t (:background "#0066CC" :inherit mode-line)))
  "Powerline face 2."
  :group 'powerline)

(defface powerline-active3-color '((t (:background "#0088CC" :inherit mode-line)))
  "Powerline face 3."
  :group 'powerline)

(defface powerline-inactive1-color  '((t (:background "grey10" :inherit mode-line-inactive)))
  "Powerline face 1."
  :group 'powerline)

(defface powerline-inactive2-color  '((t (:background "grey20" :inherit mode-line-inactive)))
  "Powerline face 2."
  :group 'powerline)

(defface powerline-inactive3-color  '((t (:background "grey30" :inherit mode-line-inactive)))
  "Powerline face 3."
  :group 'powerline)

(cond ((equal window-system 'x)
  (progn
(setq-default mode-line-format
              '("%e"
                (:eval
                 (let* ((active (powerline-selected-window-active))
                        (mode-line (if active 'mode-line 'mode-line-inactive))
                        (face1 (if active 'powerline-active1-color 'powerline-inactive1-color))
                        (face2 (if active 'powerline-active2-color 'powerline-inactive2-color))
                        (face3 (if active 'powerline-active3-color 'powerline-inactive3-color))
                        (separator-left (intern (format "powerline-%s-%s"
                                                        powerline-default-separator
                                                        (car powerline-default-separator-dir))))
                        (separator-right (intern (format "powerline-%s-%s"
                                                         powerline-default-separator
                                                         (cdr powerline-default-separator-dir))))
                        (lhs (list (powerline-raw "%*" face1 'l)
                                   (powerline-raw mode-line-mule-info face1 'l)
                                   (powerline-buffer-id face1 'l)
                                   (when (and (boundp 'which-func-mode) which-func-mode)
                                     (powerline-raw which-func-format face1 'l))
                                   (powerline-raw " " face1)
                                   (funcall separator-left face1 face2)
                                   (when (boundp 'erc-modified-channels-object)
                                     (powerline-raw erc-modified-channels-object face2 'l))
                                   (powerline-major-mode face2 'l)
                                   (powerline-process face2)
                                   (powerline-narrow face2 'l)
                                   (powerline-raw " " face2)
                                   (funcall separator-left face2 face3)
                                   (powerline-vc-short face3 'r)))
                        (rhs (list (powerline-raw global-mode-string face2 'r)
                                   (funcall separator-right face3 face2)
                                   (powerline-minor-modes face2 'l)
                                   (powerline-raw " " face2)
                                   (funcall separator-right face2 face1)
                                   (powerline-raw "%2l" face1 'l)
                                   (powerline-raw ":" face1 'l)
                                   (powerline-raw "%3c" face1 'r)
                                   (powerline-raw "%7p" face1 'r)
                                   (powerline-hud face1 face3))))
                   (concat (powerline-render lhs)
                           (powerline-fill face3 (powerline-width rhs))
                           (powerline-render rhs))))))
)))
