FROM postgres:9.4

ENV http_proxy 'http://proxy.phl.sap.corp:8080'
ENV https_proxy 'http://proxy.phl.sap.corp:8080'
ENV no_proxy 'localhost,sap.corp,mo.sap.corp,cc.mo.sap.corp,sap.biz,cloud.sap,sap,cc.ondemand.com,moo-repo,moo-repo.wdf.sap.corp,repo,repo.wdf.sap.corp,169.254.169.254,mo-d4c8c14d0,127.0.0.1,10.9.43.64'

RUN apt-get update \
    && apt-get install -y python-dev lzop pv daemontools curl build-essential \
    && curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py | python \
    && pip install wal-e \
    && apt-get remove -y build-essential python-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD make_db.sh /docker-entrypoint-initdb.d/
ADD setup-wale.sh /docker-entrypoint-initdb.d/
COPY docker-entrypoint1.sh /

ENTRYPOINT ["/docker-entrypoint1.sh"]

CMD ["postgres"]
