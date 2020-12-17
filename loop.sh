#!/bin/bash
read -s -p "Enter the no : " n

for sleeps in $(eval echo "{1..$n}")
#for i in {1..10}
do
	echo $sleeps;
done




