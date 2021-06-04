#!/bin/bash

echo "username,  minage " > minage.csv
for user in $(cat /etc/passwd | grep bash | awk -F ':' '{ print $1 }')
do
	echo "$user,";chage -I $user | grep "Minimun" | sed 's/Minimum number of days between passwd change   ://g'
done | paste-->>minage.csv
