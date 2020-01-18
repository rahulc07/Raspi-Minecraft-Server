#!/bin/bash
cd /home/pi/Minecraft_Server/
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
java -Xmx1024M -Xms1024M -jar BuildTools.jar nogui
rm BuildTools.jar
rm  -r BuildData
rm BuildTools.log.txt
rm -r Bukkit
rm -r CraftBukkit
rm -r PortableGit-2.15.0-64-bit
rm -r Spigot
rm -r work
rm -r apache-maven-3.6.0
rm server.jar
mv spigot-1.15.1.jar server.jar
