#!/bin/bash

read -p " Enter the processname to print see the PID : "  proc
ps -e | grep "$proc"$ | awk -F " " '{ print $1 , $4 }'

