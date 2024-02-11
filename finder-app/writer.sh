#!/bin/bash
if [ "$#" -ne 2 ] ; then
#check the number of arguments
	echo "There has to be two arguments...exiting"
	echo
	exit 1
else
#if checks we verify that we have the absolute path to the text file 
	if [[ "$1" == /* ]] ; then
#we have to verify that the text file exists
	directory_name=$(dirname "$1")
	base_name=$(basename "$1")

	if [[ -e "$directory_name" ]] ; then

		cd "$directory_name"
	if [[ -e "$base_name" ]] ; then
		cd "$1"
		echo "$2"> "$base_name"
		echo "Done"
		echo
	else
		touch "$base_name" || exit 1
		echo "$2" >> "$base_name"
	fi

	else
#if it doesn't exist then we have to create the text file with the command touch

		echo "Creating a new text file: $directory_name"
		mkdir "$directory_name"
		touch "$base_name" || exit 1 
		echo "$2" >> "$base_name"
		echo "Done"
		echo
		exit 1
		fi
	fi
fi
