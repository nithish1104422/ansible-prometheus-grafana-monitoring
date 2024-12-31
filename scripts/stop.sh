#!/bin/bash

echo "Stopping Prometheus and Grafana Monitoring Stack..."

# Navigate to the Docker directory
cd "$(dirname "$0")/../docker"

# Stop the stack
docker-compose down

echo "Services stopped successfully!"
