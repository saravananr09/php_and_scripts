#!/bin/bash
#system_load=$(w > /home/saravanan/mysql-base/w2.txt);
#grep_load=$(awk '{print $10}' /home/saravanan/mysql-base/w2.txt  | cut -f 1 -d ',');
#get_load=$(w | head -1|cut -f 4 -d ','| awk '{print $3}' | cut -f 1 -d '.');
#get_load=$( w | head -1|cut -f 4 -d ','|  cut -f 1 -d '.');
#get_count=$(/home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -s -N -e "select count(*) from information_schema.processlist where COMMAND not in ('Binlog Dump') and user not in ('system user','event_scheduler') and Info like 'select sleep%';");
echo $get_load;

get_load=12;
get_count=4;


if [ "$get_load" -gt 4 ]
then
	echo "Current load is ${get_load} || fired the kill"
	$(/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -S /tmp/mysql78.sock -s -N -e "SELECT concat(group_concat('KILL ',id SEPARATOR ';'),';') as selects FROM information_schema.processlist WHERE COMMAND not in ('Binlog Dump') and substring(info,1,6) ='SELECT';" > /mnt/e/back/vicky/mysql_base/scripts/kill.txt) &
	sleep 5 &
        killing_cmd=$(/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -S /tmp/mysql78.sock < /mnt/e/back/vicky/mysql_base/scripts/kill.txt) &
	${killing_cmd}
	sleep 5 &
	missed_query=$(/mnt/e/back/vicky/mysql_base//bin/mysql -uroot -S /tmp/mysql78.sock -s -N -e" select count(*) from information_schema.processlist where COMMAND not in ('Binlog Dump') and user not in ('system user','event_scheduler') and Info like 'select%';")
	if [ $missed_query > 1 ]
	then
	#$(sed "s/^[^ ]* //" /mnt/e/back/vicky/mysql_base/scripts/kill.txt > /mnt/e/back/vicky/mysql_base/scripts/kill.txt)
	${killing_cmd}  
	echo "i killed the missed sleeps "$missed_query;
	fi	
	#query="SELECT concat(group_concat('KILL ',id SEPARATOR ';'),';') as selects FROM information_schema.processlist WHERE COMMAND not in ('Binlog Dump') and substring(info,1,6) ='SELECT';"
	#$(/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -s -N -S /tmp/mysql78.sock -e "${query}" > /mnt/e/back/vicky/mysql_base/kill_ids.txt 
	#1> /mnt/e/back/vicky/mysql_base/kill_sleep.log 2>/mnt/e/back/vicky/mysql_base/kill_sleep.err)  &
elif [ "$get_count" -gt 10 ]
then
	echo "there are ${get_count} queries running || fired the kill"
else
	echo "Load is normal"
fi







