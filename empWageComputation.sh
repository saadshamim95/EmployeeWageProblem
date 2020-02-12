#!/bin/bash
echo "************************************"
echo "WELCOME TO EMPLOYEE WAGE COMPUTATION"
echo "************************************"
attendance=$$
checkAttendance(){
	attendance=$((RANDOM%2))
	if((attendance==0))
	then
		echo "Employee is absent"
	else
		echo "Employee is present"
	fi
}

checkAttendance
wagePerHour=20
fullDayHour=8
calculateFullDayWage(){
	#echo "$((wagePerHour*fullDayHour))"
	return $((wagePerHour*fullDayHour))
}

calculateFullDayWage
fullDayWage=$?
echo $fullDayWage
partTimeHour=4
calculatePartTimeWage(){
	#echo "$((wagePerHour*partTimeHour))"
	return $((wagePerHour*partTimeHour))
}

calculatePartTimeWage
partTimeWage=$?
echo $partTimeWage
