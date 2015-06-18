(require-package 'color-theme)
(require-package 'color-theme-sanityinc-solarized)
(require-package 'color-theme-sanityinc-tomorrow)
(require 'color-theme-sanityinc-solarized)
;; custom theme packages
;; can be removed
(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/init/custom-themes" user-emacs-directory))
(setq custom-theme-directory
      (expand-file-name "~/.emacs.d/init/custom-themes" user-emacs-directory))
;;(require-package 'color-theme-blackboard)

(require-package 'atom-dark-theme)

;; if you don't customize it, this is the theme you get
;;(setq-default custom-enabled-themes '(sanityinc-solarized-dark))
;;(color-theme-sanityinc-solarized--define-theme dark)
;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)



;; Toggle between light and dark
(defun light ()
  "Activate a light color theme."
  (interactive)
  (color-theme-sanityinc-solarized-light))

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (color-theme-sanityinc-solarized-dark))


(provide 'init-themes)
