;;设置界面的风格
(tool-bar-mode nil)
(setq frame-title-format "Welcome to Emacs world! ")
;;(menu-bar-mode nil)
(global-font-lock-mode t)
;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
(setq default-major-mode 'text-mode)
;;设置背景色和字体色
(set-foreground-color "grey")
(set-background-color "black")
;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))
;; 设置字体
;; 方法为: emacs->options->Set Default Font->"M-x describe-font"查看当前使用的字体名称、字体大小
(set-default-font "-outline-微软雅黑-normal-normal-normal-sans-13-*-*-*-p-*-iso8859-1")
;; 设置缩进
(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)
(setq tab-stop-list ())
;;(loop for x downfrom 40 to 1 do
;;  (setq tab-stop-list (cons (* x 4) tab-stop-list)))
;; 实现全屏效果，快捷键为f11
(global-set-key [f11] 'my-fullscreen)
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
    nil 0 nil "_NET_WM_STATE" 32
    '(2 "_NET_WM_STATE_FULLSCREEN" 0))
  )
;; 默认显示 80列就换行
(setq default-fill-column 80)
;; 去掉工具栏
(tool-bar-mode nil)

;;去掉菜单栏
;;(menu-bar-mode nil)

;; 去掉滚动栏
(scroll-bar-mode nil)
;; 启动窗口大小
(setq default-frame-alist
    '((height . 35) (width . 125) (menu-bar-lines . 20) (tool-bar-lines . 0)))

;; 在标题栏提示你目前在什么位置
(setq frame-title-format "ant@zhouqz")
 ;; 高亮显示要拷贝的区域
 (setq-default cursor-type 'bar)
;;不产生备份文件
(setq make-backup-files nil)
;;关闭启动画面
(setq inhibit-startup-message t)
;真正shell－mode乱码解决。
(ansi-color-for-comint-mode-on)
;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(setq mouse-avoidance-mode 'animate)

;; 填入大中小括号，双单引号的匹配
;; 详细格式可以参照C-h f skeleton-pair-alist
(setq skeleton-pair-alist
      '((?\" _ "\"" >)
        (?\' _ "\'" >)
        (?\( _ ")" >)
        (?\[ _ "]" >)
        (?\{ _ "}" >)))

(setq skeleton-pair t)

(mapcar
 (function (lambda (setting)
         (setq auto-mode-alist
           (cons setting auto-mode-alist))))
 '(("\\.xml$" .  sgml-mode)
   ("\\.org\\'" . org-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$" .  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.py$" . python-mode)
   ("\\.rkt$" . scheme-mode)
   ("\\.idl$" . idl-mode)))

(setq explicit-shell-file-name
      "C:/Program Files (x86)/Git/bin/bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

 (setq gnus-select-method '(nntp "news.cn99.com"))
