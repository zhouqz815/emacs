;; should be loaded after yasnippet
(require-package 'fuzzy)
(require-package 'popup)
(require-package 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories
             (expand-file-name "~/.emacs.d/init/custom-dicts" user-emacs-directory))
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/elpa/auto-complete-20150615.34/dict")
(ac-config-default)
;; if TAB is pressed, first indent current line, then try to complete
(setq tab-always-indent 'complete)

;; prevent auto-complete from automatically expanding
(setq-default ac-expand-on-auto-complete nil)
(setq-default ac-auto-start nil)
;; use TAB to explicitily trigger the auto-complete func
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
(ac-set-trigger-key "<C-return>")
;; (setq-default ac-dwim nil)
; (define-key ac-complete-mode-map (kbd "<C-return>") 'ac-complete)
; (define-key ac-complete-mode-map (kbd "M-j") 'ac-complete)
(define-key ac-completing-map (kbd "C-n") 'ac-next)
(define-key ac-completing-map (kbd "C-p") 'ac-previous)
;; 不让回车的时候执行`ac-complete', 因为当你输入完一个
;; 单词的时候, 很有可能补全菜单还在, 这时候你要回车的话,
;; 必须要干掉补全菜单, 很麻烦, 用M-j来执行`ac-complete'
; (define-key
;   ac-complete-mode-map
;   (("<return>"   'nil)
;     ("RET"        'nil)
;     ("M-j"        'ac-complete)
;     ("<C-return>" 'ac-complete)
;     ("c-n"        'ac-next)
;     ("c-p"        'ac-previous)))
;; use pos-tip instead of popup
(require-package 'pos-tip)
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)
;; use quick-help to show the documents
;; (setq ac-use-quick-help t)
;; (setq ac-quick-help-delay 1.0)

;; use fuzzy matching. needs manually triggering.
(setq ac-fuzzy-enable t)

(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
; (eval-after-load 'init-yasnippet
(set-default 'ac-sources
             '(ac-source-dictionary
                ac-source-words-in-buffer
                ac-source-words-in-same-mode-buffers
                ac-source-words-in-all-buffer
                ac-source-functions
                ac-source-yasnippet))

;; add custom sources
(require 'init-ac-source)

(provide 'init-auto-complete)
