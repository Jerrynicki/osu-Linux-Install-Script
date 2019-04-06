#!/bin/sh

echo "Diese Skript benötigt Superuser-Rechte. Falls du gefragt wirst, gebe dein Passwort unten ein. | This script needs superuser permissions, please enter your password if prompted."
sudo python3 pulse_latency_switcher.py

pulseaudio -k
sleep 2
pulseaudio --start

echo "Fertig! | Done!"
