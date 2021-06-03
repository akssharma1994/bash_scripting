#!/bin/bash

yum install vsftp* -y
systemctl enable vsftpd.service
systemctl start vsftpd.service
systemctl status vsftpd.service

# Create a User and it's directory
useradd ftpuser
passwd ftpuser
#Create a ftp user and its directory
mkdir -p /home/ftpuser/ftp-dir
chmod -R 750 /home/ftpuser/ftp_dir
chown -R ftpuser: /home/ftpuser/ftp_dir

#We also need to add the FTP user to the /etc/vsftpd/user_list
#file to allow the user access to the vsftp server.\\

bash -c 'echo ftpuser >> /etc/vsftpd/user_list'

#Configure vsftpd via its configuration file
vi /etc/vsftpd/vsftpd.conf

