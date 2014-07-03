;;;
(require-package 'multi-term)
(require 'multi-term)
(setq multi-term-program "/bin/zsh")
;; term模式关闭yas补全模式
(add-hook 'term-mode-hook (lambda()
                            (yas-minor-mode -1)))
(add-hook 'multi-term-mode-hook (lambda()
                                  (yas-minor-mode -1)))
;; 修改为login shell模式，使其兼容rvm
(setq multi-term-program-switches "--login")

(provide 'init-multi-term)
;;; init-multi-term.el ends here
