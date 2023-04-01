#!/bin/bash
#
#######==> OBJ:
####=====> TODO: 	
#========>
XX='clear'
Z='sleep .5'
ZZ='sleep 1.5'
ZZZ='sleep 2.5'

$XX;$ZZ
toilet --metal --gay -f term "			Select Search Engine ....:    ";$Z
toilet -f term --metal "	[1]   ====>    SHODAN   ";$Z
toilet -f term --metal "	[2]   ====>    CENSYS   ";$Z
toilet -f term --metal "	[3]   ====>    ZOOMEYE   ";$Z
toilet -f term --metal "    	[4]   ====>    ALL  ";$Z
toilet -f term --metal "    	[5]   ====>    ALL w/ LIST  ";$Z





read -p " 		>=======>:   " ENGINE;$XX;$ZZ

#===> SHODAN
 if [ $ENGINE == 1 ]; then
#     shodan info
     read -p "Enter Number Of Results To Display  :" LIMIT;$XX;$ZZ
     read -p "Enter Shodan Search Query : " DORK;$XX;$ZZ
     shodan download --limit $LIMIT .tmp/tmp1 $DORK
     gunzip -d .tmp/*.gz;$ZZ
     shodan parse --fields ip_str,port --separator : .tmp/*.json|tee -a results.txt




#===> CENSYS
 elif [ $ENGINE == 2 ]; then
       read -p "Enter Number Of Results To Display  ;" LIMIT;$XX;$ZZ
       read -p "Enter Censys Search Query : " DORK;$XX;$ZZ
       censys search --virtual-hosts EXCLUDE --index-type hosts --fields ip,port --max-records $LIMIT $DORK |tee -a .tmp/tmp1;$ZZZ
       cat .tmp/tmp1|sed 's/:/ /g'|grep -Ew "ip"|sed 's/"//g'|sed 's/ip//g'|sed 's/,//g'|sed 's/ //g'|tee -a results.txt
       rm -rf .tmp/*

#===> ZOOMEYE
 elif [ $ENGINE == 3 ]; then
       read -p "Enter Number Of Results To Display  :" LIMIT;$XX;$ZZ
       read -p "Enter Zoomeye Search Query : " DORK;$XX;$ZZ
       echo "[1]	===>	IP's 
		[2]     ===>	Domains	"
       read -p "Select Results Format ..:  " FORMAT;$XX;$ZZ

       zoomeye search  -type web -num $LIMIT -save=site $DORK ;$ZZZ
       cat *.json|tr "'" '"'|tee -a .tmp/tmp1;$ZZ
	if [ $FORMAT == 1 ]; then
	    jq . .tmp/tmp1|grep "ip" |tr '"' ' '|tr ':' ' '|sed 's/ip/ /g'|sed 's/ //g'|sed 's/,//g'|tee -a results.txt

        elif [ $FORMAT == 2 ]; then
              jq . .tmp/tmp1|grep "site" |tr '"' ' '|tr ':' ' '|sed 's/site/ /g'|sed 's/ //g'|sed 's/,//g'|tee -a results.txt

        fi
       rm -rf *.json
#===> ALL
 elif [ $ENGINE == 4 ]; then
       read -p "Enter Number Of Results To Display  :" LIMIT;$XX;$ZZ
       read -p "Enter Search Query  : " DORK;$XX;$ZZ
       shodan download --limit $LIMIT .tmp/tmp1 $DORK
       gunzip -d .tmp/*.gz;$ZZ
       shodan parse --fields ip_str,port --separator : .tmp/*.json|tee -a results.txt
       rm -rf .tmp/*

       censys search --virtual-hosts EXCLUDE --index-type hosts --fields ip,port --max-records $LIMIT $DORK |tee -a .tmp/tmp1;$ZZZ
       cat .tmp/tmp1|sed 's/:/ /g'|grep -Ew "ip"|sed 's/"//g'|sed 's/ip//g'|sed 's/,//g'|sed 's/ //g'|tee -a results.txt
       rm -rf .tmp/*

       zoomeye search  -type web -num $LIMIT -save=site $DORK ;$ZZZ
       cat *.json|tr "'" '"'|tee -a .tmp/tmp1;$ZZ
       jq . .tmp/tmp1|grep "ip" |tr '"' ' '|tr ':' ' '|sed 's/ip/ /g'|sed 's/ //g'|sed 's/,//g'|tee -a results.txt
       rm -rf .tmp/*
       rm -rf *.json

#===> ALL w/ LIST
 elif [ $ENGINE == 5 ]; then
       toilet --metal -f term '		Enter  LIST'
       read -p '	===> :' LIST;$XX;$ZZ
       read -p "Enter Number Of Results To Display  :" LIMIT;$XX;$ZZ
       
        while IFS= read -r line
        do
        shodan download --limit $LIMIT .tmp/tmp1 $line
        gunzip -d .tmp/*.gz;$ZZ
        shodan parse --fields ip_str,port --separator : .tmp/*.json|tee -a results.txt
        rm -rf .tmp/*

        censys search --virtual-hosts EXCLUDE --index-type hosts --fields ip,port --max-records $LIMIT $line |tee -a .tmp/tmp1;$ZZZ
        cat .tmp/tmp1|sed 's/:/ /g'|grep -Ew "ip"|sed 's/"//g'|sed 's/ip//g'|sed 's/,//g'|sed 's/ //g'|tee -a results.txt
        rm -rf .tmp/*

        zoomeye search  -type web -num $LIMIT -save=site $line ;$ZZZ
        cat *.json|tr "'" '"'|tee -a .tmp/tmp1;$ZZ
        jq . .tmp/tmp1|grep "ip" |tr '"' ' '|tr ':' ' '|sed 's/ip/ /g'|sed 's/ //g'|sed 's/,//g'|tee -a results.txt
        rm -rf .tmp/*
        rm -rf *.json
       done < $LIST



 fi



