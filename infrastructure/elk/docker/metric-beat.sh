#! /bin/bash
docker run -d --name metricbeat \
    --net "elastic" \
    docker.elastic.co/beats/metricbeat:7.8.0 \
    setup -E setup.kibana.host=kibana:5601 \
    -E output.elasticsearch.hosts=["es01:9200"]