# ADW_E1 

FROM ubuntu:latest
MAINTAINER Ciprian Ilut "ciutp@gmail.com"

#
# Install ssh & mysql
#

RUN apt-get update && apt-get install -y --no-install-recommends \
	openssh-server --yes\
	mysql-server-5.7 --yes

#Configuración ssh 
RUN {\
	echo 'root:root' | chpasswd; \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config; \
	echo "10.0.0.5   avoid_error" >> /etc/hosts; \
	service ssh restart; \
	}

#Configuracion mysql 
RUN {\
	echo "bind-address            = 0.0.0.0" >> /etc/mysql/mysql.conf.d/mysqld.cnf; \
	echo "server-id				  = 3" >> /etc/mysql/mysql.conf.d/mysqld.cnf; \
	service mysql restart; \
	echo "CREATE USER 'myuser'@'%' IDENTIFIED BY 'myuser';" | mysql; \
	echo "GRANT ALL ON *.* TO 'myuser'@'%' IDENTIFIED BY 'myuser';" | mysql; \
	echo "STOP SLAVE;" | mysql;\
	echo "CHANGE MASTER TO MASTER_HOST='10.0.0.5',MASTER_USER='replicauser', MASTER_PASSWORD='replicauser', MASTER_LOG_FILE='mysql-bin.000016', MASTER_LOG_POS= 970;" | mysql;\
	echo "START SLAVE;" | mysql;\
	}

RUN PATH="$PATH:docker-entrypoint.sh"
COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

