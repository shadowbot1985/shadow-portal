#!/usr/bin/env zsh
set -euo pipefail

remote="${1:-shadow-drive}"
target="${2:-影子超能力入口網網站}"

if ! rclone listremotes | grep -qx "${remote}:"; then
  echo "找不到 rclone remote：${remote}，請先執行 rclone config。"
  exit 1
fi

rclone copy . "${remote}:${target}" --create-empty-src-dirs --progress
