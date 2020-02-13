#!/bin/bash
calculateFullDayWage(){
	return 160
}

calculatePartTimeWage(){
	return 80
}

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
