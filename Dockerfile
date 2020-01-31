FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4
# FROM docker.elastic.co/elasticsearch/elasticsearch-oss:6.6.1

COPY elasticsearch-entrypoint.sh /usr/local/bin/elasticsearch-entrypoint.sh
RUN chmod a+x /usr/local/bin/elasticsearch-entrypoint.sh

# ADD jvm.options /usr/share/elasticsearch/config/
ADD elasticsearch.yml /usr/share/elasticsearch/config/
USER root
# RUN chown elasticsearch:elasticsearch config/jvm.options config/elasticsearch.yml
RUN chown elasticsearch:elasticsearch config/elasticsearch.yml
RUN chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

USER elasticsearch
EXPOSE 9200 9300

WORKDIR /

RUN ./usr/share/elasticsearch/bin/elasticsearch-plugin install org.wikimedia.search.highlighter:experimental-highlighter-elasticsearch-plugin:6.5.4.1

ENTRYPOINT ["/usr/local/bin/elasticsearch-entrypoint.sh"]
