#!/bin/bash
declare -A dailyWage
Attendance(){
	if(( $((RANDOM%2))==0 ))
	then
		return 0
	else
		return 1
	fi
}

totalWages=0
count=0

geWorkingHours(){
	wage=$1
	while((count!=20))
	do
		Attendance
		result=$?
		if(($result==1))
		then
			dailyWage[$count]=$wage
		else
			dailyWage[$count]=0
		fi
		count=$((count+1))
	done
}

geWorkingHours 160

echo "Daily Wage"
for((i=0;i<20;i++))
do
	echo -n "${dailyWage[$i]} "
done