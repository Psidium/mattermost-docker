FROM ubuntu:14.04

ENV http_proxy 'http://proxy.phl.sap.corp:8080'
ENV https_proxy 'http://proxy.phl.sap.corp:8080'
ENV no_proxy 'localhost,sap.corp,mo.sap.corp,cc.mo.sap.corp,sap.biz,cloud.sap,sap,cc.ondemand.com,moo-repo,moo-repo.wdf.sap.corp,repo,repo.wdf.sap.corp,169.254.169.254,mo-d4c8c14d0,127.0.0.1,10.9.43.64'

RUN apt-get update && apt-get -y install wget netcat
RUN mkdir -p /mattermost/data

RUN wget https://releases.mattermost.com/2.2.0/mattermost-team-2.2.0-linux-amd64.tar.gz \
	&& tar -xvzf mattermost-team-2.2.0-linux-amd64.tar.gz && rm mattermost-team-2.2.0-linux-amd64.tar.gz

COPY config.template.json /
COPY docker-entry.sh /

RUN chmod +x /docker-entry.sh
ENTRYPOINT /docker-entry.sh

EXPOSE 80
