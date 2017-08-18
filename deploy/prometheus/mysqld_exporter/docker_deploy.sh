#! /bin/sh
# mysqld-exporter is bound with a mysql database, not mysqld
DATA_SOURCE_NAME="user:password@(bdd:3306)/test"
docker pull prom/mysqld-exporter:v0.10.0
# link mode
docker run -d -p 9104:9104 --name mysqld-exporter-test\
    --link=my_mysql_container:bdd \
    -e DATA_SOURCE_NAME="${DATA_SOURCE_NAME}" \
    prom/mysqld-exporter:v0.10.0
