variable "cidr" {
    default = "10.0.0.0/16"
}

resource "aws_key_pair" "terraform_key" {
  key_name = "terraform_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

resource "aws_route_table" "rt1" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.rt1.id
}

resource "aws_security_group" "webSg" {
  name = "web"
  vpc_id = aws_vpc.myvpc.id

  ingress {
    description = "http from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
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
  tags = {
    Name = "Web-sg"
  }
}

resource "aws_instance" "server" {
  ami = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  key_name = aws_key_pair.terraform_key.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id = aws_subnet.sub1.id
  tags = {
    Name = "ubuntu-vm-test"
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host = self.public_ip
  }
  provisioner "file" {
    source = "app.py"
    destination = "/home/ubuntu/app.py"
  }
  provisioner "remote-exec" {
    inline = [ 
        "echo 'Hello from Remote Instance'",
        "sudo apt update -y",
        "sudo apt-get install -y python3-pip",
        "cd /home/ubuntu",
        "sudo pip3 install flask",
        "sudo nohup python3 app.py &",
     ]
  }
}
