#!/bin/bash
sudo su
sudo apt update -y
sudo apt-get install -y mysql-server unzip
sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart
cd /tmp && wget https://github.com/cdesqus/sosialmedia/archive/refs/heads/master.zip && unzip master.zip
passwd="1234567890"
mysql -u root -e "create database sosmed"
mysql -u root -e "create user sosmed@'%' identified by '$passwd'; grant all privileges on *.* to sosmed@'%'"
mysql -u root -e "flush privileges "
mysql -u root -p1234567890 sosmed < /tmp/sosialmedia-master/dump.sql



GRANT ALL PRIVILEGES ON *.* TO 'sosmed'@'%';