unset CURRENT_BL
unset MAX_BL
unset BR_FILE
unset BL_HIST
CURRENT_BL=$( < /sys/class/backlight/radeon_bl0/brightness)
MAX_BL=$( < /sys/class/backlight/radeon_bl0/max_brightness)
BR_FILE="/sys/class/backlight/radeon_bl0/brightness"
BL_HIST="/home/boss/.backlight_history"

if [ $1 == "get" ]
then
	if [ $2 == "perc" ]
	then
		echo $(expr $CURRENT_BL \* 100 / $MAX_BL)%
	elif [ $2 == "abs" ]
	then
		echo -n $CURRENT_BL
	fi
elif [ $1 == "set" ]
then
	if [ $2 == "+" ]
	then
		CURRENT_BL=$(expr $CURRENT_BL + $3)
	else
		CURRENT_BL=$2
	fi
	if [ $CURRENT_BL -gt $MAX_BL ] 
	then
		echo -n $MAX_BL > $BR_FILE
	elif [ $CURRENT_BL -lt 1 ]
	then
		echo -n 1 > $BR_FILE
	else
		echo -n $CURRENT_BL > $BR_FILE
	fi 
elif [ $1 == "toggle" ]
then
	if [ $CURRENT_BL -eq 0 ]
	then
		if [ -e $BL_HIST ]
		then
			echo $( < $BL_HIST) > $BR_FILE
		else
			echo 1 > $BR_FILE
		fi
	else
		if [ ! -e $BL_HIST ]
		then
			touch $BL_HIST
		fi
		echo $CURRENT_BL > $BL_HIST
		echo 0 > $BR_FILE
	fi
fi
