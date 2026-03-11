# Build and Publish Dotnet Application

```bash
publish/
↓
scp publish → server
↓
/var/www/myapp
↓
systemd service
↓
nginx reverse proxy
```

```bash
# open wsl as root
wsl -u root
# exit from wsl
exit
# stop all running WSL instances:
wsl --shutdown
```

```bash
# manage permissions for www directory
sudo chown -R $USER:$USER /var/www
```

```bash
# make folder cms-api
sudo mkdir -p /var/www/cms-api

# copy file from any drive to wsl www
sudo cp -r /mnt/d/C_Sharp/Deploy/* /var/www/cms-api

# goto directory
cd /var/www/cms-api
```

```bash
# dotnet run manually
dotnet cms-backend.dll
```

```bash
# Create a service file
sudo nano /etc/systemd/system/cmsapp.service
```

```bash
[Unit]
Description=My Dotnet App
After=network.target

[Service]
WorkingDirectory=/var/www/cms-api
ExecStart=/usr/bin/dotnet /var/www/ms-api/cms-backend.dll --urls=http://0.0.0.0:5000
Restart=always
RestartSec=10
User=root
Environment=ASPNETCORE_ENVIRONMENT=Production

[Install]
WantedBy=multi-user.target
```

```bash
# for important command
sudo systemctl daemon-reload
sudo systemctl start cmsapp
sudo systemctl enable cmsapp
sudo systemctl status cmsapp
```

```bash
# stop app
sudo systemctl stop cmsapp

# stop auto start
sudo systemctl disable cmsapp

# check autostart is enabled
systemctl is-enabled cmsapp

# auto-start again
sudo systemctl enable cmsapp

# restart app
sudo systemctl restart cmsapp
```

```bash
# show logs
journalctl -u cmsapp -f
```
