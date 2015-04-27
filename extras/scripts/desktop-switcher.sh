#!/bin/bash
cur=$(wmctrl -d|cut -d':' -f 3)
if [[ $cur == " 0,0  WA" ]];then
	echo "Switching to desktop 1"
	wmctrl -o 1920,0
else
	echo "Switching to desktop 0"
	wmctrl -o 0,0
fi
