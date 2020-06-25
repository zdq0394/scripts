#! /bin/bash
docker run -d --name=jaeger-collector\
    --net "elastic" \
    -p 14250:14250 \
    -p 14268:14268 \
    -p 14269:14269 \
    -e SPAN_STORAGE_TYPE=elasticsearch \
    -e ES_SERVER_URLS=http://es01:9200 \
    jaegertracing/jaeger-collector:1.18
