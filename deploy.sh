#!/bin/bash
# deploy.sh - pull the latest code from GitHub and publish it to the web root
set -e

REPO_DIR="$HOME/azure-deploy-demo"
WEB_ROOT="/var/www/html"
LOG_FILE="$HOME/deploy.log"

cd "$REPO_DIR"
git fetch origin main
git reset --hard origin/main
cp ./*.html "$WEB_ROOT/"

COMMIT=$(git rev-parse --short HEAD)
echo "$(date '+%Y-%m-%d %H:%M:%S') deployed commit $COMMIT" >> "$LOG_FILE"
echo "Deploy complete: commit $COMMIT"
