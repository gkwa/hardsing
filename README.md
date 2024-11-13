# Hugo Site Generator Scripts

Claude.ai teaches me how to get started with hugo

## Prerequisites

- Hugo installed
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

The site name parameter is optional for both commands. If omitted, defaults to "my-hugo-site"

## Features

- Automated Hugo site creation with Ananke theme
- Git initialization with proper .gitignore
- GitHub Actions workflow for deployment
- Just commands for formatting
- Example content pages created automatically
- Simple site cleanup/removal

## Directory Structure

```
.
├── .github/workflows/   # GitHub Actions workflows
├── content/            # Site content
│   ├── about/         # About page
│   └── posts/         # Blog posts
├── themes/            # Hugo themes
│   └── ananke/       # Default theme
└── hugo.toml          # Site configuration
```

## Usage

1. Create new site:

```bash
./setup [site-name]
```

2. Start development server:

```bash
cd [site-name]
hugo server --buildDrafts --buildFuture --navigateToChanged --bind=0.0.0.0 --port=1313
```

3. Add content:

```bash
cd [site-name]
hugo new content posts/new-post.md
```

4. Format code:

```bash
just fmt
```

5. Deploy:
   Push to main branch and GitHub Actions will deploy to Pages

6. Remove site:

```bash
./teardown [site-name]
```

## Configuration

Edit hugo.toml to customize:

- Site title
- Theme settings
- Navigation
- Pagination
