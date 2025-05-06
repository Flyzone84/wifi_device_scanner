#!/bin/bash
 

sudo apt install arp-scan nmap net-tools -y

echo "----------------------------------------"
echo "📡 Wi-Fi Connected Devices Scanner"
echo "----------------------------------------"

# Get the network interface (assumes wlan0 or auto-detects active interface)
iface=$(ip route | grep default | awk '{print $5}')

if [ -z "$iface" ]; then
    echo "❌ No active network interface found."
    exit 1
fi

echo "🔍 Using interface: $iface"

# Get local subnet
ip_info=$(ip addr show "$iface")
ip_addr=$(echo "$ip_info" | grep 'inet ' | awk '{print $2}')

echo "🌐 Scanning local network: $ip_addr"
echo ""

# Run arp-scan
sudo arp-scan --interface="$iface" --localnet | grep -v "Interface" | grep -v "packets received" | grep -v "Ending" | tee /tmp/arp_results.txt

echo ""
echo "✅ Basic scan complete. Now running Nmap for additional info..."
echo ""

# Extract IP addresses from arp-scan result
ips=$(awk '{print $1}' /tmp/arp_results.txt | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}')

# Scan each IP with Nmap for open ports and device type
for ip in $ips; do
    echo "🔎 Scanning $ip ..."
    nmap -O -T4 "$ip" | grep -E 'Nmap scan report|MAC Address|Device type|Running'
    echo ""
done

echo "🎉 Scan completed!"
