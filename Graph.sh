#!/bin/bash
filename="/var/www/html/temperatur1.rrd"
rrdtool graph - \
--imgformat 'PNG' \
--width 900 \
--height 450 \
--start -1hour \
--end now \
--vertical-label "grad Celsius" \
--alt-autoscale \
--title Temperatur \
DEF:temp1=$filename:temp1:AVERAGE \
AREA:temp1#CCCCFF: \
LINE1:temp1#0000FF:'Temperatur DS18B20' \
GPRINT:temp1:MIN:"Min\\: %3.2lf °C " \
GPRINT:temp1:MAX:"Max\\: %3.2lf °C " \
GPRINT:temp1:AVERAGE:"Avg\\: %3.2lf °C " \
GPRINT:temp1:LAST:"Aktuell\\: %3.2lf °C "


