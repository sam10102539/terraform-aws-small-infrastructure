# AWS EC2 and Infrastructure Setup Using Terraform

This repository contains Terraform component to set up an AWS infrastructure including:

- AWS EC2 Instances.
- Reserved IPv4 address for EC2 intances.
- VPC.
- Private subnet.
- Security group for SSH incoming.
- Internet gateway.
- Elastic IP (EIP).
- Elastic Block Store (EBS).
- Region and Availability zones definition for EC2, EBS and VPC private subnet.

## Prerequisites
- Terraform v1.5.7 or newer.
- AWS Access key.
- AWS Secret Key.

## Structure

- `main.tf`: Contains the configuration for provisioning infrastructure instructions.
- `variables.tf`: Defines the variables used across the configuration.
- `env/dev.tfvars`: Contains variable values for the `dev` environment.

## Usage
1. Clone the repository to your local machine.
2. Navigate to the directory containing the Terraform configuration.
3. Initialize the Terraform configuration by running:

```bash
$ terraform init
```
4. Apply the Terraform configuration to AWS by running:

```bash
$ terraform apply -var-file=env/dev.tfvars
```
or using the flag ```-auto-approve``` to automatically approve the planned changes without requiring interactive confirmation:
```bash
$ terraform apply -auto-approve -var-file=env/dev.tfvars 
```

## Delete resources
Terraform has an easy solution to deploy and update the AWS infrastructure, and it also has a solution to delete resources that we created

```bash
$ terraform destroy -var-file=env/dev.tfvars
```
or using the flag ```-auto-approve``` to automatically approve the planned changes without requiring interactive confirmation:
```bash
$ terraform destroy -auto-approve -var-file=env/dev.tfvars 
```