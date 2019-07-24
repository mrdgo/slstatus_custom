#!/bin/sh

raw=`xbacklight -get`
pct=`echo "scale=0; $raw / 1" | bc`
echo " $pct%"
