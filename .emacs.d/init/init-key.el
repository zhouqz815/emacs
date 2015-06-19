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

;;; winner-mode
(winner-mode 1)
(global-set-key (kbd "C-x 4 u") 'winner-undo)
(global-set-key (kbd "C-x 4 r") 'winner-redo)

(defun display-buffer-name ()
  (interactive)
  (message (buffer-file-name (current-buffer))))
(global-set-key (kbd "M-4") 'yic-kill-current-buffer)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'other-window)
(global-set-key (kbd "M-5") 'display-buffer-name)
(global-set-key (kbd "C-x f") 'find-file-at-point)