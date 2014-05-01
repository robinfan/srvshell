#!/bin/bash
yum -y install wget unzip pcre-devel openssl-devel
echo "Please input nginx version:"
read -p "(Default nginx version: 1.2.6):" nginxversion
if [ "$nginxversion" = "" ]; then
	nginxversion="1.2.6"
fi

echo "Please input nginx install where:"
read -p "(Default nginx install: /hhedu/edusrv):" nginxwhere
if [ "$nginxwhere" = "" ]; then
	nginxwhere="/hhedu/edusrv"
fi

if [ -s $nginxwhere/nginx-${nginxversion} ]; then
	echo "$nginxwhere/nginx-$nginxversion dir already exist;please move $nginxwhere/nginx-$nginxversion to another where or delete $nginxwhere/nginx-$nginxversion then continue"
	exit
fi

if [ -s nginx-${nginxversion}.tar.gz ]; then
  echo "nginx-$nginxversion.tar.gz [found]"
  else
  echo "Error: nginx-$nginxversion not found!!!download now......"
  wget -c http://nginx.org/download/nginx-${nginxversion}.tar.gz
fi

if [ -s nginx-${nginxversion} ]; then
  rm -rf nginx-${nginxversion}
fi

#wget -O nginx.tar.gz http://nginx.org/download/nginx-${nginxversion}.tar.gz
tar -zxvf nginx-${nginxversion}.tar.gz
cd nginx-${nginxversion}
./configure --user=nobody --group=nobody --prefix=${nginxwhere}/nginx-${nginxversion} --with-http_stub_status_module --with-http_ssl_module
make
make install
