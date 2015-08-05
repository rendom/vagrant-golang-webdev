#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
MYSQL_PASS="passw0rd"

apt-get -q -y install mariadb-server
mysqladmin -u root password passw0rd

mysql -uroot -p$MYSQL_PASS -e "CREATE DATABASE dev DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;"
mysql -uroot -p$MYSQL_PASS -e "GRANT ALL on dev.* to 'dev'@'%' IDENTIFIED BY '$MYSQL_PASS';"

sed -i.bak "s/127.0.0.1/0.0.0.0/" /etc/mysql/my.cnf

service mysql restart

echo "[Mysql users]"
echo "root $MYSQL_PASS"
echo "dev $MYSQL_PASS"
