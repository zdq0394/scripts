#! /bin/bash
docker run -d --name=jaeger-query --rm \
    --net "elastic" \
    -p 16686:16686 \
    -p 16687:16687 \
    -e SPAN_STORAGE_TYPE=elasticsearch \
    -e ES_SERVER_URLS=http://es01:9200 \
    jaegertracing/jaeger-query:1.18
