#!/bin/bash


sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo touch   /var/www/html/index.html
sudo echo "Hello World" > /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html