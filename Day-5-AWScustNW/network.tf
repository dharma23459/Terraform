#Creating VPC
resource "aws_vpc" "cust" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "cust_vpc"
    }
  
}
#creating subnet
resource "aws_subnet" "cust" {
    vpc_id = aws_vpc.cust.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "cust_subnet"
    }
  
}
resource "aws_subnet" "cust_private" {
  vpc_id = aws_subnet.cust.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private-subent"
  }
  
}

# create internet gateway
resource "aws_internet_gateway" "cust" {
    vpc_id = aws_vpc.cust.id
     tags = {
      Name = "cust_ig"
    }
  
}
#create route table and edit routes
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.cust.id
    
    route {
        gateway_id = aws_internet_gateway.cust.id
        cidr_block = "0.0.0.0/0"
    }
  
}

#subnet associtaion
resource "aws_route_table_association" "name" {
  route_table_id = aws_route_table.name.id
  subnet_id = aws_subnet.cust.id
}



# Create nat gateway for private subnet
# Create route for private subnets and edit routes 
# route table association 

#Create securtiy group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.cust.id

  ingress {
    description = "TLS from ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
    description = "TLS from ssh"
    from_port   = 80
    to_port     = 80
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
    Name = "allow_tls"
  }
}