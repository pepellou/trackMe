#!/bin/bash

while read line
do
	user=`echo $line | awk 'BEGIN { FS="|" } { print $1 }'`;
	pid=`echo $line | awk 'BEGIN { FS="|" } { print $2 }'`;
	cpu=`echo $line | awk 'BEGIN { FS="|" } { print $3 }'`;
	mem=`echo $line | awk 'BEGIN { FS="|" } { print $4 }'`;
	vsz=`echo $line | awk 'BEGIN { FS="|" } { print $5 }'`;
	rss=`echo $line | awk 'BEGIN { FS="|" } { print $6 }'`;
	tty=`echo $line | awk 'BEGIN { FS="|" } { print $7 }'`;
	stat=`echo $line | awk 'BEGIN { FS="|" } { print $8 }'`;
	start=`echo $line | awk 'BEGIN { FS="|" } { print $9 }'`;
	time=`echo $line | awk 'BEGIN { FS="|" } { print $10 }'`;
	cmd=`echo $line | awk 'BEGIN { FS="|" } { print $11 }'`;

	echo "$start $user $cmd";
done < <(ps aux | tail -n +2 | sort -k 9 | awk '$9 ~ /^[0-9][0-9]:[0-9][0-9]$/ {print $1 "|" $2 "|" $3 "|" $4 "|" $5 "|" $6 "|" $7 "|" $8 "|" $9 "|" $10 "|" substr($0, index($0,$11))}')
