#!/bin/bash
set -e

sudo apt update
sudo apt install -y openjdk-21-jdk
sudo update-java-alternatives -l
export JAVA_HOME=/usr/lib/jvm/$(sudo update-java-alternatives -l | awk '{print $1}' | head -1)
echo "JAVA_HOME=$JAVA_HOME"

echo "export JAVA_HOME=$JAVA_HOME" | sudo tee /etc/profile.d/java_home.sh
echo 'export PATH=$JAVA_HOME/bin:$PATH' | sudo tee -a /etc/profile.d/java_home.sh
sudo chmod +x /etc/profile.d/java_home.sh

java -version
javac -version

sudo apt install -y maven
mvn -v

sudo apt install -y git

sudo apt-get install -y autoconf automake libtool make tar libaio-dev libssl-dev libapr1-dev lksctp-tools

echo "setup finished！"
