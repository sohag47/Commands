APP := "Setup Development Environment for ubuntu"

curl:
	sudo apt install curl
	curl --version
nodejs:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
	source ~/.bashrc
	nvm install 22
	node -v
	npm -v
git:
	sudo apt install git -y
	git --version
	git config --list
pm2:
	npm install -g pm2
	pm2 --version
docker:
	sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update
	sudo apt install -y docker-ce docker-ce-cli containerd.io
	sudo systemctl start docker
	sudo systemctl enable docker
	docker --version
	docker compose version
	sudo usermod -aG docker $USER
	newgrp docker
	echo "install docker desktop manually"
nginx:
	sudo apt install nginx -y
	nginx -v
	sudo systemctl start nginx
	sudo systemctl enable nginx
	sudo ufw allow 'Nginx Full'
	sudo systemctl status nginx
	sudo systemctl reload nginx
mysql:
	sudo apt install mysql-server -y
	sudo systemctl start mysql
	sudo systemctl enable mysql
	sudo systemctl status mysql
php:
	sudo apt install php8.1-fpm php-mysql
	sudo apt-get install php8.1-curl

.PHONY: all

all: curl nodejs git pm2 docker nginx mysql php

help:
	@echo "\033[34mMakefile for \033[35m'$(APP)'\033[0m"
	@echo "\033[32mUsage:\033[0m"
	@echo "    Command: \033[35m make [options]\033[0m"
	@echo ""
	@echo "\033[36mAvailable options:\033[0m"
	@echo ""
	@echo "  \033[32mall\033[0m    Install all dependencies"
	@echo "         Installs curl, Node.js, Git, PM2, Docker, Nginx, MySQL, and PHP"
	@echo ""
	@echo "  \033[32mcurl\033[0m   Install curl"
	@echo "         Installs curl and displays the version"
	@echo ""
	@echo "  \033[32mnodejs\033[0m  Install Node.js"
	@echo "         Installs Node.js using nvm and displays the version"
	@echo ""
	@echo "  \033[32mgit\033[0m    Install Git"
	@echo "         Installs Git and displays the version"
	@echo ""
	@echo "  \033[32mpm2\033[0m    Install PM2"
	@echo "         Installs PM2 globally and displays the version"
	@echo ""
	@echo "  \033[32mdocker\033[0m  Install Docker"
	@echo "         Installs Docker and displays the version"
	@echo ""
	@echo "  \033[32mnginx\033[0m  Install Nginx"
	@echo "         Installs Nginx and displays the version"
	@echo ""
	@echo "  \033[32mmysql\033[0m  Install MySQL"
	@echo "         Installs MySQL and displays the version"
	@echo ""
	@echo "  \033[32mphp\033[0m    Install PHP"
	@echo "         Installs PHP and displays the version"

