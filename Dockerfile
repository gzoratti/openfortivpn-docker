# Base image use debian
FROM bitnami/minideb:latest
ENV TZ=$TZ
ENV host=$host
ENV port=$port
ENV username=$username
ENV password=$password
ENV trustedcert=$trustedcert
ENV realm=$realm

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Tag maintainer 
MAINTAINER Arhs³ <infrastructure@arhs-cube.com>
MAINTAINER Gilles Zoratti
# Install base packages
RUN apt-get update
RUN apt-get install net-tools tzdata openfortivpn systemctl -y 
RUN apt-get upgrade -y

# COPY CONFIG FILE
CMD openfortivpn $host:$port --realm=$realm --username=$username --password=$password --set-dns=0 --trusted-cert=$trustedcert
