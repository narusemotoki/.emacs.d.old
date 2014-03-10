;;; free-keys-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (free-keys) "free-keys" "free-keys.el" (21277 2496
;;;;;;  13651 763000))
;;; Generated autoloads from free-keys.el

(autoload 'free-keys "free-keys" "\
Display free keys in current buffer.

A free key is a key that has no associated key-binding as
determined by function `key-binding'.

By default, keys on `free-keys-keys' list with no prefix sequence
are considered, possibly together with modifier keys from
`free-keys-modifiers'.  You can change the prefix sequence by
hitting 'p' in the *Free keys* buffer.  Prefix is supplied in
format recognized by `kbd', for example \"C-x\".

\(fn &optional PREFIX BUFFER)" t nil)

;;;***

;;;### (autoloads nil nil ("free-keys-pkg.el") (21277 2496 55330
;;;;;;  183000))

;;;***

(provide 'free-keys-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; free-keys-autoloads.el ends here
