#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt install openjdk-8-jdk
sudo apt install screen
sudo apt install proftpd
cd /home/pi
sudo mv Raspi-Minecraft-Server Minecraft_Server
cd Minecraft_Server
wget https://cdn.getbukkit.org/spigot/spigot-1.15.2.jar
sudo mv spigot-1.15.2.jar server.jar
cd /etc
sudo rm rc.local
cd /home/pi/Minecraft_Server
sudo chmod +x minecraft.sh
sudo mv rc.local /etc
cd /etc
chmod +x rc.local
