TAILWIND=tailwindcss

all: build

assets/css/default.css: assets/css/default.input.css
	$(TAILWIND) -i assets/css/default.input.css -o assets/css/default.css

.PHONY: build
build: haunt.scm assets/css/default.css
	haunt build
