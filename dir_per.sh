#!/bin/bash
read -p " Enter directory name to know the permissions : " dir
if [[ -d $dir ]]
then
	echo -e "$(ls -l $dir)"
else
	echo " $dir Directory does not exist"
fi
