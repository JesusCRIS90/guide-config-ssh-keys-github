#!/usr/bin/env bash
set -euo pipefail

# Usage: ./add-keys.sh [start-path]
# Example: ./add-keys.sh ./keys

START="${1:-./keys}"

if [[ ! -d "$START" ]]; then
  echo "Error: path '$START' does not exist or is not a directory." >&2
  exit 1
fi

# Start ssh-agent if not running
if [[ -z "${SSH_AUTH_SOCK:-}" || ! -S "${SSH_AUTH_SOCK:-}" ]]; then
  echo "No ssh-agent detected. Starting ssh-agent..."
  # start and capture environment variables
  eval "$(ssh-agent -s)" >/dev/null
fi

count=0
echo "Searching for private keys under: $START"

# Find files that do NOT end with .pub (safe for spaces, newlines)
# Use -type f to pick files only
while IFS= read -r -d '' key; do
  # Skip obvious public key files (double-check)
  [[ "$key" == *.pub ]] && continue

  # Print and add
  echo " -> Adding: $key"
  if ssh-add "$key"; then
    count=$((count + 1))
  else
    echo "   Failed to add: $key" >&2
  fi
done < <(find "$START" -type f ! -name '*.pub' -print0)

echo "Done. Added $count key(s)."