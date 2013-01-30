;;; A lot of this preamble is taken from Steve Yegge's "Effective Emacs,"
;;; Since you have to start somewhere. I also like to minimize the use of
;;; the Meta key...


;; Proper Meta key support
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Kill UI bits
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

; Line numbers
(add-to-list 'load-path "~/.emacs-extensions/linum")
(require 'linum+)
(global-linum-mode 1)
(setq linum-format "%d| ")

; Backup files are a pain
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))


;; Set Recentf-mode
(recentf-mode 1)
(global-set-key "\C-x\C-r" 'recentf-open-files) ; was file-find-read-only

; Ruby settings
(setq ruby-indent-level 4)


; Delete trailing whitespace. Note that the emacs magic of taking spaces
; and making them tabs happens here... should probably disable it, see
; how 'whitespace-cleanup' uses the 'whitespace-style' variable, maybe change...
(add-hook 'before-save-hook 'whitespace-cleanup)

(setq-default indent-tabs-mode nil)
(add-hook 'write-file-hooks (lambda () (if (not indent-tabs-mode)
                                           (untabify (point-min) (point-max)))))

(column-number-mode)