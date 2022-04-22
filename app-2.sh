#!/bin/bash
sudo su
#Install service package
apt update -y
apt install -y apache2 php php-mysql
apt install -y unzip
apt install -y php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
cd /tmp && wget https://github.com/cdesqus/sosialmedia/archive/refs/heads/master.zip && unzip master.zip
rm /var/www/html/index.html
mv sosialmedia-master/* /var/www/html

sed -i "s/localhost/192.168.153.53/g" /var/www/html/config.php
sed -i "s/devopscilsy/sosmed/g" /var/www/html/config.php
sed -i "s/dbsosmed/sosmed/g" /var/www/html/config.php