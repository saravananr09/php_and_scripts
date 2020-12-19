#! /bin/bash
PS3="Enter any :"
dbs=" mysql information_schema performance_schema"
MYSQL="/mnt/e/back/vicky/mysql_base/bin/mysql"
USER="root"
SOCKET="/tmp/mysql78.sock"

mysql_db=('mysql' 'information_schema' 'performance_schema')

echo "Kindly select on of DB to view the tables in it! "

select DB in ${mysql_db[*]}
do
	case $DB in
		"mysql")
	    		echo -e "You have selected the $DB database !\n";
			$($MYSQL -u $USER -S $SOCKET -e "show tables from $DB" > mysql_tables.txt); 
			for table in $(< mysql_tables.txt)
			do
				echo "$table"
		  	done
			$(rm -rf mysql_tables.txt)
			;;
		"information_schema")
			echo -e "You have selected the $DB database ! \n"
			echo $($MYSQL -uroot -S $SOCKET -e "show tables from $DB") 
			for word in $(< info_tables.txt)
			do
				    echo "$word"
			    done
			;;
		"performance_schema")
			echo "You have selected the $DB database!"
			;;
		*)
			echo "As of now we are serving following DBs only : $dbs"
			break
			;;
	esac			
done
