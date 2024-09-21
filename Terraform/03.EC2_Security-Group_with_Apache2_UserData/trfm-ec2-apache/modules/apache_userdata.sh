#!/bin/bash

# Update the package list
sudo apt update -y

# Install Apache2
sudo apt install apache2 -y

# Enable Apache2 to start on boot
sudo systemctl enable apache2

# Start the Apache2 service
sudo systemctl start apache2