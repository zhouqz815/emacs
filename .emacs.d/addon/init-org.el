; (require-package 'org-fstree)
; (require-package 'org-magit)
; (require-package 'toc-org)

; (define-key global-map "\C-cl" 'org-store-link)
; (define-key global-map "\C-ca" 'org-agenda)

; ;; Various preferences
; (setq org-log-done t
;       org-completion-use-ido t
;       org-edit-timestamp-down-means-later t
;       org-agenda-start-on-weekday nil
;       org-agenda-span 14
;       org-agenda-include-diary t
;       org-agenda-window-setup 'current-window
;       org-fast-tag-selection-single-key 'expert
;       org-export-kill-product-buffer-when-displayed t
;       org-tags-column 80
;       org-startup-indented t)


; ; Refile targets include this file and any file contributing to the agenda - up to 5 levels deep
; (setq org-refile-targets (quote ((nil :maxlevel . 5) (org-agenda-files :maxlevel . 5))))
; ; Targets start with the file name - allows creating level 1 tasks
; (setq org-refile-use-outline-path (quote file))
; ; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
; (setq org-outline-path-complete-in-steps t)


; (setq org-todo-keywords
;       (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
;                                 (sequence "WAITING(w@/!)" "SOMEDAY(S)" "PROJECT(P@)" "|" "CANCELLED(c@/!)"))))


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Org clock
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;; Save the running clock and all clock history when exiting Emacs, load it on startup
; (setq org-clock-persistence-insinuate t)
; (setq org-clock-persist t)
; (setq org-clock-in-resume t)

; ;; Change task state to STARTED when clocking in
; (setq org-clock-in-switch-to-state "STARTED")
; ;; Save clock data and notes in the LOGBOOK drawer
; (setq org-clock-into-drawer t)
; ;; Removes clocked tasks with 0:00 duration
; (setq org-clock-out-remove-zero-time-clocks t)

; ;; Show the clocked-in task - if any - in the header line
; (defun sanityinc/show-org-clock-in-header-line ()
;   (setq-default header-line-format '((" " org-mode-line-string " "))))

; (defun sanityinc/hide-org-clock-from-header-line ()
;   (setq-default header-line-format nil))

; (add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
; (add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
; (add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

; (eval-after-load 'org-clock
;   '(progn
;      (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
;      (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu)))

; (after-load 'org
;   (org-babel-do-load-languages
;    'org-babel-load-languages
;    '((R . t)
;      (emacs-lisp . t)
;      (gnuplot . t)
;      (haskell . nil)
;      (latex . t)
;      (octave . t)
;      (python . t)
;      (ruby . t)
;      (sh . t))))

; ;; use org-toc
; (add-hook 'org-mode-hook 'toc-org-enable)

; ;; enable markdown-exporting to the export menu
; (eval-after-load "org"
;   '(require 'ox-md nil t))

; (provide 'init-org)

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
     (let ((src-code-types
      '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
        "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
        "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
        "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
        "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))
(add-hook 'org-mode-hook '(lambda ()
                            ;; turn on flyspell-mode by default
                            (flyspell-mode 1)
                            ;; C-TAB for expanding
                            (local-set-key (kbd "C-<tab>")
                             'yas/expand-from-trigger-key)
                            ;; keybinding for editing source code blocks
                            (local-set-key (kbd "C-c s e")
                             'org-edit-src-code)
                            ;; keybinding for inserting code blocks
                            (local-set-key (kbd "C-c s i")
                             'org-insert-src-block)
                            ))
(setq org-src-fontify-natively t)
(setq org-todo-keywords
  '((sequence "TODO" "DOING" "HANGUP" "|" "DONE" "CANCEL")))
