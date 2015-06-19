;;设置一些环境
(setenv "HOME" "d:/emacs/ant/")
(setenv "PATH" "d:/emacs/ant/;C:/cygwin64/bin;C:\Program Files (x86)\Git\bin")
(setenv "ALTERNATE_EDITOR" "runemacs.exe")
(setenv "EMACS_SERVER_FILE" "~/.emacs.d/server")
;;set the default file path
(setq default-directory "~/")
;;这里是设置默认的el文件的地方，也可以改成其它地方
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/init")
(add-to-list 'load-path "~/.emacs.d/addon")
(load "init-elpa")
(load "init-base")
(load "init-key")
;;如果是初次加载，会下载elpa包，会比较慢，需要一个个地加载
(load "init-themes")
(load "init-addon")
(load "init-tabbar")
(load "init-markdown")
(load "init-smex")
(load "init-yasnippet")
(load "init-auto-complete")
(load "init-evil")
(load "init-hydra")
;;(load "init-org")
;;把窗口分为两份
;;(add-hook 'after-init-hook 'split-window-horizontally)

;;(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
