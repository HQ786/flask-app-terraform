provider "aws" {
  region = "us-east-1"
}

# Upload your SSH public key
resource "aws_key_pair" "deployer" {
  key_name   = "my-ec2-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Allow SSH and Flask app traffic
resource "aws_security_group" "flask_sg" {
  name        = "flask-sg"
  description = "Allow SSH and Flask inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask app"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance
resource "aws_instance" "flask_app" {
  ami           = "ami-0e449927258d45bc4"  # Amazon Linux 2 AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.flask_sg.name]

  tags = {
    Name = "FlaskAppEC2"
  }
}

# Output public IP
output "instance_ip" {
  value = aws_instance.flask_app.public_ip
}

