#!/bin/bash

set -eu

if [ $# -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

writedir=$(dirname "$writefile")

mkdir -p "$writedir"

echo "$writestr" > "$writefile"

if [ ! -f "$writefile" ]; then
    echo "Error: Failed to create file '$writefile'"
    exit 1
fi

echo "File '$writefile' created successfully."