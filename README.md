# Dr. Marco Antônio Machado — Website

Website institucional do Dr. Marco Antônio Machado, médico especializado em Medicina Canabinóide com abordagem integrativa e preventiva em Fortaleza e Cascavel (CE).

Este site é construído como um site estático moderno utilizando **Haunt** e **Guile Scheme**, priorizando desempenho, acessibilidade e simplicidade estrutural.

---

## 🛠️ Estrutura do Projeto

O projeto utiliza uma estrutura limpa baseada em Scheme e arquivos estáticos:

```
├── haunt.scm                 # Configuração principal do Haunt e definição de builders
├── pages/
│   └── index.scm            # Conteúdo da página inicial (SXML) e gerador da página index.html
├── templates/
│   └── default.scm          # Layout HTML compartilhado e estrutura de cabeçalho/metadados
├── assets/
│   ├── css/
│   │   └── default.css      # Estilização completa do site usando CSS semântico e moderno
│   └── img/
│       ├── grafismo.svg     # Elementos gráficos vetoriais decorativos
│       └── separador.svg    # Elemento gráfico divisor de seção
```

---

## 🚀 Como Executar o Projeto

### Pré-requisitos

Certifique-se de ter os seguintes pacotes instalados em seu ambiente:
- **GNU Guile** (interpretador Scheme do GNU)
- **Haunt** (gerador de sites estáticos escrito em Guile)

### Compilação do Site

Para gerar o site estático final (os arquivos compilados serão gerados na pasta de saída padrão do Haunt, `site/`):

```bash
haunt build
```

---

## 🎨 Design e Estilização

O projeto adota uma abordagem de design limpo e focado no usuário:
- **CSS Semântico**: Toda a estilização está concentrada no arquivo `assets/css/default.css` através de classes semânticas claras (`.hero-section`, `.condition-card`, `.process-card`, etc.), garantindo carregamento rápido e fácil manutenção.
- **Tipografia e Ícones**: Utiliza fontes modernas via Google Fonts e ícones do Font Awesome importados no layout base (`templates/default.scm`).
- **Design Responsivo**: O layout se adapta automaticamente a diferentes tamanhos de tela (desktop, tablets e celulares) utilizando CSS Grid, Flexbox e Media Queries modernas.

---

## 📂 Visão Geral dos Arquivos

### [haunt.scm](file:///home/vct/1.projects/pachamama/drmarcomachado.neocities.org/haunt.scm)
Contém a configuração global do site, incluindo metadados (título, domínio, autor, email de contato) e a lista de builders necessários para a compilação do projeto, como o gerador da página principal e a cópia direta da pasta de `assets`.

### [pages/index.scm](file:///home/vct/1.projects/pachamama/drmarcomachado.neocities.org/pages/index.scm)
Define o conteúdo e a estrutura modular da página inicial do site em formato SXML. O código é organizado de forma limpa, fatorando componentes repetidos (como cards de condições de saúde, etapas do processo de atendimento e estatísticas) em pequenos procedimentos auxiliares no Scheme, evitando duplicação de marcação.

### [templates/default.scm](file:///home/vct/1.projects/pachamama/drmarcomachado.neocities.org/templates/default.scm)
Fornece o layout base HTML do site (`default-layout`). Configura o cabeçalho (`<head>`), tags meta para SEO, inclusão das folhas de estilo e a estrutura que envelopa o corpo (`<body>`) do site.
