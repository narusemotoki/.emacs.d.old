; rebase-modeに自動で入らないようにする
;(setq auto-mode-alist (delete '("git-rebase-todo" . rebase-mode)
;                              auto-mode-alist))

(global-set-key "\C-xg" 'magit-status)
