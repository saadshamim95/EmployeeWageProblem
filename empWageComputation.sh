#!/bin/bash
checkAttendance(){
	if(( $((RANDOM%2))==0 ))
	then
		return 0
	else
		return 1
	fi
}

calculateFullDayWage(){
	return 160
}

calculatePartTimeWage(){
	return 80
}

days=0
totalWages=0
present=0
totalWorkingHours=0

getWorkingHours(){
	while((count!=20 && totalWorkingHours<100))
	do
		checkAttendance
		res=$?
		if(( $res==1 ))
		then
			
		fi
	done
}

read choice
case $choice in
1)	while((count!=20 && totalWorkingHours<100))
	do
		checkAttendance
		res=$?
		if(( $res==1 ))
		then
			present=$((present+1))
			totalWorkingHours=$((totalWorkingHours+8))
			if((totalWorkingHours>100))
			then
				totalWorkingHours=100
				totalWages=$((20*totalWorkingHours))
			else
				calculateFullDayWage
				totalWages=$(($?+totalWages))
				#echo $totalWages
			fi
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
			totalWorkingHours=$((totalWorkingHours+4))
			calculatePartTimeWage
			totalWages=$(($?+totalWages))
			#echo $totalWages
		fi
		count=$((count+1))
	done
	;;
*)	echo "Enter valid choice"
esac
echo "Employee worked $present days this month"
echo "Total Working hours: $totalWorkingHours"
echo "Total wage of this month: $totalWages"