#!/bin/bash
service dbus start
service avahi-daemon start
opensand_interfaces
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
ip route add 192.168.30.0/24 via 172.20.0.2
ip route add 192.168.0.0/24 via 192.168.35.3
ip route add 192.168.15.0/24 via 192.168.35.3
sand-daemon -f
