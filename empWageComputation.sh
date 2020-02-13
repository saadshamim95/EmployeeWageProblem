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

#calculateFullDayWage
#fullDayWage=$?
#echo $fullDayWage
partTimeHour=4
calculatePartTimeWage(){
	#echo "$((wagePerHour*partTimeHour))"
	return $((wagePerHour*partTimeHour))
}

#calculatePartTimeWage
#partTimeWage=$?
#echo $partTimeWage

days=0
totalWages=0
present=0
totalWorkingHours=0

declare -A dailyWage

getWorkingHours(){
	hours=$1
	while((count!=20 && totalWorkingHours<100))
	do
		checkAttendance
		res=$?
		if(( $res==1 ))
		then
			present=$((present+1))
			totalWorkingHours=$((totalWorkingHours+hours))
			if((totalWorkingHours>100))
			then
				hours=$(( hours-$((totalWorkingHours-100)) ))
				dailyWage[$count]=$((hours*wagePerHour))
				totalWorkingHours=100
				return
			else
				dailyWage[$count]=4((hours*wagePerHour))
			fi
		fi
		count=$((count+1))
	done
}

echo "Enter the type of Employement"
echo "1. Full Time"
echo "2. Part Time"
read choice
case $choice in
1)	getWorkingHours fullDayHour 
	totalWages=$((totalWorkingHours*wagePerHour))
	;;
2)	getWorkingHours partTimeHour
	totalWages=$((totalWorkingHours*wagePerHour))
	;;
*)	echo "Enter valid choice"
esac

echo "Employee worked $present days this month"
echo "Total Working hours: $totalWorkingHours"
echo "Total wage of this month: $totalWages"
echo "Daily Wage this month:"
for((i=0;i<20;i++))
do
	echo -n "${dailyWage[$i]} "
done
