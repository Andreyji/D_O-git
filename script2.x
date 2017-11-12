#!/bin/bash
echo "Here is your home dir:"
echo "++++++++++++++++++++++"
ls -al $HOME
	
echo "Please enter the file name to view:"
read "Filename"
read "filename"

cat ${Filename}
echo ${filename:-`tac $Filename`}
echo $#
