;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Alireza Morsali"
      user-mail-address "alireza.mors@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)
(setq display-line-numbers-type 'relative)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-derectory "~/Library/CloudStorage/Dropbox/Workspace/org/")

;; ++++++++++++++++++++++++++++++++++++
;; Org Agenda
;; ====================================
;; (setq org-agenda-files '("~/Library/CloudStorage/Dropbox/Workspace/org/agenda.org"))
(setq org-agenda-files '("~/Library/CloudStorage/Dropbox/Workspace/org/gtd/inbox.org"
                         ;; "~/Library/CloudStorage/Dropbox/Workspace/org/gtd/next.org"
                         "~/Library/CloudStorage/Dropbox/Workspace/org/gtd/gtd.org"
                         "~/Library/CloudStorage/Dropbox/Workspace/org/gtd/tickler.org"))
(use-package org-capture
  :config
  (setq org-capture-templates '(
                        ("t" "Todo [inbox]" entry
                        (file+headline "~/Library/CloudStorage/Dropbox/Workspace/org/gtd/inbox.org" "Tasks")
                        "* TODO %i%?")
                        ("T" "Tickler" entry
                        (file+headline "~/Library/CloudStorage/Dropbox/Workspace/org/gtd/tickler.org" "Tickler")
                        "* %i%? \n %U")))
  :bind ("C-c c" . org-capture)
)
(setq org-refile-targets '(("~/Library/CloudStorage/Dropbox/Workspace/org/gtd/gtd.org" :level . 3)
                           ;; ("~/Library/CloudStorage/Dropbox/Workspace/org/gtd/next.org" :maxlevel . 3)
                           ("~/Library/CloudStorage/Dropbox/Workspace/org/gtd/someday.org" :level . 1)
                           ("~/Library/CloudStorage/Dropbox/Workspace/org/gtd/tickler.org" :maxlevel . 2)))

;; (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))
(setq org-agenda-custom-commands
      '(
        ("h" "At home" tags-todo "@home"
         ((org-agenda-overriding-header "Home")))
        ("c" "On the couch" tags-todo "@couch"
         ((org-agenda-overriding-header "Couch")))
        ("o" "At office" tags-todo "@office"
         ((org-agenda-overriding-header "Office")))
        ))

;; ++++++++++++++++++++++++++++++++++++
;; Org Roam
;; ====================================
;; (setq org-roam-directory "~/Dropbox/Workspace/roam")



;; ++++++++++++++++++++++++++++++++++++
;; Org Babel
;; ====================================
;; (require 'ob-ipython)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((ipython . t)
;;    ))



;; ++++++++++++++++++++++++++++++++++++
;; Latex and PDF tools
;; ====================================
(add-hook 'pdf-tools-enabled-hook 'pdf-view-midnight-minor-mode)
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

;; ++++++++++++++++++++++++++++++++++++
;; Word wrap
;; ====================================
(global-visual-line-mode t)


;; ++++++++++++++++++++++++++++++++++++
;; treemacs
;; ====================================
(with-eval-after-load 'treemacs
  (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action))
(setq doom-themes-treemacs-theme "doom-colors")
;; all the icons
(use-package all-the-icons
  :if (display-graphic-p))

;; ++++++++++++++++++++++++++++++++++++
;; Avy
;; ====================================
(setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?b ?c ?e ?i ?m ?n ?o ?p ?q ?r ?t ?u ?v ?w ?x ?y ?z))
(map! :leader
      :desc "Avy"
      "j" '(lambda (&rest _)
            (interactive)
            ;; (let ((current-prefix-arg t)) (evil-avy-goto-char-timer))))
            (let ((current-prefix-arg t)) (evil-avy-goto-word-0))))
            ;; (let ((current-prefix-arg t)) (evil-avy-goto-word-1))))

(map! :leader
      :desc "Avy"
      "k" '(lambda (&rest _)
            (interactive)
            (let ((current-prefix-arg t)) (evil-avy-goto-char-2))))

;; ++++++++++++++++++++++++++++++++++++
;; Long line indicator
;; ====================================
(setq-default
 whitespace-line-column 119
 ;; whitespace-line-column 79
 whitespace-style       '(face lines-tail))
(add-hook 'prog-mode-hook #'whitespace-mode)
(setq-default display-fill-column-indicator-column 119)
;; (setq-default display-fill-column-indicator-column 79)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)


;; ++++++++++++++++++++++++++++++++++++
;; Beacon Mode
;; ====================================
(beacon-mode 1)

;; ++++++++++++++++++++++++++++++++++++
;; Show methods of a Class
;; ====================================
;; (global-set-key (kbd z i) 'org-latex-preview)
(after! evil
  (map! :nv "zi" 'hs-hide-level))

;; ++++++++++++++++++++++++++++++++++++
;; Tmux style resizing
;; ====================================
(global-set-key (kbd "C-H") 'shrink-window)
(global-set-key (kbd "C-J") 'enlarge-window)
(global-set-key (kbd "C-K") 'shrink-window-horizontally)
(global-set-key (kbd "C-L") 'enlarge-window-horizontally)


;; ++++++++++++++++++++++++++++++++++++
;; easy navigation
;; ====================================
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; ++++++++++++++++++++++++++++++++++++
;; remove ~ for empty lines
;; ====================================
(setq indicate-empty-lines nil)


;; ++++++++++++++++++++++++++++++++++++
;; better wvil
;; ====================================
(evil-collection-init '(vterm calendar dired calc ediff))
