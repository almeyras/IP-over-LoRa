#!/bin/bash
echo
echo 'Adjusting GPIO for transmission (M0=0, M1=0)...'
echo "22" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio22/direction
echo "0" > /sys/class/gpio/gpio22/value
echo "27" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio27/direction
echo "0" > /sys/class/gpio/gpio27/value
sleep 1
#echo "27" > /sys/class/gpio/unexport
#echo "22" > /sys/class/gpio/unexport


echo
echo 'Available serial ports:'
ls -l /dev/serial*
echo
echo 'Attempting to restart tncattach:'
killall tncattach
tncattach /dev/ttyAMA0 115200 -d --noipv6 --noup --mtu 220
ifconfig tnc0 10.0.0.1 pointopoint 10.0.0.2
echo
echo 'IP configuration for your serial modem:'
ip a s tnc0
echo