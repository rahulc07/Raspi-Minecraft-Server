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
read -r -p "Do You Have A Pi 4? [Y/n] " model
case $model in
    [yY][eE][sS]|[yY])
  read -r -p "Which One 1gb 2gb 4gb or 8gb Please Answer With 1 2 4 or 8  " piram
  case $piram in
      1)
    echo Okay
    ;;
      2)
    sudo rm /home/pi/Server/minecraft.sh
    echo "#!/bin/bash" >> /home/pi/Server/minecraft.sh
    echo "java -Xms512M -Xmx2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui" >> /home/pi/Server/minecraft.sh 
    echo Okay
   ;;
      4)
    sudo rm /home/pi/Server/minecraft.sh
    echo "#!/bin/bash" >> /home/pi/Server/minecraft.sh
    echo "java -Xms512M -Xmx4G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui" >>  /home/pi/Server/minecraft.sh
   ;;
      8)
    echo "Make Sure You Are Using 64bit OS"
    sleep 1
    sudo rm /home/pi/Server/minecraft.sh
    echo "#!/bin/bash" >> /home/pi/Server/minecraft.sh
    echo "java -Xms512M -Xmx2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar server.jar nogui" >> /home/pi/Server/minecraft.sh
   ;;
    
      *)
    echo "Invaild Input... Abort"
    exit 1
   ;;
  esac
 ;;
    *)
  echo Okay
 ;;
esac

 
read -r -p "What Version Do You Want eg:1.8.9 " version
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
  echo Invalid Input.... Abort
  exit 1
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


