#!/bin/bash
echo "обновление Ubuntu"
sudo apt-get update
echo "установка Java OpenJDK version 8 из репозитория PPA"
sudo apt install software-properties-common apt-transport-https -y
sudo add-apt-repository ppa:openjdk-r/ppa -y
sudo apt install openjdk-8-jdk -y
echo "проверка версии Java"
java -version
echo "установка Jenkins"
echo "-----------------"
echo "добавление ключа и репозитория Jenkins в систему"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo 'deb https://pkg.jenkins.io/debian-stable binary/' | sudo tee -a /etc/apt/sources.list
echo "обнавление репозитория"
sudo apt update
echo "установка Jenkins"
sudo apt install jenkins -y
echo "проверка status Jenkins"
sudo systemctl start jenkins
echo "добавление Jenkins в автозагрузку"
sudo systemctl enable jenkins
echo "Jenkins теперь работает и запущен на сервере Ubuntu 18.04, работая на порту 8080 по умолчанию"
echo "проверка работающих портов"
sudo netstat -plntu
echo "установка веб-сервер apache2 из репозитория Ubuntu"
echo "--------------------------------------------------"
sudo apt install apache2 -y
echo "включение модулей proxy и proxy_http для настройка Apacht как proxy"
sudo a2enmod proxy
sudo a2enmod proxy_http
echo "restart службы Apache и Jenkins"
sudo systemctl restart apache2
sudo systemctl restart jenkins
echo "вывод ключа Jenkins"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "проверка статуса Apache и Jenkins"
sudo systemctl status apache2
sudo systemctl status jenkins