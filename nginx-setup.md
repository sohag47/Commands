# Setup nginx

```bash
# Install Nginx
sudo apt install nginx
```

```bash
# Start and Enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```

```bash
# Configure the Firewall
sudo ufw allow 'Nginx Full'
```

```bash
# Verify Nginx Installation
sudo systemctl status nginx
```

```bash
# create a nginx configuration file
sudo nano /etc/nginx/sites-available/nextjs-app.conf
```

## Nginx without SSL configuration

```bash
# add this config for each app without ssl
server {
listen 80;
server_name 127.0.0.1; # IP/Domain
    location / {
    proxy_pass http://127.0.0.1:3000; # pm2 application url
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
    }
}
```

```bash
# Create the symbolic link
sudo ln -s /etc/nginx/sites-available/nextjs-app.conf /etc/nginx/sites-enabled/
```

```bash
# Show log
sudo nginx -t
# restart Server
sudo systemctl reload nginx
# or
sudo systemctl restart nginx
```
