;;系统插件的一些配置
;;--------------------插件tabbar设置---------------------
(require-package 'tabbar)
(tabbar-mode 1)
(global-set-key [(meta h)] 'tabbar-backward)
;(global-set-key [(meta k)] 'tabbar-forward)
(require-package 'markdown-mode)
;;(autoload 'markdown-mode "markdown-mode"
  ;;  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;===============最近打开的文件recentf===================
(require-package 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;==============server=================
(defun is-server-running ()
  "Check is an emacs-server process is already running"
    (file-exists-p "~/.emacs.d/server/server"))
(unless (is-server-running)
  (server-start))
;;============git===================
(require-package 'magit)
;;(require 'magit-autoloads)
(provide 'init-git)
