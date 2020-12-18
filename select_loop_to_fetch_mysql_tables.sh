#! /bin/bash
set -x
PS3="Enter any of the above any number : "
dbs=" mysql information_schema performance_schema"
MYSQL="/home/saravanan/mysql-base/bin/mysql"
USER="root"
SOCKET="/tmp/mysql06.sock"




echo "Kindly select on of DB to view the tables in it! "

select DB in mysql information_schema performance_schema
do
        case $DB in
                "mysql")
                        echo -e "You have selected the $DB database !\n"
			#$( /home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -e 'show tables from mysql' > mysql_tables)|grep 
                        $($MYSQL -u $USER -S $SOCKET -e 'show tables from mysql' > mysql_tables.txt 2>tab.err ) | cat mysql_tables.txt 
                        ;;
                "information_schema")
                        echo "You have selected the $DB database !"
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














