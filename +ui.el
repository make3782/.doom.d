;;; +ui.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-snazzy)


;; orgmode将日历显示为中文的星期
(set-locale-environment "zh_CN.utf-8")


;;设置tab为4个空格
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(setq-default default-tab-width 4)
(setq-default default-tab-width 4)


;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Menlo" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Menlo" :size 13))

;;设置行间距
(setq-default line-spacing 5)

;;-_为单词的一部分
(modify-syntax-entry ?- "w")
(modify-syntax-entry ?_ "w")
