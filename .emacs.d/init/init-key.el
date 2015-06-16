(global-set-key (kbd "C-,") 'set-mark-command)
;; 回车缩进
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key (kbd "C-<return>") 'newline)
;;用鼠标快速 copy ,cut , paste
(require 'mouse-copy)
(global-set-key [M-down-mouse-1] 'mouse-drag-secondary-pasting)
(global-set-key [M-S-down-mouse-1] 'mouse-drag-secondary-moving)
