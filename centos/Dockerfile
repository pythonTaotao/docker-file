FROM centos:7.6.1810

RUN    echo "root:centos" | chpasswd \
    && sed -i "s/^mirrorlist/#&/g" /etc/yum.repos.d/CentOS-Base.repo \
    && sed -i "s/^#baseurl/baseurl/g" /etc/yum.repos.d/CentOS-Base.repo \
    && sed -i "s/http:\/\/mirror.centos.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/g" /etc/yum.repos.d/CentOS-Base.repo \
    && yum install -y vim openssl openssh-server openssh-clients initscripts \
    && /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone \
    && yum clean all

COPY [ "./src/startup.sh", "/opt/" ]

RUN echo "sh /opt/startup.sh" >> /etc/rc.d/rc.local \
    && chmod +x /opt/startup.sh \
    && chmod +x /etc/rc.d/rc.local


EXPOSE 22

ENTRYPOINT ["/usr/sbin/init"]
