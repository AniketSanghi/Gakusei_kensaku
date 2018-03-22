#!/bin/bash

branches="ACES ACMS AE BIO BSBE CDC CDTE CESE CELT CELP CMCH CHE CHM CE CGS CS CSE COSE BSE MD DESP ES ECOS ECO ECON EE MCH EEM HSS IME LT DES MDES MET MME MSE MS MSP MATH ME MEC VLFM MTH NET PHY STAT SBER"
add_init="https://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchStudRoll.jsp?selstudrol=&selstuddep="
add_end="&selstudnam="
touch temp.txt
touch Database.txt
touch Stu_Database.txt

echo "|0ROLL NO.|NAME|PROGRAM|DEPARTMENT|HOSTEL|EMAIL|BLOODGROUP|GENDER|COUNTRY|" >>Database.txt

for branch in $branches;
	do 
		
		curl $add_init$branch$add_end -o temp.txt
		no_of_slides=`grep -E "records\s$" temp.txt|grep -Eo "\d+"`
		
		count='0'
		if [[ $no_of_slides ]]; then
			
			while [ $count -le $no_of_slides ]
			do
					curl "https://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchStudRoll.jsp?recpos=${count}&selstudrol=&selstuddep=${branch}&selstudnam=" -o temp.txt
					roll=`grep -E "href.+>(INT)?Y?\d+" temp.txt|grep -Eo ">Y?(INT)?\d+"|grep -Eo "Y?(INT)?\d+"`
					
					for rollno in $roll;
						do
							name='Not Available'
							program="Not Available"
							dept="Not Available"
							hostel="Not Available"
							email="Not Available"
							bloodgroup="Not Available"
							gender="Not Available"
							country="Not Available"
							

							curl "https://oa.cc.iitk.ac.in/Oa/Jsp/OAServices/IITk_SrchRes.jsp?typ=stud&numtxt=${rollno}&sbm=Y" -o temp.txt

							name=`grep -Eo -A1 "Name:" temp.txt|grep -Eov "Name:"|grep -Eo "[a-zA-Z0-9 -/()\.\`\\[]+"`
							program=`grep -Eo -A1 "Program:" temp.txt|grep -Eov "Program:"|grep -Eo "[A-Za-z0-9 ()-\.]+"`
							dept=` grep -Eo -A1 "Department:" temp.txt|grep -Eov "Department:"|grep -Eo "[A-Za-z &\.]+"`
							hostel=`grep -Eo -A1 "Hostel Info:" temp.txt|grep -Eov "Hostel Info:"|grep -Eo "[A-Za-z ,-\d]+"`
							email=`grep -E "E-Mail:" temp.txt|grep -Eo "\">.*iitk.ac.in"|grep -Eo "\w.*"`

							if [[ -z $email ]]
							then 
									email="Not Available"
							fi	

							bloodgroup=`grep -Eo -A1 "Blood Group:" temp.txt|grep -Eov "Blood Group:"|grep -Eo "[A-Za-z +-]+"`
							gender=`grep -Eo -A1 "Gender:" temp.txt|grep -Eov "Gender:"|grep -Eo "[A-Za-z]+"`
							country=`grep -Eo -A1 "CountryOfOrigin:" temp.txt|grep -Eov "CountryOfOrigin:"|grep -Eo "[A-Za-z ]+"`

							echo "|$rollno|$name|$program|$dept|$hostel|$email|$bloodgroup|$gender|$country|" >>Database.txt
							
							
						done
					count=$(($count+12))
					
			done
		fi	
		
	done
column -s"|" -t Database.txt>Stu_Database.txt
touch Student_Database.txt

sort Stu_Database.txt|uniq>Student_Database.txt
rm Database.txt
rm temp.txt
rm Stu_Database.txt
