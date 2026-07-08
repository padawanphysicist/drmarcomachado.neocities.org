#!/usr/bin/env bash

# Arquivos a serem observados
FILES=(haunt.scm templates/default.scm pages/index.scm assets/css/default.css)

while inotifywait -e modify,attrib "${FILES[@]}"; do
    haunt build
done    
