#! /bin/shs
# 1. Deploy Mysql Server container
echo "Deploy Mysql Server container: mysql-server"
docker run --name mysql-server -t \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix_pwd" \
-e MYSQL_ROOT_PASSWORD="root_pwd" \
-d mysql:5.7 \
--character-set-server=utf8 --collation-server=utf8_bin

# 2. Deploy Zabbix Gava Gateway container
echo "Deploy Zabbix Gava Gateway container zabbix-java-gateway"
docker run --name zabbix-java-gateway -t \
-d zabbix/zabbix-java-gateway:latest

# 3. Start Zabbix server instance and link the instance with created MySQL server instance
echo "Start Zabbix server instance and link the instance with created MySQL server instance" 
docker run --name zabbix-server-mysql -t \
-e DB_SERVER_HOST="mysql-server" \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix_pwd" \
-e MYSQL_ROOT_PASSWORD="root_pwd" \
-e ZBX_JAVAGATEWAY="zabbix-java-gateway" \
--link mysql-server:mysql \
--link zabbix-java-gateway:zabbix-java-gateway \
-p 10051:10051 \
-d zabbix/zabbix-server-mysql:latest
echo "Zabbix server instance exposes 10051/TCP port (Zabbix trapper) to host machine."

# 4. Start Zabbix web interface and link the instance with created MySQL server and Zabbix server instances
echo "Start Zabbix web interface and link the instance with created MySQL server and Zabbix server instances"
docker run --name zabbix-web-nginx-mysql -t \
-e DB_SERVER_HOST="mysql-server" \
-e MYSQL_DATABASE="zabbix" \
-e MYSQL_USER="zabbix" \
-e MYSQL_PASSWORD="zabbix_pwd" \
-e MYSQL_ROOT_PASSWORD="root_pwd" \
--link mysql-server:mysql \
--link zabbix-server-mysql:zabbix-server \
-p 80:80 \
-d zabbix/zabbix-web-nginx-mysql:latest
echo "Zabbix web interface instance exposes 80/TCP port (HTTP) to host machine."
