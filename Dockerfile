FROM centos:7
MAINTAINER lyly
ENV TIME_ZOME Asia/Shanghai
ARG red="redis-4.0.14"
ADD $red.tar.gz /tmp
RUN yum -y install gcc gcc-c++ libstdc++-devel git \
&& cd /tmp/$red \
&& make && make install \
&& cp redis.conf /usr/local/bin \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& rm -rf /tmp/*
WORKDIR /usr/local/bin/
CMD ["/usr/local/bin/redis-server","/usr/local/bin/redis.conf"]
