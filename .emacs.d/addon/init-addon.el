;;系统插件的一些配置
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
;;===============最近打开的文件recentf===================
(require-package 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
