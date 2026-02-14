# GitOps - GitHub Actions Learning Project

A comprehensive GitHub Actions project demonstrating CI/CD pipelines, multi-environment deployments, and automation workflows.

**Repository**: [enFaust/GitOps](https://github.com/enFaust/GitOps)

**📄 View Complete Report**: [REPORT.md](REPORT.md)

---

## 📋 Homework Assignments Summary

### Assignment 1: Setting up a Basic GitHub Action ✅

**Objective**: Create a GitHub Action workflow that runs a simple script on push.

**Completed Tasks**:
- ✅ Created public repository on GitHub
- ✅ Created [hello.py](hello.py) script that prints "Hello, GitHub Actions!"
- ✅ Created GitHub Action workflow: [.github/workflows/workflow.yml](.github/workflows/workflow.yml)
- ✅ Configured workflow to trigger on every push to main branch
- ✅ Pushed changes and verified GitHub Action execution

**Output**: Simple script execution via GitHub Actions

---

### Assignment 2: Building and Testing with GitHub Actions ✅

**Objective**: Create a program with unit tests and a workflow that runs tests automatically.

**Completed Tasks**:
- ✅ **Language**: Python
- ✅ **Created Program**: [app/calculator.py](app/calculator.py) - Simple calculator with add, subtract, multiply, divide operations
- ✅ **Created Unit Tests**: [tests/test_calculator.py](tests/test_calculator.py) - 22 comprehensive unit tests
- ✅ **Created Workflow**: [.github/workflows/workflow.yml](.github/workflows/workflow.yml)
  - Runs unit tests on every push
  - Tests pass/fail reporting
  - Supports multiple jobs: hello job and test job
- ✅ All tests pass successfully

**Project Structure**:
```
app/
├── __init__.py
├── calculator.py        # Main application
└── hello.py             # Hello script

tests/
├── __init__.py
└── test_calculator.py   # 22 unit tests
```

**Test Results**: 22/22 tests passing ✅

**Run Tests Locally**:
```bash
python3 -m unittest tests.test_calculator -v
```

---

### Assignment 3: Continuous Deployment with GitHub Actions ✅

**Objective**: Create a web application that automatically deploys to GitHub Pages.

**Completed Tasks**:
- ✅ **Web Application**: Interactive Calculator with HTML, CSS, JavaScript
- ✅ **Project Structure**: Organized in [web/](web/) folder
  - [web/index.html](web/index.html) - Main interface
  - [web/src/css/styles.css](web/src/css/styles.css) - Styling
  - [web/src/js/script.js](web/src/js/script.js) - Calculator logic
  - [web/src/assets/](web/src/assets/) - Asset folder
- ✅ **Created Deployment Workflow**: [.github/workflows/deploy.yml](.github/workflows/deploy.yml)
- ✅ **GitHub Pages Deployment**: Automatically deploys on push to main
- ✅ **Live Website**: https://enFaust.github.io/GitOps

**Features**:
- Basic arithmetic operations (+, −, ×, ÷)
- Decimal number support
- Clear and delete functions
- Error handling for division by zero
- Responsive design
- Real-time calculation display

**Web Application**: [Live Calculator](https://enFaust.github.io/GitOps)

---

### Assignment 4: Customizing GitHub Actions Workflow (Optional) ✅

**Objective**: Set up multi-environment deployment with conditional workflows.

**Completed Tasks**:
- ✅ **Created Multiple Branches**:
  - [main](https://github.com/enFaust/GitOps/tree/main) - Production environment
  - [staging](https://github.com/enFaust/GitOps/tree/staging) - Pre-production environment
  - [develop](https://github.com/enFaust/GitOps/tree/develop) - Development environment

- ✅ **Created Multi-Environment Workflow**: [.github/workflows/multi-env-deploy.yml](.github/workflows/multi-env-deploy.yml)
  - **Conditional Deployments**:
    - **main** → Production: https://enFaust.github.io/GitOps
    - **staging** → Staging: https://enFaust.github.io/GitOps-staging
    - **develop** → Development: https://enFaust.github.io/GitOps-dev

- ✅ **Environment-Specific Variables**:
  - Debug mode (enabled for dev/staging, disabled for prod)
  - Analytics (enabled for staging/prod)
  - Cache settings (varies by environment)
  - API timeouts (5s for prod, 15s for staging, 30s for dev)

- ✅ **Conditional Steps**:
  - Production: Optimization checks, pre-deployment validation
  - Staging: Extended testing, security scanning
  - Development: Fast deployment, verbose logging

- ✅ **Tested**: Each branch triggers appropriate environment deployment

**Branch Strategy**:
```
develop → staging → main
  ↓         ↓         ↓
  Dev      Staging  Production
```

---

## 📁 Project Structure

```
GitOps/
├── .github/
│   └── workflows/
│       ├── workflow.yml              # Assignment 1 & 2: Tests and hello script
│       ├── deploy.yml                # Assignment 3: GitHub Pages deployment
│       └── multi-env-deploy.yml      # Assignment 4: Multi-environment deployment
├── app/
│   ├── __init__.py
│   ├── calculator.py                 # Assignment 2: Calculator app
│   └── hello.py                      # Assignment 1: Hello script
├── tests/
│   ├── __init__.py
│   └── test_calculator.py            # Assignment 2: 22 unit tests
├── web/
│   ├── index.html                    # Assignment 3: Calculator UI
│   └── src/
│       ├── css/
│       │   └── styles.css            # Assignment 3: Styling
│       ├── js/
│       │   └── script.js             # Assignment 3: Calculator logic
│       └── assets/                   # Assignment 3: Asset folder
├── config/
│   └── environments.json             # Assignment 4: Environment configuration
├── GITOPS_GUIDE.md                   # Assignment 4: Multi-environment guide
├── ENV_VARIABLES.md                  # Assignment 4: Environment variables documentation
├── CONDITIONAL_EXAMPLES.md           # Assignment 4: Conditional workflow examples
├── README.md                         # This file
└── .gitignore
```

---

## 🚀 Quick Start

### 1. Clone the Repository
```bash
git clone https://github.com/enFaust/GitOps.git
cd GitOps
```

### 2. Run the Calculator App Locally
```bash
# Option 1: Open directly
open web/index.html

# Option 2: Use Python server
python3 -m http.server 8000
# Then visit http://localhost:8000/web/
```

### 3. Run Unit Tests
```bash
python3 -m unittest tests.test_calculator -v
```

### 4. Run the Calculator Script
```bash
python3 app/calculator.py
```

### 5. Run the Hello Script
```bash
python3 hello.py
```

---

## 🔄 GitHub Actions Workflows

### Workflow 1: [workflow.yml](.github/workflows/workflow.yml) - Testing & Hello Script
- **Trigger**: Push to main branch
- **Jobs**:
  - hello: Runs hello.py
  - test: Runs all unit tests

### Workflow 2: [deploy.yml](.github/workflows/deploy.yml) - GitHub Pages Deployment
- **Trigger**: Push to main branch
- **Action**: Builds and deploys web app to GitHub Pages
- **URL**: https://enFaust.github.io/GitOps

### Workflow 3: [multi-env-deploy.yml](.github/workflows/multi-env-deploy.yml) - Multi-Environment
- **Trigger**: Push to main, staging, or develop branches
- **Features**:
  - Automatic environment detection
  - Conditional step execution
  - Environment-specific configuration
  - Security scanning (staging/prod only)
  - Dynamic config file generation

---

## 📊 Deployment Environments

| Environment | Branch | URL | Debug | Analytics | Cache |
|-------------|--------|-----|-------|-----------|-------|
| Production | main | https://enFaust.github.io/GitOps | ❌ | ✅ | ✅ |
| Staging | staging | https://enFaust.github.io/GitOps-staging | ✅ | ✅ | ✅ |
| Development | develop | https://enFaust.github.io/GitOps-dev | ✅ | ❌ | ❌ |

---

## 📖 Documentation

- **[GITOPS_GUIDE.md](GITOPS_GUIDE.md)** - Complete GitOps setup and best practices
- **[ENV_VARIABLES.md](ENV_VARIABLES.md)** - Environment variables and configuration
- **[CONDITIONAL_EXAMPLES.md](CONDITIONAL_EXAMPLES.md)** - Workflow conditional examples

---

## ✨ Key Features

### Calculator Application
- ✅ Responsive web interface
- ✅ Basic arithmetic operations
- ✅ Decimal support
- ✅ Error handling
- ✅ Real-time display

### GitHub Actions Automation
- ✅ Automatic testing on push
- ✅ Continuous deployment to GitHub Pages
- ✅ Multi-environment support
- ✅ Conditional execution
- ✅ Environment-specific configurations
- ✅ Automated build and deploy

### Development Workflow
- ✅ Unit testing framework (Python unittest)
- ✅ 22 comprehensive unit tests
- ✅ Branch protection ready
- ✅ GitOps best practices

---

## 🧪 Test Results

**Test Suite**: 22 unit tests for Calculator

```
✓ test_add_floats
✓ test_add_mixed_numbers
✓ test_add_negative_numbers
✓ test_add_positive_numbers
✓ test_add_zero
✓ test_divide_by_zero
✓ test_divide_floats
✓ test_divide_mixed_numbers
✓ test_divide_negative_numbers
✓ test_divide_positive_numbers
✓ test_divide_result_is_float
✓ test_multiply_by_one
✓ test_multiply_by_zero
✓ test_multiply_floats
✓ test_multiply_mixed_numbers
✓ test_multiply_negative_numbers
✓ test_multiply_positive_numbers
✓ test_subtract_floats
✓ test_subtract_mixed_numbers
✓ test_subtract_negative_numbers
✓ test_subtract_positive_numbers
✓ test_subtract_zero

Result: 22/22 PASSED ✅
```

---

## 🔗 Related Links

- **GitHub Repository**: https://github.com/enFaust/GitOps
- **Live Calculator**: https://enFaust.github.io/GitOps
- **Staging Environment**: https://enFaust.github.io/GitOps-staging
- **Development Environment**: https://enFaust.github.io/GitOps-dev

---

## 📝 Assignment Workflow

### Pushing Changes Through Environments

```bash
# 1. Create feature branch from develop
git checkout develop
git checkout -b feature/my-feature

# 2. Make changes and commit
git add .
git commit -m "Add feature"

# 3. Push to develop
git push -u origin feature/my-feature

# 4. Create PR to develop → Gets tested in Dev environment
# (Approve and merge)

# 5. Create PR from develop to staging → Gets tested in Staging
# (Additional testing, approval)

# 6. Create PR from staging to main → Deploy to Production
# (Final approval, automatic deployment)
```

---

## 🎯 Learning Outcomes

By completing this project, you've learned:

✅ **GitHub Actions Basics** - Creating workflows, triggers, jobs, steps
✅ **CI/CD Pipeline** - Automated testing and deployment
✅ **Multi-Environment Setup** - Development, staging, production workflows
✅ **Conditional Workflows** - Using if statements in GitHub Actions
✅ **Environment Variables** - Dynamic configuration per environment
✅ **Git Branching Strategy** - Feature → Develop → Staging → Main
✅ **GitHub Pages Deployment** - Automatic website publishing
✅ **Unit Testing** - Writing and running tests
✅ **Python Development** - Building applications with tests
✅ **Web Development** - HTML, CSS, JavaScript basics

---

## 📋 Checklist

**Assignment 1**: ✅
- [x] Created repository
- [x] Created hello.py script
- [x] Created GitHub Actions workflow
- [x] Configured main branch trigger
- [x] Verified execution

**Assignment 2**: ✅
- [x] Created calculator app
- [x] Written unit tests
- [x] Created test workflow
- [x] All tests passing

**Assignment 3**: ✅
- [x] Created web application
- [x] Set up project structure
- [x] Created deployment workflow
- [x] Deployed to GitHub Pages

**Assignment 4**: ✅
- [x] Created multiple branches
- [x] Set up multi-environment workflow
- [x] Added conditional statements
- [x] Configured environment variables
- [x] Tested all environments

---

## 🤝 Contributing

This is a learning project. Feel free to fork and extend the functionality!

---

## 📄 License

This project is provided for educational purposes.

---

**Last Updated**: February 2026
**Repository**: [enFaust/GitOps](https://github.com/enFaust/GitOps)
