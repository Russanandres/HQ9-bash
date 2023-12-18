#!/bin/bash

#
#		HQ9+ interpreter on bash. Made by Russanandres 2023
#		All sources are avialible on my official github:
#
#		https://github.com/Russanandres/HQ9-bash
#

read input														# Read input

for (( i=0; i<${#input}; i++ )); do 												# Do cycle: read character by character and put in in variable
	case ${input:$i:1} in														# Grep character from previous variable
		"H"|"h" ) echo "Hello world!";;													# Input "H" - print "Hello world!"
		"Q"|"q" ) echo $input;;														# Input "Q" - print user input
		"9"		) for i in $(seq 99 -1 1); do 											# Cycle from 99 to 1 with -1 steps 
					if [ "$i" != "1" ]; then postfix=bottles; else postfix=bottle;fi 						# If number equals 1; then changing word prefix 
					echo "$i $postfix of beer on the wall, $i $postfix of beer."							# Echo output

					drain=$(($i-1))													# Calculating bottle - 1
					if [ "$drain" == "0" ]; then drain="no more"; postfix=bottles
					elif [ "$drain" == "1" ];then postfix=bottle; else i=$drain;fi 							# If bottle = 0; changing text AND if bottle = 1; changing word prefix
					echo -e "Take one down and pass it around, $drain $postfix of beer on the wall.\n"				# Echo output
			  	done															# Finish cycle
				  echo "No more bottles of beer on the wall, no more bottles of beer."
				  echo "Go to the store and buy some more, 99 bottles of beer on the wall.";;						# Echo last final lines
		"C"|"c"	) let counter=counter+1;;												# Addition counter by 1
		"+"		) let 1/0;;													# Device one by zero
		*		) echo "Syntax error!";;											# Syntax error! User typed wrong command
	esac																# Closing grep process
done																# Exit from loop

exit															# Exit program
