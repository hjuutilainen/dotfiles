;; Disable backup
(setq backup-inhibited t)

;; Disable auto save
(setq auto-save-default nil)

;; NO tabs
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; Set the tab width
(setq default-tab-width 4)
(setq tab-width 4)
(setq c-basic-indent 4)

;; Taken from:
;; http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode#10439239
(setq tab-stop-list (number-sequence 4 200 4))
