iptables -A INPUT  -p tcp --dport 27017 -s 111.227.174.66 -j ACCEPT
iptables -A INPUT -p tcp --dport 27017 -j DROP
service iptables save
