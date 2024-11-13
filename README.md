# Hugo Site Generator Scripts

Scripts to learn how to use hugo.

View the source code:

- [repo](https://github.com/gkwa/hardsing)
- [setup.sh script](https://raw.githubusercontent.com/gkwa/hardsing/refs/heads/master/setup.sh) - Creates new Hugo site with theme and initial content
- [teardown.sh script](https://raw.githubusercontent.com/gkwa/hardsing/refs/heads/master/teardown.sh) - Removes Hugo site directory

## Prerequisites

- Hugo extended version installed
- Git installed
- Tree command installed
- Just command runner (optional)

## Quick Start

Create new site:

```bash
./setup.sh my-site-name
```

Remove site:

```bash
./teardown.sh my-site-name
```

Site name parameter is optional and defaults to "my-hugo-site"

## Features

- Automated Hugo site creation with PaperMod theme
- Git initialization and configuration
- GitHub Actions CI/CD workflow
- Just commands for code formatting
- Example content pages
- Simple site cleanup

## Directory Structure

```
.
├── .github/workflows/   # CI/CD configuration
├── content/            # Site content
│   ├── about/         # About page
│   └── posts/         # Blog posts
├── themes/            # Hugo themes
│   └── PaperMod/     # Default theme
└── hugo.toml          # Site configuration
```

## Usage

Create site:

```bash
./setup.sh [site-name]
```

Start dev server:

```bash
cd [site-name]
hugo server --buildDrafts --buildFuture --navigateToChanged --bind=0.0.0.0 --port=1313
```

Add content:

```bash
cd [site-name]
hugo new content posts/new-post.md
```

Format code:

```bash
just fmt
```

Deploy:
Push to main branch for automatic GitHub Pages deployment

Remove site:

```bash
./teardown.sh [site-name]
```

## Configuration

Edit hugo.toml to configure:

- Site title and metadata
- Theme settings
- Navigation menu
- Content pagination
