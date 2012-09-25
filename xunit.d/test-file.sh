#!bin/bash

function testFile {
	. $1
	while read testFunction
	do
		setUp
		doTest $testFunction
	done < <(grep 'function test' $1 | awk '{ print $2 }')
}

function doTest {
	countTest
	current_test=$1
	error="no"
	$1
	if [ "$error" = "no" ]
	then
		printColorized green "$current_test passes"
	fi
}

function printResults {
	echo
	if [ $failedAsserts = 0 ]
	then
		printColorized green "OK ($numTests tests, $numAsserts assertions)"
	else
		printColorized red "FAILURES!"
		printColorized red "Tests: $numTests, Assertions: $numAsserts, Failures: $failedAsserts."
	fi
}

