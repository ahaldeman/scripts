#!/bin/bash

usage_message="Usage: ./run_loop.sh <filename> <run-command-in-quotes>"
if [ "$1" = "" ] || [ $# -lt 1 ]; then
	echo "Error: missing filename"
	echo $usage_message
	exit
elif [ "$2" = "" ] || [ $# -lt 2 ]; then
        echo "Error: missing run-command-in-quotes"
        echo $usage_message
        exit
fi

while read j
do 
	echo "file changed"
	break
done < <(inotifywait -q -e modify $1)
