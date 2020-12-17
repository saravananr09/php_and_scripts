for i in `/home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -e "show processlist" | awk '/select/ {print $1}'` ; do /home/saravanan/mysql-base/bin/mysql -uroot -S /tmp/mysql06.sock -e "KILL $i;"; done

