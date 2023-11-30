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

# SSH Connection for Graphical Forwarding (X11)

To initiate X11 forwarding, run:
./ssh_connection_X11.sh

# Update SSH Configuration for Visual Studio Code

The update_ssh_config_vscode.sh script updates the ~/.ssh/config file to enable the use of the Visual Studio Code
(VSCode) Remote-SSH extension. This extension allows you to edit code on the remote machine directly from your local VSCode
environment.

## Steps to Use:

1. Run update_ssh_config_vscode.sh to update the SSH config file with the current IP address of the robot.
2. Open VSCode.
3. Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P on Mac).
4. Select “Remote-SSH: Connect to Host...”.
5. Choose “MIRTE” from the list of available hosts.

## Example SSH Config:

In the file called "config" you will find an example config file that you can place in your ~/.ssh directory.

It contains:

- ForwardX11 yes: Enables X11 forwarding, allowing you to view graphical applications running on the robot.
- Host MIRTE: Configures the connection details for the robot.
  - HostName: The IP address of the robot (updated by update_ssh_config_vscode.sh).
  - User mirte: Specifies the username for the SSH connection.
  - IdentityFile: The path to your private SSH key.

## Linking Your SSH Key:

Ensure your SSH public key is linked to the robot for seamless authentication:
ssh-copy-id -i ~/.ssh/your_private_key mirte@robot_ip_address

Replace your_private_key and robot_ip_address with the appropriate file name and IP address.
Once set up, you can connect to “MIRTE” via Remote-SSH in VSCode. This opens a new VSCode window, allowing you to edit files
directly on the robot

## SSH connection for graphical forwarding

To innitate the X11 forwarding run:

```bash
./mirte_ssh.sh
```

## update_ssh_config_vscode.sh

This shell script allows you to update the ~/.ssh/config file. This file will allow you to use the vscode extension Remote-SSH in order to edit the code on the remote, locally using vscode.

Run the script to update the config file with the robot ip adress. Then go to the command palette in vscode, select Remote-SSH: connect to host.. Choose MIRTE.

As you can see in the example config file:

# General settings

ForwardX11 yes

# Specific host settings

Host MIRTE
HostName robot_ip_adress
User mirte
IdentityFile ~/.ssh/your_private_key

We have added "ForwardX11 yes", such that X11 forwarding is enabled allowing you to view graphical applications that run on the mirte. The created host is called MIRTE, the robot_ip_adress can be altered depending on you network using the update_ssh_config_vscode.sh script. The user is mirte and the IdentityFile should be the location of your private key that has been linked to your mirte with:

ssh-copy-id -i ~/.ssh/your_private_key mirte@robot_ip_address

Now you can go to view, commandpallete, Remote-SSH: connect to host..
and then select MIRTE. This will openup a new vscode window, that allows you to modify the files on mirte using vscode.
