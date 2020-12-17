#!/bin/bash
#system_load=$(w > /home/saravanan/mysql-base/w2.txt);
#grep_load=$(awk '{print $10}' /home/saravanan/mysql-base/w2.txt  | cut -f 1 -d ',');
grep_load=$(w | head -1|cut -f 4 -d ','| awk '{print $3}' | cut -f 1 -d '.');


#grep_load=0
#get_count=0
get_count=$(/home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -s -N -e "select count(*) from information_schema.processlist where COMMAND not in ('Binlog Dump') and user not in ('system user','event_scheduler') and Info like 'select sleep%';");
echo $grep_load;

if [ "$grep_load" -gt 10 ]
then
   echo "Current load is ${grep_load} || fired the kill"
   for i in `/home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -e "show processlist" | awk '/select/ {print $1}'`;
   do
     
elif [ "$get_count" -gt 10 ]
then
   echo "there are ${get_count} queries running || fired the kill"
else 
   echo "Load is normal"
fi




