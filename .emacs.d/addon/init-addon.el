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
;;-------------dired mode------------
(add-hook 'dired-mode-hook (lambda ()
                             (interactive)
                             (make-local-variable  'dired-sort-map)
                             (setq dired-sort-map (make-sparse-keymap))
                             (define-key dired-mode-map "s" dired-sort-map)
                             (define-key dired-sort-map "s"
                                         '(lambda () "sort by Size"
                                            (interactive) (dired-sort-other (concat dired-listing-switches "S"))))
                             (define-key dired-sort-map "x"
                                         '(lambda () "sort by eXtension"
                                            (interactive) (dired-sort-other (concat dired-listing-switches "X"))))
                             (define-key dired-sort-map "t"
                                         '(lambda () "sort by Time"
                                            (interactive) (dired-sort-other (concat dired-listing-switches "t"))))
                             (define-key dired-sort-map "n"
                                         '(lambda () "sort by Name"
                                            (interactive) (dired-sort-other (concat dired-listing-switches ""))))))
(defun sof/dired-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))
(add-hook 'dired-after-readin-hook 'sof/dired-sort)
;; C-x C-j open the directory of current buffer
; (global-set-key (kbd "C-x C-j")
;                 (lambda ()
;                   (interactive)
;                   (if (buffer-file-name)
;                     (dired default-directory))))
; (add-hook 'dired-mode-hook (lambda ()
;                              (interactive)
;                              (define-key dired-mode-map (kbd "<M-up>" )
;                                          'dired-up-directory)
;                              (define-key dired-mode-map (kbd "ESC <up>" ) 'dired-up-directory)
;                              (setq dired-omit-extensions '("CVS/" ".o" "~" ".bin" ".lbin"
;                                                            ".fasl" ".ufsl" ".a" ".ln" ".blg"
;                                                            ".bbl" ".elc" ".lof" ".glo" ".idx"
;                                                            ".lot" ".fmt" ".tfm" ".class" ".fas" ".lib" ".x86f"
;                                                            ".sparcf" ".lo" ".la" ".toc" ".log" ".aux" ".cp" ".fn" ".ky" ".pg"
;                                                            ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs"
;                                                            ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns" ".ky"
;                                                            ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs"))
;                              (defvar wcy-dired-mode-hide-column-regex
;                                "^\\s-\\{2\\}[drwx-]\\{10\\}\\s-+[0-9]+\\s-+\\sw+\\s-+\\sw+"
;                                "doc")
