# X-Kiddy
##
#
======> Description:
 Complete Exploitation Framework.
  * Stage 1: Dork
 	module to 'assist' in creating list for target allocation [etc:dorklist]
 	- Extract keywords from cve templates
 	- User Input Wordlist
 	- DorkMaker
 	
  * Stage 2: Target
	module to 'aquire' IP's, Domains, URL's using third party tools (FREE API REQUIRED)
	- Shodan
	- Zoomeye
	- Censys
		
  * Stage 3: Scan  
 	module to scan target(s) for possible exploitation using Nuclei
	- Nuclei Scanning
	- Results Database
 	 	
  * Stage 4: Exploit


======> PreReq's:
 Additional repo's required for operation.   -see 'Installation:' 
  * python3		* shodan
  * python3-pip		* censys
  * git			* zoomeye
  * golang
  *

  * Tested:
  - Kali

======> Installation:
 Exe these cmd's from konsole as root from inside repo dir
...
  $: sudo chmod +x *.sh
  $: sudo ./Install.sh



