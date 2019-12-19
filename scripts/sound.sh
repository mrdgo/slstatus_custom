#!/bin/sh

pct=`pactl list sinks | grep -A 13 'Sink #0' | grep Volume | awk 'NR==1' | awk -F "/" '{print $2}' | awk '{print $1}'`

mute=`pactl list sinks | grep -A 13 'Sink #0' | grep Mute | awk -F ":" '{print $2}'`

if [ $mute = "yes" ]; then
    echo " mute"
else
    num=`echo $pct | sed 's/%//'`

    if [ 50 -gt $num ]; then
        echo " $pct"
    else
        echo " $pct"
    fi
fi

