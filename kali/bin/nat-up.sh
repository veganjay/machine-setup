#!/bin/bash

WLAN_DEVICE=wlan0

# Allow forwarding
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward

# Set up NAT rules so clients can access the Internet
if [[ $(ip addr show dev ${WLAN_DEVICE}) ]]; then
    sudo iptables -t nat -A POSTROUTING -o ${WLAN_DEVICE} -j MASQUERADE
else
    echo To fix, set WLAN_DEVICE.
fi
