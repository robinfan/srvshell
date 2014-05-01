iptables -A INPUT  -p tcp --dport 27017 -s 111.227.174.66 -j ACCEPT
iptables -A INPUT -p tcp --dport 27017 -j DROP
iptables -I INPUT -i eth0 -s  111.227.174.66 -j ACCEPT

service iptables save
