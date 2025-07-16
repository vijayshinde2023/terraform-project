# Azure Infrastructure with Terraform

This project provisions a Docker-based Azure App Service, a MySQL Flexible Server, and integrates Key Vault, SSL certificate, and environment variables using Terraform in a modular and scalable structure.

---

## 🔧 Features

- Modular Terraform setup
- Deploys:
  - Azure Resource Group
  - App Service Plan
  - Linux Web App (Docker container)
  - MySQL Flexible Server & DB
  - Azure Key Vault with Secrets
  - SSL certificate upload and binding
  - Custom domain support
- Uses naming convention with `resource_prefix`
- Supports environment variables via `app_settings`

---

## 📁 Folder Structure

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── .gitignore
├── modules/
│   ├── resource_group/
│   ├── app_service_plan/
│   ├── linux_web_app/
│   ├── mysql/
│   └── key_vault/
└── certs/
    └── your-cert.pfx
```

---

## ✅ Requirements

- Terraform `>= 1.8.x`
- Azure CLI authenticated (`az login`)
- Azure Subscription
- `your-cert.pfx` SSL certificate (for HTTPS binding)

---

## ⚙️ Variables

Defined in `variables.tf`:

| Variable                | Description                                |
| ----------------------- | ------------------------------------------ |
| `resource_prefix`       | Prefix for naming Azure resources          |
| `resource_group_name`   | Resource group name                        |
| `location`              | Azure region                               |
| `app_service_plan_name` | App Service Plan name                      |
| `app_service_sku`       | SKU name for App Service Plan (e.g., `B1`) |
| `web_app_name`          | Web App name                               |
| `docker_image`          | Docker image to deploy                     |
| `pfx_password`          | Password for the SSL certificate           |

You can override these in `terraform.tfvars`.

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/your/repo.git
cd your-repo
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Preview the Plan

```bash
terraform plan
```

### 4. Apply the Changes

```bash
terraform apply
```

---

## 🔐 SSL Certificate

Place your PFX certificate at:

```
./certs/your-cert.pfx
```

And set the password via:

```hcl
pfx_password = "yourPfxPasswordHere"
```

---

## 🛡️ Key Vault

- Stores MySQL username and password as secrets
- Web App is granted access using a `SystemAssigned` identity
- Access policy is applied automatically

---

## 🧹 Custom Domain + SSL Binding

- Custom domain is bound using `azurerm_app_service_custom_hostname_binding`
- SSL certificate is bound via `azurerm_app_service_certificate_binding`

Make sure your domain is mapped via CNAME to the App Service.

---

## 🩼 Clean Up

To destroy all resources:

```bash
terraform destroy
```

---

## 📝 Notes

- Do **not commit** `.terraform/` or sensitive files
- Ensure correct RBAC for user/identity to access Key Vault
- Use Azure-managed identities for better security

---

## 📜 License

MIT License

