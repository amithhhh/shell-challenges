#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "please provide the arguement"
	exit 1

fi

find "$1" -type f -name "*" | wc -l > output2.txt
