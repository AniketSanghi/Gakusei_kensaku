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
	printf "\e[93m  Enter your '#' separated input as optionnumber~value \n        \e[293;34meg: 1~170110#2~Aniket Sanghi#3~BTech#4~Computer science#5~Hall5, C-208#6~sanghi#7~O\+#8~M#9~india\e[234m\n"
	printf "\e[31m   	The match is not case sensitive match. But take care of format like in hostel name. \e[231m\n"

	read data

	roll=`echo "$data" | grep -Eo "1~[^#]+" | sed 's/^..//g'`
	name=`echo "$data" | grep -Eo "2~[^#]+" | sed 's/^..//g'`
	prog=`echo "$data" | grep -Eo "3~[^#]+" | sed 's/^..//g'`
	dept=`echo "$data" | grep -Eo "4~[^#]+" | sed 's/^..//g'`
	hostel=`echo "$data" | grep -Eo "5~[^#]+" | sed 's/^..//g'`
	email=`echo "$data" | grep -Eo "6~[^#]+" | sed 's/^..//g'`
	bldgrp=`echo "$data" | grep -Eo "7~[^#]+" | sed 's/^..//g'`
	gender=`echo "$data" | grep -Eo "8~[^#]+" | sed 's/^..//g'`
	country=`echo "$data" | grep -Eo "9~[^#]+" | sed 's/^..//g'`

	printf "\e[35m__________________________________________________________________________________________________________________________________________________________________________________________\n"
	printf "|                                                                                                                                            						  |\n"
	printf "|                                                                                                                                            						  |\n"
	printf "|\e[92;1mROLL NO.       NAME          PROGRAM           DEPARTMENT            HOSTEL           E-MAIL         BLOODGRP   GENDER  COUNTRY \e[0m\e[35m                                                         |\n"
	printf "|                                                                                                                                            					    	  |\n"
	printf "\e[35m|_________________________________________________________________________________________________________________________________________________________________________________________|\e[0m\e[93m\n\n"

	if [[ $roll || $name || $prog || $dept  || $hostel  || $email || $bldgrp || $gender || $country ]]
	then
		grep -Ei "\|  $roll[^\|]*\|  $name[^\|]*\|  $prog[^\|]*\|  $dept[^\|]*\|  $hostel[^\|]*\|  $email[^\|]*\|  $bldgrp[^\|]*\|  $gender[^\|]*\|  $country[^\|]*\|" Student_Database.txt| tr -s " " | column -s"|" -t
	fi	
	printf "\n\n\e[31m  Do you want to search for more Students (y/n)\n"
	read runagain
	
	
done