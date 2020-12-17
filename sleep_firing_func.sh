#! /bin/bash

read -p "Enter the query count : " n
read -p "Enter the time U want : " t
read -p "Enter the chunk U want: " c


fire()
{
        for sleeps in $(eval echo "{1..$n}")
        do
		echo $sleeps;
		$(/home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -e "select sleep(${t})" > /home/saravanan/mysql-base/scripts/query_func.txt 2> /home/saravanan/mysql-base/scripts/quer.err) &
		
        done
}

i=1;
while [ $i -le $c ]; do
        echo "sleep chunk $i";
        fire
        sleep 5
        ((i++))
done

