#!/usr/bin/env bash
#  sets up your web servers for the deployment of web_static

sudo apt-get -y install nginx
sudo mkdir -p /data
sudo mkdir /data/web_static
sudo mkdir /data/web_static/releases
sudo mkdir /data/web_static/shared
sudo mkdir /data/web_static/releases/test
sudo touch /data/web_static/releases/test/index.html
echo "This is a test" | sudo tee /data/web_static/releases/test/index.html
sudo rm -f /data/web_static/current && ln -sf /data/web_static/releases/test/ /data/web_static/current
sudo chown -hR ubuntu:ubuntu /data
redirect="\n\tlocation /hbnb_static {\n\t\talias /data/web_static/current/;\n\t}\n"
sudo sed -i "50s|.*|$redirect|" /etc/nginx/sites-enabled/default
sudo service nginx start
