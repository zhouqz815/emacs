
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

  
;;============c-f搜索字符串=====================
(defun my-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.
Typing `my-go-to-char-key' again will move forwad to the next Nth
occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (let ((case-fold-search nil))
    (if (eq n 1)
        (progn                            ; forward
          (search-forward (string char) nil nil n)
          (backward-char)
          (while (equal (read-key)
                        char)
            (forward-char)
            (search-forward (string char) nil nil n)
            (backward-char)))
      (progn                              ; backward
        (search-backward (string char) nil nil )
        (while (equal (read-key)
                      char)
          (search-backward (string char) nil nil )))))
  (setq unread-command-events (list last-input-event)))
(global-set-key (kbd "C-f") 'my-go-to-char)

;;============高亮括号=======================
(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
                    (if autopair-handle-action-fns
                        autopair-handle-action-fns
                      '(autopair-default-handle-action))
                    '((lambda (action pair pos-before)
                        (hl-paren-color-update)))))))

(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

