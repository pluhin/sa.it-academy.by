sudo -i
apt-get update
apt-get -y upgrade
apt-get -y install vim git wget curl nginx

echo '<h1>Hello, World!</h1>' >/var/www/html/index.html

service nginx restart

rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
