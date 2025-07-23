# Monitoring Stack for EKS

This directory contains Helm-based configuration to deploy Prometheus and Grafana using the kube-prometheus-stack on AWS EKS.

## Components

- **prometheus-stack-values.yaml**: Custom Helm values
- **grafana-dashboards**: Preloaded dashboards for Drupal, MySQL, and Kubernetes
- **provisioning/**: Auto-provisioning config for Grafana
- **helm-install.sh**: Install script to deploy the entire stack

## Usage

```bash
bash monitoring/helm-install.sh
