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
if [ $slave_status == No ]
then
echo "slave started successfully"
$($MYSQL -u$MYSQL_USER -S$SOCKET -e 'start slave;')
fi
sleep 5
((i++))
done
