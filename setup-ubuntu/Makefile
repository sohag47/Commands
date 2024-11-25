APP := "Setup Development Environment for ubuntu pc"

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



