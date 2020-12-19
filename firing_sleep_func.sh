
#! /bin/bash

read -p "Enter the query count : " n
read -p "Enter the time U want : " t
read -p "Enter the chunk U want: " c


fire()
{
	for sleeps in $(eval echo "{1..$n}")
	do
		echo "sleepies !$sleeps with time $t"
	done
}

i=1;
while [ $i -le $c ]; do
	echo "sleep chunk $i";
	fire 
	sleep 5;
	((i++))
done

#echo fire($c)

#for sleeps in $(eval echo "{1..$n}")
#do
#	echo "sleepies $sleeps!"
#done

#for sleeps in $(eval echo "{1..$n}")
#do 
	#echo $(/mnt/e/back/vicky/mysql_base/bin/mysql -u root -S /tmp/mysql78.sock -e "select sleep(${t})");
	#sleep 5;
	#echo $sleeps;
#done

#echo $sleeps;







