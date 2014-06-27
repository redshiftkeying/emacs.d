;;; Commentary:
;;;conf设置文件。
;;;--------------------------------------------
;;; Code:

;; 开启全局开关，与sgml共同启动
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
;; 默认绑定键是C-j

(provide 'conf-zencoding)
;;; conf-yasnippet ends here
