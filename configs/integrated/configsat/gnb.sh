#!/bin/bash
ip route add 192.168.30.0/24 via 192.168.35.4
sleep 6
nr-gnb --config gnbcfg.yaml