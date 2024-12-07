#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

echo "---" | tee -a /tmp/example_bar.log

polybar top &

my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1')
if [[ $my_laptop_external_monitor = *connected* ]]; then
    polybar top2 &
fi
