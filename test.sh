#!/bin/bash
echo $0
vara=$1
varb=$2
echo ${vara} 
if [ ${#vara} -lt 3 and ${#varb} -lt 3 ]
	then
	echo "Success"
	exit 0
else
	then
	echo "failed"
	exit 5
fi
