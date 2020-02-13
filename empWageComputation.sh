#!/bin/bash
declare -a dailyWage
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

getWorkingHours(){
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

getWorkingHours 160

echo "Daily Wage"
for((i=0;i<20;i++))
do
	printf  "Day %02d: ${dailyWage[$i]}\n" "$((i+1))"
done