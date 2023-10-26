terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}

provider "aws" {
  region = var.provider_aws_region
  access_key  = var.provider_aws_access_key
  secret_key  = var.provider_aws_secret_key
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.private_subnet_az
  map_public_ip_on_launch = var.private_subnet_map_public_ip_on_launch
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.route_public_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rtb_public.id
}

resource "aws_security_group" "sg_ssh_22" {
  name        = "ssh-port-sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = var.sg_ssh_port
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_network_interface" "ec2_instance_web-nic-a" {
  subnet_id       = aws_subnet.subnet.id
  private_ips     = var.nic_public_ips
  security_groups = [aws_security_group.sg_ssh_22.id]
}

resource "aws_ebs_volume" "ebs" {
  availability_zone = "eu-central-1a"
  size              = 4
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs.id
  instance_id = aws_instance.ec2_instance_web.id
}

resource "aws_instance" "ec2_instance_web" {
  ami           = var.ec2_instance_ami
  instance_type = var.ec2_instance_type
  availability_zone = var.ec2_instance_az

  network_interface {
    network_interface_id = aws_network_interface.ec2_instance_web-nic-a.id
    device_index         = 0
  }

}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2_instance_web.id
  domain   = var.eip_domain_type
}

output "Done" {
    value = "Finaly Done !!"
}