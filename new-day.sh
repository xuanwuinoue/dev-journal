#!/usr/bin/env bash
# Creates today's entry at days/YYYY/MM/YYYY-MM-DD.md from the template.
set -e
cd "$(dirname "$0")"
TODAY=$(date +%F)
DIR="days/$(date +%Y)/$(date +%m)"
FILE="$DIR/$TODAY.md"
mkdir -p "$DIR"
if [ -f "$FILE" ]; then
  echo "Already exists: $FILE"
else
  sed "s/{{DATE}}/$TODAY/" template/day.md > "$FILE"
  echo "Created: $FILE"
fi
