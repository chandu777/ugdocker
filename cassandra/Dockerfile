# docker file for usergrid cassandra
FROM ca03430/usergrid-base-image:ssh

MAINTAINER chandrakant

ENV CASSANDRA_CONFIG /opt/apache-cassandra-2.1.21

RUN groupadd -r cassandra --gid=999 && useradd -r -g cassandra --uid=999 cassandra

ADD apache-cassandra-2.1.21-bin.tar.gz /opt
COPY docker-entrypoint.sh /
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN mkdir -p /var/log/supervisor

RUN chown -R cassandra:cassandra "$CASSANDRA_CONFIG" \
    && chmod 777 "$CASSANDRA_CONFIG"

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/supervisord"]

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 7000 7001 7199 9042 9160
