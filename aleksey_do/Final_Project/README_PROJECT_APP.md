# Task Management Application

## Project Information

- **Project's reporter:** First Name, Surname
- **Group number:** m-sa2-30-24
- [git-repository](https://github.com/alex-agd/tasker-infra)


## Infrastructure CI Pipeline
The CI Pipeline for infrastructure code ensures continuous validation of Kubernetes manifests and configurations. This process guarantees the quality and reliability of infrastructure code before applying it to the cluster.


##  Helm Chart Validation

### Environment Setup
Installation of the latest Helm version for chart management
Addition of official Bitnami and VMware Tanzu repositories
Automatic repository information updates

#### Chart Correctness Verification
Updating Helm chart dependencies (helm dependency update)
Syntax validation using helm lint
Test rendering of templates using helm template
Kubernetes Resource Validation

#### Verification Tools
Using kubeconform for strict manifest validation
Setting up a test cluster based on Kind
Environment preparation with installation of current CRDs
#### Manifest Validation

Checking all YAML files outside the /helm, /monitoring and /argocd directories
Validating Custom Resource Definitions using kubectl apply --dry-run
Separate validation for PrometheusRule and ArgoCD Application manifests

### Integrations and Notifications
#### Slack Notifications
Automatic generation of validation result notifications
Color-coded messages (green for successful validation, red for errors)
Sending detailed messages via webhook

#### ArgoCD Integration
Prepared mechanism for automatic synchronization triggering
Secure interaction through API tokens
Webhook trigger capability when configuration changes
This pipeline is a critical part of the GitOps approach, providing continuous verification of infrastructure code and preventing incorrect configurations from being applied in the production environment.

### Application Details

- **Name:** Task Management Application
- **Programming Language:** Java 17
- **Database:** PostgreSQL 15

## Project Overview

Task Management Application is a RESTful service that allows users to manage their tasks. Built with Spring Boot, it
provides a robust API for creating, reading, updating, and deleting tasks.

### Technology Stack

- Java 17
- Spring Boot 3.4.3
- PostgreSQL 15
- Swagger/OpenAPI
- Docker & Docker Compose
- Prometheus & Grafana for monitoring

## Getting Started

### Prerequisites

- Docker and Docker Compose
- Java 17 or later
- Maven 3.6 or later

### Local Development Setup

1. Clone the repository:
   git clone <repository-url>
   cd tasker_app_backend

2. Start the development environment:

```bash
   docker-compose up -d
```

3. Access the applications:

- Application: http://localhost:8080
- Swagger UI: http://localhost:8080/swagger-ui.html
- Prometheus: http://localhost:9090
- Grafana: http://localhost:3000

### API Documentation

The API documentation is available through Swagger UI at http://localhost:8080/swagger-ui.html

### Database Migrations

Database migrations are managed by Flyway and run automatically on application startup.

### Monitoring

The application includes:

- Prometheus metrics at /actuator/prometheus
- Grafana dashboards for visualization
- Health checks at /actuator/health

## Development Workflow

1. Create a new branch for your feature
2. Implement changes
3. Write tests
4. Create a pull request

## Testing

The project includes both unit and integration tests. Run tests with:

```bash
bash
mvn test
```

## Deployment

## Monitoring

The application exposes metrics through Spring Boot Actuator and Prometheus.
Grafana dashboards are available for:

- Application metrics
- JVM metrics
- Database metrics

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request