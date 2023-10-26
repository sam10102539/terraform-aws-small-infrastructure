provider_aws_region = "eu-central-1"

vpc_cidr = "10.0.0.0/16"

private_subnet_cidr = "10.0.10.0/24"
private_subnet_az = "eu-central-1a"
private_subnet_map_public_ip_on_launch = true

route_public_cidr = "0.0.0.0/0"

ebs_volume_az = ["eu-central-1a"]

nic_public_ips = ["10.0.10.250"]

ec2_instance_ami = "ami-0be656e75e69af1a9"
ec2_instance_type = "t2.micro"
ec2_instance_az = "eu-central-1a"

eip_domain_type = "vpc"

sg_ssh_port = 22