(custom-set-variables
  '(ac-ispell-requires 2)
  '(ac-ispell-fuzzy-limit 4))

(eval-after-load "auto-complete"
  '(progn
      (ac-ispell-setup)))

(add-hook 'auto-complete-mode-hook 'ac-ispell-ac-setup)
