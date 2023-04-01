#!/bin/bash
#
#======>> API's SHODAN  ZOOMEYE  CENSYS   GOOGLE(CSE)
ZZ='sleep 3'
XX='clear'
XXX="echo '


	'"
$XX;$XXX
toilet --metal --gay -f term "	Which API would you like to configure ...?

	[1] 	>==>	CENSYS   
	
	[2]	>==>	ZOOMEYE
	
	[3]	>==>	SHODAN
	
"
read -p "		==>>	:	" OPTION;$XX;$ZZ
#=======>	CENSYS
if [ $OPTION == 1 ]; then
censys config

#=======>	ZOOMEYE
if [ $OPTION == 2 ]; then
read -p "Enter APIKEY For Zoomeye Acount :     " API
zoomeye -apikey $API

#=======>	SHODAN
if [ $OPTION == 3 ]; then
