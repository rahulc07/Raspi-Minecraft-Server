# Raspi-Minecraft-Server
This is a easy to make minecraft server using the Raspberry Pi

# Prerequisites 

Get a micro-sd-card with raspbian


# Basic Configuration
sudo raspi-config
Go to a "Boot Options" Then Go to "Desktop/CLI"  Go to Console Auto Login then hit enter Go to advanced options then to Memory Split change that to 16 go down to finish and hit enter. Go back to Advanced options than go to "Expand File System" go down to finish and when it asks you to reboot say yes

HARD PART IS OVER!
# Install
sudo apt update && sudo apt install git 

git clone https://github.com/xXTeraXx/Raspi-Minecraft-Server.git

cd Raspi-Minecraft-Server

Chmod +x minecraftinstall.sh

sudo ./minecraftinstall.sh


(Reboot) with sudo reboot

YOUR DONE!!!

PS:You still need to port forward with port 25565 for other people to be able to connect to your minecraft server.


To see command line do sudo screen -r minecraft






