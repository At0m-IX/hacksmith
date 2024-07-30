HackSmith: Hackers Toolkit Installer

Version: 1.0 Alpha
Author: At0m-IX
License: MIT

Overview

HackSmith is a comprehensive toolkit installer designed to set up essential and advanced hacking tools on your system. This script provides a seamless installation experience, whether you're using Debian/Ubuntu or Arch Linux distributions.

Downloading may take time, Be Patient

Features

Multi-Distribution Support: Automatically detects your OS and installs tools tailored for Debian/Ubuntu or Arch Linux.
    Comprehensive Toolset: Installs a wide range of common and Python-based hacking tools, as well as popular GitHub repositories.
    Interactive Shell: Offers a command-line interface for easy navigation and installation.

Getting Started

 Clone the Repository:  
    
     git clone https://github.com/At0m-IX/hacksmith
     cd hacksmith
     chmod +x hacksmith.sh
     sudo ./hacksmith.sh

This will start the interactive shell. Follow the prompts to install the toolkit.

Commands

    install: Initiates the installation of all tools.
    help: Displays this help message.
    tools: Lists all available tools.
    clear: Clears the terminal screen.
    contribute: Provides information on how to contribute to the project.
    exit: Exits the interactive shell.

Installation Options
Interactive Shell

After running the script, you’ll be greeted with an interactive shell. You can use commands like install, tools, clear, contribute, and exit to navigate and perform actions.
Command-Line Arguments

Alternatively, you can run specific commands directly:

 Install:

    sudo ./hacksmith.sh install

This installs the toolkit based on your OS.

Supported Tools

Common Tools:

    nmap, wireshark, aircrack-ng, metasploit-framework, hydra, john, sqlmap, gobuster, nikto, netcat, tcpdump, hashcat, proxychains, ettercap, responder, set, binwalk, foremost, volatility, autopsy, lynis, masscan, radare2, exploitdb

Python Tools:

    scapy, impacket, requests, pwntools, volatility3, dnspython, pyinstaller, frida, angr, pycryptodome

GitHub Tools:

    SecLists, Pwntools, PowerSploit, CTF Tools, PayloadsAllTheThings, Awesome Hacking

Additional Tools:

    BeEF

Contributing

To contribute to HackSmith, please visit the GitHub repository. We welcome forks, improvements, and pull requests.
License

HackSmith is licensed under the MIT License. See the LICENSE file for details.
Disclaimer

This toolkit is intended for educational and ethical hacking purposes only. Use it responsibly and ensure you have permission before testing any systems.
