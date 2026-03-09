# Setup nginx

```bash
# Install Nginx
sudo apt install nginx
# verify Nginx Installation
nginx --version
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
# create a nginx configuration file
sudo nano /etc/nginx/sites-available/nextjs-app.conf
```

## Nginx without SSL configuration

### Configure with url as a proxy server

```bash
# add this config for each app without ssl
server {
    listen 80;
    server_name example.com www.example.com;

    location / {
        proxy_pass http://localhost:3000;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';

        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### Configure with root file

```bash
server {
    listen 80;
    server_name example.com www.example.com;

    root /var/www/example.com;
    index index.html index.htm index.php;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

```bash
# Create the symbolic link
sudo ln -s /etc/nginx/sites-available/nextjs-app.conf /etc/nginx/sites-enabled/
```

```bash
# show current status
sudo systemctl status nginx
sudo nginx -t
```

```bash
# restart Server
sudo systemctl reload nginx
# or
sudo systemctl restart nginx
```

# Install Certbot (SSL Tool)

```bash
# install Certbot for ubuntu server
sudo apt install certbot python3-certbot-nginx -y
```

### Generate SSL Certificate

```bash
sudo certbot --nginx -d example.com -d www.example.com

#Follow prompts
# Enter email:
# Agree terms:
# Redirect HTTP → HTTPS: (choose Yes)
# Certbot will automatically modify your Nginx config.
```

## Auto Renew SSL

```bash
sudo certbot renew --dry-run
```

## Final Nginx SSL Config Example

### For proxy configuration with SSL

```bash
server {
    listen 80;
    server_name example.com www.example.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl http2;
    server_name example.com www.example.com;

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;

    location / {
        proxy_pass http://127.0.0.1:3000;

        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';

        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;

        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        proxy_read_timeout 60;
        proxy_connect_timeout 60;
    }
}
```

### Run from Root file configuration with SSL

```bash
# Redirect HTTP → HTTPS
server {
    listen 80;
    server_name example.com www.example.com;

    return 301 https://$host$request_uri;
}

# HTTPS server
server {
    listen 443 ssl http2;
    server_name example.com www.example.com;

    root /var/www/example.com;
    index index.html index.htm;

    ssl_certificate /etc/letsencrypt/live/example.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/example.com/privkey.pem;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;

    location / {
        try_files $uri $uri/ =404;
    }

    access_log /var/log/nginx/example_access.log;
    error_log /var/log/nginx/example_error.log;
}
```
