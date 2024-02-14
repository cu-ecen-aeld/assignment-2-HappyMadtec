#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "There has to be two arguments"
    exit 1
fi

filedir="$1"

if [ ! -d "$filedir" ]; then
    echo "Directory does not exist"
    exit 1
fi

searchstr=$(find "$filedir" -type f | wc -l)
value_line=0

for file in "$filedir"/*; do
    occurrences=$(grep -o "$2" "$file" | wc -l)
    ((value_line += occurrences))
done

echo "The number of files in $filedir is $searchstr and the number of matching lines are $value_line"

