#!/bin/bash
#ip route add 192.168.0.0/24 via 192.168.30.3
ip route add 192.168.40.0/24 via192.168.20.4
sleep 6
nr-gnb --config gnbcfg.yaml