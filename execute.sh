#!/bin/bash

#get commands number
NC=`cat listfile | wc -l`

#Delete finalret if exist
if [ -e finalret.html ]
	then
		rm finalret.html
fi

#Execute command from listfile
I=1
while [ $I -le $NC ]
	do
		COMMAND=`sed -n ${I}p listfile`
		$COMMAND > ret
		if [ $? -eq 0 ]
			then
				echo -e "<tr><td>${COMMAND}</td><td>`cat ret`</td></tr>" >> finalret.html
		fi
		I=`expr $I + 1`
	done
rm ret
exit 0 
		
