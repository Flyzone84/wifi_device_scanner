# Create a README.md file with the full content provided above

readme_content = """# 🔍 WiFi Device Scanner

A lightweight Bash tool to scan your Wi-Fi network and list all connected devices with details like IP address, MAC address, and vendor information. It also uses `nmap` to provide basic fingerprinting of each device.

---

## ✨ Features

- Automatically detects your active Wi-Fi interface
- Scans the local network for connected devices
- Displays IP, MAC address, and vendor
- Uses Nmap to detect device types and open ports
- Easy to use — just run and get results

---

## 📦 Installation

### ⚙️ Requirements

Make sure you have the following tools installed:

```bash
sudo apt update
sudo apt install arp-scan nmap net-tools -y
```

This script is tested on Kali Linux but should work on most Debian/Ubuntu-based distributions.
# 🚀 Usage

    Clone this repository:

Always show details

git clone https://github.com/Flyzone84/wifi_device_scanner
cd wifi-device-scanner

    Make the script executable:

Always show details

chmod +x wifi_device_scanner.sh

    Run the script with root privileges:

Always show details

sudo ./wifi_device_scanner.sh

You will see a list of devices connected to your Wi-Fi network, along with IP addresses, MAC addresses, vendor names, and device details detected by Nmap.
# 📁 Output

    Displays live scan results in the terminal.

    Optionally, results from arp-scan are stored temporarily in /tmp/arp_results.txt.

# 🔐 Note on Permissions

arp-scan and nmap require sudo privileges to access network hardware and perform scans properly.
# 📜 License

This project is licensed under the MIT License.



