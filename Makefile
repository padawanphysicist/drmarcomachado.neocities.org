TAILWIND:=tailwindcss

.PHONY: all build clean

all: build

assets/css/default.css: assets/css/default.input.css
	$(TAILWIND) -i $< -o $@


build: haunt.scm assets/css/default.css
	haunt build


# Para desenvolvimento
.PHONY: dev
dev:
	@echo "Iniciando ambiente de desenvolvimento..."
	$(TAILWIND) -i assets/css/default.input.css -o assets/css/default.css
	haunt build
	$(TAILWIND) -i assets/css/default.input.css -o assets/css/default.css --watch & \
	haunt serve --watch; \
	trap 'kill 0' EXIT

clean:
	rm -rf site/ assets/css/default.css
