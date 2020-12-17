#! /bin/bash
#set -x
read -s -p " How much sleep queries do you want to fire ? " n
read -s -p " Enter the time for sleep : " sleep_time
#echo -e $n " \n Totally ${n} of query fire with the time of ${sleep_time}";

for sleeps in $(eval echo "{1..$n}")
do
        $(/home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql07.sock -e "select sleep($sleep_time)" 2>/home/saravanan/mysql-base/scripts/fired.err)  &
        sleep 5 &
done
#echo $sleeps;
