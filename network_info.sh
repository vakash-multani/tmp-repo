#!/bin/bash

# if command -v apt &>/dev/null; then
#         echo "[+] Installing ipcalc using apt..."
#         sudo apt update && sudo apt install -y ipcalc
#     elif command -v dnf &>/dev/null; then
#         echo "[+] Installing ipcalc using dnf..."
#         sudo dnf install -y ipcalc
#     elif command -v yum &>/dev/null; then
#         echo "[+] Installing ipcalc using yum..."
#         sudo yum install -y ipcalc
#     else
#         echo "[-] Cannot detect package manager. Please install 'ipcalc' manually."
#         exit 1
#     fi
# }

# # Check if ipcalc is installed
# if ! command -v ipcalc &>/dev/null; then
#     echo "[*] ipcalc not found. Attempting to install..."
#     install_ipcalc
# fi


# Get the primary network interface
interface=$(ip route | grep default | awk '{print $5}')

# Get the IP address and subnet in CIDR format
ip_info=$(ip -4 addr show "$interface" | grep -oP '(?<=inet\s)\d+(\.\d+){3}/\d+')

# Split IP and subnet
ip_address=$(echo "$ip_info" | cut -d/ -f1)
cidr=$(echo "$ip_info" | cut -d/ -f2)


# Convert CIDR to subnet mask and show both
subnet_cidr="/$cidr"
subnet_mask=$(ipcalc -m "$ip_address$subnet_cidr" | cut -d= -f2)


# Get the default gateway
gateway=$(ip route | grep default | awk '{print $3}')

# Output
echo "Interface     : $interface"
echo "IP Address    : $ip_address"
# echo "Subnet Mask   : $subnet_mask"
echo "Subnet Mask    : $subnet_mask ($subnet_cidr)"
echo "Default Gateway: $gateway"
