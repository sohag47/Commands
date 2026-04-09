# Install & Configure necessary tools for application deploy

```bash
# update ubuntu
sudo apt update
sudo apt upgrade -y
```

## Setup curl

```bash
# install
sudo apt install curl -y

# verify install
curl --version

# Test a link
curl https://example.com

# Check only headers
curl -I https://example.com

# Test HTTPS SSL
curl -I https://example.com

# POST Request Example
curl -X POST https://api.example.com/login \
-H "Content-Type: application/json" \
-d '{"email":"test@test.com","password":"123456"}'

# Download File with curl
curl -o myfile.zip https://example.com/file.zip

# Check Server IP
curl ifconfig.me
```

## Setup nodejs [latest]

```bash
# replace nodejs url from nodejs website
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v

# Verify npm version:
npm -v
```

## Setup git

```bash
# verify install
sudo apt install git -y

# verify install
git --version

# configure local username & email
git config --list --global

git config --global user.name "Your Name"

git config --global user.email "your_email@example.com"

git config --global user.name

git config --global user.email
```

## Setup Mysql

```bash
sudo apt install mysql-server -y

sudo systemctl start mysql

sudo systemctl enable mysql

sudo systemctl status mysql
```

### Login to MySQL

```bash
# login with terminal
sudo mysql
# mysql>

# Show databases
SHOW DATABASES;

# Create Database
Create Database

# Create MySQL User
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'StrongPassword123!';

# Give access to the database:
GRANT ALL PRIVILEGES ON myapp.* TO 'myuser'@'localhost';

# Reload privileges:
FLUSH PRIVILEGES;

# Test Login with New User
mysql -u myuser -p

# Exit MySQL
EXIT;
```

## Allow Remote Connections (Optional)

```bash
# Edit MySQL config:
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf

# Find:
bind-address = 127.0.0.1

# Change to:
bind-address = 0.0.0.0

# Allow port in firewall:
sudo ufw allow 3306

# Restart MySQL:
sudo systemctl restart mysql

```

## Setup docker

```bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo systemctl start docker

sudo systemctl enable docker

docker --version

docker compose version
sudo usermod -aG docker $USER

newgrp docker

echo "install docker desktop manually"
```


# Create a folder and set permissions
```bash
sudo mkdir -p /opt/frontend
sudo chown -R sptsolution:sptsolution /opt/frontend
sudo chmod -R 755 /opt/frontend
# verify 
ls -ld /opt/frontend 
# output: drwxr-xr-x  sptsolution sptsolution /opt/frontend
```
