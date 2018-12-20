LAST_STATE=$( xinput list-props "FocalTechPS/2 FocalTech Touchpad" | grep "Device Enabled" | awk '{print $4}' )

if [ $LAST_STATE -eq 0 ] 
then
	xinput enable "FocalTechPS/2 FocalTech Touchpad"
else
	xinput disable "FocalTechPS/2 FocalTech Touchpad"
fi
