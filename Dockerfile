FROM ubuntu:14.04
MAINTAINER hernad@bring.out.ba

RUN sed -e 's/archive./ba.archive./' /etc/apt/sources.list -i

RUN sudo apt-get update 
RUN sudo apt-get install -y supervisor pptp-linux iptables traceroute


ADD start.sh /start.sh
RUN chmod +x /start.sh
