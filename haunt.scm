;; haunt.scm --- site configuration
;;
;; Run with:  haunt build

(use-modules (haunt site)
             (haunt builder assets)
             (pages index))

(site #:title "Dr. Marco Antônio Machado — Medicina Canabinóide"
      #:domain "drmarcomachado.neocities.org"
      #:default-metadata '((author . "@vct")
                           (email  . "vct.santos@protonmail.com"))
      ;; No blog posts are read from disk for this landing page, so the
      ;; reader list is empty; the index page is generated directly by
      ;; its own builder below.
      #:readers '()
      #:file-filter (make-file-filter '("^\\." "^#" "~$" "default.input.css" "\\.bash$"))
      #:builders (list
                  index-page
                  (static-directory "assets")))
