FROM centos:7.6

ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-5.7.31
ARG MYSQL_SHELL_PACKAGE=mysql-shell-8.0.21

COPY docker-entrypoint.sh /entrypoint.sh
COPY healthcheck.sh /healthcheck.sh
# Install server
RUN yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
      https://repo.mysql.com/mysql-community-release-el7.rpm \
  && yum-config-manager --enable mysql57-server-minimal \
  && yum install -y \
      $MYSQL_SERVER_PACKAGE \
      $MYSQL_SHELL_PACKAGE \
      libpwquality \
      initscripts \
  && yum clean all \
  && mkdir /docker-entrypoint-initdb.d 

VOLUME /var/lib/mysql

ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
EXPOSE 3306 
CMD ["mysqld"]

