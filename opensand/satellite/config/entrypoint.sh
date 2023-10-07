#!/bin/bash
service dbus start
service avahi-daemon start
opensand_interfaces
ip route add 192.168.30.0/24 via 172.20.0.4
ip route add 192.168.0.0/24 via 172.20.0.3
ip route add 192.168.15.0/24 via 172.20.0.3
sand-collector -b
sand-daemon
xvfb-run sand-manager -i
