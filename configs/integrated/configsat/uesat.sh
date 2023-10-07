#!/bin/bash
ip route add 192.168.0.0/24 via 192.168.30.3   # Add SBI
ip route add 192.168.15.0/24 via 192.168.30.3   # Add terrestrial route
ip route add 192.168.5.0/24 via 192.168.30.3
#ip route add 192.168.40.0/24 via 192.168.30.3    # Add satellite route
sleep 6
nr-ue --config uecfg.yaml