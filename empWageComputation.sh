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

echo "Enter the type of Employement"
echo "1. Full Time"
echo "2. Part Time"
read choice
case $choice in
1) 	calculateFullDayWage
	result=$?
	echo $((result))
	;;
2)	calculatePartTimeWage
	result=$?
	echo $((result))
	;;
*)	echo "Not a valid Input"
esac
