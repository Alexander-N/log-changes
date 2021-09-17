#!/bin/bash

FILE="$1"
OLD_FILE=$(mktemp)
cp "$FILE" "$OLD_FILE"

while inotifywait -q "$FILE" > /dev/null; do
  DIFF=$(diff "$FILE" "$OLD_FILE")
  if [[ "$DIFF" = '' ]]; then
    continue
  fi

  MODIFICATION_DATE=$(date -r "$FILE")
  printf '
  filename: "%s"
  date: "%s"
  diff: "%s"
' "$FILE" "$MODIFICATION_DATE" "$DIFF"

  cp "$FILE" "$OLD_FILE"
done
