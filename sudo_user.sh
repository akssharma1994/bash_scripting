#!/bin/bash

read -p "Enter the Name of user : " user
sudousr=$(cat /etc/sudoers | grep $user)
if [[ -n $myvar ]]
then
	echo "user  is a sudoer: sudouser"
else
	echo "user is not a sudouser"
fi
