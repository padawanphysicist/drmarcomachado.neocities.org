# Haunt site

```
haunt.scm                 site config / builders
templates/default.scm     shared <html> layout (default-layout)
pages/index.scm           landing page content (SXML) + index-page builder
static/css/style.css      all styling (Tailwind removed, plain CSS classes)
```

Build with:

```
haunt build
```

Notes:
- Tailwind's CDN/utility classes have been replaced by semantic class names
  (`.hero`, `.condition-card`, `.evidence-card`, etc.) defined in
  `static/css/style.css`, so no build step or Tailwind config is needed.
- Font Awesome is still loaded from its CDN for the icons (`fas fa-*`,
  `fab fa-whatsapp`), since that's a separate icon library, not Tailwind.
- `pages/index.scm` factors repeated markup (condition cards, process
  steps, evidence stats, tags) into small helper procedures instead of
  copy-pasting each card's SXML.
