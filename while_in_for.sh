#!/bin/bash
read -s -p " How much sleep queries do you want to fire ? " n
echo -e "$n\n";
read -s -p " Enter the time for sleep : " sleep_time
echo -e "$sleep_time \n";
read -s -p " How much time you want to iterate this process " iter
echo -e "$iter \n";
i=1
while [ $i -le $iter ]
do

for sleeps in $(eval echo "{1..$n}") 
do 
	query="select sleep(${sleep_time});"
	#echo $query;
	$(/home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -s -N -e "$query" > tester.log) & 
done
sleep 5 
echo "######################################"
echo "*********chunk $i completed**********"
echo "######################################"
((i++))

done
