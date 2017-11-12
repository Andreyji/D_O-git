#!/bin/bash

if [[ $1 =~ ^[0-9]+$ ]]
then 
	echo "Wrong input (numeric). Try again."
	exit 2
else
	echo "It's all good"
fi 
mkdir $HOME/mylogs
touch  $HOME/mylogs/LOG.log
file=$HOME/mylogs/LOG.log 
shift
count=$1
rest=$* 
a=['normal','request','failure','error','warning','alert','notice','note']
echo ${#a}
for i in rest 
do
	echo i + (( RANDOM % ${#a} )) >> file
done
