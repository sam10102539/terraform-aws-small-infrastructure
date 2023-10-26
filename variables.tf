variable "provider_aws_region" {
  description = "The region for the terraform provier"
  type        = string
}

variable "provider_aws_access_key" {
  description = "The access key to access AWS resources"
  type        = string
}

variable "provider_aws_secret_key" {
  description = "The secret key to access AWS resources"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR blocks for the private subnets"
  type        = string
}

variable "private_subnet_az" {
  description = "The availability zones for the subnet"
  type        = string
}

variable "private_subnet_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
  type        = bool
  default     = true
}

variable "route_public_cidr" {
  description = "The route table settings within internet gateway"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ebs_volume_az" {
  description = "The EBS storage availability zones"
  type        = list(string)
}

variable "nic_public_ips" {
  description = "Specific IP for EC2 instance"
  type        = list(string)
}

variable "ec2_instance_ami" {
  description = "Amazon machine images"
  type        = string
}

variable "ec2_instance_type" {
  description = "The EC2 instance type"
  type        = string
}

variable "ec2_instance_az" {
  description = "EC2 Instance availability zones"
  type        = string
}

variable "eip_domain_type" {
  description = "Elastic IP domain type"
  type        = string
  default     = "vpc"
}

variable "sg_ssh_port" {
  description = "Incoming traffic port for SSH into EC2 instances"
  type        = number
  default     = 22
}
