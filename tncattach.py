#!/usr/bin/python
# -*- coding: UTF-8 -*-

import RPi.GPIO as GPIO
import os

M0 = 22
M1 = 27

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(M0,GPIO.OUT)
GPIO.setup(M1,GPIO.OUT)

GPIO.output(M0,GPIO.LOW)
GPIO.output(M1,GPIO.LOW)

print('\nAvailable serial ports:')
os.system('ls -l /dev/serial*')
print('\nAttempting to restart tncattach:')
os.system('killall tncattach')
os.system('tncattach /dev/ttyAMA0 115200 -d --noipv6 --noup --mtu 220')
os.system('ifconfig tnc0 10.0.0.2 pointopoint 10.0.0.1')
print('\nIP configuration for your serial modem:')
os.system('ip a s tnc0')
print('\n')