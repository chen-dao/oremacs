(defconst emacs-d
  (file-name-directory
   (file-chase-links load-file-name))
  "The giant turtle on which the world rests.")

(setq package-user-dir
      (expand-file-name "elpa" emacs-d))
(package-initialize)
(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
(package-refresh-contents)

(defconst ora-packages
  '(ac-cider
    ace-link
    ace-popup-menu
    ace-window
    alert
    auctex
    auto-compile
    auto-yasnippet
    clipmon
    cmake-mode
    company
    company-jedi
    counsel
    define-word
    eclipse-theme
    find-file-in-project
    function-args
    geiser
    google-c-style
    gtk-pomodoro-indicator
    headlong
    helm-make
    hideshowvis
    ivy-hydra
    j-mode
    jedi
    lispy
    magit
    make-it-so
    markdown-mode
    netherlands-holidays
    org-bullets
    org-download
    powerline
    projectile
    rainbow-mode
    request
    rust-mode
    slime
    smex
    swiper
    ukrainian-holidays
    use-package
    vimish-fold
    wgrep
    which-key
    worf
    yaml-mode)
  "List of packages that I like.")

;; install required
(dolist (package ora-packages)
  (unless (package-installed-p package)
    (ignore-errors
      (package-install package))))

;; upgrade installed
(save-window-excursion
  (package-list-packages t)
  (package-menu-mark-upgrades)
  (condition-case nil
      (package-menu-execute t)
    (error
     (package-menu-execute))))
