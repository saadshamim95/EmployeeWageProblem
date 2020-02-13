#!/bin/bash
echo "************************************"
echo "WELCOME TO EMPLOYEE WAGE COMPUTATION"
echo "************************************"
attendance=$$
checkAttendance(){
	attendance=$((RANDOM%2))
	if((attendance==0))
	then
		#echo "Employee is absent"
		return 0
	else
		#echo "Employee is present"
		return 1
	fi
}

#checkAttendance
wagePerHour=20
fullDayHour=8
calculateFullDayWage(){
	#echo "$((wagePerHour*fullDayHour))"
	return $((wagePerHour*fullDayHour))
}

calculateFullDayWage
#fullDayWage=$?
#echo $fullDayWage
partTimeHour=4
calculatePartTimeWage(){
	#echo "$((wagePerHour*partTimeHour))"
	return $((wagePerHour*partTimeHour))
}

calculatePartTimeWage
#partTimeWage=$?
#echo $partTimeWage

days=0
totalWages=0
present=0

echo "Enter the type of Employement"
echo "1. Full Time"
echo "2. Part Time"
read choice
case $choice in
1) 	while((count!=20))
	do
		checkAttendance
		res=$?
		if(( $res==1 ))
		then
			present=$((present+1))
			calculateFullDayWage
			totalWages=$(($?+totalWages))
			#echo $totalWages
		fi
		count=$((count+1))
	done
	;;
2)	while((count!=20))
	do
		checkAttendance
		res=$?
		if(( $res==1 ))
		then
			present=$((present+1))
			calculatePartTimeWage
			totalWages=$(($?+totalWages))
			#echo $totalWages
		fi
		count=$((count+1))
	done
	;;
*)	echo "Not a valid Input"
esac
echo "Employee worked $present days this month"
echo "Total Wages: $totalWages"
