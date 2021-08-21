#!/bin/bash

# Executed by conky (see conkyrc) to help determine which temp readout in /sys
# belongs to which device, and add labels accordingly.
#
# In this instance, two AMD GPUs share the label "amdgpu", so extra steps are 
# added to discern which card is which.
#
# No noticable performance impact using this script, on a 3700X.


target=$@
device=""
GPU_FREQ="0"
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


getTemp () {
	deviceTemp=$(cat ${deviceMap[$device]}/temp1_input)
	echo $(echo $deviceTemp | cut -c-2)
}


## only works for RX570 atm
getGPUFreq() {
	GPU_FREQ=$(awk '{printf "%.2f",$1/1000000000; exit}' /sys/class/drm/card0/device/hwmon/hwmon2/freq1_input)
	echo $GPU_FREQ
}


## only works for RX570 atm
getGPUFreqPercent () {
	deviceFreq=$(cat /sys/class/drm/card0/device/hwmon/hwmon2/freq1_input)
	deviceBaseFreq=1168000000
	percentage=$(bc -l <<< "($deviceFreq/$deviceBaseFreq)*100")
	echo $(echo $percentage | cut -d '.' -f1)
}


case $target in
	"3700X")
		device="k10temp"
		temp=$(getTemp)
		echo "$temp"C
		;;
	"RX 570")
		device="gcn"
		temp=$(getTemp)
		freq=$(getGPUFreq)
		freqPercent=$(getGPUFreqPercent)
		echo "$temp"C '|' "$freq"GHz '|' "$freqPercent"% 
		;;
	"5700XT")
		device="navi"
		echo $(getTemp)
		;;
	*)
esac


#echo "${!deviceMap[@]}"
#echo "${deviceMap[@]}"
