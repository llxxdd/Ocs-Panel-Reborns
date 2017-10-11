#!/bin/bash

# go to root
cd
apt-get update
apt-get --assume-yes install libxml-parser-perl
apt-get --assume-yes install nginx php5 php5-fpm php5-cli php5-mysql php5-mcrypt
clear
lee-connect
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/mysql.sh
chmod +x mysql.sh
./mysql.sh
clear
lee-connect
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/mysql_secure.sh
chmod +x mysql_secure.sh
./mysql_secure.sh
clear
useradd -m vps
mkdir -p /home/vps/public_html
chown -R mysql:mysql /var/lib/mysql/
chmod -R 755 /var/lib/mysql/
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
lee-connect
wget -O /etc/nginx/nginx.conf https://github.com/llxxdd/sys/tree/master/lib/db/jig/nginx.conf
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
lee-connect
wget -O /etc/nginx/conf.d/vps.conf https://github.com/llxxdd/sys/tree/master/lib/db/jig/vps-lee-83.conf
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf
echo "<?php phpinfo() ?>" > /home/vps/public_html/info.php
service php5-fpm restart
service nginx restart
clear
apt-get -y install zip unzip
cd /home/vps/public_html
lee-connect
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/Leepanelocs.zip
unzip Leepanelocs.zip
rm -f Leepanelocs.zip
clear
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
clear
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
php5enmod mcrypt
rm -r /root/ocs
wget -O /home/vps/public_html/index.html "https://github.com/llxxdd/sys/tree/master/lib/db/jig/index.html"
clear
cd
rm .sh
rm mysql.sh
rm mysql_secure.sh
rm -rf ~/.bash_history && history -c
clear
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/dotdeb.gpg
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/jcameron-key.asc
cat dotdeb.gpg | apt-key add -;rm dotdeb.gpg
cat jcameron-key.asc | apt-key add -;rm jcameron-key.asc
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
apt-get update;apt-get -y upgrade;apt-get -y install wget curl
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
if [ -d '/usr/local/ddos' ]; then
	echo; echo; echo "Please un-install the previous version first"
	exit 0
else
	mkdir /usr/local/ddos
fi
clear
echo; echo 'Installing DOS-Deflate 0.6'; echo
echo; echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo; echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo; echo 'Installation has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'
echo 'Please send in your comments and/or suggestions to Lee Dzung Autoscript'
apt-get -y install squid3
lee-connect
wget -O /etc/squid3/squid.conf https://github.com/llxxdd/sys/tree/master/lib/db/jig/squid.conf
sed -i "s/ipserver/$myip/g" /etc/squid3/squid.conf
apt-get -y install openvpn
cd /etc/openvpn/
lee-connect
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/openvpn.tar;tar xf openvpn.tar;rm openvpn.tar
lee-connect
wget -O /etc/iptables.up.rules https://github.com/llxxdd/sys/tree/master/lib/db/jig/iptables.up.rules
sed -i '$ i\iptables-restore < /etc/iptables.up.rules' /etc/rc.local
sed -i "s/ipserver/$myip/g" /etc/iptables.up.rules
iptables-restore < /etc/iptables.up.rules
lee-connect
wget -O /home/vps/public_html/client.ovpn https://github.com/llxxdd/sys/tree/master/lib/db/jig/client.ovpn
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client.ovpn;cd
lee-connect
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/cronjob.tar
tar xf cronjob.tar;mv uptimes.php /home/vps/public_html/
mv usertol userssh uservpn /usr/bin/;mv cronvpn cronssh /etc/cron.d/
chmod +x /usr/bin/usertol;chmod +x /usr/bin/userssh;chmod +x /usr/bin/uservpn;
useradd -m -g users -s /bin/bash sshvpn
echo "sshvpn:123456" | chpasswd
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i 's/Port 22/Port  22/g' /etc/ssh/sshd_config
service ssh restart
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=443/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-p 109 -p 110"/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
service ssh restart
service dropbear restart
apt-get -y install fail2ban;
service fail2ban restart
lee-connect
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/webmin.sh
chmod +x webmin.sh
./webmin.sh
lee-connect
wget https://github.com/llxxdd/sys/tree/master/lib/db/jig/pptp.sh
chmod +x pptp.sh
./pptp.sh
lee-connect
echo "0 0 * * * root /usr/bin/user-expire" > /etc/cron.d/user-expire
echo "0 */12 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "* * * * * service dropbear restart" > /etc/cron.d/dropbear
rm $0
clear
service openvpn restart
service squid3 restart
service ssh restart
service dropbear restart
service nginx start
clear
cd ~/
cat /dev/null > ~/.bash_history && history -c
