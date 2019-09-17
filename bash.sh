#!/bin/bash
#Update
sudo apt-get update
sudo apt-get upgrade
#Install NGINX
sudo apt-get install nginx
sudo ufw allow 'Nginx HTTP'
#Configuration NGINx
sudo cp default /etc/nginx/sites-available/default
sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
sudo systemctl restart nginx

#Update creator
sudo chown -R user:www-data /var/www/html
#Install PHP-FPM PHP-MYSQL
sudo apt install -y php-fpm php-mysql php-cli
#Install Mysql
sudo apt-get install mysql-server
#Creating new user
sudo mysql -u root -p123 -D mysql -e "CREATE USER 'user'@'localhost' IDENTIFIED BY '123';"
exit
#Install Mysql-Workbench
sudo apt-get install mysql-workbench 
#Install GIT
sudo apt-get install git
#Add user
git config --global user.name "Admin"
git config --global user.email anastasiya.hahanova@mail.ru
cd /var/www/html
rm -rf /var/www//html/*
#Clone repository
git clone https://git.devspark.ru/m_kultyshev/stage-lrs /var/www/html

touch /var/www/html/app/config/Database.php
cd /var/www/html/app/config
echo '<?php
return [
    "host" => "localhost",
    "user" => "user",
    "password" => "123",
    "base" => "lrs"
];
?>' > Database.php
cd /var/www/html/migration
php cli.php migration

echo 'done!!!'