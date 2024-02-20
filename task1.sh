#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "please provide 2 arguements"
	exit 1
elif [ "$#" -eq 1 ]; then
	echo "You are missing one arguement please provide that"
	exit 1
fi

if [ -f "$1/output.txt" ]; then
	find "$1" -type f  -name "*.$2" > output.txt
else
	touch output.txt
	find "$1" -type f  -name "*.$2" > output.txt
fi

echo "result are forwarded to output.txt"
echo "---------result---------"
cat output.txt
