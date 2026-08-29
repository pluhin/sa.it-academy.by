
# 05. IasC: Terraform and Terragrunt Report

## 🔗 Repository Links
https://github.com/maksimsolapai-gif/opentofu-labs

📁 Final Repository Directory Structure

```
~/opentofu-labs/
05.IasC.Terraform.and.Terragrunt/
├── .github/
│   └── workflows/
│       └── tofu-ci.yml             # Assignment 5: GitHub Actions Pipeline
├── .gitignore                      # Global exclusion engine (state, cache, secrets)
├── README.md                       # This unified master report
├── lab1/                           # Assignment 1: Core State & Lifecycle
│   ├── main.tf
│   └── versions.tf
├── lab2/                           # Assignment 2: Parametrization & Plan Diff
│   ├── main.tf
│   ├── outputs.tf
│   ├── terraform.tfvars
│   ├── terraform.tfvars.example
│   └── variables.tf
├── lab3/                           # Assignment 3: Reusable Code Modules
│   ├── main.tf
│   ├── outputs.tf
│   └── modules/
│       └── config-file/
│           ├── main.tf
│           ├── outputs.tf
│           └── variables.tf
└── live/                           # Assignment 4: Terragrunt Multi-Env Orchestration
    ├── root.hcl                    # Inheritable root provider & global inputs
    ├── dev/
    │   └── terragrunt.hcl          # DRY environment config for Development
    └── prod/
        └── terragrunt.hcl          # DRY environment config for Production
```
## Homework Assignment 1: First configuration and state
https://github.com/maksimsolapai-gif/opentofu-labs/tree/main/lab1

## Homework Assignment 2: Variables, outputs and locals
https://github.com/maksimsolapai-gif/opentofu-labs/tree/main/lab2

## Homework Assignment 3: Modules
https://github.com/maksimsolapai-gif/opentofu-labs/tree/main/lab3

## Homework Assignment 4: Terragrunt (Optional)
https://github.com/maksimsolapai-gif/opentofu-labs/tree/main/terragrunt/live

## Homework Assignment 5: Remote state and CI (Optional)
https://github.com/maksimsolapai-gif/opentofu-labs/actions/runs/33251315860/job/99097363645

---
🛡️ Final .gitignore

```
.terraform.lock.hcl
terraform.tfstate
terraform.tfstate.backup
terraform.tfstate.lock.info
.terragrunt-cache/
dist/
*-config.txt
*.tfvars
*.tfvars.json
.DS_Store

```
