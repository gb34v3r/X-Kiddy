#!/bin/bash
#
XX="clear"
ZZ="sleep 2.5"


$XX;$ZZ
echo "		Install required apps for this program?		"
echo "		Y=YES else=EXIT ======>:  "
read CHECK
if [ $CHECK == Y ]; then
        $XX;$ZZ;$XXX



#======> INSTALL REQUIRED APPS
#       -python3         -censys   -golang     -shodan    -nuclei
#       -python3-pip     -zoomeye  -toilet     -httprobe   -git	

	echo "Installing From APT "
        apt-get update -y && apt-get upgrade -y;$XX;$ZZ
        apt-get install -y python3 python3-pip golang toilet git python3-censys python3-shodan httprobe 
	$XX;$XXX
	echo "Installing Python Modules .....";$XX;$ZZ
        python3 -m pip install zoomeye;$XX;$ZZ
	echo "Installing Nuclei Scanner ....";$ZZ
        go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
	$XX;$ZZ



        echo "Installation Complete !!"
else
    exit
