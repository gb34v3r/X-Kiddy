#!/bin/bash
#
#

XX='clear'
ZZ='sleep 1.5'
ZZZ='sleep 3.5'

$XX;$ZZ
toilet --gay --metal -f term "	How Many Results From Each Search Engine   :"
read -p "		>=====>>	:  " LIMIT




#======> 

 toilet --metal --gay -f term "QUERY ===>  :  "
 read -p "		:" DORK;$XX;$ZZ;$XXX
 zoomeye search  -type web -num $LIMIT -save=ip "$DORK" ;$XXX;$ZZZ
 cat *.json|tr "'" '"'|tee -a .tmp/tmp1;$ZZ
 jq . .tmp/tmp1|grep "site" |tr '"' ' '|tr ':' ' '|sed 's/site/ /g'|sed 's/ //g'|sed 's/,//g'|tee -a .tmp/tmp2
	
 shodan download --limit $LIMIT .tmp/tmp1 "$DORK";$ZZZ
 gunzip -d .tmp/*.gz;$ZZ;$XXX
 shodan parse --fields ip_str,port --separator : .tmp/*.json|tee -a .tmp/tmp2
        
 censys search --virtual-hosts EXCLUDE --index-type hosts --fields ip,port --max-records $LIMIT "$DORK" |tee -a .tmp/tmp1;$ZZZ
 cat .tmp/tmp1|sed 's/:/ /g'|grep -Ew "ip"|sed 's/"//g'|sed 's/ip//g'|sed 's/,//g'|sed 's/ //g'|tee -a .tmp/tmp2

#======>

 $XX;$ZZ
 toilet --metal -f term "Probing Targets For Protocall ...."
 toilet --metal --gay -f term "Results Will Be Saved [appended] To Targets.txt ...."
 cat .tmp/tmp2 | httprobe |tee -a Targets.txt
 $XX;$ZZ
 rm -rf .tmp/*
 rm -rf *.json
 toilet --gay --metal -f term "TARGETING COMPLETE"
