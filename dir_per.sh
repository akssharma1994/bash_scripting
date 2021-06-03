#!/bin/bash
read -p " Enter filename to know the permissions : " file
if [[ -f $file ]]
then
	echo -e "$(ls -l $file)"
else
	echo "File does not exist"
fi
