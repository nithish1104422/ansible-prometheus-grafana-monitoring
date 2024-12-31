#!/bin/bash

echo "Starting Prometheus and Grafana Monitoring Stack..."

# Navigate to the Docker directory
cd "$(dirname "$0")/../docker"

# Start the stack
docker-compose up -d

echo "Services started successfully!"
echo "Access Prometheus at http://localhost:9090"
echo "Access Grafana at http://localhost:3000"
echo "Access Alertmanager at http://localhost:9093"
