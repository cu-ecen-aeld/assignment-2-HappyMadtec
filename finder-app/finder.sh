#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "There has to be two arguments"
    exit 1
fi

filedir="$1"

searchstr=$(find "$filedir" -type f | wc -l)
for file in "$filedir"/*; do
    occurrences=$(grep -o "$2" "$file" | wc -l)
    ((value_line += occurrences))
done

echo "The number of files are $searchstr and the number of matching lines are $value_line"

