#! /bin/bash
PS3="Enter any :"
dbs=" mysql information_schema performance_schema"
MYSQL="/mnt/e/back/vicky/mysql_base/bin/mysql"
USER="root"
SOCKET="/tmp/mysql78.sock"




echo "Kindly select on of DB to view the tables in it! "

select DB in mysql information_schema performance_schema
do
	case $DB in
		"mysql")
	    		echo -e "You have selected the $DB database !\n";
			#$(/mnt/e/back/vicky/mysql_base/bin/mysql -uroot -S /tmp/mysql78.sock -e "show tables from $DB" > /mnt/e/back/vicky/mysql_base/mysql_tables.txt ) & 
			#$echo $(xargs -n1 < /mnt/e/back/vicky/mysql_base/mysql_tables.txt)
			#$echo $( /mnt/e/back/vicky/mysql_base/mysql_tables.txt)
			$($MYSQL -u $USER -S $SOCKET -e "show tables from $DB" > mysql_tables.txt); 
			for table in $(< mysql_tables.txt)
			do
				echo "$table"
		  	done
			;;
		"information_schema")
			echo -e "You have selected the $DB database ! \n"
			echo $($MYSQL -uroot -S $SOCKET -e "show tables from $DB") 
			#info= $(grep "$1" info_tables.txt)
			#echo $info;
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
