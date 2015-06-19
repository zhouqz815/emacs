(require-package  'hydra)
(defhydra hydra-hick (:color pink
                             :hint nil)
  "
^Utl^              ^Unmark^           ^Actions^          ^Git
^^^^^^^^-----------------------------------------------------------------
_k_: kill line     _u_: unmark        _x_: execute       _S_: magit show
_s_: smex          _U_: unmark up     _b_: bury          _g_: magit status
"
  ("k" kill-line :exit t)
  ("u" Buffer-menu-unmark)
  ("U" Buffer-menu-backup-unmark)
  ("s" smex)
  ("x" Buffer-menu-execute)
  ("b" Buffer-menu-bury)
  ("T" Buffer-menu-toggle-files-only)
  ("g" magit-status :color blue)
  ("S" magit-show :color blue)
  ("c" nil "cancel")
  ("v" Buffer-menu-select "select" :color blue)
  ("o" Buffer-menu-other-window "other-window" :color blue)
  ("q" quit-window "quit" :color blue))

(global-set-key (kbd "C-t") 'hydra-hick/body)
