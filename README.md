# Prometheus-Grafana-Monitoring

This project automates the deployment of a complete monitoring and observability stack using Prometheus, Grafana, and Node Exporter. It includes metrics collection, alerting, and data visualization.

---

## Features

- **Prometheus**: Collects and stores metrics from Node Exporter and other services.
- **Grafana**: Provides interactive dashboards for visualizing Prometheus data.
- **Alertmanager**: Sends alerts based on Prometheus alerting rules.
- **Node Exporter**: Collects system-level metrics like CPU, memory, and disk usage.

---

## Directory Structure

prometheus-grafana-monitoring/
├── ansible/
│   ├── inventories/
│   │   ├── dev/
│   │   │   ├── hosts
│   │   │   └── group_vars/
│   │   │       └── all.yml
│   │   └── staging/
│   │       ├── hosts
│   │       └── group_vars/
│   │           └── all.yml
│   ├── roles/
│   │   ├── prometheus/
│   │   │   ├── tasks/
│   │   │   │   └── main.yml
│   │   │   ├── templates/
│   │   │   │   ├── prometheus.yml.j2
│   │   │   │   ├── alertmanager.yml.j2
│   │   │   │   └── rules.yml.j2
│   │   │   └── vars/
│   │   │       └── main.yml
│   │   ├── grafana/
│   │   │   ├── tasks/
│   │   │   │   └── main.yml
│   │   │   ├── templates/
│   │   │   │   └── datasources.yml.j2
│   │   │   └── vars/
│   │   │       └── main.yml
│   │   ├── node_exporter/
│   │   │   ├── tasks/
│   │   │   │   └── main.yml
│   │   │   └── vars/
│   │   │       └── main.yml
│   └── site.yml
├── docker/
│   ├── docker-compose.yml
│   └── prometheus/
│       ├── prometheus.yml
│       ├── alertmanager.yml
│       └── rules.yml
├── scripts/
│   ├── setup.sh
│   ├── start.sh
│   └── stop.sh
└── README.md


---

## Prerequisites

- **Ansible**: Install using `pip install ansible`.
- **Docker**: Install Docker and Docker Compose.
- **Python 3**: Required for Ansible and related scripts.

---

## Installation

### Using Docker Compose
a. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/prometheus-grafana-monitoring.git
   cd prometheus-grafana-monitoring/docker

b.Start the stack:

    docker-compose up -d

c.Access the services:
        Prometheus: http://localhost:9090
        Grafana: http://localhost:3000
        Alertmanager: http://localhost:9093

Using Ansible

    Navigate to the Ansible directory:

cd prometheus-grafana-monitoring/ansible

Update the inventory file with your target servers:

nano inventories/dev/hosts

Run the playbook:

    ansible-playbook -i inventories/dev/hosts site.yml

Configuration
Prometheus Configuration

    prometheus.yml: Define scrape jobs, targets, and alerting rules.
    alertmanager.yml: Configure alert routing and notification channels.

Grafana Configuration

    datasources.yml: Set up Prometheus as a data source.

Alerting
Example Alerting Rule

groups:
  - name: node_rules
    rules:
      - alert: HighCPUUsage
        expr: avg(node_cpu_seconds_total{mode="system"}) > 0.8
        for: 2m
        labels:
          severity: warning
        annotations:
          summary: "High CPU Usage Detected"
          description: "CPU usage is above 80% for 2 minutes."

Useful Commands
Docker

    Start services:

docker-compose up -d

Stop services:

    docker-compose down

Ansible

    Check syntax:

ansible-playbook --syntax-check site.yml

Run playbook:

    ansible-playbook -i inventories/dev/hosts site.yml

Contributing

    Fork the repository.
    Create a new branch (git checkout -b feature-branch).
    Commit changes (git commit -am 'Add new feature').
    Push to the branch (git push origin feature-branch).
    Create a pull request.
