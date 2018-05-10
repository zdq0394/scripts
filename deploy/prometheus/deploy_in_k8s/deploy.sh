#!/bin/bash
# Create namespace monitoring
kubectl apply -f namespace.yaml
# Create alertmanager
kubectl apply -f alertmanager/alertmanager.cm.yaml
kubectl apply -f alertmanager/alertmanager.deployment.yaml
kubectl apply -f alertmanager/alertmanager.svc.yaml
# Create node exporter
kubectl apply -f exporter/node_exporter.daemonset.yaml
# Create prometheus-server
kubectl apply -f prometheus/prometheus-rules.cm.yaml
kubectl apply -f prometheus/prometheus.cm.yaml
kubectl apply -f prometheus/prometheus.deployment.yaml
kubectl apply -f prometheus/prometheus.svc.yaml
# Create grafana
kubectl apply -f grafana/grafana.ds.cm.yaml
kubectl apply -f grafana/grafana.dashboard.k8s-cluster-health.yaml
kubectl apply -f grafana/grafana.dashboard.k8s-cluster-monitoring.yaml
kubectl apply -f grafana/grafana.dashboard.cm.yaml
kubectl apply -f grafana/grafana.deployment.yaml
kubectl apply -f grafana/grafana.svc.yaml