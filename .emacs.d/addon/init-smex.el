;;一个M-x的增强插件
(require-package 'smex) ; Not needed if you use package.el
(require-package 'ido-ubiquitous)
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
;(global-set-key ("F1") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;;ido config https://github.com/DarwinAwardWinner/ido-ubiquitous
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
;;Org-mode and magit have their own support for ido
(setq org-completion-use-ido t)
(setq magit-completing-read-function 'magit-ido-completing-read)
