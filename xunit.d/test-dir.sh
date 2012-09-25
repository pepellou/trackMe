#!bin/bash

function testDir {
	ls -l $1 | awk '{ print $8 }' | grep ".sh$"
}
