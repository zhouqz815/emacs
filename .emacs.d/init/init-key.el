(global-set-key (kbd "C-,") 'set-mark-command)
;;用鼠标快速 copy ,cut , paste
(require 'mouse-copy)
(global-set-key [M-down-mouse-1] 'mouse-drag-secondary-pasting)
(global-set-key [M-S-down-mouse-1] 'mouse-drag-secondary-moving)
;;使用C-k删掉指针到改行末的所有东西
(setq-default kill-whole-line t)
(global-set-key (kbd "C-<left>")  'windmove-left)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<up>")    'windmove-up)
(global-set-key (kbd "C-<down>")  'windmove-down)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key (kbd "M-<down>") 'end-of-buffer)
(global-set-key (kbd "M-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-/") 'comment-region)
(global-set-key (kbd "s-?") 'uncomment-region)
