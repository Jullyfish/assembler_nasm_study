#!/bin/sh
#	test_deque.pas
GRN='\033[0;32m'
RED='\033[0;31m'
YLW='\033[0;33m'
NC='\033[0m' #NoColor
count=1

while read str pat; do
	res=`./mp $str $pat`
	read expect
	if test "$expect" != "$res" ; then 
		echo TEST[${GRN}$count${NC}] [${RED}FAILED${NC}]: $str $pat 
	        echo '	'[${YLW}EXPECTED${NC}]: $expect
		echo '	'["  "${YLW}GOT${NC}"   "]: $res
	else 
	echo TEST[${GRN}$count${NC}] [${GRN}SUCCESS${NC}]: $str $pat [${GRN}RESULT${NC}]: $res 
	fi
	count=$(($count+1))

done<"test.txt"
