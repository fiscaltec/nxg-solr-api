FROM solr:8.3.0

USER root

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs

RUN mkdir /opt/nxg-solr-api

COPY src /opt/nxg-solr-api

WORKDIR /opt/nxg-solr-api

RUN npm install
RUN npx tsc

ENTRYPOINT ["bash", "/opt/nxg-solr-api/startup.sh"]

EXPOSE 8983
EXPOSE 8765
