;;; package --- Summary
;;; Commentary:
;;;设置文件。
;;;--------------------------------------------
;;; Code:
;;设置初始化文件（package配置文件），配置文件（el-get配置文件）目录。
(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "conf" user-emacs-directory))
;;设置benchmark的配置文件
;;设置benchmark-init先于el-get启动
(require 'init-benchmarking) ;; 开始监控模块启动参数
;;参见benchmark-init/show-durations-tree与benchmark-init/show-durations-tabulated命令


;;--------------------------------------------
;;一些个性化初始设置
(defconst *spell-check-support-enabled* nil) ;; 语法检查
;;--------------------------------------------
(defconst *is-a-mac* (eq system-type 'darwin)) ;; 判断是否是mac环境
;;--------------------------------------------
;;初始化设置
;;--------------------------------------------
(require 'init-compat) ;; 配置版本的兼容性
(require 'init-utils) ;; copy StevePurcell 的一些配置
(require 'init-elpa) ;; 初始化elpa设置
(require 'init-exec-path) ;; Set up $PATH
(require 'init-el-get) ;; el-get 设置


;;--------------------------------------------
;;设置扩展功能包
;;--------------------------------------------
(require-package 'wgrep) ;; grep包，控制grep的功能
(require-package 'project-local-variables) ;; 为程序项目文件设置环境，TODO：用DirVarsPackage替换
(require-package 'scratch) ;; 设置scrath-buffer
(require-package 'mwe-log-commands) ;; 记录操作命令

;;--------------------------------------------
;; 设置和配置其他功能包
(require 'init-frame-hooks) ;; 设置多tty模式
(require 'init-xterm) ;; 设置xterm的按键绑定
(require 'init-themes) ;; 设置主题
(require 'init-gui-frames) ;;设置gui下的窗口和按键配置
(require 'init-dired) ;; 设置dired plus
(require 'init-isearch) ;; 搜索功能的扩展
(require 'init-uniquify) ;; file 和 buffer 的命名
(require 'init-ibuffer) ;; 自适应窗口大小调整
(require 'init-flycheck) ;; 语法错误高亮显示
(require 'init-multi-term) ;; 配置多term窗口

(require 'init-recentf) ;; 处理最近打开的文件列表
(require 'init-ido) ;; ido不解释
(require 'init-hippie-expand) ;; 文件中录入目录名
(require 'init-auto-complete) ;; 自动补全代码
(require 'init-windows) ;; 快速跳转窗口
(require 'init-sessions) ;; 自动保存打开的文件
(require 'init-fonts) ;; 设置字体，调整字体大小的快捷键
(require 'init-mmm) ;; 设置mmm-mode

(require 'init-editing-utils) ;; 主要编辑区域功能设置

(require 'init-vc) ;; 配置版本控制
;; darcs 暂时不用
;(require 'init-darcs) ;; 轻量级版本控制器
(require 'init-git) ;; git的配置

(require 'init-crontab) ;; 配置定期执行命令的程序
(require 'init-markdown) ;; 设置markdown的编写模式
(require 'init-csv) ;; 处理csv文件
(require 'init-javascript) ;; 处理js文件
(require 'init-org) ;; 设置org mode
(require 'init-nxml) ;; xml类文件的模式
(require 'init-html) ;; html文件的配置
(require 'init-css) ;; CSS文件的配置
(require 'init-haml) ;; haml模板文件模式
(require 'init-ruby) ;; Ruby语言的配置
(require 'init-rails) ;; rails模式
(require 'init-sql) ;; SQl的缩进模式

(require 'init-paredit) ;; lisp族语言专用括号匹配
(require 'init-lisp) ;; lisp 的配置
(require 'init-slime) ;; slime的配置
(require 'init-common-lisp) ;; commonlisp的设置

(when *spell-check-support-enabled*
  (require 'init-spelling)) ;; 拼写检查

(require 'init-misc) ;; 其他～～

(require 'init-dash) ;; dash不解释

;;--------------------------------------------

;;--------------------------------------------
;;一些不需要配置的包
(require-package 'gnuplot) ;;著名的画图软件，类似R语言
(require-package 'htmlize) ;;生成html插件
(require-package 'dsvn) ;;svn的插件
(require-package 'regex-tool) ;;正则表达式工具
;;--------------------------------------------

;;--------------------------------------------
;; 设置 emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))
;;--------------------------------------------

;;--------------------------------------------
;; 测试用配置文件
(setq test-file (expand-file-name "test.el" user-emacs-directory))
(when (file-exists-p test-file)
  (load test-file))
;;--------------------------------------------


;; 个人定制undo tree 设置,全局undo模式
(global-undo-tree-mode)
(put 'downcase-region 'disabled nil)

;; 配置el-get文件的设定，配置文件在conf文件夹内
(require 'conf-yasnippet)
(require 'conf-zencoding)


(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End;
;;; init.el ends here
