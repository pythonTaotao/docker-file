FROM alpine:latest
ENV DOTNET_ROOT=/opt/dotnet PATH=${PATH}:/opt/dotnet \
    JAVA_HOME="/usr/lib/jvm/default-jvm/"
COPY ["./dotnet","/root/dotnet"]
COPY ["./java","/root/java"]
COPY ["./run.sh","/tmp/run.sh"]
RUN apk update && apk add icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib curl bash openjdk11
ENV PATH=$PATH:${JAVA_HOME}/bin
RUN mkdir -p -m 777 ${DOTNET_ROOT} && \   #创建目录并授予777权限
    curl -Lo /tmp/dotnet-install.sh https://dot.net/v1/dotnet-install.sh && \   #下载dotnet的安装脚本到tmp目录下
    chmod a+x /tmp/dotnet-install.sh && \    #给dotnet-install.sh脚本赋予执行权限
    cd /opt/dotnet && \   #进入到/opt/dotnet目录
    /tmp/dotnet-install.sh -c Current -v 5.0.13 -i ${DOTNET_ROOT} --runtime aspnetcore && \  #执行dotnet-install.sh脚本安装dotnet环境
    rm -f /tmp/dotnet* && \   #删除下载的文件
    chomd +x /tmp/run.sh      #给run.sh 脚本赋予执行权限

CMD ["/bin/bash","/tmp/run.sh"]
##https://docs.microsoft.com/zh-cn/dotnet/core/install/linux-scripted-manual#scripted-install
