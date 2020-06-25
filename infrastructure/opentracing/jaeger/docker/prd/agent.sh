#! /bin/bash
docker run -d --name=jaeger-agent \
    --net "elastic" \
    --rm \
    -p5775:5775/udp \
    -p6831:6831/udp \
    -p6832:6832/udp \
    -p5778:5778/tcp \
    jaegertracing/jaeger-agent:1.18 \
    --reporter.grpc.host-port=jaeger-collector:14250