#!/bin/bash
# Create namespace monitoring
kubectl apply -f namespace.yaml
# Create alertmanager
kubectl apply -f alertmanager/alertmanager.cm.yaml
kubectl apply -f alertmanager/alertmanager.deployment.yaml
kubectl apply -f alertmanager/alertmanager.svc.yaml
# Create prometheus-server
kubectl apply -f prometheus/prometheus-rules.cm.yaml
kubectl apply -f prometheus/prometheus.cm.yaml
kubectl apply -f prometheus/prometheus.deployment.yaml
kubectl apply -f prometheus/prometheus.svc.yaml
# Create grafana
kubectl apply -f grafana/grafana.ds.cm.yaml
kubectl apply -f grafana/grafana.deployment.yaml
kubectl apply -f grafana/grafana.svc.yaml