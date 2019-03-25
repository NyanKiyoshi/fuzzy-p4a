#!/bin/sh

header() {
  local IFS=', '
  echo "<!doctype html><html><head><title>index of: $*</title></head><body>"
}

index_dir() {
  dir=$1
  echo '<ul>'
  for filepath in $(cd "$1"; find . -type f); do
    filename=$(basename ${filepath})
    filepath="$1/$filename"
    echo "$filepath" | grep -qE "\.(jpg|png)$" && {
      echo "<li><a href='${filepath}'><img src='${filepath}' alt='${filename}' /></a></li>"
    } || {
      echo "<li><a href='${filepath}'>${filename}</a></li>"
    }
  done
  echo '</ul>'
}

body() {
  for dir in $@; do
    echo "<section><h2>${dir}</h2>"
    index_dir "$dir"
    echo "</section>"
  done
}

footer() {
  echo '</body></html>'
}

header $@
body $@
footer $@
