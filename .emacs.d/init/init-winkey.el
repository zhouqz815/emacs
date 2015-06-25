;;(setq w32-pass-apps-to-system nil)
;;绑定了两个新的键，将来可以研究一下，把他们配置好
(setq w32-apps-modifier 'hyper)

(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'hyper)


;; editing
(global-set-key (kbd "H-c") 'kill-ring-save) ;; copy
(global-set-key (kbd "H-x") 'kill-region) ;; cut
(global-set-key (kbd "H-v") 'yank) ;; paste

(global-set-key (kbd "H-a") 'mark-whole-buffer) ;; select all

(if (featurep 'undo-trees)
(progn
(global-set-key (kbd "H-z") 'undo-tree-undo)
(global-set-key (kbd "H-S-z") 'undo-tree-redo)
(global-set-key (kbd "H-y") 'undo-tree-redo))
(progn
(global-set-key (kbd "H-z") 'undo)
(if (featurep 'redo)
(progn
(global-set-key (kbd "H-S-z") 'redo)
(global-set-key (kbd "H-y") 'redo)))))



;; files
;;(global-set-key (kbd "H-n") 'create-empty-buffer) ;;FIXME
(global-set-key (kbd "H-o") 'menu-find-file-existing)
(global-set-key (kbd "H-s") 'save-buffer)
(global-set-key (kbd "H-S-s") 'write-file)

;; search
(global-set-key (kbd "H-f") 'isearch-forward)
(global-set-key (kbd "H-h") 'query-replace)
(global-set-key [H-f3] 'nonincremental-repeat-search-forward)
(global-set-key [C-H-f3] 'nonincremental-repeat-search-backward)

;; bookmarks (within buffer)
(if (featurep 'bm)
    (progn
      (global-set-key [H-f2] 'bm-next)
      (global-set-key [C-H-f2] 'bm-toggle)
      (global-set-key [S-H-f2] 'bm-previous)))

;; completion (Emacs default: M-TAB - lisp-complete-symbol, M-/ - dabbrev-expand)
(global-set-key (kbd "H-/") 'hippie-expand)
