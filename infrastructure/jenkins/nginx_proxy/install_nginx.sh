#! /bin/sh
apt-get install -y nginx
mkdir -p /var/log/nginx/jenkins
cp nginx.conf /etc/nginx/sites-available/jenkins.conf
cd /etc/nginx/sites-enabled
rm -f default
ln -s /etc/nginx/sites-available/jenkins.conf jenkins

service nginx reload
service nginx restart