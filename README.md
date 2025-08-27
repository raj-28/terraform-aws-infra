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

## How Each Requirement Was Met

- **Provision AWS resources with Terraform:** All infrastructure is created using Terraform only.
- **VPC with CIDR block 10.0.0.0/16:** VPC module provisions the required CIDR.
- **Three public and three private subnets across different AZs:** Subnet module creates three public and three private subnets, each in a different AZ.
- **Public subnets have internet access:** Internet Gateway and public route table are set up for public subnets.
- **Private subnets do not have direct internet connectivity:** No NAT Gateway or IGW for private subnets; only public subnets have internet access.
- **Parameterization for reusability and flexibility:** All values (CIDRs, AZs, instance type, AMI, key name) are variables, set via tfvars files.
- **No comments in code:** All Terraform code is comment-free as required.
- **No third-party/community modules:** Only custom modules are used for VPC, subnet, and EC2.
- **Minimal, clean code:** No unnecessary resources or complexity; only what is required.
- **EC2 instance in public subnet, reachable on port 80:** EC2 module provisions an instance in a public subnet with a security group allowing HTTP (port 80) from anywhere.
- **Environment separation:** Separate dev and prod tfvars files for easy switching between environments.
- **Clear commit history:** Each logical step is committed with a clear message.

## How to Use (Step-by-Step)

1. **Configure your AWS credentials:**
	- Run `aws configure` or set environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_DEFAULT_REGION`).
2. **Update environment variable files:**
	- Edit `environments/dev/dev.tfvars` and `environments/prod/prod.tfvars`.
	- Replace the following placeholders with your own values:
	  - `ami_id = "<your-ami-id>"` (find a valid AMI for your region, e.g., Amazon Linux 2)
	  - `key_name = "<your-key-pair-name>"` (use an existing EC2 key pair)
	  - Adjust subnet CIDRs, AZs, and instance type as needed.
3. **Initialize Terraform:**
	- `terraform init`
4. **Plan the deployment:**
	- `terraform plan -var-file=environments/dev/dev.tfvars`
5. **Apply the infrastructure:**
	- `terraform apply -var-file=environments/dev/dev.tfvars`
6. **Destroy resources when done:**
	- `terraform destroy -var-file=environments/dev/dev.tfvars`

## Optional: Install Nginx Automatically on EC2
To install nginx on your EC2 instance during creation, add the following to your EC2 module in `modules/ec2/main.tf`:

```
resource "aws_instance" "nginx" {
  # ...existing code...
  user_data = <<-EOF
	 #!/bin/bash
	 sudo yum update -y
	 sudo amazon-linux-extras install nginx1 -y
	 sudo systemctl start nginx
	 sudo systemctl enable nginx
  EOF
}
```
This will install and start nginx automatically. After deployment, access your EC2 public IP in a browser to see the nginx welcome page.

## Notes
- Make sure to use valid AWS credentials and key pair.
- Always replace placeholder values before deploying.
- For production, use `prod.tfvars` in place of `dev.tfvars`.

