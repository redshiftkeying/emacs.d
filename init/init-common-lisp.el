;; See http://bc.tech.coop/blog/070927.html
(add-auto-mode 'lisp-mode "\\.cl\\'")
(add-hook 'lisp-mode-hook (lambda ()
                            (unless (featurep 'slime)
                              (require 'slime)
                              (normal-mode))))

;;--------------------------------------------
;;slime whit allegro设置
;; update this path to the correct location.

(eval-after-load "slime"
  '(progn
    (slime-setup '(slime-fancy slime-banner))
    (setq slime-complete-symbol*-fancy t)
    (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))

;; Optionally, specify the Lisp program you are using. Default is "lisp"
;; If the Allegro directory is not in your PATH environment variable
;; this should be a fully qualified path.
;; choose one of the below based on Express or non-Express usage
(setq inferior-lisp-program "/home/aliphon/lisp/acl81/alisp")
;; (setq inferior-lisp-program "allegro-express")

;;--------------------------------------------

(provide 'init-common-lisp)
