#!/bin/bash

xinput list

device=16
state=`xinput list-props "$device" | grep "Device Enabled" | grep -o "[01]$"`

if [ "$state" -eq '1' ];then
  xinput --disable "$device"
else
  xinput --enable "$device"
fi
