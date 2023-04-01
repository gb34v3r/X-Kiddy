#!/bin/bash
#
ZZ='sleep 1'
ZZZ='sleep 3'
XX='clear'
$XX
toilet --metal -f future " 	X=Kiddy Framework";$ZZ
toilet --gay -f digital "				    by: b34v3r";$ZZ
toilet --metal -f term "	
			SELECT  MODULE  :


	[1]	======>>	TARGET
	[2]	======>>	SCAN
	[3]	======>>	EXPLOIT

	[A]	======>>	AUTO X
	[E]	======>>	EXIT

	
"
read -p "	--->:  " OPTION
$XX;$ZZ
 if [ $OPTION == 1 ]; then

	./BIN/target.sh



 elif [ $OPTION == 2 ]; then
	./BIN/scan.sh

 elif [ $OPTION == 3 ]; then
	./BIN/exploit.sh



 elif [ $OPTION == 4 ]; then
	./BIN/exploit.sh


 elif [ $OPTION == E ]; then
	exit

 elif [ $OPTION == A ]; then



fi
