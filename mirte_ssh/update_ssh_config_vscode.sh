#!/bin/bash

# Define the SSH config file path
SSH_CONFIG="$HOME/.ssh/config"

# Define the host entry name in the SSH config
HOST_NAME="MIRTE"

# Debug: Display current SSH config
echo "Before update:"
cat $SSH_CONFIG

# Get local network information (subnet) for the first interface starting with "wl"
subnet=$(ip a show wlp0s20f3 | grep -oP 'inet \K(\d+\.\d+\.\d+)' | head -n 1)

# Perform nmap scan
nmap_result=$(nmap -sP ${subnet}.0/24)

# Get the last IP address from the nmap scan
last_ip=$(echo "$nmap_result" | grep -oP '\d+\.\d+\.\d+\.\d+$' | tail -n 1)

# Debug: Display found IP address
echo "Found IP: $last_ip"

# Update the SSH config file
sed -i "/^Host $HOST_NAME/,/^\s*HostName /{s/^\s*HostName .*/    HostName $last_ip/;}" $SSH_CONFIG

# Debug: Display updated SSH config
echo "After update:"
cat $SSH_CONFIG
