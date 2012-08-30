#!/bin/bash

function setUp {
	theCommand='src/scan.sh';
}

function testEachLineHasAtLeast3Columns {
	while read line
	do
		numFields=`echo $line | awk '{print NF}'`;
		assertGreaterThan 2 $numFields $FUNCNAME
	done < <($theCommand)
}

function testFirstColumnIsHour {
	while read line
	do
		firstField=`echo $line | awk '{print $1}'`;
		assertMatches "^[0-9][0-9]:[0-9][0-9]$" $firstField
	done < <($theCommand)
}
