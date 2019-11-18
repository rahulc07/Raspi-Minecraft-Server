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



