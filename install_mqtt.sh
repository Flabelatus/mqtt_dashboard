#!/bin/bash

# Function to install Mosquitto on Ubuntu/Debian
install_mqtt_ubuntu() {
    echo "Installing Mosquitto on Ubuntu/Debian..."
    sudo apt update
    sudo apt install -y mosquitto mosquitto-clients
    sudo systemctl enable mosquitto
    sudo systemctl start mosquitto
    echo "Mosquitto installed and started on Ubuntu/Debian!"
}

# Function to install Mosquitto on macOS
install_mqtt_mac() {
    echo "Installing Mosquitto on macOS..."
    # Check if Homebrew is installed
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found, installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew update
    brew install mosquitto
    brew services start mosquitto
    echo "Mosquitto installed and started on macOS!"
}

# Function to install Mosquitto on Windows using Chocolatey
install_mqtt_windows() {
    echo "Installing Mosquitto on Windows..."
    # Check if Chocolatey is installed
    if ! command -v choco &> /dev/null; then
        echo "Chocolatey not found, installing Chocolatey..."
        powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process; [System.Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
    fi
    choco install mosquitto -y
    echo "Mosquitto installed on Windows! Please start Mosquitto manually from services.msc or by running 'net start mosquitto'."
}

# Detect the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/debian_version ]; then
        install_mqtt_ubuntu
    else
        echo "Unsupported Linux distribution. Please install Mosquitto manually."
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    install_mqtt_mac
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    install_mqtt_windows
else
    echo "Unsupported OS. Please install Mosquitto manually."
fi

echo "Installation complete!"