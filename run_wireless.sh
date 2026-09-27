#!/bin/bash

# Ask if pairing is needed
read -p "Do you need to pair a new device first? (y/n): " pair_choice

# Ask for the device IP
read -p "Enter phone's IP Address (e.g., 192.168.1.5): " ip

if [ "$pair_choice" == "y" ] || [ "$pair_choice" == "Y" ]; then
    read -p "Enter Pairing Port: " pair_port
    read -p "Enter 6-digit Pairing Code: " pair_code
    
    echo "Pairing with $ip:$pair_port..."
    adb pair "$ip:$pair_port" "$pair_code"
fi

# Ask for the Connection Port
read -p "Enter Connection Port: " conn_port

# Connect to ADB
echo "Connecting to $ip:$conn_port..."
adb connect "$ip:$conn_port"

# Verify connection
echo ""
echo "Checking connected devices..."
flutter devices

# Run Flutter
echo ""
echo "Starting Flutter App..."
flutter run
