#! /bin/bash
#http://repoforge.org/use/

echo "Please input php version > 5.4.0:"
read -p "(Default php version: 5.4.10):" phpversion
if [ "$phpversion" = "" ]; then
	phpversion="5.4.10"
fi

echo "Please input php install where:"
read -p "(Default php install: /hhedu/edusrv):" phpinstalldir
if [ "$phpinstalldir" = "" ]; then
	phpinstalldir="/hhedu/edusrv"
fi


#if [ -s $phpinstalldir/php-${phpversion} ]; then
#	echo "$phpinstalldir/php-$phpversion dir already exist;please move $phpinstalldir/php-$phpversion to another where or delete $phpinstalldir/php-$phpversion then continue"
#	exit
#fi

#if [ ! -f rpmforge-release-0.5.2-2.el6.rf.i686.rpm ];then
#	wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm
#fi
#rpm -ivh rpmforge-release-0.5.2-2.el6.rf.i686.rpm

#if [ ! -f libiconv-1.13.1.tar.gz ];then
#	wget http://public.157.img1001.com/web/libiconv-1.13.1.tar.gz
#fi
#rm -rf libiconv-1.13.1
#tar zxvf libiconv-1.13.1.tar.gz
#cd libiconv-1.13.1
#./configure --prefix=$phpinstalldir/libiconv
#make
#make install
#ldconfig
#cd ..

yum -y install gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel libmcrypt libmcrypt-devel mhash mhash-devel libtool-ltdl-devel
#rm -rf php-${phpversion} ${phpversion}.tar.gz
#if [ ! -f php-${phpversion}.tar.gz ];then
#	wget http://cn.php.net/get/php-${phpversion}.tar.gz/from/cn2.php.net/mirror
#fi
#tar zxvf php-${phpversion}.tar.gz
cd php-${phpversion}
./configure --prefix=${phpinstalldir}/php-${phpversion} --with-config-file-path=${phpinstalldir}/php-${phpversion}/etc --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --enable-fpm --enable-static --enable-maintainer-zts --enable-zend-multibyte --enable-inline-optimization --enable-sockets --enable-wddx --enable-zip --enable-calendar --enable-bcmath --enable-soap --with-zlib --with-iconv-dir=$phpinstalldir/libiconv --with-gd --with-xmlrpc --enable-mbstring --without-sqlite --with-curl --enable-ftp --with-mcrypt  --with-freetype-dir --with-jpeg-dir --with-png-dir --disable-ipv6 --disable-debug
make ZEND_EXTRA_LIBS='-liconv'
make install
