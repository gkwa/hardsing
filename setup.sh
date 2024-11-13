#!/usr/bin/env bash

# Exit on error, undefined variables, and prevent pipe errors
set -euo pipefail

# Site name from argument or default
SITE_NAME="${1:-my-hugo-site}"

# Get current date in Hugo-compatible format
CURRENT_DATE=$(date +%Y-%m-%dT%H:%M:%S%z)

# Create a new directory for your Hugo project with TOML config
hugo new site "${SITE_NAME}" --format=toml

# Move into the project directory
cd "${SITE_NAME}"

# Remove config.toml if it exists (we'll use hugo.toml)
rm -f config.toml

# Create comprehensive hugo.toml configuration
cat >hugo.toml <<EOF
baseURL = "https://gkwa.github.io/hardsing/my-hugo-site/"  # Change to match your GitHub Pages URL
title = "My New Hugo Site"
theme = "PaperMod"

[pagination]
 pagerSize = 5

enableRobotsTXT = true
buildDrafts = false
buildFuture = false
buildExpired = false

[minify]
disableXML = true
minifyOutput = true

[params]
env = "production"
title = "My Hugo Site"
description = "My new hugo site"
keywords = ["Blog", "Portfolio", "PaperMod"]
author = "Me"
DateFormat = "January 2, 2006"
defaultTheme = "auto"
disableThemeToggle = false
ShowReadingTime = true
ShowShareButtons = true
ShowPostNavLinks = true
ShowBreadCrumbs = true
ShowCodeCopyButtons = true
ShowWordCount = true
ShowRssButtonInSectionTermList = true
UseHugoToc = true

 [params.homeInfoParams]
 Title = "Welcome 👋"
 Content = "My Hugo blog"

 [params.profileMode]
 enabled = false
 title = "PaperMod"
 subtitle = "Welcome to my blog"
 
 [[params.socialIcons]]
 name = "github"
 url = "https://github.com/"

 [[params.socialIcons]]
 name = "twitter"
 url = "https://twitter.com/"

[menu]
main = [
   {identifier = "categories", name = "categories", url = "/categories/", weight = 10},
   {identifier = "tags", name = "tags", url = "/tags/", weight = 20},
   {identifier = "archives", name = "archives", url = "/archives/", weight = 30},
   {identifier = "search", name = "search", url = "/search/", weight = 40},
]
EOF

# Initialize git repository
git init --initial-branch=main

# Create initial .gitignore
cat >.gitignore <<'EOF'
public/
resources/
.hugo_build.lock
EOF

# Add theme (PaperMod)
git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod

# Create initial content
mkdir -p content/{posts,about}

# Create about page
cat >content/about/index.md <<EOF
---
title: "About"
date: ${CURRENT_DATE}
draft: false
---

This is my Hugo website's about page.
EOF

# Create first post
cat >content/posts/my-first-post.md <<EOF
---
title: "My First Post"
date: ${CURRENT_DATE}
draft: false
summary: "Welcome to my first post!"
tags: ["first"]
categories: ["blog"]
---

This is my first post using Hugo with PaperMod theme!
EOF

# Create search page
cat >content/search.md <<EOF
---
title: "Search"
layout: "search"
---
EOF

# Create archives page
cat >content/archives.md <<EOF
---
title: "Archives"
layout: "archives"
url: "/archives/"
summary: archives
---
EOF

# Clean any existing generated files
rm -rf public/ resources/ .hugo_build.lock

# Initial build
hugo --minify

# Initialize git repository and commit
git add .
git config user.email "you@example.com"
git config user.name "Your Name"
git commit -m "Initial Hugo site with PaperMod theme"

exit 0
