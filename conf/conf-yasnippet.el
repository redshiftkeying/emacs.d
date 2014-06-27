;;; Commentary:
;;;conf设置文件。
;;;--------------------------------------------
;;; Code:

;;开启全局开关
(require 'yasnippet)
(yas/global-mode 1)
;; 绑定快捷键
(global-set-key (kbd "C-;") 'yas/expand)

(provide 'conf-yasnippet)
;;; conf-yasnippet ends here
