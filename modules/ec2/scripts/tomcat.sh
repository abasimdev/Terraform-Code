
# ************ Tomcat 9 Installation *************


# ************ Tomcat 9 Installation *************

#!/bin/bash

# Exit on error
set -e

# Variables
TOMCAT_VERSION=9.0.106
INSTALL_DIR=/opt/tomcat
USER=tomcat

# echo "Updating system..."
# sudo apt update && apt upgrade -y

echo "Installing Java..."
sudo apt install openjdk-17-jdk -y wget curl

echo "Creating Tomcat user..."
sudo useradd -r -m -U -d $INSTALL_DIR -s /bin/false $USER

echo "Downloading Tomcat $TOMCAT_VERSION..."
wget https://downloads.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -P /tmp

echo "Extracting Tomcat..."
sudo mkdir -p $INSTALL_DIR
sudo tar -xf /tmp/apache-tomcat-$TOMCAT_VERSION.tar.gz -C $INSTALL_DIR --strip-components=1

echo "Setting permissions..."
sudo chown -R $USER:$USER $INSTALL_DIR
sudo chmod +x $INSTALL_DIR/bin/*.sh

echo "Creating systemd service..."
echo "
[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

User=$USER
Group=$USER

Environment="JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64"
Environment="CATALINA_PID=$INSTALL_DIR/temp/tomcat.pid"
Environment="CATALINA_HOME=$INSTALL_DIR"
Environment="CATALINA_BASE=$INSTALL_DIR"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
Environment="JAVA_OPTS=-Djava.security.egd=file:/dev/./urandom"

ExecStart=$INSTALL_DIR/bin/startup.sh
ExecStop=$INSTALL_DIR/bin/shutdown.sh

Restart=on-failure

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/tomcat.service

echo "Reloading systemd daemon..."
sudo systemctl daemon-reexec
sudo systemctl daemon-reload

echo "Enabling and starting Tomcat..."
sudo systemctl enable tomcat
sudo systemctl start tomcat

echo "Tomcat installation complete!"
echo "Access it via: http://<your-server-ip>:8080"


