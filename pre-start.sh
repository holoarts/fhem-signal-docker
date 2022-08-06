#!/bin/bash
#$Id:$

SCRIPTVERSION="0.1"
# Author: Holoarts
# License: GPL
#start script for signal-cli within fhem docker



service dbus start
echo -n "Waiting for dbus to become ready."
    WAIT="service dbus status | grep -i 'dbus is running'"
    echo $WAIT
    CHECK=`$WAIT`
		while [ -z "$CHECK" ]
		do
			echo -n "."
			sleep 1
            CHECK=`$WAIT`
            echo $CHECK
		done
	echo "($CHECK), running"

echo "Starting signal_cli"
chown fhem.fhem /var/lib/signal-cli                               
sudo -u fhem /opt/signal/bin/signal-cli --config /var/lib/signal-cli daemon --system  >/var/log/signal.log 2>/var/log/signal.err &
echo -n "Waiting for signal-cli to become ready."
    WAIT='grep -i "DBus daemon running" /var/log/signal.err' 
    CHECK=`grep -i "DBus daemon running" /var/log/signal.err`
		while [ -z "$CHECK" ]
		do
			echo -n "."
			sleep 1
            CHECK=`grep -i "DBus daemon running" /var/log/signal.err`
		done
	echo "($CHECK), running"

 
 


