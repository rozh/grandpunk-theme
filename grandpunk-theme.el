;;; color-theme
(load "color-theme")
(color-theme-initialize)
;; (load "zen-and-art")
;; (load "color-theme-bluebulator")
;; (load "color-theme-tomorrow")
(load "color-theme-tangotango")
(load "color-theme-molokai")
(load "molokai-theme")
(load "monokai-theme")
(load "my-color-theme")
;; (my-color-theme)

;; (load "grandshell-theme")
;; (load "cyberpunk-theme")

(load "grandpunk-theme")


;;; invisible
(setq inhibit-startup-screen t) ; startup
(tool-bar-mode -1)              ; tool bar
(menu-bar-mode -1)              ; menu bar
(set-scroll-bar-mode nil)       ; scroll bar


;;; fullpath in title bar
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

(show-paren-mode t)            ; 対応する括弧を光らせる。
(setq show-paren-style 'mixed) ; ウィンドウ内に収まらないときだけ括弧内も光らせる

(global-auto-revert-mode 1)

(require 'uniquify)            ; バッファ名の識別文字列の変更
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;;; line
(global-hl-line-mode)                                    ; 現在行を目立たせる
(require 'linum)                                         ; 行番号表示
(global-linum-mode t)
(setq linum-format "%4d")                                ; 行番号フォーマット
(setq-default show-trailing-whitespace t)                ; 行末の空白を強調表示
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; 保存時に行末の空白削除

;;; カーソルの位置
(blink-cursor-mode 0)  ; カーソルの点滅を止める
(column-number-mode t) ; カーソルの位置が何文字目かを表示する
(line-number-mode t)   ; カーソルの位置が何行目かを表示する


(require 'my-split-window)
;;; Window分割
(defun split-window-and-run-eshell()
;;; フレームの最大化
  (setq default-frame-alist
        (append
         (list '(width  . 168)
               '(height . 44)
               '(alpha  . 98))
         default-frame-alist))
  (split-window-coding)
)
(add-hook 'after-init-hook
          (lambda()(split-window-and-run-eshell)))


(which-function-mode 1)
(setq which-function-modes t) ; すべてのメジャーモードに対してwhich-func-modeを適用
;; 画面上部に表示する場合は下の2行が必要
(display-time)
;; (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
;; (setq-default header-line-format
;;               '(which-func-mode ("" which-func-format)))


;; タブ
(setq-default indent-tabs-mode nil)     ; タブをスペースで扱う
(custom-set-variables '(tab-width 4))   ; タブ幅

;; Image
(auto-image-file-mode t)

;; Commentの設定
(setq comment-style 'multi-line)


;;; 最終更新日の自動挿入
;;;   ファイルの先頭から 8 行以内に Time-stamp: <> または
;;;   Time-stamp: " " と書いてあれば、セーブ時に自動的に日付が挿入される
(require 'time-stamp)
;; 日本語で日付を入れたくないのでlocaleをCにする
(defun time-stamp-with-locale-c ()
  (let ((system-time-locale "C"))
    (time-stamp)
    nil))
(if (not (memq 'time-stamp-with-locale-c write-file-hooks))
    (add-hook 'write-file-hooks 'time-stamp-with-locale-c))
(setq time-stamp-format "%3a %3b %02d %02H:%02M:%02S %Z %:y")
