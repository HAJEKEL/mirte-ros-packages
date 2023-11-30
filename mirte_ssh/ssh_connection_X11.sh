#!/bin/sh
# Get local network information (subnet)
subnet=$(ifconfig | grep -oP 'broadcast \K(\d+\.\d+\.\d+)')

# Perform nmap scan
nmap_result=$(nmap -sP ${subnet}.0/24)

# Get the last IP address from the nmap scan
last_ip=$(echo "$nmap_result" | grep -oP '\d+\.\d+\.\d+\.\d+$' | tail -n 1)

# SSH into the last IP with username mirte (Option -Y for trusted X11 forwarding)
ssh -Yv mirte@$last_ip

