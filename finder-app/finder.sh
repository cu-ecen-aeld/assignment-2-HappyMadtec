#!/bin/bash
if [ "$#" -ne 2 ] ; then
#check first if there is the correct number of arguments
     echo "There has to be two arguments"
     exit 1

else 
     filedir="$1"

     if [ -e "$filedir" ]; then
	echo "Path exists"
	echo

	
	searchstr=$(find "$filedir" -type f | wc -l)
	for file in "$filedir"/*; do
		occurrences=$(grep -o "$2" "$file" | wc -l)
		((value_line += occurrences))
	done

	echo "The number of files are $searchstr and the number of matching lines are $value_line in Path exists"
	echo

     else
	echo "Path doesn't exist"
	echo
	exit 1
     fi
fi
