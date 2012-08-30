#!/bin/bash

function scan {
	while read line
	do
		user=`extract "$line" 1`
		start=`extract "$line" 9`
		cmd=`extract "$line" 11`
	
		echo "$start $user $cmd";
	done < <(getAllProcesses | parse)
}

function extract {
	echo $1 | awk -v i=$2 'BEGIN { FS="|" } { print $i }'
}

function getAllProcesses {
	ps aux | tail -n +2 | sort -k 9
}

function parse {
	awk '$9 ~ /^[0-9][0-9]:[0-9][0-9]$/ {print $1 "|" $2 "|" $3 "|" $4 "|" $5 "|" $6 "|" $7 "|" $8 "|" $9 "|" $10 "|" substr($0, index($0,$11))}'
}

scan
