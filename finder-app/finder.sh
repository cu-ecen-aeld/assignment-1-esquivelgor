#!/bin/bash

set -eu

if [ $# -lt 2 ]
then
	echo "You have to specify at least 2 arguments"
	echo "Usage: $0 <dir_path> file.sh"
    exit 1
else
	FILESDIR=$1
	SEARCHSTR=$2

    if [ ! -d "$FILESDIR" ]
    then
    echo "Error: '$FILESDIR' is not a directory or does not exist."
    exit 1
    fi

    num_files=$(find "$FILESDIR" -type f | wc -l)

    # Count the number of matching lines across all files
    num_matching_lines=$(grep -r "$SEARCHSTR" "$FILESDIR" 2>/dev/null | wc -l)

    # Print the result
    echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

fi