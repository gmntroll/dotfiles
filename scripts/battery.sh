#!/bin/sh
LVL_LOW=10
LVL_CRIT=5
BAT_PATH='/sys/class/power_supply/BAT0'
AC_PATH='/sys/class/power_supply/AC0'
CRIT_TIMEOUT=false
while true
do
	BAT_CAP=$( < $BAT_PATH/capacity )
	AC_STATE=$( < $AC_PATH/online )
	if [ $AC_STATE -eq 1 ]; then
		if $CRIT_TIMEOUT
		then
			CRIT_TIMEOUT=false
		fi
		sleep 5m
	else
		if $CRIT_TIMEOUT 
		then
			CRIT_TIMEOUT=false
			$HOME/scripts/lock.sh && systemctl hibernate
		fi
		if [ $BAT_CAP -lt $LVL_LOW ]; then
			if [ $BAT_CAP -gt $LVL_CRIT ]; then
				notify-send -u critical -t 20000 "battery" "low level"
				sleep 2m
			else
				notify-send -u critical -t 20000 "battery" "hibernation after 1 min"
				CRIT_TIMEOUT=true
				sleep 1m
			fi
		else
			sleep 5m
		fi
	fi
done
