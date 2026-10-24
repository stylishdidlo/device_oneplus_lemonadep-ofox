#
# OrangeFox Recovery Project
#
FDEVICE="lemonadep"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
	export FOX_AB_DEVICE=1
	export FOX_VIRTUAL_AB_DEVICE=1
	export OF_VIRTUAL_AB_DEVICE=1
	export FOX_USE_BASH_SHELL=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_NANO_EDITOR=1
	export FOX_ENABLE_APP_MANAGER=1
	export OF_QUICK_BACKUP_LIST="/boot;/data;"
	export OF_KEEP_FORCED_ENCRYPTION=1
	export OF_DISABLE_DM_VERITY=1
	export OF_SCREEN_H=3168
	export OF_STATUS_H=126
	export OF_STATUS_INDENT_LEFT=48
	export OF_STATUS_INDENT_RIGHT=48
	export TARGET_DEVICE_ALT="OnePlus9Pro,lemonadep"
	export OF_MAINTAINER="stylishdidlo"
	export OF_FL_PATH1="/sys/class/leds/vibrator"
else
	if [ -z "$FOX_BUILD_DEVICE" -a -z "$BASH_SOURCE" ]; then
		echo "I: This script requires bash. Not processing the $FDEVICE $(basename $0)"
	fi
fi

