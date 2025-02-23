provider "aws" {
  region = "ap-south-1"
}

# Security Group
resource "aws_security_group" "japan_army" {
  name        = "japan_army"
  description = "Allow inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance that depends on the Security Group
resource "aws_instance" "example_instance" {
  ami           = "ami-0d682f26195e9ec0f"  # Replace with a valid AMI ID
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.japan_army.id]

  depends_on = [aws_security_group.japan_army]  # Explicit dependency
  tags = {
    Name = "EC2-created-after-sg-Dependency"
  }
}
