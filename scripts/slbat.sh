#!/bin/sh

pct=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}' `

# time to full
ttf=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "time to full"`
if [ -n "$ttf" ]; then
    #ttf=`echo $ttf | awk -F ":" '{print $2}'`
    #ttf_number=`echo $ttf | awk '{print $1}'`
    #ttf_unit=`echo $ttf | awk '{print $2}' | cut -c 1`
    #ti=" $ttf_number$ttf_unit "
    ti=" "
fi

# time to empty
tte=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep "time to empty"`
if [ -n "$tte" ]; then
    #tte=`echo $tte | awk -F ":" '{print $2}'`
    #tte_number=`echo $tte | awk '{print $1}'`
    #tte_unit=`echo $tte | awk '{print $2}' | cut -c 1`
    #ti=" $tte_number$tte_unit"
    ti=""
fi

#num_pct=`echo $pct | sed 's/%//'`

#if [ -z "$ti" ]; then
#    notify-send " Battery full" "Please un- power cable"
#    echo "full"
#fi

if [ 10 -gt $num_pct ]; then
    echo " $pct $ti"
    # If not already plugged - send notification
    if [[ -n "$tte" ]]; then
        notify-send -u CRITICAL " Battery weak" "Please  power cable"
    fi
    exit 33
elif [ 25 -gt $num_pct ]; then
    echo `echo " $pct $ti" | awk '{$1=$1};1'`
elif [ 50 -gt $num_pct ]; then
    echo `echo " $pct $ti" | awk '{$1=$1};1'`
elif [ 75 -gt $num_pct ]; then
    echo `echo " $pct $ti" | awk '{$1=$1};1'`
else
    echo `echo " $pct $ti" | awk '{$1=$1};1'`
fi
