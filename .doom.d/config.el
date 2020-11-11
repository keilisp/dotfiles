;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Druk Alexander" user-mail-address
      "druksasha@ukr.net")

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
;; (setq doom-font (font-spec :family "Monaco"
;;                            :size 12))

(setq doom-font (font-spec :family "Monaco" :size 12)
      doom-big-font (font-spec :family "Monaco")
      doom-variable-pitch-font (font-spec :family "Libre Baskerville" :size 12)
      doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'ewal-doom-one)
(setq doom-theme 'doom-tomorrow-day)
;; (setq doom-theme 'doom-tomorrow-day)
;; (require 'ayu-theme)
;; Terminal mode
(unless (display-graphic-p)
  (setq doom-theme 'doom-gruvbox)
  ;; (setq doom-theme 'doom-tomorrow-night))
  (use-package! evil-terminal-cursor-changer
    :hook (tty-setup . evil-terminal-cursor-changer-activate)))

;; Set theme based on time
;; (defvar install-theme-loading-times nil
;;   "An association list of time strings and theme names.
;; The themes will be loaded at the specified time every day.")
;; (defvar install-theme-timers nil)

;; (defun install-theme-loading-at-times ()
;;   "Set up theme loading according to `install-theme-loading-at-times`"
;;   (interactive)
;;   (dolist (timer install-theme-timers)
;;     (cancel-timer timer))
;;   (setq install-theme-timers nil)
;;   (dolist (time-theme install-theme-loading-times)
;;     (add-to-list 'install-theme-timers
;;                  (run-at-time (car time-theme) (* 60 60 24) 'load-theme (cdr time-theme)))))

;; (setq install-theme-loading-times '(("9:00am" . doom-tomorrow-day)
;;                                     ("8:00pm" . doom-gruvbox)))

(setq calendar-location-name "Europe, Kiev")
(setq calendar-latitude 50.43)
(setq calendar-longitude 30.52)
(require 'theme-changer)
(change-theme 'doom-tomorrow-day 'doom-gruvbox)


;; Which-key global-mode
(which-key-mode)

;; Line number

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.

;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are

;; jj --> esc
(setq key-chord-two-keys-delay 0.9)
(key-chord-define evil-insert-state-map "jj"
                  'evil-normal-state)
(key-chord-define evil-insert-state-map "оо"
                  'evil-normal-state)
(key-chord-mode 1)

;; disable o/O continue commented lines
(setq +evil-want-o/O-to-continue-comments
      nil)

(define-key evil-motion-state-map " " nil)
;; SPC k to save buffer
(define-key evil-motion-state-map (kbd "SPC k") 'save-buffer)
;; SPC \ to call ibuffer
;; (define-key evil-motion-state-map (kbd "SPC \/") 'ibuffer)
;; (define-key evil-motion-state-map (kbd "SPC DEL") 'ibuffer)
(map! :leader :desc
      "SPC / to open ibuffer" "\/" 'ibuffer)

;; (general-define-key
;;  :states 'normal
;;  :keymaps 'override
;;  :prefix "SPC"
;;  "\/" 'ibuffer)

;; SPC [ to call path-completion
;; (define-key evil-motion-state-map (kbd "SPC [") 'company-files)

;; SPC y --> Yank and comment out
(defun yank-and-comment ()
  (interactive)
  (call-interactively 'evil-yank)
  (call-interactively 'evilnc-comment-or-uncomment-lines))

(general-define-key :states 'motion
                    :prefix "SPC"
                    "y" 'yank-and-comment)


;; Vim-like changing windows
(define-key global-map (kbd "C-h") #'evil-window-left)
(define-key global-map (kbd "C-j") #'evil-window-down)
(define-key global-map (kbd "C-k") #'evil-window-up)
(define-key global-map (kbd "C-l") #'evil-window-right)

;; Projectile folders
(projectile-mode +1)
(setq projectile-project-search-path '("~/scripts/" "~/code/projects/" "~/code/"))
(setq projectile-globally-ignored-directories '("~/doom-emacs/"))

;; Resizing windows
(global-set-key (kbd "<C-down>")
                'shrink-window)
(global-set-key (kbd "<C-up>")
                'enlarge-window)
(global-set-key (kbd "<C-right>")
                'shrink-window-horizontally)
(global-set-key (kbd "<C-left>")
                'enlarge-window-horizontally)

;; Reverse mode
(use-package! reverse-im
  :init :custom
  (reverse-im-input-methods '("russian-computer"))
  :config (reverse-im-mode t))


;; Format lisp code
;; (require 'srefactor)
(require 'srefactor-lisp)

;; OPTIONAL: ADD IT ONLY IF YOU USE C/C++.
(semantic-mode 1) ;; -> this is optional for Lisp

(add-hook 'lisp-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      (lambda ()
                        (call-interactively #'srefactor-lisp-format-buffer)))))

;; Format on save
(add-hook 'before-save-hook
          (lambda ()
            (call-interactively #'format-all-buffer)))

;; Make tab work properly
;; (setq tab-always-indent 'complete
;;       indent-tabs-mode nil)


;; Emmet setup
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook 'emmet-mode) ;; enable Emmet's css abbreviation.

;; Org setup
(setq org-directory "~/progs/emacs/org")
(after! org
  (map! :map org-mode-map
        :n "M-j"#'org-metadown :n "M-k"#'org-metaup)
  (setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)"
                                      "|" "DONE(d)" "CANCELLED(c)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "#7c7c75"
           :weight normal
           :underline t)
          ("WAITING" :foreground "#9f7efe"
           :weight normal
           :underline t)
          ("INPROGRESS" :foreground "#0098dd"
           :weight normal
           :underline t)
          ("DONE" :foreground "#50a14f"
           :weight normal
           :underline t)
          ("CANCELLED" :foreground "#ff6480"
           :weight normal
           :underline t)))
  (setq org-fontify-quote-and-verse-blocks nil
        org-fontify-whole-heading-line nil org-hide-leading-stars
        nil org-startup-indented nil))

;; Priorities
(use-package! org-fancy-priorities
  :hook (org-mode . org-fancy-priorities-mode):config
  (setq org-fancy-priorities-list '("⚡" ,"⚡" ,"⚡")))

;; Auto-rename tag
(use-package instant-rename-tag
  :defer 3
  :load-path (lambda ()
               (expand-file-name "~/.doom.d/plugins/instant-rename-tag")):config
  (map! :leader (:prefix ("m" . "local leader")
                 :desc "Instantly rename opening/closing HTML tag"
                 "o"
                 #'instant-rename-tag)))


;; Confirm kill proccess
(use-package files
  :defer t
  :config (setq confirm-kill-processes nil))

;; Treat underscore and hyphen as part of the word
(add-hook 'after-change-major-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")))

(add-hook 'after-change-major-mode-hook
          (lambda ()
            (modify-syntax-entry ?- "w")))

;; Paste menu
(map! "M-v" #'counsel-yank-pop)

;; Dashboard image
(add-hook! '(+doom-dashboard-mode-hook)
  (setq fancy-splash-image "~/pix/doom/stallman.png"))

;; Doom modeline
;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))

;; Speed type
(use-package speed-type
  :commands (speed-type-text))

;; Flycheck
(use-package flycheck
  :defer t
  :hook (prog-mode . flycheck-mode):custom
  (flycheck-emacs-lisp-load-path 'inherit)
  :config (flycheck-add-mode 'javascript-standard 'js2-mode))

;; Higlight colors everywhere
;; (define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
;;   (lambda () (rainbow-mode 1)))

;; Xclip mode everywhere
(define-globalized-minor-mode my-global-xclip-mode
  xclip-mode
  (lambda ()
    (xclip-mode 1)))
(my-global-xclip-mode 1)

;; set specific browser to open links
(setq browse-url-browser-function 'browse-url-firefox)

;; multiedit
(require 'evil-multiedit)
;; Highlights all matches of the selection in the buffer.
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Insert marker at point
(define-key evil-insert-state-map (kbd "M-d") 'evil-multiedit-toggle-marker-here)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
;; OPTIONAL: If you prefer to grab symbols rather than words, use ;; `evil-multiedit-match-symbol-and-next` (or prev).

;; Restore the last group of multiedit regions.
(define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; RET will toggle the region under the cursor
(define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ...and in visual mode, RET will disable all fields outside the selected region
(define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; For moving between edit regions
(define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
(evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)


;; LaTeX
(latex-preview-pane-enable)

;; Force splits to open on the right
(defun prefer-horizontal-split ()
  (set-variable 'split-height-threshold nil
                t)
  (set-variable 'split-width-threshold 40 t)) ; make this as low as needed
(add-hook 'markdown-mode-hook 'prefer-horizontal-split)

;; Image previews in dired
(global-set-key (kbd "C-x i")
                'peep-dired)
(evil-define-key 'normal
  peep-dired-mode-map
  (kbd "j")
  'peep-dired-next-file
  (kbd "k")
  'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)


;; Rustic flycheck
(remove-hook 'rustic-mode-hook 'flycheck-mode)

;; TAB

;; Make Tab always indent
(setq tab-always-indent 'complete)

;; Tab code and path autocompletion
(setq company-backends '((company-files company-capf company-dabbrev-code)))
(after! evil
  (map! :n "TAB"'company-indent-or-complete-common))

;; Racer
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(pretty-symbols flymake-racket racket-mode
                                              geiser chicken-scheme typescript-mode tern-auto-complete
                                              speed-type rustic rust-auto-use reverse-im
                                              peep-dired path-iterator org-super-agenda
                                              org-plus-contrib org-fancy-priorities lsp-mode
                                              key-chord js2-mode flymake-rust flycheck-rust
                                              exec-path-from-shell evil-multiedit doom-modeline
                                              clippy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; So long mode
(setq large-file-warning-threshold 100000000000000)

;; When saving a file that start with '#!', make it executable
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Treat CamelCaseSubWords as separate words in every programming mode
;; (add-hook 'prog-mode-hook 'subword-mode)

(defun pdf-view-save-page ()
  "Save the current page number for the document."
  (interactive)
  (message (number-to-string (pdf-view-current-page))))
