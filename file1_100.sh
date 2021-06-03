#!/bin/bash
rm -rf test
mkdir test
cd test
for i in {1..100}
do
	touch file$i;
done
for i in {1..50}
do
	chmod o+x file$i
done

echo -e "$(ls -l | grep "x")"

for i in {1..50}
do
        chmod o-x file$i
done
echo -e "$(ls -l | grep "r")"
