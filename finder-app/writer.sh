#!/bin/bash

if [ "$#" -eq 0 ] || [ "$#" -ne 2 ]; then
    echo "Invalid number of arguments. There must be two arguments."
    exit 1
fi

if [[ "$1" == /* ]]; then
    directory_name=$(dirname "$1")
    base_name=$(basename "$1")

    if [[ -e "$directory_name" ]]; then
        cd "$directory_name"
        if [[ -e "$base_name" ]]; then
            cd "$1"
            echo "$2" > "$base_name"
            echo "Done"
            echo
        else
            touch "$base_name" || exit 1
            echo "$2" >> "$base_name"
        fi
    else
        echo "Creating a new text file: $directory_name"
        mkdir "$directory_name"
        touch "$base_name" || exit 1
        echo "$2" >> "$base_name"
        echo "Done"
        echo
        exit 1
    fi
fi

