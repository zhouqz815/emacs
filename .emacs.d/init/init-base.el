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
;; 设置字体
;; 方法为: emacs->options->Set Default Font->"M-x describe-font"查看当前使用的字体名称、字体大小
;;(set-default-font " -bitstream-Courier 10 Pitch-normal-normal-normal-*-19-*-*-*-m-0-iso10646-1")
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
