;;系统插件的一些配置
;;----------------color-theme插件设置
(require-package 'color-theme)
(color-theme-initialize)
;;(color-theme-matrix)
(color-theme-dark-blue2)
;;--------------------插件tabbar设置---------------------
(require-package 'tabbar)
(tabbar-mode 1)
(global-set-key [(meta j)] 'tabbar-backward)
(global-set-key [(meta k)] 'tabbar-forward)
(require-package 'markdown-mode)
;;(autoload 'markdown-mode "markdown-mode"
  ;;  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;---------------org-mode----------------------
(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
     (let ((src-code-types
      '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
        "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
        "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
        "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
        "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))
(add-hook 'org-mode-hook '(lambda ()
                            ;; turn on flyspell-mode by default
                            (flyspell-mode 1)
                            ;; C-TAB for expanding
                            (local-set-key (kbd "C-<tab>")
                             'yas/expand-from-trigger-key)
                            ;; keybinding for editing source code blocks
                            (local-set-key (kbd "C-c s e")
                             'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-c s i")
                             'org-insert-src-block)
                            ))
(setq org-src-fontify-natively t)
(setq org-todo-keywords
  '((sequence "TODO" "DOING" "HANGUP" "|" "DONE" "CANCEL")))
;;------------------------skeleton-------------------------
(define-skeleton latex-skeleton
  "Inserts a Latex letter skeleton into current buffer.
  This only makes sense for empty buffers."
  "Empfänger: "
  "\\documentclass[a4paper]{letter}\n"
  "\\usepackage{german}\n"
  "\\usepackage[latin1]{inputenc}\n"
  "\\name{A. Schröder}\n"
  "\\address{Alexander Schröder \\\\ Langstrasse 104 \\\\ 8004 Zürich}\n"
  "\\begin{document}\n"
  "\\begin{letter}{" str | " *** Empfänger *** " "}\n"
  "\\opening{" _ "}\n\n"
  "\\closing{Mit freundlichen Grüssen,}\n"
  "\\end{letter}\n"
  "\\end{document}\n")
(global-set-key "\C-cl" 'latex-skeleton)
