#! /bin/bash
#set -x
read -s -p " How much sleep queries do you want to fire ? " n
read -s -p " Enter the time for sleep : " sleep_time
echo -e $n " \n Totally ${n} of query fire with the time of ${sleep_time}";


for sleeps in $(eval echo "{1..$n}")
do 
	query="select sleep(${sleep_time});"
	#echo $(/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -S /tmp/mysql78.sock -e "${query}" >/mnt/e/back/vicky/mysql_base/sleep.log 2>/mnt/e/back/vicky/mysql_base/log.err);
	$(/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -S /tmp/mysql78.sock -e "${query}" 1> /mnt/e/back/vicky/mysql_base/fired.log 2>/mnt/e/back/vicky/mysql_base/fired.err)  &
	#echo $sleeps;
done
echo $sleeps;







