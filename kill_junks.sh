#!/bin/bash

grep_load=$(w | head -1|cut -f 4 -d ','| awk '{print $3}' | cut -f 1 -d '.');
#echo $grep_load;
get_count=$(/home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -s -N -e "select count(*) from information_schema.processlist where COMMAND not in ('Binlog Dump') and user not in ('system user','event_scheduler') and Info like 'select sleep%';");



kill_junks()
{
echo $grep_load;

}

kill_junks


