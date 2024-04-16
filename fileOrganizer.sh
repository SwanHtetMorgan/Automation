#!/bin/bash

input_dir="$1"

if [ $# -ne 1 ]; then
  echo "No input directory provided."
  exit 1
fi

if [ ! -d "$input_dir" ]; then
    echo "Directory does not exist."
    exit 2
fi

cd "$input_dir" || exit 3

for file in *; do
  if [ -d "$file" ]; then
    continue
  fi

  extension="${file##*.}"
  mkdir -p "$extension"
  mv "$file" "$extension/"
done
