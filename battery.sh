#!/bin/bash
BAT_CAP=/sys/class/power_supply/BAT0/capacity
while true
do
	if [ $(< $BAT_CAP) -lt 10 ]
	then
		notify-send -u critical -t 20000 "battery" "low level"
	fi
	sleep 5m
done
