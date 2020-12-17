#!/bin/bash
#set -x
DATE=$(date +%d-%m-%Y)
MYSQL_USER="root"
#MYSQL_PASSWORD=""
MYSQL=/home/saravanan/mysql-base/bin/mysql
SOCKET=/tmp/mysql07.sock

while true;
do

slave_status=$($MYSQL -u$MYSQL_USER -S$SOCKET -e 'show slave status\G' | grep 'Slave_SQL_Running:' | awk '{print $2}')
echo "sql thread status = ${slave_status}"

system_load=$(w | head -1 | cut -f 4 -d ',' | awk '{print $3}' | cut -f 1 -d '.')
echo "current load = $system_load"

threads_count=$($MYSQL -u$MYSQL_USER -S$SOCKET -s -N -e "select count(*) from information_schema.processlist where COMMAND not in ('Binlog Dump') and user not in ('system user','event_scheduler');")
echo "current threads running = $threads_count"

if [ $slave_status == No ]
then
$($MYSQL -u$MYSQL_USER -S$SOCKET -e 'start slave;')
echo "slave started successfully"

elif [ $system_load -ge 5 ];then
echo "current load is ${system_load} || firing the kill threshold"

$MYSQL -u$MYSQL_USER -S$SOCKET -s -N -e "SELECT concat(group_concat('KILL ',id SEPARATOR ';'),';') as sel FROM information_schema.processlist WHERE COMMAND not in ('Binlog Dump') and substring(info,1,6) ='SELECT';" > query_id.txt

$MYSQL -u$MYSQL_USER -S$SOCKET -f -vv < query_id.txt 1> kill.log 2> kil.err

elif [ $threads_count -ge 10 ];then
echo "${threads_count} threads are running on this server || firing the kill threshold "

######################Login MySQL and collect kill queries info

$MYSQL -u$MYSQL_USER -S$SOCKET -s -N -e "SELECT concat(group_concat('KILL ',id SEPARATOR ';'),';') as sel FROM information_schema.processlist WHERE COMMAND not in ('Binlog Dump') and substring(info,1,6) ='SELECT';" > query_id.txt

$MYSQL -u$MYSQL_USER -S$SOCKET -f -vv < query_id.txt 1> kill.log 2> kil.err

else

echo "-------------------DB seems fine---------------"

fi

sleep 10

((i++))

done
