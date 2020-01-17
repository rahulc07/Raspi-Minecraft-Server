#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install openjdk-8-jdk
sudo apt install screen
cd /home/pi
sudo mv Raspi-Minecraft-Server Minecraft_Server
cd /etc
sudo rm rc.local
cd /home/pi/Minecraft_Server
sudo mv rc.local /etc
cd /etc
chmod +x rc.local