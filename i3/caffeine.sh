#!/bin/bash

status=`xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -v`
if [ $status == 'false' ];
then
  polybar-msg hook caffeine 2
  xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -T && \
  dunstify 'Caffeine Enabled!'
else
  polybar-msg hook caffeine 1
  xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/presentation-mode -T && \
  dunstify 'Caffeine Disabled!'
fi
