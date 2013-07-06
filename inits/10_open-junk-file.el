(require 'open-junk-file)
(setq open-junk-file-format "~/tmp/junk/%Y%m%d%H%M%S")

(global-set-key (kbd "C-c j") 'open-junk-file)
