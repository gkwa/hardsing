# Hugo Site Generator Scripts

Scripts to learn how to use hugo.

View the source code:

- [repo](https://github.com/gkwa/hardsing)
- [setup script](https://raw.githubusercontent.com/gkwa/hardsing/refs/heads/master/setup) - Creates new Hugo site with theme and initial content
- [teardown script](https://raw.githubusercontent.com/gkwa/hardsing/refs/heads/master/teardown) - Removes Hugo site directory

## Prerequisites

- Hugo extended version installed
- Git installed
- Tree command installed
- Just command runner (optional)

## Quick Start

Create new site:

```bash
./setup my-site-name
```

Remove site:

```bash
./teardown my-site-name
```

Site name parameter is optional and defaults to "my-hugo-site"

## Features

- Automated Hugo site creation with Ananke theme
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
│   └── ananke/       # Default theme
└── hugo.toml          # Site configuration
```

## Usage

Create site:

```bash
./setup [site-name]
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
./teardown [site-name]
```

## Configuration

Edit hugo.toml to configure:

- Site title and metadata
- Theme settings
- Navigation menu
- Content pagination

```

```
