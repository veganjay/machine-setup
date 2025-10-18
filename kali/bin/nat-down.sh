#!/bin/bash

WLAN_DEVICE=wlan0

# Set up NAT rules so clients can access the Internet
if [[ $(ip addr show dev ${WLAN_DEVICE}) ]]; then
    sudo iptables -t nat -D POSTROUTING -o ${WLAN_DEVICE} -j MASQUERADE
else
    echo Unknown device ${WLAN_DEVICE}
fi
