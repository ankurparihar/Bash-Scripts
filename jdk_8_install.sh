#! /bin/bash

echo "Always keep an eye to the process."
echo "Please follow the instructions:"
echo "put jdk-8****-linux-x**.tar.gz and remove other jdk*** if exists in Downloads folder."
read -p  "press <enter> when done."
jdkfile=$(for f in $(find Downloads/ -type f);do echo $f; done | grep jdk | cut -c 11-| head -n 1)
echo found jdk file:
echo $jdkfile
read -p "Proceed...? <enter/ctrl+c>"
echo "creating directory /usr/local/java"
gksudo mkdir /usr/local/java
sudo cp -v Downloads/$jdkfile /usr/local/java/
cd /usr/local/java/
echo extracting jdk files
sudo tar -xzf $jdkfile
jdkdir=$(ls --group-directories-first| head -n 1)
echo "Put the following lines between dash-breaks in the document opened:"
echo "==============================================================="
echo "JAVA_HOME=/usr/local/java/$jdkdir"
echo "JRE_HOME=\$JAVA_HOME/jre"
echo "PATH=\$PATH:\$JAVA_HOME/bin:\$JRE_HOME/bin"
echo "export JAVA_HOME"
echo "export JRE_HOME"
echo "export PATH"
echo "==============================================================="
sudo gedit /etc/profile
echo "Informing the system where Oracle Java JDK is located..."
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/$jdkdir/jre/bin/java" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/$jdkdir/jre/bin/javaws" 1
echo "Informing the system that Oracle Java JDK must be default Java..."
sudo update-alternatives --set java /usr/local/java/$jdkdir/jre/bin/java
sudo update-alternatives --set javaws /usr/local/java/$jdkdir/jre/bin/javaws
echo "Now we need to reboot."
read -p "Press <enter> to reboot or <ctrl+c> to cancel."
echo rebooting...
reboot
