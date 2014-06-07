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
   benchmark-init	         	; Benchmark your Emacs initialization.
   dash
   wgrep
   diminish
   fuzzy
   popup
   cl-lib
   escreen            			; screen for emacs, C-\ C-h
   mmm-mode				; 单文件中自动切换多种混合模式
   smex                                 ; M-x interface with Ido-style fuzzy matching.
   switch-window			; takes over C-x o
   auto-complete			; complete as you type with overlays
   sqlite-dump                          ; View SQLite database files in Emacs as '.dump' SQL text.
   coffee-mode
   expand-region                        ; 按快捷键选中当前文本,可以将选择区域扩展或者收缩
   yasnippet                            ; 强大的文本模板输入工具
   helm
   git-modes
   magit
   ido-hacks
   ido-gnus
   rvm                                  ; 这个要在rinari之前
   rinari                               ; Rinari Is Not A Rails IDE
   smartparens                          ; 自动输入需要成对输入的字符如右括号之类的字符
   cssh                                 ; ClusterSSH meets Emacs
   undo-tree                            ; Treat undo history as a tree
   ;; o-blog需要的组件
   htmlize                              ; Convert buffer text and decorations to HTML.
   o-blog                               ; Stand alone org-mode blog exporter.
   slime
   emacs-w3m
   mew
   zencoding-mode))			; http://www.emacswiki.org/emacs/ZenCoding

;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
(setq my:el-get-packages
      (append
       my:el-get-packages
       (loop for src in el-get-sources collect (el-get-source-name src))))
;; install new packages and init already installed packages
(el-get 'sync my:el-get-packages)

(provide 'init-el-get)
