# Leasing Platform – CI/CD Project Report

**Project Reporter:** Daniil Shauchenka  
**Group Number:** md-sa2-33-25

---

## 1. Application Description

**Application name:** Leasing Platform (Backend)

**Programming language(s):**
- Java 21
- Spring Boot

**Database type:**
- PostgreSQL


### Description

The application is a backend service for a leasing company, implemented as a Java Spring Boot monolith.  
It exposes REST APIs for business operations and persists data in a PostgreSQL database.

The application supports:
- Versioning
- Health checks
- Metrics collection
- Data persistence across deployments

The system is deployed into two isolated environments:
- **Development (DEV)** — via Docker Compose
- **Test (TEST)** — Kubernetes (k3s) with blue/green deployment

---

## 2. Pipeline – High-Level Design

![CI/CD Architecture](diagram.png)

### Environment Overview

#### Development Environment (DEV)
- Used for active development
- All services are deployed using Docker Compose
- Frontend developers connect directly to this environment
- Jenkins pipelines build and redeploy containers on the DEV server

#### Test Environment (TEST)
- Kubernetes (k3s) cluster
- Implements blue/green deployment strategy
- Traffic switching is handled via Kubernetes Service selector updates

---

### CI/CD Flow (Test Environment)

1. Developer pushes code to the application repository
2. Jenkins pipeline is triggered
3. Application is built using Gradle
4. Unit tests are executed
5. Docker image is built
6. Image is pushed to the Docker registry
7. Jenkins detects the currently active color (blue or green)
8. New version is deployed to the inactive color
9. Kubernetes waits for pod readiness
10. Health check via actuator
11. If successful — traffic is switched to the new version
12. If failed — traffic remains on the previous version
13. Telegram notification sent

---

## 3. Technologies Used

### Orchestration
- **Development:** Docker Compose
- **Test:** Kubernetes (k3s)
- **CI/CD:** Jenkins

### Automation Tools
- Bash (deployment and health-check scripts)
- Docker / Docker Compose
- Kubernetes manifests (YAML)
- Kustomize

---

## 4. Continuous Integration (CI)

**Trigger type:**
- Manual Jenkins trigger

---

## 5. Continuous Delivery (CD)

### Deployment Flows

#### New Deployment
- Application is deployed to the inactive environment (blue or green)
- Health checks are executed
- Traffic is switched only after successful verification

#### Upgrade Deployment
- PostgreSQL data is preserved
- Liquibase manages schema changes
- Zero downtime is achieved using blue/green strategy

---

## 6. Rollback Strategy

**Rollback process description:**
- Rollback is implemented by keeping traffic on the currently active version
- No destructive actions are performed during a failed deployment

**Trigger conditions:**
- Pod readiness failure
- Health check (`/actuator/health`) failure
- Deployment timeout

---

## 7. Monitoring and Observability

- **Prometheus** collects application and infrastructure metrics
- **Grafana** visualizes dashboards and metrics
- **Spring Boot Actuator** exposes health and metrics endpoints
- **Telegram notifications** provide pipeline start, success, and failure alerts

---
