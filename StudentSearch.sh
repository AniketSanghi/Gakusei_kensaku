#!/bin/bash
clear
printf "\e[34m____________________________________________________________________________________________________________________________________________________________________________________________________________\e[234m\n"
printf "\e[34m|                                                                                                                                            																|\e[234m\n"
printf "\e[34m|                                                                                                                                            																|\e[234m\n"
printf "|                                                                         \e[1;35m GAKUSEI KENSAKU \e[1;235;93m(STUDENT SEARCH) \e[5;21;293;36m- IIT-K \e[0m                                                                                       \e[34m|\n"
printf "\e[34m|                                                                                                                                            																|\e[234m\n"
printf "\e[34m|__________________________________________________________________________________________________________________________________________________________________________________________________________|\e[234m\n\n"
runagain='y'
while [ $runagain = 'y' ]
do
	printf "\e[31m	Search Category:\e[231m\n\n"
	printf "\e[96m	1.	Roll No.\e[296m\n"
	printf "\e[96m	2.	Name\e[296m\n"
	printf "\e[96m	3.	Program\e[296m\n"
	printf "\e[96m	4.	Department\e[296m\n"
	printf "\e[96m	5.	Hostel\e[296m\n"
	printf "\e[96m	6.	E-mail\e[296m\n"
	printf "\e[96m	7.	BloodGroup\e[296m\n"
	printf "\e[96m	8.	Gender\e[296m\n"
	printf "\e[96m	9.	Country\e[296m\n\n"
	printf "\e[93m  Enter your input as {optionnumber}.{value} \n        \e[293;34meg: 1.170110 (or) 2.Aniket  Sanghi (or) 3.BTech (or) 4.physics (or) 5.Hall5, C-208 (or) 6.sanghi (or) 7.O\+ (or) 8.M (or) 9.india\e[234m\n"
	printf "\e[31m   	The match is not case sensitive match. But take care of format like in hostel name. \e[231m\n"

	read data
	b=`echo $data | grep -Eo "^\d"`
	c=`echo $data | sed 's/^..//g'`
	echo $b , $c 
	printf "\e[35m__________________________________________________________________________________________________________________________________________________________________________________________\n"
	printf "|                                                                                                                                            						  |\n"
	printf "|                                                                                                                                            						  |\n"
	printf "|\e[92;1mROLL NO.            NAME                         PROGRAM               DEPARTMENT               HOSTEL                  E-MAIL                        BLOODGROUP      GENDER     COUNTRY \e[0m\e[35m|\n"
	printf "|                                                                                                                                            					    	  |\n"
	printf "\e[35m|_________________________________________________________________________________________________________________________________________________________________________________________|\e[0m\e[93m\n\n"

	if [[ $b = "1" ]]
	then
		grep -Ei "^$c" Student_Database.txt
	elif [[ $b = "7" || $b = "9" || $b = "5" || $b = "3" || $b = "4" ]]
	then
		grep -Ei "$c" Student_Database.txt
	elif [[ $b = "6" ]]
	then		
		grep -Ei "$c@iitk\.ac\.in" Student_Database.txt
	elif [[ $b = "2" ]]
	then		
		grep -Ei "^(INT)?Y?\d+\s+$c" Student_Database.txt
	elif [[ $b = "8" ]]
	then		
		grep -Ei "@iitk\.ac\.in\s+[A-Z+-]+\s+$c" Student_Database.txt
	else
		echo "Wrong format"
							
	fi
	
	printf "\n\n\e[31m  Do you want to search for more Students (y/n)\n"
	read runagain
	
	
done