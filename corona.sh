#!/bin/bash
### Customization:#########
blue="\033[0;34m"
brightblue="\033[1;34m"
cyan="\033[0;36m"
brightcyan="\033[1;36m"
green="\033[0;32m"
brightgreen="\033[1;32m"
red="\033[0;31m"
brightred="\033[1;31m"
white="\033[1;37m"
black="\033[0;30m"
grey="\033[0;37m"
darkgrey="\033[1;30m"
########################
location=`pwd`
tag()
{
	clear   
        echo -e "$brightblue"
        echo " ##################################################################"
        echo "     ____    ___   __     __  ___   ____            _    ___  "
        echo "    / ___|  / _ \  \ \   / / |_ _| |  _ \          / |  / _ \ "
        echo "   | |     | | | |  \ \ / /   | |  | | | |  _____  | | | (_) |"
        echo "   | |___  | |_| |   \ V /    | |  | |_| | |_____| | |  \__, |"
        echo "    \____|  \___/     \_/    |___| |____/          |_|    /_/ "
        echo;echo " ##################################################################"
        echo;echo -e "$white                                                   "$white"ARTH "$brightgreen"X "$white"THE_CYBER_GUY_                    "
}
display()
{	
	tag
	echo;echo -e " $brightgreen CONNECTION $white ESTABLISHED TO $red SPREAD.... "
	echo;echo -e "$green ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "
	echo;echo -e "\t$white GET LIVE UPDATE OF CORONAVIRUS PANDEMIC \n\n\t THE $green ANTI-VIRUS $white FOR $red HUMAN-VIRUS"
	echo;echo -e "\t$white JUST NAME WHICH $red COUNTRY DISTRUCTION $white YOU WANNA SEE"
	echo;echo -e "$green ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ "
	country
}
country()
{
	echo;echo -ne "$white  COUNTRY : "
	read choice
	if [[ $choice == "bye" || $choice == "exit" ]]
	then 
		clear
		exit 0
	
	elif [[  -z "$choice"  ]]
	then
		echo;echo -e "   ITS EMPTY HUH ??? NOW $red CORONA $white IS COMMING FOR YOU .....  " 1>&2
		read y
	else
	while read p
	do
		if [[ $p == $choice ]]
		then
		echo
		echo -e "  YOUR LUCK WORKED !!! THE COUNTRY $cyan $choice $white WAS FOUN IN THE DATABASE" && read y 
		getdata $choice
		fi
	done < <( cat .country.txt | tr [A-Z] [a-z] | tr -d " ")
	echo;echo -e "  ENTERED WRONG COUNTRY NAME HUH ??? $red CORONA $WHITE IS SEARCHING FOR YOU NOW..."; read y
	fi
}
getdata()
{
	echo;echo -e "  GETTING THE $brightcyan DATA $white .... "
	echo;echo -ne "$brightcyan  " 
	for i in `seq 67`
	do
		echo -ne "+"
		sleep 0.01
	done
	echo;echo -e "$white"; curl -o out.txt https://www.worldometers.info/coronavirus/country/$1 2> /dev/null
	echo;echo -e "$white  GOT THE $brightcyan STATS $white !!!!"
	country=$1
	var=$(cat out.txt | grep ">.*</span>$" -o | tr -d "," | grep [0-9]* -o | uniq)
	set -- $var
	echo 
	echo -e "$darkgrey	TO"$white"TAL$brightred		DE"$white"ATHS	$brightgreen	RE"$white"COVERED	" ; echo
	echo -e "$darkgrey	$1	$brightred	$2	$brightgreen	$3		"
	if [[ $country == "india" ]]
	then	
		if [ -e $location/log.txt ]
		then
			:
		else
			echo -e "DATE\t\tCOUNTRY\t\tTOTAL\t\tDEATHS\t\tRECOVERED\tTIME\n"   >> $location/log.txt
		fi
		echo -e "`date +%D`\t$country\t\t$1\t\t$2\t\t$3\t\t`date \"+%l:%M %p\"`" >> $location/log.txt
	fi
	read y
	rm out.txt

}
########
# MAIN #
########
clear
trap "clear;exit 0" 1 2 3 9 11 15  
while :
do
ping -c 1 8.8.8.8 > /dev/null
if [ $? -ne 0 ]
then
	tag
	echo;echo -e "$red  CONID-19 $white NEED INTERNET TO SPREAD... CHECK YOUR $red NETWORK CONNECTION" 
	read y
	clear
	exit 1
fi 
display
done


