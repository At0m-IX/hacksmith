#!/bin/bash

# HackSmith: Hackers Toolkit Installer
# Version: 3.0
# Author: At0m-IX
# License: MIT
# GitHub: https://github.com/yourusername/hacksmith

set -e


RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color


print_color() {
    printf "${1}${2}${NC}\n"
}


print_banner() {
    clear
    echo -e "${MAGENTA}"
    cat << "EOF"
 _   _            _    ____            _ _   _     
| | | | __ _  ___| | _/ ___|  _ __ ___ (_) |_| |__  
| |_| |/ _ |/ __| |/ \___ \ | '_  _ \| | __| '_ \ 
|  _  | (_| | (__|   < ___) || | | | | | | |_| | | |
|_| |_|\__,_|\___|_|\_\____(_)_| |_| |_|_|\__|_| |_|
EOF
    sleep 0.1
    clear
    echo -e "${MAGENTA}"
    cat << "EOF"
 _   _            _    ____            _ _   _     
| | | | __ _  ___| | _/ ___|  _ __ ___ (_) |_| |__  
| |_| |/ _ |/ __| |/ \___ \ | '_  _ \| | __| '_ \ 
|  _  | (_| | (__|   < ___) || | | | | | | |_| | | |
|_| |_|\__,_|\___|_|\_\____(_)_| |_| |_|_|\__|_| |_|
                                                    
EOF
    sleep 0.1
    clear
    echo -e "${MAGENTA}"
    cat << "EOF"
 _   _            _    ____            _ _   _     
| | | | __ _  ___| | _/ ___|  _ __ ___ (_) |_| |__  
| |_| |/ _ |/ __| |/ \___ \ | '_  _ \| | __| '_ \ 
|  _  | (_| | (__|   < ___) || | | | | | | |_| | | |
|_| |_|\__,_|\___|_|\_\____(_)_| |_| |_|_|\__|_| |_|

-By @At0m-IX

Hackers Toolkit Installer
EOF
    echo -e "${NC}"
    print_color $YELLOW "Hackers Toolkit"
    print_color $CYAN "Version 1.0 Alpha"
    print_color $YELLOW "Type 'help' command for further information"
    print_color $CYAN "This toolkit is intended for educational and ethical hacking purposes only. Use it responsibly and ensure you have permission before testing any systems."
    echo
}


detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
    else
        OS=$(uname -s)
    fi
}


check_root() {
    if [ "$EUID" -ne 0 ]; then
        print_color $RED "Please run as root"
        exit 1
    fi
}


show_spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " %c  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b"
    done
    printf "    \b\b\b\b"
}


install_common_tools() {
    print_color $BLUE "Installing common hacking tools..."
    
    tools=(
        "nmap" "Network exploration tool and security scanner"
        "wireshark" "Network protocol analyzer"
        "aircrack-ng" "WiFi security auditing tools suite"
        "metasploit-framework" "Penetration testing framework"
        "hydra" "Password cracking tool"
        "john" "Password cracker"
        "sqlmap" "Automatic SQL injection tool"
        "gobuster" "Directory/file & DNS busting tool"
        "nikto" "Web server scanner"
        "netcat" "Networking utility for reading/writing network connections"
        "tcpdump" "Network packet analyzer"
        "hashcat" "Advanced password recovery tool"
        "proxychains" "Proxy chains tool"
        "ettercap" "Network protocol analyzer and MITM attacks"
        "responder" "LLMNR, NBT-NS and MDNS poisoner"
        "set" "Social-Engineer Toolkit"
        "binwalk" "Firmware analysis tool"
        "foremost" "File carving tool"
        "volatility" "Memory forensics framework"
        "autopsy" "Digital forensics platform"
        "lynis" "Security auditing tool"
        "masscan" "TCP port scanner"
        "radare2" "Reverse engineering framework"
        "exploitdb" "Exploit database"
    )

    for ((i=0; i<${#tools[@]}; i+=2)); do
        tool=${tools[i]}
        description=${tools[i+1]}
        print_color $YELLOW "Installing $tool - $description"
        $INSTALL_CMD $tool > /dev/null 2>&1 &
        show_spinner $!
        print_color $GREEN "✓ Installed $tool"
    done
}


install_python_tools() {
    print_color $BLUE "Installing Python-based hacking tools..."
    
    pip_tools=(
        "scapy" "Packet manipulation library"
        "impacket" "Network protocols library"
        "requests" "HTTP library"
        "pwntools" "CTF framework and exploit development library"
        "volatility3" "Memory forensics framework"
        "dnspython" "DNS toolkit"
        "pyinstaller" "Python executable creator"
        "frida" "Dynamic instrumentation toolkit"
        "angr" "Binary analysis framework"
        "pycryptodome" "Cryptographic library"
    )

    for ((i=0; i<${#pip_tools[@]}; i+=2)); do
        tool=${pip_tools[i]}
        description=${pip_tools[i+1]}
        print_color $YELLOW "Installing $tool - $description"
        pip3 install $tool > /dev/null 2>&1 &
        show_spinner $!
        print_color $GREEN "✓ Installed $tool"
    done
}

# Function to install tools on Debian/Ubuntu
install_debian() {
    export DEBIAN_FRONTEND=noninteractive
    INSTALL_CMD="apt install -y"

    print_color $BLUE "Updating system..."
    apt update && apt upgrade -y

    print_color $BLUE "Installing essential tools..."
    apt install -y build-essential git python3-pip curl wget

    install_common_tools
    install_python_tools

    print_color $BLUE "Installing additional Debian/Ubuntu specific tools..."
    apt install -y net-tools bsdmainutils gdb
}

# Function to install tools on Arch Linux
install_arch() {
    INSTALL_CMD="pacman -S --noconfirm"

    print_color $BLUE "Updating system..."
    pacman -Syu --noconfirm

    print_color $BLUE "Installing essential tools..."
    pacman -S --noconfirm base-devel git python-pip curl wget

    install_common_tools
    install_python_tools

    print_color $BLUE "Installing additional Arch specific tools..."
    pacman -S --noconfirm net-tools gdb
}

# Function to setup additional tools
setup_additional_tools() {
    print_color $BLUE "Setting up additional tools..."

    # Clone and setup popular GitHub tools
    git_tools=(
        "https://github.com/danielmiessler/SecLists.git" "SecLists - Collection of multiple types of lists for security assessments"
        "https://github.com/Gallopsled/pwntools.git" "Pwntools - CTF framework and exploit development library"
        "https://github.com/PowerShellMafia/PowerSploit.git" "PowerSploit - PowerShell post-exploitation framework"
        "https://github.com/zardus/ctf-tools.git" "CTF Tools - Collection of setup scripts for security research tools"
        "https://github.com/swisskyrepo/PayloadsAllTheThings.git" "PayloadsAllTheThings - Useful payloads and bypass for Web Application Security and Pentest/CTF"
        "https://github.com/Hack-with-Github/Awesome-Hacking.git" "Awesome Hacking - A collection of awesome lists for hackers, pentesters & security researchers"
    )

    for ((i=0; i<${#git_tools[@]}; i+=2)); do
        repo=${git_tools[i]}
        description=${git_tools[i+1]}
        tool_name=$(basename $repo .git)
        print_color $YELLOW "Cloning $tool_name - $description"
        git clone $repo /opt/$tool_name > /dev/null 2>&1 &
        show_spinner $!
        print_color $GREEN "✓ Cloned $tool_name"
    done

  

    

    
    print_color $YELLOW "Installing BeEF..."
    git clone https://github.com/beefproject/beef.git /opt/beef
    cd /opt/beef && ./install
    print_color $GREEN "✓ Installed BeEF"
}


setup_environment() {
    echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
    source ~/.bashrc
}

# Function to display help
show_help() {
    cat << EOF
HackSmith: Hackers Toolkit Installer
Version: 1.0 Alpha

Available commands:
  install    Install all tools
  help       Show this help message
  tools      List all available tools
  clear      Clear the screen
  contribute Show how to contribute
  exit       Exit the shell

Instructions to get started:
1. Type 'install' to begin the installation of all tools.
2. Use 'tools' to list all available tools.
3. For more details on contributing, type 'contribute'.
4. Use 'clear' to clear the screen.


EOF
}

# Function to list available tools
list_tools() {
    cat << EOF
Available tools:
  nmap, wireshark, aircrack-ng, metasploit-framework, hydra, john, sqlmap, gobuster,
  nikto, netcat, tcpdump, hashcat, proxychains, ettercap, responder, set, binwalk,
  foremost, volatility, autopsy, lynis, masscan, radare2, exploitdb

Python tools:
  scapy, impacket, requests, pwntools, volatility3, dnspython, pyinstaller, frida, angr, pycryptodome

GitHub tools:
  SecLists, Pwntools, PowerSploit, CTF Tools, PayloadsAllTheThings, Awesome Hacking

Additional tools:
   BeEF
EOF
}


show_contribute() {
    cat << EOF
To contribute to HackSmith, please visit the GitHub repository at:
https://github.com/At0m-IX/hacksmith

Feel free to fork the project, make improvements, and create pull requests.
EOF
}


interactive_shell() {
    print_banner
    while true; do
        echo -n "hacksmith> "
        read cmd
        case $cmd in
            help)
                show_help
                ;;
            tools)
                list_tools
                ;;
            clear)
                clear
                ;;
            contribute)
                show_contribute
                ;;
            exit)
                print_color $GREEN "Exiting HackSmith shell. Happy Hacking!"
                exit 0
                ;;
            install)
                detect_os
                check_root
                if [[ "$OS" == "Ubuntu" || "$OS" == "Debian" ]]; then
                    install_debian
                elif [[ "$OS" == "Arch Linux" ]]; then
                    install_arch
                else
                    print_color $RED "Unsupported operating system: $OS"
                    exit 1
                fi
                setup_additional_tools
                setup_environment
                print_color $GREEN "Installation complete. Happy Hacking!"
                ;;
            *)
                print_color $RED "Unknown command: $cmd"
                ;;
        esac
    done
}

# Main script entry point
print_banner
if [[ $# -eq 0 ]]; then
    interactive_shell
else
    case $1 in
        install)
            detect_os
            check_root
            if [[ "$OS" == "Ubuntu" || "$OS" == "Debian" ]]; then
                install_debian
            elif [[ "$OS" == "Arch Linux" ]]; then
                install_arch
            else
                print_color $RED "Unsupported operating system: $OS"
                exit 1
            fi
            setup_additional_tools
            setup_environment
            print_color $GREEN "Installation complete. Happy Hacking!"
            ;;
        *)
            show_help
            ;;
    esac
fi
