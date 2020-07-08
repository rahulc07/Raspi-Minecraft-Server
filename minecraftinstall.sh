#!/bin/bash
echo Upgrading And Installing Essential Software
sleep 1
sudo apt update
sudo apt upgrade
sudo apt install openjdk-8-jdk -yy
sudo apt install screen -yy
sudo apt install proftpd -yy
cd /home/pi
sudo mv Raspi-Minecraft-Server Server
cd Server
read -r -p "What Version Do You Want eg:1.8.9  " version
case $version in
    1.1*)
  wget https://cdn.getbukkit.org/spigot/spigot-$version.jar

 ;;
    1.*)
  wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
  echo THIS CAN TAKE UP TO 45 MINUTES
  screen -dmS buildtools java -jar BuildTools.jar --rev $version
  screen -r buildtools
 ;;
    *)
  Invalid Input.... Abort
 ;;
esac
sudo mv spigot-*.jar server.jar
cd /etc
sudo rm rc.local
cd /home/pi/Server
sudo chmod +x minecraft.sh
sudo mv rc.local /etc
cd /etc
chmod +x rc.local
echo Done.... Please Reboot


