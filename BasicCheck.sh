#!/bin/bash
folderName=$1 
exeFile=$2
shift 
shift 
input=$@
currentPath=`pwd`  #Print Working Directory


cd $folderName
make > /dev/null # ignore output of make 
returnVal=$? # store exit code (like in the end of main function)
if [[ $returnVal -gt 0 ]]; then
        echo  "Compilation	Memory leaks	thread race"
	echo  "    FAIL            FAIL             FAIL"
        exit 7 #  0 = good, not 0 = bad
else                                       # ignore output of log file   # run 
	valgrind --leak-check=full --error-exitcode=3 --log-file=/dev/null ./$exeFile <<< $input >> /dev/null
	returnVal=$? # exit code


	if [[ $returnVal -eq 0 ]]; then
        	leaks=0
	else
       		leaks=1
	fi

	valgrind --tool=helgrind --error-exitcode=3 --log-file=/dev/null ./$exeFile <<< $input >> /dev/null
	returnVal=$?


	if [[ $returnVal -eq 0 ]]; then
        	threadRace=0
	else
        	threadRace=1
	fi

	finalCheck=$leaks$threadRace

	if [[ $finalCheck -eq 11 ]]; then
        	echo  "Compilation	Memory leaks	thread race"
		echo "     PASS            FAIL            FAIL"
        	exit 3
	elif [[ $finalCheck -eq 01 ]]; then
        	echo  "Compilation	Memory leaks	thread race"
		echo "     PASS            PASS           FAIL"
        	exit 1
	elif [[ $finalCheck -eq 10 ]]; then
        	echo  "Compilation	Memory leaks	thread race"
		echo "     PASS            FAIL           PASS"
        	exit 2
	else
        	echo  "Compilation	Memory leaks	thread race"
		echo "     PASS            PASS           PASS"
       	 	exit 0
	fi
		
fi

cd $currentPath



