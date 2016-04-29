FROM ubuntu:14.04

ENV http_proxy 'http://proxy.phl.sap.corp:8080'
ENV https_proxy 'http://proxy.phl.sap.corp:8080'
ENV no_proxy 'localhost,sap.corp,mo.sap.corp,cc.mo.sap.corp,sap.biz,cloud.sap,sap,cc.ondemand.com,moo-repo,moo-repo.wdf.sap.corp,repo,repo.wdf.sap.corp,169.254.169.254,mo-d4c8c14d0,127.0.0.1,10.9.43.64'

RUN apt-get update && apt-get install -y nginx

RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/mattermost /etc/nginx/sites-enabled/mattermost

ADD mattermost /etc/nginx/sites-available/
ADD docker-entry.sh /

RUN mkdir /cert
ADD cert/cert.pem /cert/
ADD cert/private/key-no-password.pem /cert/

RUN chmod +x /docker-entry.sh

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

ENTRYPOINT /docker-entry.sh

EXPOSE 80 443
