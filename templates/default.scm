;; templates/default.scm --- shared page layout
(define-module (templates default)
  #:export (default-layout))

;; default-layout returns the full <html> tree as SXML. BODY is a list
;; of SXML elements (the page's own content).
(define* (default-layout #:key (title "") (description "") (body '()))
  `(html (@ (lang "pt-BR"))
         (head
          (meta (@ (charset "utf-8")))
          (meta (@ (name "viewport")
                   (content "width=device-width, initial-scale=1")))
          (title ,title)
          ,@(if (= (string-length description) 0)
                '()
                `((meta (@ (name "description") (content ,description)))))
          (link (@ (rel "stylesheet") (href "assets/css/default.css")))   
          (link (@ (rel "stylesheet")
                   (href "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"))))
         (body (@ (class "m-0 antialiased font-lato bg-med-bg text-med-text text-[18px]"))
            ,@body)))
