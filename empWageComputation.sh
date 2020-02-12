#!/bin/bash
wagePerHour=20
fullDayHour=8
calculateFullDayWage(){
	#echo "$((wagePerHour*fullDayHour))"
	return $((wagePerHour*fullDayHour))
}

calculateFullDayWage
fullDayWage=$?
echo "$fullDayWage"
