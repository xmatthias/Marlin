#!/bin/bash

sshadress=pi@192.168.1.41
sshport=10022
filepath=Marlin/applet
filename=Marlin.hex

scp -P $sshport $filepath/$filename $sshadress:~/$filename


ssh -p $sshport $sshadress 'avrdude -D -p m2560 -c stk500v2 -P /dev/ttyACM0 -U flash:w:'$filename'; rm '$filename';'

echo "Press q to exit"

read -n1 key

if [ "$ey" == "q" ]; then
	exit 1
fi
