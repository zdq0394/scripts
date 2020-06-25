#! /bin/bash
docker run -d --name kibana \
    --net "elastic" \
    -p 5601:5601 \
    -e "SERVER_NAME=kibana" \
    -e "ELASTICSEARCH_HOSTS=http://es01:9200" \
    docker.elastic.co/kibana/kibana:7.8.0