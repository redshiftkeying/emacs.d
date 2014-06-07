(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(tool-bar-mode nil))

;;禁用工具栏图标，和启动欢迎窗口
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;--------------------------------------------
;;设置benchmark-init先于el-get启动
(let ((benchmark-init.el "~/.emacs.d/el-get/benchmark-init/benchmark-init.el"))
  (when (file-exists-p benchmark-init.el)
    (load benchmark-init.el)))
;;设置benchmark的配置文件
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))
(require 'init-benchmarking) ;; 开始监控模块启动参数
;;参见benchmark-init/show-durations-tree与benchmark-init/show-durations-tabulated命令


;;--------------------------------------------
;;一些个性化初始设置
(defconst *spell-check-support-enabled* nil) ;; 语法检查
;;--------------------------------------------

;;--------------------------------------------
;;初始化设置
;;--------------------------------------------
(require 'init-utils) ;;copy StevePurcell 的一些配置
(require 'init-elpa) ;; 初始化elpa设置
(require 'init-exec-path) ;; Set up $PATH
(require 'init-el-get) ;; el-get 设置

;;--------------------------------------------
;;设置扩展功能包
;;--------------------------------------------


;;;slime whit allegro设置
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


;;;;------------------------------------------------------

;; 设置emacs的rvm开发环境
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

;; 个人定制undo tree 设置,全局undo模式
(global-undo-tree-mode)
(put 'downcase-region 'disabled nil)
