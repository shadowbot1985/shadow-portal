#!/usr/bin/env zsh
set -euo pipefail

repo_name="${1:-shadow-portal}"

if ! gh auth status >/dev/null 2>&1; then
  echo "GitHub 尚未登入，請先執行 gh auth login。"
  exit 1
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  gh repo create "$repo_name" --private --source=. --remote=origin --push
else
  git push -u origin main
fi

