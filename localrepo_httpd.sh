#!/bin/bash
mount /dev/sr0 /opt/
echo "[InstallMedia-BaseOS]
name=CentOS Linux 8 - BaseOS
gpgcheck=0
enabled=1
baseurl=file:///opt/BaseOS/
[InstallMedia-AppStream]
name=CentOS Linux 8 - AppStream
gpgcheck=0
enabled=1
baseurl=file:///opt/AppStream/" > /etc/yum.repos.d/centos8.repo
chmod 644 /etc/yum.repos.d/centos8.repo
yum clean all
yum repolist
sed -i s/enabled=1/enabled=0/g /etc/yum.repos.d/CentOS-AppStream.repo /etc/yum.repos.d/CentOS-Base.repo

#httpd service installation
yum install httpd -y
systemctl enable httpd.service
systemctl start httpd.service

#static content hosting configuration file changes
sed -i 's!/var/www/html!/opt!' /etc/httpd/conf/httpd.conf
sed -i 's/Options Indexes FollowSymLinks/Options All Indexes FollowSymLinks/' /etc/httpd/conf/httpd.conf
sed -i 's!/var/www!/opt!' /etc/httpd/conf/httpd.conf
rm -rf /etc/httpd/conf.d/welcome.conf
#restarting httpd service
systemctl restart httpd.service
