
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
;;---------Emacs shell mode 下自动更改buffer name 用于显示当前路径名称
(make-variable-buffer-local 'wcy-shell-mode-directory-changed)
(setq wcy-shell-mode-directory-changed t)

(defun wcy-shell-mode-auto-rename-buffer-output-filter (text)
  (if (and (eq major-mode 'shell-mode)
           wcy-shell-mode-directory-changed)
      (progn
        (let ((bn  (concat "sh:" default-directory)))
          (if (not (string= (buffer-name) bn))
              (rename-buffer bn t)))
        (setq wcy-shell-mode-directory-changed nil))))


(defun wcy-shell-mode-auto-rename-buffer-input-filter (text)
  (if (eq major-mode 'shell-mode)
      (if ( string-match "^[ \t]*cd *" text)
          (setq wcy-shell-mode-directory-changed t))))
(add-hook 'comint-output-filter-functions 'wcy-shell-mode-auto-rename-buffer-output-filter)
(add-hook 'comint-input-filter-functions 'wcy-shell-mode-auto-rename-buffer-input-filter )