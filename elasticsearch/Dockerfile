# Elasticsearch Dockerfile for Usergrid
FROM ca03430/usergrid-base-image:ssh

MAINTAINER chandrakant

RUN groupadd -r elasticsearch --gid=999 && useradd -r -g elasticsearch --uid=999 elasticsearch

ADD elasticsearch-1.7.6.tar.gz /opt
ENV ES_HOME /opt/elasticsearch-1.7.6
ENV ES_CONFIG_FILE $ES_HOME/config/elasticsearch.yml

RUN mkdir -p /var/log/supervisor

RUN chown -R elasticsearch:elasticsearch $ES_HOME \
    && chmod 777 $ES_HOME

COPY entrypoint-elasticsearch.sh /entrypoint-elasticsearch.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/entrypoint-elasticsearch.sh"]
CMD ["/usr/bin/supervisord"]

# expose ports
#   - 9200: HTTP
#   - 9300: native transport
EXPOSE 9200
EXPOSE 9300


