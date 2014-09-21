;;; moz-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (inferior-moz-mode moz-minor-mode) "moz" "moz.el"
;;;;;;  (21531 40989 384423 845000))
;;; Generated autoloads from moz.el

(autoload 'moz-minor-mode "moz" "\
MozRepl minor mode for interaction with Firefox.
With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

When this minor mode is enabled, some commands become available
to send current code area (as understood by c-mark-function) or
region or buffer to an inferior MozRepl process (which will be
started as needed).

The following keys are bound in this minor mode:

\\{moz-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'inferior-moz-mode "moz" "\
Major mode for interacting with Firefox via MozRepl.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("moz-pkg.el") (21531 40989 427365 108000))

;;;***

(provide 'moz-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; moz-autoloads.el ends here
