;; sample setting
;(load "TypeScript")
;(add-to-list 'auto-mode-alist '("\\.ts" . typescript-mode))
;
;(require 'typescript-tss)
;(require 'auto-complete-ts)
;(defun my-ac-ts-mode-setup ()
;  (local-set-key "\C-c\C-t" 'typescript-tss-show-type)
;  (local-set-key "\C-c\C-d" 'typescript-tss-goto-definition)
;  (setq ac-sources (append '(ac-source-ts ac-source-yasnippet) ac-sources)))
;(add-hook 'typescript-mode-hook 'my-ac-ts-mode-setup)
;(setq ac-ts-auto-save nil)
;(add-to-list 'ac-modes 'typescript-mode)
;
;(load "flymake-typescript")

;; If use bundled typescript.el,
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(require 'tss)

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)

;(defun my-tss-config ()
;  "Do setting recommemded configuration."
;  ;; Activate auto-complete and setup TSS automatically when open tss-enable-modes buffer.
;  (loop for mode in tss-enable-modes
;        for hook = (intern-soft (concat (symbol-name mode) "-hook"))
;        do (add-to-list 'ac-modes mode)
;        ;if (and hook
;        ;        (symbolp hook))
;        do (add-hook hook 'tss-setup-current-buffer t))
;  ;; Run flymake when save buffer.
;  (add-hook 'after-save-hook 'tss-run-flymake t)
;  ;; Delete tss process of the buffer when kill buffer.
;  (add-hook 'kill-buffer-hook 'tss--delete-process t))
;(my-tss-config)
