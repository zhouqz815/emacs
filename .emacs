;;设置一些环境
(setenv "HOME" "d:/emacs/ant/")
(setenv "PATH" "d:/emacs/ant/")
;;set the default file path
(setq default-directory "~/")
;;这里是设置默认的el文件的地方，也可以改成其它地方
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/init")
(add-to-list 'load-path "~/.emacs.d/addon")
(load "init-elpa")
(load "init-base")
(load "init-key")
(load "init-addon")
;;(load "init-org")
;;把窗口分为两份
(add-hook 'after-init-hook 'split-window-horizontally)
