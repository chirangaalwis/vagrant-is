#!/bin/bash

# ------------------------------------------------------------------------
# Copyright 2017 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License
# ------------------------------------------------------------------------

# set variables
DBPASSWD=wso2carbon

# set and export environment variables
export DEBIAN_FRONTEND=noninteractive
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# set MySQL root password configuration using debconf
echo debconf mysql-server/root_password password $DBPASSWD | \
  sudo debconf-set-selections
echo debconf mysql-server/root_password_again password $DBPASSWD | \
  sudo debconf-set-selections

# run package updates
apt-get update

# install mysql
apt-get -y install mysql-server

# run product db script
mysql -uroot -pwso2carbon -e "source /vagrant/mysql/scripts/mysql.sql"

# grants root access to MySQL server from any host
mysql -uroot -pwso2carbon -e "create user 'root'@'%' identified by 'wso2carbon';"
mysql -uroot -pwso2carbon -e "grant all privileges on *.* to 'root'@'%' with grant option;"
mysql -uroot -pwso2carbon -e "flush privileges;"

# set the bind address from loopback address to all IPv4 addresses of the host
#sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf

# restart the MySQL server
service mysql restart
