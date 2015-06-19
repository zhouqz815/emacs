;;系统插件的一些配置
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
