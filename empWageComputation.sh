#!/bin/bash
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
