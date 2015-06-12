;;设置一些环境
(setenv "HOME" "d:/Program Files/emacs-22.3/ant/")
(setenv "PATH" "d:/Program Files/emacs-22.3/ant/")
;;set the default file path
(setq default-directory "~/")
;;这里是设置默认的el文件的地方，也可以改成其它地方
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/init")

(load "init-base")
(load "init-key")
(load "init-chajian")