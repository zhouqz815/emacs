
;;按*向前搜索下一个单词, 按#向后搜索后一个单词.
(defun isearch-cur-word (fun)
  "ISearch current word use function FUN."
  (let ((cur-word (current-word)))
    (if (not cur-word)
        (message "No word under cursor.")
      (call-interactively fun)
      (isearch-yank-string cur-word))))

(defun isearch-forward-cur-word (&optional backward)
  "`isearch-forward' current word."
  (interactive "P")
  (let ((fun (if backward 'isearch-backward 'isearch-forward)))
    (isearch-cur-word fun)))
