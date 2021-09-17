#!/bin/bash

FILE_LIST="$1"
# Terminate the entire process group on CTRL-C
trap 'kill $(jobs -p)' SIGINT

while read -r FILE; do
   ./log_changes.sh "$FILE" &
done < "$FILE_LIST"
wait
