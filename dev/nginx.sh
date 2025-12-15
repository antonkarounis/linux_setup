# ---- install nginx -----

sudo apt install -y nginx

sudo ufw allow 'Nginx Full'
sudo ufw allow 'OpenSSH'
sudo ufw enable

echo run the rest of the script manually with documentation

exit 1

# 1. run through guide here: https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-22-04
# 2. setup let's encrypt here: https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-20-04
# 3. set up reverse proxy here: https://www.digitalocean.com/community/tutorials/how-to-configure-nginx-as-a-reverse-proxy-on-ubuntu-22-04

# run this manually:

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
