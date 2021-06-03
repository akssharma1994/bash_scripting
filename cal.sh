#!/bin/bash
if [ $1 == add ]
then 
	sum=$(($2 + $3))
		echo "Sum = $sum"
elif [ $1 == sub ]
then
	subtr=$(($2 - $3))
		echo "sub = $subtr"
fi
