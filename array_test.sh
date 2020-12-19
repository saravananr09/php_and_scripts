#!/bin/bash 
#set -x
tables=('tb1' 'tb2' 'tb3' 'tb4' 'tb5')
coa=${#tables[*]}
#echo $coa

i=0
get_tables () {
while [ $i -lt $coa ]
do
	echo ${tables[$i]};
	#sleep 2
	(( i++ ))
done
}


PS3="Enter any below option "









