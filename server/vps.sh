# last ran on Ubuntu 24.04 LTS


sudo apt update
sudo apt upgrade
sudo shutdown -r now

sudo apt install wget curl

# ---- install docker ----- 
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#install packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#set up user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# ---- install nginx -----

sudo apt install nginx

# 1. run through guide here: https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-22-04
# 2. setup let's encrypt here: https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04
# 3. set up reverse proxy here: https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-reverse-proxy-on-ubuntu-22-04

sudo apt install nginx
sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
sudo ufw enable

sudo mkdir -p /var/www/[domain]/html
sudo chown -R $USER:$USER /var/www/[domain]/
sudo nano /var/www/[domain]/html/index.html
sudo nano /etc/nginx/sites-available/[domain]

ln -s /etc/nginx/sites-available/[domain] /etc/nginx/sites-enabled/

sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx

sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d [domain]

# ---- github ----

#complains about locally stored token, find better way
docker login ghcr.io -u USER_NAME

