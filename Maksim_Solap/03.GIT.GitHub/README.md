# 03. GIT. GitHub

## 🚀 Repository Contents

*   `hello.py` — A simple Python script that prints a greeting to the console.
*   `calc.py` — A basic calculator module (addition and multiplication).
*   `test_calc.py` — Unit tests to verify the calculator functions.
*   `requirements.txt` — A list of dependencies required for the project (`pytest`).
*   `.github/workflows/` — Configuration files for automation (workflows).
*   `hello_action.yml` — Configuration files for automation (workflows).
*   `test.yml` — Configuration files for automation (workflows).
  
---

### Homework Assignment 1: Setting up a Basic GitHub Action
**Objective:** Create and trigger your first automated workflow.
*   **Script:** Prints the string `"Hello, GitHub Actions!"` to the console.
*   **Trigger:** The workflow runs automatically on every `push` to the `main` branch.
*   **Logs:** The execution results can be viewed under the **Actions** tab -> **Hello** workflow.

* **Execution result:** - https://github.com/maksimsolapai-gif/GitHub_actions/actions/runs/32461629751

### Homework Assignment 2: Building and Testing with GitHub Actions

**Objective:** Set up Continuous Integration (CI) to automatically validate code with tests.
*   **Testing:** Powered by the `pytest` framework.
*   **Triggers:** Tests run on every `push` and `pull_request` targeting the `main` branch.
*   **Build Status:** GitHub Actions reports the outcome:
    *   ✅ **Green status (passing)** — All tests passed successfully.
    *   ❌ **Red status (failing)** — Code contains bugs or tests failed.

* **Execution result:** - hello_action.yml workflow execution - https://github.com/maksimsolapai-gif/GitHub_actions/actions/runs/32468008774

# Homework Assignment 3: Continuous Deployment with GitHub Actions

**Project:** Static website deployment  
**Objective:** Configure an automated CI/CD pipeline to deploy a static website to GitHub Pages on every push to the `main` branch.

---

## 1. Project Structure
The repository contains the following minimal structure for a static website:
- `index.html` — The main website page with basic HTML/CSS markup.
- `.github/workflows/deploy.yml` — The GitHub Actions workflow configuration file.

---

## 2. GitHub Actions Configuration (`deploy.yml`)

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ "main" ]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: \${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Setup Pages
        uses: actions/configure-pages@v5

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: '.'

      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

---

## 3. Deployment Verification
1. In the repository settings (**Settings -> Pages -> Build and deployment -> Source**), the source was set to **GitHub Actions**.
2. The code changes were committed and pushed to the remote repository (`git push origin main`).
3. The **Actions** tab confirms that all build and deployment steps completed successfully (Workflow run succeeded).

---

## 4. Live Links
* **Execution result:** - https://github.com/maksimsolapai-gif/GitHub_actions/actions/runs/32584678183