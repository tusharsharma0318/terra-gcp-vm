#!/bin/bash
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2

echo "<h1>Apache Web Server is running</h1>" > /var/www/html/index.html