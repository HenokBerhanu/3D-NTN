#!/bin/bash
#
# Configure iptables in UPF
#
iptables -t nat -A POSTROUTING -o eth0  -j MASQUERADE
iptables -I FORWARD 1 -j ACCEPT
#ip route add 192.168.30.0/24 via 192.168.35.3
free5gc-upfd -c upfcfg.yaml