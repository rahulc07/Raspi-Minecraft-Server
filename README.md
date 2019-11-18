# Raspi-Minecraft-Server
This is a easy to make minecraft server using the Raspberry Pi

Install

Get a micro-sd-card with raspbian

sudo apt update

sudo apt upgrade
(Obviously press y and enter whenever it prompts you to make changes)

sudo raspi-config

Select "Boot Options"
Then Select Desktop/Cli
Select "Console Auto Login"
Go down to "Advanced options"
Select "Expand File System"  NOTICE:This will go back tot he terminal for a couple seconds
Go back to "Advanced Options" And click "Memory Split"
Delete the old value and type "8" (Hit Enter)
Hit the right arrow key  twice and hit "Finish"

When it prompts you to reboot hit "Yes"

Commands

sudo apt install openjdk-8-jdk

sudo apt install screen

git clone https://github.com/xXTeraXx/Raspi-Minecraft-Server.git

mv Raspi-Minecraft-Server Minecraft_Server

cd Minecraft_Server

chmod +x minecraft.sh

___________________________________________________________________________________________________________________________

#To Start the server Everytime the Pi Boots up type these commands 

cd Minecraft_Server

sudo ./minecraft.sh

[The server can take anywhere from 1-12 minutes the first time it boots from there it should take about 1-2 minutes]


You will need to Port Forward the server so it can be seen to the outside world to do this google your router brand name and portforwarding and there should be a guide
________________________________________________________________________________________________________________________________

#Starting On startup

If you don't want to type in the commands to the Pi everytime it boots up then you can make it so it starts on startup.

To do this type in these commands into terminal

cd /etc

sudo nano rc.local

(BEFORE EXIT 0 ADD)

screen -dm -S minecraft /home/pi/Minecraft_Server/minecraft.sh

Then hit Ctrl+X then hit y then type in sudo reboot and your done

Notice To see your command line type in 

sudo screen -r minecraft
___________________________________________________________________________________________________________________________________






