;;; +keyboard.el -*- lexical-binding: t; -*-

;; alt再mac下的改键盘
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(global-set-key (kbd "C-x C-j") 'dired-jump) ; 通过 C-x C-j 跳转到当前目录的 Dired

;;因为有alfred的snippet存在，会冲突这个键，所以这个键用回默认的(同时新定义一个上翻页的键吧，感觉用的还比较多)
(bind-key* "M-v" 'yank)

;;删除整行
(bind-key* "C-k" 'kill-whole-line)

;;复制本行到下一行
(defun ue-select-line-down ()
  "like Shift+down in UltraEdit."
  (interactive)
  (let ((s (point)))
  (setq next-line-add-newlies t)
  (next-line 1)
  (setq next-line-add-newlines nil)
  (kill-new (buffer-substring s (point)))))
(defun my-dup-line-down ()
  "duplicate this line at next line"
  (interactive)
  (let ((c (current-column)))
    (beginning-of-line)
    (ue-select-line-down)
    (beginning-of-line)
    (yank)
    (previous-line 1)
    (move-to-column c)))
(bind-key "C-j" 'my-dup-line-down)

(defun newline-above-current()
  "快速在当前行上面插入一行,并进入插入模式;类似vim的O"
  (interactive)
  (progn (beginning-of-line)
         (open-line 1)
         (indent-according-to-mode)
         (evil-insert-state)
         ))
(defun newline-next-current()
  "快速在当前行下面插入一行,并进入插入模式;类似vim的o"
  (interactive)
  (progn (end-of-line)
         (newline-and-indent)
         (evil-insert-state)
         ))
(define-key global-map (kbd "C-o") 'newline-next-current)
(define-key evil-normal-state-map (kbd "C-o") 'newline-next-current)
(define-key global-map (kbd "M-o") 'newline-above-current)


(defun zz-scroll-half-page (direction)
  "Scrolls half page up if `direction' is non-nil, otherwise will scroll half page down."
  (let ((opos (cdr (nth 6 (posn-at-point)))))
    ;; opos = original position line relative to window
    (move-to-window-line nil)  ;; Move cursor to middle line
    (if direction
        (recenter-top-bottom -1)  ;; Current line becomes last
      (recenter-top-bottom 0))  ;; Current line becomes first
    (move-to-window-line opos)))  ;; Restore cursor/point position

(defun zz-scroll-half-page-down ()
  "Scrolls exactly half page down keeping cursor/point position."
  (interactive)
  (zz-scroll-half-page nil))

(defun zz-scroll-half-page-up ()
  "Scrolls exactly half page up keeping cursor/point position."
  (interactive)
  (zz-scroll-half-page t))
(bind-key "M-n" 'zz-scroll-half-page-down)
(bind-key "M-p" 'zz-scroll-half-page-up)

;; 自己写的跳出括号方法
(defun match-paren ()
  (interactive)
  (progn (when (re-search-forward "[\]\'\"\>\}\)]" nil t)
      (message "跳出括号")
      ))
  )
(bind-key* "M-j" 'match-paren)
