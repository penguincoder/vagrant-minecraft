#!/bin/bash
MINECRAFT_VERSION=1.8.3
MINECRAFT_MAJOR=1.8

echo "Performing initial setup"
groupadd -r notch && useradd -r -m -g notch notch
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
apt-get install -y software-properties-common
add-apt-repository ppa:webupd8team/java
apt-get update
echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | debconf-set-selections
apt-get install -y vim build-essential python-imaging python-dev python-numpy git htop screen rsync oracle-java8-installer oracle-java8-set-default nginx-light

# minecraft server
cd /home/notch
cp -avr /vagrant/minecraft .
echo "Downloading Minecraft official server..."
wget -q https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/minecraft_server.${MINECRAFT_VERSION}.jar
mv *.jar minecraft/
cd minecraft
ln -s $(ls minecraft_server.*.jar | head -n 1) minecraft_server.jar

# minecraft init
cd /home/notch
echo "Installing Minecraft init script"
git clone https://github.com/Ahtenus/minecraft-init.git
chmod 755 minecraft
cp /vagrant/mc-init-config ./minecraft-init/config
ln -s /home/notch/minecraft-init/minecraft /etc/init.d/

# minecraft overviewer
echo "Installing Minecraft Overviewer"
cd /home/notch
mkdir mc-overviewer
cd mc-overviewer
git clone git://github.com/overviewer/Minecraft-Overviewer.git
cp /vagrant/mc-overviewer-config.py ./config.py
cd Minecraft-Overviewer
python setup.py build

# minecraft overviewer texture pack
cd /home/notch/mc-overviewer
echo "Downloading Minecraft client for texture pack..."
cp /vagrant/get-texture-pack.sh .
./get-texture-pack.sh ${MINECRAFT_MAJOR}

echo "Starting Minecraft server..."
chown -R notch:notch /home/notch
update-rc.d minecraft defaults
service minecraft start

echo "Installing crontab for automation"
crontab -u notch /vagrant/crontab

echo "Configuring nginx to serve overviewer map"
rm -f /etc/nginx/sites-enabled/default
cp /vagrant/nginx-minecraft-overviewer /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx-minecraft-overviewer /etc/nginx/sites-enabled/
service nginx restart
