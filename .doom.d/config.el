;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

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
(setq doom-font (font-spec :family "FiraCode Nerd Font" :weight 'light :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
; (setq doom-theme 'doom-one)
; (setq doom-theme 'doom-outrun-electric)
; (setq doom-theme 'doom-solarized-light)
(setq doom-theme 'doom-outrun-electric)
;; (setq doom-theme 'doom-moonlight)
;; (setq doom-theme 'doom-laserwave)
;; (setq doom-theme 'doom-challenger-deep)

;; Light themes
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-fairy-floss)
;; (setq doom-theme 'doom-tomorrow-day)
;; (setq doom-theme 'doom-solarized-light)
;; (setq doom-theme 'doom-acario-light)
;; (setq doom-theme 'doom-opera-light)
;; (setq doom-theme 'doom-nova)
;; (setq doom-theme 'doom-one-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)


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
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(use-package pdf-tools
  :ensure t
  :mode ("\\.pdf\\'" . pdf-tools-install)
  :bind ("C-c C-g" . pdf-sync-forward-search)
  :defer t
  :config
  (setq mouse-wheel-follow-mouse t)
  (setq pdf-view-resize-factor 1.10))

(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (rainbow-delimiters-mode)
              (company-mode)
              (smartparens-mode)
              (turn-on-reftex)
              (setq reftex-plug-into-AUCTeX t)
              (reftex-isearch-minor-mode)
              (setq TeX-PDF-mode t)
              (setq TeX-source-correlate-method 'synctex)
              (setq TeX-source-correlate-start-server t)))

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
           #'TeX-revert-document-buffer)

;; to use pdfview with auctex
(add-hook 'LaTeX-mode-hook 'pdf-tools-install)

;; to use pdfview with auctex
(setq TeX-view-program-selection '((output-pdf "pdf-tools"))
       TeX-source-correlate-start-server t)
(setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view"))))

;; keyboard backward search
(defun pdf-sync-backward-to-top-of-page ()
  "Use coordinate (1,1) to sync backward"
  (interactive)
  (pdf-sync-backward-search 1 1))


(add-hook 'pdf-sync-minor-mode-hook
   (lambda () (define-key pdf-sync-minor-mode-map
                 (kbd "C-c b")
                 'pdf-sync-backward-to-top-of-page)))
;; Matlab-Mode
;; % CLI matlab from the shell:
    ;; % /Applications/MATLAB_R2016a.app/bin/matlab -nodesktop
    ;; %
    ;; % elisp setup for matlab-mode:
(setq matlab-shell-command "/Applications/MATLAB_R2019b.app/bin/matlab")
(setq matlab-shell-command-switches (list "-nodesktop"))


;; SML-Mode
(setenv "PATH" (concat "/usr/local/smlnj/bin" (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin"  exec-path))

;; Word wrap
(global-visual-line-mode t)

;; neotree
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; ;; Evince
;; (setq TeX-source-correlate-start-server t)


;; (defun my-LaTeX-mode()
;;   (add-to-list 'TeX-view-program-list '("Evince" "evince --page-index=%(outpage) %o"))
;;   (setq TeX-view-program-selection '((output-pdf "Evince")))
;;   (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;;   (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;;   ; Other mode specific config
;;   )
;; (add-hook 'LaTeX-mode-hook 'my-LaTeX-mode)
