sudo -i
yum update
yum -y upgrade
yum -y install vim git wget curl nginx

firewall-cmd --permanent --add-service=http
firewall-cmd --reload

echo '<h1>Hello, World!</h1>' >/usr/share/nginx/html/index.html

service nginx restart

rm -rf /var/lib/apt/lists/*  /tmp/*  /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base
cat /dev/null > ~/.bash_history && history -c && exit
