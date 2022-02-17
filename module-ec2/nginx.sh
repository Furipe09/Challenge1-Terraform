#!/bin/sh
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
#sudo ufw allow 'Nginx HTTP'
#sudo ufw allow 22
#sudo systemctl start ufw
#sudo ufw enable
#echo "AWS Instance created by Terraform"
