LAST_STATE=$( < .touchpad )

if [ $LAST_STATE -eq 0 ] 
then
	xinput enable "FocalTechPS/2 FocalTech Touchpad"
	echo 1 > .touchpad
else
	xinput disable "FocalTechPS/2 FocalTech Touchpad"
	echo 0 > .touchpad
fi
