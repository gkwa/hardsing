#!/usr/bin/env bash
set -euo pipefail

SITE_NAME="${1:-my-hugo-site}"

rm -rf "$SITE_NAME"
