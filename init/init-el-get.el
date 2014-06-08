;;; el-get 的设置
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))
;; now set our own packages
(setq
 my:el-get-packages
 '(el-get				; el-get is self-hosting
   diminish
   fuzzy
   popup
   sqlite-dump                          ; View SQLite database files in Emacs as '.dump' SQL text.
   yasnippet                            ; 强大的文本模板输入工具
   helm
   cssh                                 ; ClusterSSH meets Emacs
   o-blog                               ; Stand alone org-mode blog exporter.
   emacs-w3m
   mew
   zencoding-mode))			; http://www.emacswiki.org/emacs/ZenCoding

;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
(when (el-get-executable-find "cvs")
  (add-to-list 'my:el-get-packages 'emacs-goodies-el)) ; the debian addons for emacs

(when (el-get-executable-find "svn")
  (loop for p in '(psvn    		; M-x svn-status
		   yasnippet		; powerful snippet mode
		   )
	do (add-to-list 'my:el-get-packages p)))

(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))

;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)

(provide 'init-el-get)
