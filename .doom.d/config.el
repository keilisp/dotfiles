;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Druk Alexander"
	  user-mail-address "druksasha@ukr.net")

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
(setq doom-font (font-spec :family "Mononoki Nerd Font" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

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
(setq-default evil-escape-key-sequence "jj")

;; Relative line numbers
(setq doom-line-numbers-style 'relative)

;; Vim-like changing windows
  (define-key global-map (kbd "C-h") #'evil-window-left)
  (define-key global-map (kbd "C-j") #'evil-window-down)
  (define-key global-map (kbd "C-k") #'evil-window-up)
  (define-key global-map (kbd "C-l") #'evil-window-right)

;; Separate clipboards
;; (setq select-enable-clipboard nil)

;; Projectile folders
(setq projectile-project-search-path '("~/scripts/" "~/code/projects/"))

;; Resizing windows
(global-set-key (kbd "<C-down>") 'shrink-window)
(global-set-key (kbd "<C-up>") 'enlarge-window)
(global-set-key (kbd "<C-right>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-left>") 'enlarge-window-horizontally)

;; Reverse mode
(use-package! reverse-im
  :init
  ;; :ensure t
  :custom
  (reverse-im-input-methods '("russian-computer"))
  :config
  (reverse-im-mode t))

;; Doom-modiline
(use-package! doom-modeline
  :init (doom-modeline-mode 1))

;; Format on save
(add-hook 'evil-save
          (lambda()
            (call-interactively #'format-all-buffer)))

;; Make tab work properly
;; (setq tab-always-indent 'complete)
(setq tab-always-indent 'complete
      indent-tabs-mode nil)
;; Emmet setup
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
