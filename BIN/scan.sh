#!/bin/bash
#
#>===> Nuclei Scan Module :
#    ||=> Scan List of Target IP's / Domains for Exploitable Hosts
#		* Collect Resuls in Database
#		* Index Vuln Hosts to pass to Exploit Module
#		* Database User Functions: print  clear  add  remove
#      ||=> CVE YEAR
#	  |-->2022
#	  |-->2021
#	  |-->2020
#      ||=> CVE TYPE
#         |--> VULNERABILITIES
#	  |--> TECHNOLOGIES
#	  |--> EXPOSED PANELS
#	  |--> MISCONFIGURATIONS 
#      ||=> WEBAPP
#	  |--> wordpress	|--> drupal
#	  |--> apache		|--> cisco
#	  |--> joomla		|--> oracle
#=============================================
ZZ='sleep 1.5'
ZZZ='sleep 3.5'
XX='clear'
XXX="echo '
	
				
	
	'"
$XX;$ZZ;$XXX
toilet --metal --gay -f digital "	>>====>	ScanR Module <=====< 	";$XXX;$ZZ
toilet --gay -f term "
	[1]  ||=> CVE YEAR
	  	|--> 2022
	  	|--> 2021
	  	|--> 2020
		|--> ALL
	
	[2]  ||=> CVE TYPE
         	|--> VULNERABILITIES
	  	|--> TECHNOLOGIES
	  	|--> EXPOSED PANELS
	  	|--> MISCONFIGURATIONS 
	
	[3]  ||=> WEBAPP
	  	|--> wordpress
	  	|--> apache		
	  	|--> joomla		
		|--> drupal
		|--> cisco
		|--> oracle
"
read -p "			>==>:  " SCAN;$XX;$ZZ;$XXX
read -p "	Enter TARGETS list .... :    " LIST;$XX;$ZZ;$XXX


#====>  CVE YEAR	2022 2021 2020
#config:
 if [ $SCAN == 1 ]; then
     toilet --metal -f term "
    [1]  >>==>	2022
    [2]  >>==>	2021
    [3]  >>==>	2020
    [4]  >>==>	ALL
      "
     read -p "		>===>:  " YEAR
  if [ $YEAR == 1 ]; then
#       echo "GOOD"
        ./BIN/nuclei -l $LIST -t CVES/2022/TEMPLATES/ -severity critical -config .config.yaml
  elif [ $YEAR == 2 ]; then
        echo "BETTER"
  elif [ $YEAR == 3 ]; then
	echo "BEST"
  elif [ $YEAR == 4 ]; then
	./BIN/nuclei -l $LIST -t CVES/2022/TEMPLATES/,CVES/2021/TEMPLATES/,CVES/2020/TEMPLATES/ -severity critical -config .config.yaml
  fi






#====>  XPLOIT TYPE		VULNS  TECHNO  PANELS  MISCFG	
#config:
 elif [ $SCAN == 2 ]; then
    toilet --metal -f term "
    [1]  >>==>  VULNERABILITIES
    [2]  >>==>  TECHNOLOGIES
    [3]  >>==>  XPOSED PANELS
    [4]  >>==>  MISCONFIGURATION
	"
	read -p "	>==>:  " TYPE
  if [ $TYPE == 1 ]; then
	echo "shittin"
  elif [ $TYPE == 2 ]; then
	echo "BIG SHITTIN"
  elif [ $TYPE == 3 ]; then
	echo "poopin"
  elif [ $TYPE == 4 ]; then
	echo "BIG DICKIN"
  fi

 fi




