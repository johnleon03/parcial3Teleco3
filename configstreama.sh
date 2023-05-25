echo "configuring streama as a service"
sudo -i
sudo touch /etc/systemd/system/streama.service
cd /etc/systemd/system/
sudo echo -e "[Unit]\nDescription=Streama Server\nAfter=syslog.target\nAfter=network.target\n" >> streama.service
sudo echo -e "[Service]\nUser=root\nType=simple\nExecStart=/bin/java -jar /opt/streama/streama.jar\nRestart=always\nStandardOutput=syslog\nStandardError=syslog\nSyslogIdentifier=Streama" >> streama.service
sudo echo -e "[Install]\nWantedBy=multi-user.target" >> streama.service
echo "starting streama"
sudo systemctl start streama
sudo systemctl enable streama
sudo systemctl status streama


sudo reboot