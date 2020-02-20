#!/usr/bin/env bash

# Operations before system is powered off to be rebooted

if [[ $(id -u) != 0 ]]; then echo "Error: Must be run as sudo/root." ; exit 1; fi


# Log system poweroffs
if [[ ! -d /var/log/power-state ]]; then
	mkdir -vp /var/log/power-state
fi
touch /var/log/power-state/$(date -u +%Y-%m-%d-%H%M%S).poweroff

reboot
