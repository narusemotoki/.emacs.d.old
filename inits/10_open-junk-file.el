(require 'open-junk-file)
(setq open-junk-file-format "~/Documents/junk/%Y%m%d%H%M%S.txt")

(global-set-key (kbd "C-c j") 'open-junk-file)
