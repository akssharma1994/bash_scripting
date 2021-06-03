#!/bin/bash

sed -i s/IPADDR*/IPADDR=192.168.10.3/g /etc/sysconfig/network-scripts/ifcfg-ens33
sed -i s/PRIFIX*/PREFIX=24/g /etc/sysconfig/network-scripts/ifcfg-ens33
sed -i s/GATEWAY*/GATEWAY=192.168.10.1/ /etc/sysconfig/network-scripts/ifcfg-ens33
ifdown ens33
ifup ens33

echo "Following are the IP address details"
serverip=$(ifconfig | head -n2 | grep inet | awk '{print $2}')
broadcastip=$(ifconfig | head -n2 | grep inet | awk '{print $4}')
netmaskip=$(ifconfig | head -n2 | grep inet | awk '{print $6}')
echo ""
echo "Server IP is $serverip"
echo ""
echo "Refreshing the interface by restarting it"
sleep 2s
echo "Interfaces are up"
echo ""
echo "Installing DHCP using YUM server"
yum -y install dhcp-server

echo ""
echo "Checking if DHCP package is Installed.."
sleep 1s
var=$(rpm -qa dhcp)
if [[ -n $var ]]
	then
		echo "DHCP package is Installed."
	else
		echo "DHCP package is not installed properly"
fi

echo "Configuring the dhcp.conf file"
echo "log-facility local7;
subnet 192.168.10.0 netmask 255.255.255.0 {
  range 192.168.10.50 192.168.10.100;
  option routers 192.168.10.1;
  option broadcast-address 192.168.10.255;
  default-lease-time 600;
  max-lease-time 7200;
}" > /etc/dhcp/dhcpd.conf
sleep 2s
echo ""
echo "DHCP configuration file congfigured"
echo ""
echo "This is the final configuration"
cat /etc/dhcp/dhcpd.conf
echo ""
sleep 1s
echo "Starting dhcpd service now"
service dhcpd start
sleep 1s
echo "Checking if started properly"
service dhcpd status | head -n6
echo "Done. Please go to client to fetch the IP from DHCP Server. Thanks "
whoami
