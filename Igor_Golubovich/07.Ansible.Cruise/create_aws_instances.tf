# Creating bastion and ansible_hosts via aws + terraform
# by Igor Golubovich


provider "aws" {
  region = "eu-north-1"
}


data "aws_ami" "ami_lat_amz" {
  owners      = ["137112412989"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*x86_64-gp2"]
  }
}

data "aws_ami" "ami_lat_redhat" {
  owners      = ["309956199498"]
  most_recent = true
  filter {
    name   = "name"
    values = ["RHEL_HA-8.4.0_HVM-*"]
  }
}

data "aws_ami" "ami_lat_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.*-amd64-server-20*"]
  }
}


resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ansible_test - VPC"
  }
}


resource "aws_subnet" "private_sub" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "192.168.20.0/24"
  tags = {
    Name = "ansible_test - private_sub"
  }
}

resource "aws_subnet" "nat_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "192.168.10.0/24"
  tags = {
    Name = "nat_gateway_subnet"
  }
}

resource "aws_internet_gateway" "nat_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "nat_gateway"
  }
}

resource "aws_route_table" "nat_route" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nat_gateway.id
  }
  tags = {
    Name = "nat_gateway_route"
  }
}

resource "aws_route_table_association" "nat_route_sub" {
  route_table_id = aws_route_table.nat_route.id
  subnet_id      = aws_subnet.nat_subnet.id
}

resource "aws_eip" "nat_ip" {
  vpc = true
  tags = {
    Name = "static_ip_nat"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.nat_subnet.id
  tags = {
    Name = "gw NAT"
  }
}


resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = {
    Name = "nat_gateway_private_route"
  }
}


resource "aws_route_table_association" "private_route_sub" {
  route_table_id = aws_route_table.private_route.id
  subnet_id      = aws_subnet.private_sub.id
}

resource "aws_eip" "bastion_ip" {
  instance = aws_instance.bastion.id
  vpc      = true
  tags = {
    Name = "bastion_static_ip"
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ami_lat_amz.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.nat_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg_ansible.id]
  key_name                    = "igoz-keys-stockholm"

  provisioner "file" {
    source      = "igoz-keys-stockholm.pem"
    destination = "~/.ssh/igoz-keys-stockholm.pem"
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("igoz-keys-stockholm.pem")
      host        = self.public_ip
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 ~/.ssh/igoz-keys-stockholm.pem",
      "sudo hostname bastion"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("igoz-keys-stockholm.pem")
      host        = self.public_ip
    }
  }
  tags = {
    Name = "bastion"
  }
}


resource "aws_instance" "ansible_host_redhat" {
  ami                    = data.aws_ami.ami_lat_redhat.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg_ansible.id]
  subnet_id              = aws_subnet.private_sub.id
  key_name               = "igoz-keys-stockholm"
  tags = {
    Name = "ansible redhat host"
  }
}

resource "aws_instance" "ansible_host_ubuntu" {
  ami                    = data.aws_ami.ami_lat_ubuntu.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg_ansible.id]
  subnet_id              = aws_subnet.private_sub.id
  key_name               = "igoz-keys-stockholm"
  tags = {
    Name = "ansible ubuntu host"
  }
}


resource "aws_security_group" "sg_ansible" {
  name        = "ansible_sg"
  vpc_id      = aws_vpc.my_vpc.id
  description = "allow_SSH,HTTP,ICMP"


  dynamic "ingress" {
    for_each = ["22", "80", "443"]
    content {
      from_port        = ingress.value
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  #allow only echo icmp
  ingress {
    from_port        = 8
    to_port          = 0
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ansible_sg"
  }
}


output "public_ip_bastion" {
  value = aws_eip.bastion_ip.public_ip
}

output "private_ip_ansible_ubuntu_host" {
  value = aws_instance.ansible_host_ubuntu.private_ip
}

output "private_ip_ansible_redhat_host" {
  value = aws_instance.ansible_host_redhat.private_ip
}
