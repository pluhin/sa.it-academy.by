[Assignment 2](https://github.com/Andreykkin/DockerCompose)
# Dockerfile Structure Documentation

### The provided Dockerfile uses a multi-stage build approach with two distinct stages:
### Stage 1: Builder Stage

```
FROM python:3.9-alpine AS builder
WORKDIR /app
RUN python -m venv /app/venv
COPY requirements.txt .
RUN /app/venv/bin/pip install --no-cache-dir -r requirements.txt
```
### Base Image: Lightweight python:3.9-alpine

### Purpose: Isolates dependency installation

### Key Actions:

####     Creates a Python virtual environment

####     Copies requirements.txt

####     Installs dependencies into the virtual environment

### Stage 2: Runtime Stage

```
FROM python:3.9-alpine AS runtime
RUN adduser -D webapp
WORKDIR /app
COPY --from=builder /app/venv /app/venv
COPY --chown=webapp:webapp app.py .
USER webapp
ENV PATH="/app/venv/bin:$PATH"
EXPOSE 5000
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
CMD ["flask", "run"]
```

### Base Image: Fresh python:3.9-alpine

### Security Measures:

####     Creates non-root webapp user

####     Switches to non-root user context

### Artifact Copying:

####     Brings installed dependencies from builder stage

####     Copies application code with proper ownership

### Runtime Configuration:

####     Sets up environment variables

####     Exposes port 5000

####     Defines startup command

# Advantages of Multi-Stage Builds

###    1. Reduced Image Size

####        1. Excludes build dependencies (e.g., pip cache, build tools)

####        2. Final image contains only runtime components

###    2. Enhanced Security

####        1. No development tools in production image

####        2. Non-root user execution

####        3. Reduced attack surface

###    3. Optimized Layering

####        1. Build dependencies remain in temporary stage

####        2. Clean separation of concerns

###    4. Improved Maintainability

####        1. Clear distinction between build and runtime

####        2. Easier to optimize each stage independently

###    5. Build Process Efficiency

####        1. Can use different base images for build vs runtime

####        2. Parallel layer building where possible
