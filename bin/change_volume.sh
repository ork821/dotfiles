#!/bin/bash

DEFAULT=`exec pactl get-default-sink`

SINK_ID=`exec pactl list short sinks | grep $DEFAULT | grep -oE '[0-9]{2,3}' | head -1`
VOLUME=`exec pactl get-sink-volume $SINK_ID | grep -Po '\d+(?=%)' | head -n 1`

if [[ $1 == "incr" ]]; then
  VOLUME=$(($VOLUME + 1))
else
  VOLUME=$(($VOLUME - 1))
fi
`exec pactl set-sink-volume $SINK_ID $VOLUME%`
