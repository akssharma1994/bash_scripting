#!/bin/bash
cat /etc/passwd | awk -F: '$3 > 1000 { print $3 , $1 }'
