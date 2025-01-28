<!-- @format -->

# Set up Nextjs Project

## Setup pm2

```bash
cp .env.example .env.production  #create .env file
# change API_HOST, API_PORT

npm i --ff # install all dependencies

npm run build # default build

npm install -g pm2 # for project management in background

pm2 start npm --name nextjs-app -- start # configure your project

pm2 startup # auto restart system start up

pm2 save # save configuration

pm2 list # show all application

pm2 start/restart/reload/stop/delete nextjs-app # all actions

pm2 logs # show logs

pm2 monit # monitor project health

pm2 plus # monitor project health with cloud app remotely
```

## Setup nginx

```bash
# Install Nginx
sudo apt install nginx

# Start and Enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Configure the Firewall
sudo ufw allow 'Nginx Full'

# Verify Nginx Installation
sudo systemctl status nginx

# Configure Nginx Server with pm2 projects
sudo nano /etc/nginx/sites-available/nextjs-app

# add this script
server {
  listen 80;
  server_name 192.168.0.122; # IP/Domain
  location / {
    proxy_pass http://192.168.0.122:3000; # pm2 application url
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
  }
}

# sites-enabled
sudo ln -s /etc/nginx/sites-available/nextjs-app /etc/nginx/sites-enabled/

# Show log
sudo nginx -t

# restart Server
sudo systemctl reload nginx

```

## Final Step

```bash
# restart pm2 server
 pm2 restart nextjs-app

 # restart nginx Server
sudo systemctl reload nginx
```
