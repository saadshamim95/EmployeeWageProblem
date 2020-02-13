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
read choice
case $choice in
1)	while((count!=20))
	do
		checkAttendance
		res=$?
		if(( $res==1 ))
		then
			present=$((present+1))
			calculateFullDayWage
			totalWages=$(($?+totalWages))
			echo $totalWages
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
			echo $totalWages
		fi
		count=$((count+1))
	done
	;;
*)	echo "Enter valid choice"
esac
echo "Employee worked $present days this month"