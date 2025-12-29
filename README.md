
# 🚀 Essential Terraform Commands (Most Used)

This section covers the **most commonly used Terraform commands** for initializing, validating, planning, deploying, and managing infrastructure.

---

## 🔹 Initialize Terraform

```bash
terraform init
```

**Purpose:**

* Initializes the working directory
* Downloads required providers
* Configures remote backend (S3, etc.)
  👉 Run this **first** in every new or cloned Terraform project.

---

## 🔹 Format Terraform Files

```bash
terraform fmt
```

**Purpose:**

* Automatically formats `.tf` files
* Improves readability and consistency
  👉 Recommended before every commit.

---

## 🔹 Validate Configuration

```bash
terraform validate
```

**Purpose:**

* Checks syntax and configuration correctness
* Does NOT contact cloud providers
  👉 Ensures code is logically valid.

---

## 🔹 Create Execution Plan

```bash
terraform plan
```

**Purpose:**

* Shows what Terraform **will create, update, or destroy**
* Safe command (no changes applied)
  👉 Always review before applying.

---

## 🔹 Apply Infrastructure Changes

```bash
terraform apply
```

**Purpose:**

* Creates or updates infrastructure
* Prompts for confirmation
  👉 Use to deploy resources.

### Auto-approve (no prompt)

```bash
terraform apply -auto-approve
```

---

## 🔹 Destroy Infrastructure

```bash
terraform destroy
```

**Purpose:**

* Deletes all resources managed by Terraform
  👉 Use carefully (especially in production).

---

## 🔹 Show Current State

```bash
terraform show
```

**Purpose:**

* Displays the current Terraform state
* Helpful for debugging.

---

## 🔹 List Managed Resources

```bash
terraform state list
```

**Purpose:**

* Lists all resources tracked in the state file.

---

## 🔹 Inspect a Specific Resource

```bash
terraform state show aws_instance.my_ec2
```

**Purpose:**

* Shows detailed info about a specific resource.

---

## 🔹 Refresh State (Sync with Real Infra)

```bash
terraform refresh
```

**Purpose:**

* Updates Terraform state with real cloud resources
  ⚠️ Deprecated in newer versions (use `apply -refresh-only`).

---

## 🔹 Refresh Only (Recommended)

```bash
terraform apply -refresh-only
```

**Purpose:**

* Updates state without making changes
* Safe way to sync state.

---

## 🔹 Work with Variables

```bash
terraform apply -var="instance_type=t3.micro"
```

or

```bash
terraform apply -var-file="dev.tfvars"
```

**Purpose:**

* Pass environment-specific values.

---

## 🔹 Select Workspace

```bash
terraform workspace list
terraform workspace new dev
terraform workspace select dev
```

**Purpose:**

* Manage multiple environments (dev, staging, prod).

---

## 🔹 Get Outputs

```bash
terraform output
```

**Purpose:**

* Displays output values (IPs, URLs, IDs).

---

## 🔹 Check Terraform Version

```bash
terraform version
```

**Purpose:**

* Shows Terraform version and provider info.

---

## 🔹 Upgrade Providers

```bash
terraform init -upgrade
```

**Purpose:**

* Updates providers to the latest allowed versions.

---

## 🧠 Best Practices (DevOps Tips)

* Always run `terraform plan` before `apply`
* Never commit `.tfstate` files
* Use **remote backend (S3 + DynamoDB)** for teams
* Use **modules** for reusable infrastructure
* Keep secrets in **environment variables**, not `.tf` files

---


