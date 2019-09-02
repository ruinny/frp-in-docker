FROM alpine:3.8
 
MAINTAINER ruiny <anyzdm@gmail.com>

ENV Frp_ver 0.29.0

RUN wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${Frp_ver}/frp_${Frp_ver}_linux_amd64.tar.gz && \
    tar -zxf frp_${Frp_ver}_linux_amd64.tar.gz && \
    mkdir /var/frp && \
    mkdir /var/frp/conf && \
    mv frp_${Frp_ver}_linux_amd64/* /var/frp && \
    rm -rf frp_${Frp_ver}_linux_amd64.tar.gz 
    
ADD frps.ini /var/frp/conf

WORKDIR /var/frp


ENTRYPOINT ./frps -c conf/frps.ini
