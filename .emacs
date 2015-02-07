
;; Add .emacs.d/custom/ as load-path
(add-to-list 'load-path "~/.emacs.d/custom/")

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command-style (quote (("" "%(PDF)%(latex) -shell-escape  %(extraopts) %S%(PDFout)"))))
 '(custom-enabled-themes (quote (wheatgrass)))
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; JAVA MOde JDEE
(setq jde-help-remote-file-exists-function '("beanshell"))
(add-to-list 'load-path "~/.emacs.d/jdee-2.4.1/lisp/")
(load "jde")


;; HTML files should not be opened in html-helper but traditional html.
(add-to-list 'magic-mode-alist 
    '("\\(?:<\\?xml\\s +[^>]*>\\)?\\s *<\\(?:!--\\(?:[^-]\\|-[^-]\\)*-->\\s *<\\)*\\(?:!DOCTYPE\\s +[^>]*>\\s *<\\s *\\(?:!--\\(?:[^-]\\|-[^-]\\)*-->\\s *\<\\)*\\)?[Hh][Tt][Mm][Ll]"
      . html-mode))
;; Use it in LaTexP (in emacs, not aquamacs)
(when (not (featurep 'aquamacs))
  (funcall 'set-exec-path-from-shell-PATH)
  (require 'recentf)
  (recentf-mode 1)
  (global-set-key "\C-x\C-r" 'recentf-open-files)) 

;; Also, by default I want line wrapping, but not breaking.
(auto-fill-mode -1)
(remove-hook 'text-mode-hook #'turn-on-auto-fill)

;; And tab behaves like tab.
(global-set-key (kbd "TAB") #'tab-to-tab-stop)

;; Cursor is a bar
;;(setq 'cursor-type 'bar)
(setq default-cursor-type 'bar)

;;4 spaces for tab
(setq tab-width 4);


;; And delete selection mode...
(delete-selection-mode 1)

;; Smooth Scrolling
;;(require 'smooth-scroll)
;;(smooth-scroll-mode t)
;; An alternative
(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
    ;; scroll one line at a time (less "jumpy" than defaults)
    
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time

(setq mouse-wheel-progressive-speed 1) ;; don't accelerate scrolling

(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse


;; set the initial frame (window) size
(when (display-graphic-p)
    (progn  
	(add-to-list 'default-frame-alist (cons 'width 90))
	(add-to-list 'default-frame-alist (cons 'height 50))
	;; Theme
	(load-theme 'wheatgrass)))




;; show matching parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-foreground 'show-paren-match-face "green")
(set-face-attribute 'show-paren-match-face nil
        :weight 'bold :underline nil :overline nil :slant 'normal :background nil)
(set-face-foreground 'show-paren-mismatch-face "red") 
(set-face-background 'show-paren-mismatch-face nil)
(set-face-attribute 'show-paren-mismatch-face nil 
                    :weight 'bold :underline t :overline nil :slant 'normal)


;; inhibit startup (if you want).
;;(setq inhibit-startup-message 1)

;; change dir of splash screen
(setq command-line-default-directory "~/")

;; Start in the correct working directory
(setq default-directory "~/")

