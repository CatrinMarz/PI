#!/bin/bash

if ! test -e /sys/class/gpio/gpio21; then echo 21 > /sys/class/gpio/export; fi
if ! test -e /sys/class/gpio/gpio20; then echo 20 > /sys/class/gpio/export; fi
if ! test -e /sys/class/gpio/gpio16; then echo 16 > /sys/class/gpio/export; fi

if ! test -e /sys/class/gpio/gpio13; then echo 13 > /sys/class/gpio/export; fi
echo in > /sys/class/gpio/gpio13/direction


echo out > /sys/class/gpio/gpio21/direction
echo 0 > /sys/class/gpio/gpio21/value
echo out > /sys/class/gpio/gpio20/direction
echo 0 > /sys/class/gpio/gpio20/value


echo out > /sys/class/gpio/gpio16/direction
echo 1 > /sys/class/gpio/gpio16/value
sleep 1
echo 1 > /sys/class/gpio/gpio20/value
sleep 1
echo 0 > /sys/class/gpio/gpio16/value
echo 0 > /sys/class/gpio/gpio20/value
echo 1 > /sys/class/gpio/gpio21/value
if grep -q 1 /sys/class/gpio/gpio13/value; then echo 1 > /sys/class/gpio/gpio20/value; fi

sleep 3
echo 0 > /sys/class/gpio/gpio21/value
echo 1 > /sys/class/gpio/gpio20/value
sleep 1

