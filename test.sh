#OUTPUT=$(ls -1)
#echo "${OUTPUT}"

disk_usage=$(du -sh )

echo "${disk_usage}"

if(${disk_usage} | awk{$0}> 3 )
	echo "success";
	echo "succeed";
