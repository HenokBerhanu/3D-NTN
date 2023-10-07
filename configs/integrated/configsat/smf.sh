#!/bin/bash
ip route add 192.168.30.0/24 via 192.168.5.5
sleep 6
smf --config smfcfg.yaml --uerouting uerouting.yaml