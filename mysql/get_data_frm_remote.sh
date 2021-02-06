
#!/bin/bash

ips=($(cat ip_list.txt))
#set -x

for i in "${!ips[@]}"
do
	echo "$i ... ${ips[$i]}"
done





