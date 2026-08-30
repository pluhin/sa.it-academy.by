# Assignment 1: First Configuration and State

## Commands Explanation

### `tofu init`
- Initializes the working directory
- Downloads required provider plugins
- Sets up the backend configuration
- Creates the `.terraform` directory

### `tofu fmt`
- Formats all `.tf` files in the directory
- Ensures consistent code style
- Returns nothing if already formatted

### `tofu validate`
- Validates the configuration syntax
- Checks for internal consistency
- Verifies that required arguments are present

### `tofu plan`
- Creates an execution plan
- Shows what actions will be taken
- Doesn't make any changes to resources

### `tofu apply`
- Executes the plan and creates/modifies resources
- Saves the state to `terraform.tfstate`
- Shows the output of resource creation

After running `tofu apply` a second time without code changes:
No changes. Your infrastructure matches the configuration.
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

It means that applying the same configuration multiple times produces the same result. The configuration is declarative - we declare the desired state, and OpenTofu ensures the actual state matches it. If the resources already exist and match the configuration, no changes are made.

# Assignment 2: Variables, Outputs and Locals

## Variable Passing Methods and Precedence

### tofu output example:
```bash
api_key = <sensitive>
file_path = "./production_pet.txt"
pet_name = "inherently_selected_weasel"
pet_name_uppercase = "INHERENTLY_SELECTED_WEASEL"
```

### 1. `-var` flag (highest precedence)
```bash
tofu apply -var="filename=custom.txt" -var="pet_length=4"
```
### 2. *.tfvars file
```bash
tofu apply -var-file="custom.tfvars"
```
### 3. terraform.tfvars (automatically loaded)
Place variables in terraform.tfvars

# Assignment 3: Modules

### tofu output example

```bash
all_environments = {
  "dev" = "dev"
  "prod" = [
    "api",
    "db",
    "web",
  ]
  "stage" = "stage"
}
dev_config_path = "modules/config-file/dev_app.cfg"
dev_pet_name = "arriving-kid"
prod_config_paths = {
  "api" = "modules/config-file/prod_api.cfg"
  "db" = "modules/config-file/prod_db.cfg"
  "web" = "modules/config-file/prod_web.cfg"
}
prod_pet_names = {
  "api" = "adversely-virtually-supreme-redfish"
  "db" = "free:lemur"
  "web" = "greatly.sought.lynx"
}
stage_config_path = "modules/config-file/stage_app.cfg"
stage_pet_name = "kindly_huge_goose"
```

## What Problem Do Modules Solve?

Modules solve several critical problems in infrastructure as code:

### 1. **Code Reusability**
- Write once, use many times across different environments
- Reduces duplication and maintenance overhead
- Enables sharing of infrastructure patterns across teams

### 2. **Abstraction and Encapsulation**
- Hide complex implementation details
- Expose only necessary inputs and outputs
- Make infrastructure easier to understand and use

### 3. **Standardization**
- Enforce consistent patterns across environments
- Ensure best practices are applied everywhere
- Reduce human error through template usage

### 4. **Versioning and Dependency Management**
- Module versions can be pinned
- Changes are tracked and controlled
- Rollback is possible without affecting other modules

### 5. **Team Collaboration**
- Different teams can work on different modules
- Clear interfaces between modules
- Separate responsibilities

## When to Extract a Module

### Extract a module when:

1. **Resource is used in multiple places**
   - Same configuration in dev, stage, prod
   - Multiple instances of similar resources

2. **Configuration is complex**
   - Many resources that work together
   - Complex dependencies between resources

3. **Team needs to share infrastructure patterns**
   - Standard VPC configuration
   - Database setup pattern
   - Monitoring stack

4. **Resource has clear inputs and outputs**
   - Well-defined variables
   - Predictable behavior
   - Returns useful outputs

5. **You want to enforce standards**
   - Security group rules
   - Tagging standards
   - Naming conventions

## Module Usage Example

The config-file module is called three times for different environments:

```hcl
# Dev - minimal configuration
module "config_dev" {
  source = "./modules/config-file"
  filename      = "dev_app.cfg"
  environment   = "dev"
  pet_length    = 2
}

# Stage - medium complexity
module "config_stage" {
  source = "./modules/config-file"
  filename      = "stage_app.cfg"
  environment   = "stage"
  pet_length    = 3
  custom_data   = { "REPLICA_COUNT" = "2" }
}

# Prod - multiple instances using for_each
module "config_prod" {
  source = "./modules/config-file"
  for_each = local.prod_configs
  filename      = each.value.filename
  environment   = "prod"
  pet_length    = each.value.pet_length
}
