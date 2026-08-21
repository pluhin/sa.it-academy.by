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
