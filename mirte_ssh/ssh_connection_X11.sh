#!/bin/sh
# Get local network information (subnet)
# Using `ip a` instead of `ifconfig`
subnet=$(ip a show wlp0s20f3 | grep -oP 'inet \K(\d+\.\d+\.\d+)' | head -n 1)

# Perform nmap scan
nmap_result=$(nmap -sP ${subnet}.0/24)

# Get the last IP address from the nmap scan
last_ip=$(echo "$nmap_result" | grep -oP '\d+\.\d+\.\d+\.\d+$' | tail -n 1)

# SSH into the last IP with username mirte (Option -Y for trusted X11 forwarding)
ssh -Yv mirte@$last_ip
