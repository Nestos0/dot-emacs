;;; -*- lexical-binding: t -*-

(use-package meow
  :ensure t)

  (defun meow-setup ()
    ;; Motion 状态：自定义移动键 u n e i
    (meow-motion-overwrite-define-key
     '("u" . meow-prev)
     '("i" . meow-right)
     '("n" . meow-left)
     '("e" . meow-next)
     ;; 可选：添加行首/行尾
     '("0" . meow-line-start)
     '("$" . meow-line-end))

    ;; Leader 键 (SPC)：数字参数 + 移动回退 + 常见命令
    (meow-leader-define-key
     ;; 移动键回退到 motion 状态，避免冲突
     '("n" . "h-u")  ; left
     '("i" . "h-i")  ; right
     '("e" . "h-n")  ; next
     '("u" . "h-e")  ; prev
     ;; 数字参数
     '("1" . meow-digit-argument)
     '("2" . meow-digit-argument)
     '("3" . meow-digit-argument)
     '("4" . meow-digit-argument)
     '("5" . meow-digit-argument)
     '("6" . meow-digit-argument)
     '("7" . meow-digit-argument)
     '("8" . meow-digit-argument)
     '("9" . meow-digit-argument)
     '("0" . meow-digit-argument)
     ;; 帮助
     '("/" . meow-keypad-describe-key)
     '("?" . meow-cheatsheet)
     ;; 其他常见
     '("f" . find-file)
     '("b" . switch-to-buffer)
     '("w" . save-buffer)
     '("W" . meow-open-above)
     '("q" . kill-this-buffer))

    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("1" . meow-expand-1)
     '("2" . meow-expand-2)
     '("3" . meow-expand-3)
     '("4" . meow-expand-4)
     '("5" . meow-expand-5)
     '("6" . meow-expand-6)
     '("7" . meow-expand-7)
     '("8" . meow-expand-8)
     '("9" . meow-expand-9)
     '(")" . meow-forward-slurp)
     '("(" . meow-forward-barf)
     '("{" . meow-backward-slurp)
     '("}" . meow-backward-barf)
     '("-" . negative-argument)
     '(";" . meow-reverse)
     '("," . meow-inner-of-thing)
     '("." . meow-bounds-of-thing)
     '("[" . meow-beginning-of-thing)
     '("]" . meow-end-of-thing)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("c" . meow-change)
     '("d" . meow-kill)
     '("g" . meow-join)
     '("G" . meow-grab)
     '("o" . meow-open-below)
     '("O" . meow-open-above)
     '("p" . meow-yank)
     '("r" . meow-replace)
     '("s" . meow-grab)
     '("t" . meow-till)
     '("U" . undo-redo)
     '("v" . meow-block)
     '("V" . meow-to-block)
     '("x" . meow-line)
     '("y" . meow-save)
     '("Y" . meow-sync-grab)
     '("z" . meow-pop-selection)
     '("n" . meow-left)
     '("N" . meow-left-expand)
     '("i" . meow-right)
     '("I" . meow-right-expand)
     '("e" . meow-next)
     '("E" . meow-next-expand)
     '("u" . meow-prev)
     '("U" . meow-prev-expand)
     '("b" . meow-back-word)
     '("B" . backward-word)
     '("w" . meow-insert)
     '("W" . meow-open-above)
     '("k" . meow-next-word)
     '("K" . meow-next-symbol)
     '("m" . meow-mark-word)
     '("M" . meow-mark-symbol)
     '("f" . meow-find)
     '("s" . avy-goto-char-timer)
     '("Q" . meow-goto-line)
     '("%" . meow-query-replace)
     '("j" . consult-line)
     '("'" . repeat)
     '("<escape>" . meow-cancel-selection)
     '("?" . comment-dwim)))

(setq
 meow-visit-sanitize-completion nil
 meow-keypad-describe-delay 1.0
 meow-replace-state-name-list '((normal . "N")
                                (motion . "M")
                                (keypad . "K")
                                (insert . "I")
                                (beacon . "B")))

(require 'meow)

(meow-global-mode 1)

(with-eval-after-load "meow"
  ;; disable expand hint in telega
  (add-to-list 'meow-expand-exclude-mode-list 'telega-chat-mode)

  ;; make Meow usable in TUI Emacs
  (add-to-list 'meow-mode-state-list '(inf-iex-mode . normal))
  (add-to-list 'meow-mode-state-list '(haskell-interactive-mode . normal))
  (add-to-list 'meow-mode-state-list '(erc-mode . normal))

  ;; use << and >> to select to bol/eol
  (add-to-list 'meow-char-thing-table '(?> . line))
  (add-to-list 'meow-char-thing-table '(?< . line))
  (add-to-list 'meow-char-thing-table '(?o . do/end))

  (meow-thing-register 'do/end
                       '(pair ("do" "fn") ("end"))
                       '(pair ("do" "fn") ("end")))
  (meow-thing-register 'quoted
                       '(regexp "`" "`\\|'")
                       '(regexp "`" "`\\|'"))

  (setq meow-grab-fill-commands '(meow-query-replace
                                  meow-query-replace-regexp
                                  eval-expression)
        meow-esc-delay 0.001)


  ;; define our command layout
  (meow-setup))

(provide 'init-modal)
