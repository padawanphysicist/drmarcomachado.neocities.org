;; templates/default.scm --- shared page layout
(define-module (templates default)
  #:export (default-layout))

(define* (og-tags #:key
                  (og-title "Dr. Marco Antônio Machado | Medicina Canabinoide & Integrativa")
                  (og-description "Tratamento individualizado e humanizado focado em dores crônicas, ansiedade, insônia e condições neurodegenerativas via sistema endocanabinoide.")
                  (og-preview "assets/img/og-preview.jpeg"))
  "Open Graph (OG) Metadata (For Social Media sharing)"
  `(
    (meta (@ (property "og:type")
             (content "website")))
    (meta (@ (property "og:url")
             (content "https://drmarcomachado.neocities.org/")))
    (meta (@ (property "og:title")
             (content ,og-title)))
    (meta (@ (property "og:description")
             (content ,og-description)))
    
    ;; Imagem de exibição (Card do WhatsApp) - Substitua pela URL final da imagem/logo do Dr. Marco
    ;; Proporção ideal para redes sociais é 1200x630 pixels
    (meta (@ (property "og:image")
             (content ,og-preview)))
    (meta (@ (property "og:image:width")
             (content "1200")))
    (meta (@ (property "og:image:height")
             (content "630")))
    (meta (@ (property "og:image:alt")
             (content "Fotografia do Dr. Marco Antônio Machado")))

    ;; Twitter Cards (Garante compatibilidade extra se compartilhado em outras redes)
    (meta (@ (name "twitter:card")
             (content "summary_large_image")))
    (meta (@ (name "twitter:title")
             (content ,og-title)))
    (meta (@ (name "twitter:description")
             (content ,og-description)))
    (meta (@ (name "twitter:image")
             (content ,og-preview)))))

;; default-layout returns the full <html> tree as SXML. BODY is a list
;; of SXML elements (the page's own content).
(define* (default-layout #:key (title "") (description "") (body '()))
  `(html (@ (lang "pt-BR"))
         (head
          (meta (@ (charset "utf-8")))
          (meta (@ (name "viewport")
                   (content "width=device-width, initial-scale=1")))
          ,(og-tags)
          (title ,title)
          (link (@ (rel "apple-touch-icon") (sizes "180x180") (href "assets/img/favicon/favicon-apple-touch-icon-180x180.png")))
          (link (@ (rel "icon") (type "image/png") (sizes "16x16") (href "assets/img/favicon/favicon-16x16.png")))
          (link (@ (rel "icon") (type "image/png") (sizes "32x32") (href "assets/img/favicon/favicon-32x32.png")))
          (link (@ (rel "icon") (type "image/png") (sizes "512x512") (href "assets/img/favicon/favicon-512x512.png")))
          (link (@ (rel "icon") (type "image/x-icon") (href "assets/img/favicon/favicon.ico")))
          ,@(if (= (string-length description) 0)
                '()
                `((meta (@ (name "description") (content ,description)))))
          (link (@ (rel "stylesheet") (href "assets/css/default.css")))   
          (link (@ (rel "stylesheet")
                   (href "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"))))
         (body (@ (class "m-0 antialiased font-lato bg-med-bg text-med-text text-[18px]"))
            ,@body)))
