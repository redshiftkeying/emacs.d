(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;调用用下载的主题

;;禁用工具栏图标，和启动欢迎窗口
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")


;;; el-get 设置
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
   escreen            			; screen for emacs, C-\ C-h
   switch-window			; takes over C-x o
   auto-complete			; complete as you type with overlays
   sqlite-dump                          ; View SQLite database files in Emacs as '.dump' SQL text.
   expand-region                        ; 按快捷键选中当前文本,可以将选择区域扩展或者收缩
   yasnippet                            ; 强大的文本模板输入工具
   helm
   git-modes
   magit
   rvm                                  ; 这个要在rinari之前
   rinari                               ; Rinari Is Not A Rails IDE
   smartparens                          ; 自动输入需要成对输入的字符如右括号之类的字符
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


;;ELPA设置
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;在更新包之后调整load-path					;
(defun package-update-load-path ()
  "Update the load path for newly installed packages."
  (interactive)
  (let ((package-dir (expand-file-name package-user-dir)))
    (mapc (lambda (pkg)
            (let ((stem (symbol-name (car pkg)))
		  (version "")
		  (first t)
		  path)
	      (mapc (lambda (num)
		      (if first
			  (setq first nil)
			  (setq version (format "%s." version)))
		      (setq version (format "%s%s" version num)))
		    (aref (cdr pkg) 0))
              (setq path (format "%s/%s-%s" package-dir stem version))
              (add-to-list 'load-path path)))
          package-alist)))


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

;;ibus 设置ibus的输入法
(push "~/.emacs.d/ibus-el/" load-path)
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
;; Use S-SPC to toggle input status
(ibus-define-common-key ?\S-\s nil)
(global-set-key (kbd "s-SPC") 'ibus-toggle)
(setq ibus-cursor-color '("red" "blue" "limegreen"))

;;设置emacs的rvm开发环境
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session


