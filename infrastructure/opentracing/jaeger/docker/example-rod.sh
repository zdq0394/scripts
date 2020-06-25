#! /bin/bash
docker run -d --rm -it --name example-rod \
  --link jaeger-allinone \
  -p8080-8083:8080-8083 \
  -e JAEGER_AGENT_HOST="jaeger-allinone" \
  jaegertracing/example-hotrod:1.18 \
  all