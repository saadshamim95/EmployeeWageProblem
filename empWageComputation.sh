#!/bin/bash
echo "************************************"
echo "WELCOME TO EMPLOYEE WAGE COMPUTATION"
echo "************************************"
attendance=$$
checkAttendance(){
	attendance=$((RANDOM%2))
	if((attendance==0))
	then
		return 0
	else
		return 1
	fi
}

wagePerHour=20
fullDayHour=8
calculateFullDayWage(){
	return $((wagePerHour*fullDayHour))
}

partTimeHour=4
calculatePartTimeWage(){
	return $((wagePerHour*partTimeHour))
}

days=0
totalWages=0
present=0
totalWorkingHours=0
count=0

declare -a dailyWage

getWorkingHours(){
	hours=$1
	while((count!=20 && totalWorkingHours<100))
	do
		checkAttendance
		res=$?
		if(($res==1))
		then
			present=$((present+1))
			totalWorkingHours=$((totalWorkingHours+hours))
			if((totalWorkingHours>100))
			then
				hours=$(( hours-$((totalWorkingHours-100)) ))
				dailyWage[count]=$((hours*wagePerHour))
				totalWorkingHours=100
				return
			else
				dailyWage[count]=$((hours*wagePerHour))
			fi
		else
			dailyWage[count]=0
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

echo "Daily Wage this month:"
for((i=0;i<${#dailyWage[@]};i++))
do
	printf  "Day %02d: ${dailyWage[$i]}\n" "$((i+1))"
done
echo ""
echo "Employee worked $present days this month"
echo "Total Working hours: $totalWorkingHours"
echo "Total wage of this month: $totalWages"