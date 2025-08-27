# AWS Terraform Infrastructure Coding Challenge

## Project Overview
This project provisions AWS infrastructure using Terraform, following best practices and a modular approach. The goal is to create a VPC with public and private subnets across three availability zones, and an EC2 instance accessible over HTTP (port 80).

## Folder Structure
```
terraform-aws-infra/
│
├── modules/
│   ├── vpc/        # VPC and networking logic
│   ├── subnet/     # Public/private subnet logic
│   ├── ec2/        # EC2 instance logic
│
├── environments/
│   ├── dev/        # Development environment configs
│   ├── prod/       # Production environment configs
│
├── scripts/        # Helper scripts (if needed)
│
├── README.md       # Project documentation
├── main.tf         # Root Terraform configuration
├── variables.tf    # Input variables
├── outputs.tf      # Output values
├── provider.tf     # AWS provider setup
```

## Approach & Rationale
- **Modular Design:** Custom modules for VPC, subnets, and EC2 ensure reusability and clarity.
- **Environment Separation:** `environments/` allows for easy scaling to multiple environments.
- **Parameterization:** All resources are configurable via variables for flexibility.
- **No Comments in Code:** As per requirements, code will be clean and minimal.
- **Commit Strategy:** Each logical step is committed separately with clear messages to show thought process.

## How to Use
1. Configure your AWS credentials.
2. Initialize Terraform: `terraform init`
3. Plan the deployment: `terraform plan -var-file=environments/dev/dev.tfvars`
4. Apply the infrastructure: `terraform apply -var-file=environments/dev/dev.tfvars`
5. Destroy when done: `terraform destroy -var-file=environments/dev/dev.tfvars`

## Interview Talking Points

