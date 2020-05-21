#!/bin/bash

# Executed by conky (see conkyrc) to help determine which temp readout in /sys
# belongs to which device, and add labels accordingly.
#
# In this instance, two AMD GPUs share the label "amdgpu", so extra steps are 
# added to discern which card is which.
#
# No noticable performance impact using this script, on a 3700X.


target=$@
hwmonPath="/sys/class/hwmon"
declare -A deviceMap

for hwmon in $(ls -1 $hwmonPath); do
	path=$hwmonPath/$hwmon

	if [[ -e $path/name ]]; then
		name=$(cat "$path/name")
		if [[ $name != "amdgpu" ]]; then
			deviceMap[$name]=$path
		else
			if [[ -e $path/temp2_input ]]; then
				pseudo="navi"
				deviceMap[$pseudo]=$path
			else
				pseudo="gcn"
				deviceMap[$pseudo]=$path
			fi
		fi
	fi
done


case $target in
	"3700X")
		temp=$(cat ${deviceMap["k10temp"]}/temp1_input)
		echo $(echo $temp | cut -c-2)
		;;
	"RX 570")
		temp=$(cat ${deviceMap["gcn"]}/temp1_input)
		echo $(echo $temp | cut -c-2)
		;;
	"5700XT")
		temp=$(cat ${deviceMap["navi"]}/temp1_input)
		echo $(echo $temp | cut -c-2)
		;;
	*)
esac


#echo "${!deviceMap[@]}"
#echo "${deviceMap[@]}"
