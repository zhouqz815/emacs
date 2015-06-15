;;系统插件的一些配置
;;----------------color-theme插件设置
;;
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-matrix)
(color-theme-dark-blue2)
;;; This was installed by package-install.el.
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                      ;;   ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
;;--------------------插件tabbar设置---------------------
(require 'tabbar)
(tabbar-mode 1)
(global-set-key [(meta j)] 'tabbar-backward)
(global-set-key [(meta k)] 'tabbar-forward)


(autoload 'markdown-mode "markdown-mode"
    "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
