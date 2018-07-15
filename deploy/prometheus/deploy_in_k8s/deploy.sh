#!/bin/bash
# Create namespace monitoring
kubectl apply -f namespace.yaml

# Create node exporter
kubectl apply -f exporter/node_exporter.daemonset.yaml
kubectl apply -f exporter/node_exporter.svc.yaml

# Create SMS hook
kubectl apply -f smshook/smshook.cm.yaml
kubectl apply -f smshook/smshook.deployment.yaml
kubectl apply -f smshook/smshook.svc.yaml

# sleep a while in seconds
sleep 15s

# Create alertmanager
kubectl apply -f alertmanager/alertmanager.cm.yaml
kubectl apply -f alertmanager/alertmanager.deployment.yaml
kubectl apply -f alertmanager/alertmanager.svc.yaml

# sleep a while in seconds
sleep 15
# Create prometheus-server
## Create prometheus server alert rules
kubectl apply -f prometheus/prometheus-rules.cm.yaml
kubectl apply -f prometheus/rules/target.rules.yaml
kubectl apply -f prometheus/rules/node.rules.yaml
kubectl apply -f prometheus/rules/etcd.rules.yaml
kubectl apply -f prometheus/rules/apiserver.rules.yaml
kubectl apply -f prometheus/rules/pod.rules.yaml
## Create prometheus server
kubectl apply -f prometheus/prometheus.cm.yaml
kubectl apply -f prometheus/prometheus.deployment.yaml
kubectl apply -f prometheus/prometheus.svc.yaml
# Create grafana
kubectl apply -f grafana/grafana.ds.cm.yaml
kubectl apply -f grafana/grafana.dashboard.k8s-cluster-health.yaml
kubectl apply -f grafana/grafana.dashboard.k8s-cluster-monitoring.yaml
kubectl apply -f grafana/grafana.dashboard.docker-host.yaml
kubectl apply -f grafana/grafana.dashboard.cm.yaml
kubectl apply -f grafana/grafana.deployment.yaml
kubectl apply -f grafana/grafana.svc.yaml