# AWS Infrastructure Automation Repository
This repository contains infrastructure automation scripts using Ansible and Terraform for deploying and configuring web servers on AWS EC2 instances.

## Ansible Playbook
**Installation and Configuration of Apache, Timezone, and HTML Page**
The Ansible playbook apache-setup.yml automates the installation of Apache, setting the timezone to a specified value, and deploying a basic HTML page on EC2 instances.

**Usage:**
Ensure you have Ansible installed on your local machine.

Modify the inventory file (host-inventory) to include the target EC2 instances.

Run the Ansible playbook:

ansible-playbook apache-setup.yml -i ansible/host-inventory

## Terraform Infrastructure as Code (IaC)
The terraform directory contains Terraform files to provision AWS infrastructure, including VPC, EC2 instances, route tables, load balancer, security groups, and other necessary components.

**Prerequisites:**
Terraform installed on your local machine.

AWS CLI configured with necessary credentials.

**Usage:**
Navigate to the terraform directory:

cd terraform

Modify the variable.tf file to customize variables.

Initialize Terraform:

terraform init

Review the changes Terraform will make:

terraform plan

Apply the Terraform configuration:
terraform apply

### Resources Created:
VPC with public and private subnets

EC2 instances with user data to configure Apache and HTML page

Internet Gateway, Route Tables, and associations

Security Groups

Application Load Balancer
