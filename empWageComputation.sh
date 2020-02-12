#!/bin/bash
wagePerHour=20
partTimeHour=4
calculatePartTimeWage(){
	#echo "$((wagePerHour*partTimeHour))"
	return $((wagePerHour*partTimeHour))
}

calculatePartTimeWage
partTimeWage=$?
echo $partTimeWage
