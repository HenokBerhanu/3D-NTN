#!/bin/bash
ip route add 192.168.0.0/24 via 192.168.30.3
ip route add 192.168.15.0/24 via 192.168.30.3
sleep 6
nr-ue --config uecfg.yaml