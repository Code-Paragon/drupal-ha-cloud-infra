#!/bin/bash

set -e

NAMESPACE=monitoring

echo "🔧 Creating namespace..."
kubectl apply -f monitoring/namespace.yaml

echo "📦 Installing kube-prometheus-stack with Helm..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm upgrade --install prometheus-stack prometheus-community/kube-prometheus-stack \
  -n $NAMESPACE \
  -f monitoring/charts/prometheus-stack-values.yaml

echo "✅ Prometheus stack deployed to namespace '$NAMESPACE'."