# MIRTE IP-ADRESS

To find out what the IP address is of your MIRTE-Master's Orange Pi in order to obtain an SSH connection:

## REQUIREMENTS

- `nmap`: To perform network scanning.
- `net-tools`: To use `ifconfig` for network configuration.

Ensure you have these requirements installed by running:

```bash
sudo apt install nmap
sudo apt install net-tools
```

## STEPS

**Finding Your IPv4 Address:**

1. Open a terminal on your Orange Pi or access it via SSH.

2. Run the following command to display network information, including the IP address:

```bash
ifconfig
```

3. Locate the section related to your Wi-Fi network (e.g., `wlan0` or `wlp4so`).

4. Find the "inet" parameter; it represents the IP address of the device you are running these commands on. The IP address consists of four sets of 8 bits: `255:255:255:255`, where the first three bytes correspond to the subnet mask.

**Ping Live Hosts on the Network:**

1. Determine your local network's subnet. The subnet is typically in the format `subnet.0-subnet.255`.

2. Run the following command to ping live hosts in the network:

```bash
nmap -sP subnet.0/24
```

Replace `subnet` with the appropriate subnet values based on your network configuration.

3. Review the scan results to identify your Orange Pi's IP address. It will appear as one of the live hosts in the list.

This guide provides instructions for using `ifconfig` and `nmap` to discover your Orange Pi's IP address on the local network. The SSH connection part has been omitted, focusing on the IP discovery process.

# X11 Forwarding with mirte_ssh.sh

## Introduction

This guide provides instructions on setting up X11 forwarding on the robot computer using `xauth` to allow SSH connections for graphical applications. The `mirte_ssh.sh` script is used to initiate the SSH connection with debugging enabled for troubleshooting.

## Prerequisites

- SSH access to the robot computer.
- A working X11 environment on the local machine.
- The `xauth` utility installed on the robot computer.

## Installing xauth

To install `xauth` on the robot computer, run the following commands:

```bash
sudo apt-get update
sudo apt-get install xauth
```

## SSH connection for graphical forwarding

To innitate the X11 forwarding run:

```bash
./mirte_ssh.sh
```
