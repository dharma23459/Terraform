# resource "aws_instance" "name" {
#     ami = "ami-0ddfba243cbee3768"
#     instance_type = "t2.micro"
#     key_name = "ec2test"
#     availability_zone = "ap-south-1a"
#     count = 2
#     # tags = {
#     #   Name = "dev"   two resource will create on same name 
#     # }
#     tags = {
#       Name = "dev-${count.index}"
#     }
   
   
  
# }
############################### Example-2 Different names #############
variable "env" {
  type    = list(string)
  default = [ "dev", "prod"]
}

resource "aws_instance" "name" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "sainikudu"
    availability_zone = "ap-south-1a"
    count = length(var.env)

    tags = {
      Name = var.env[count.index]
    }
}

## example-2 with variables list of string 

variable "ami" {
  type    = string
  default = "ami-0ddfba243cbee3768"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "sandboxes" {
  type    = list(string)
  default = [ "sandbox_server_two", "sandbox_server_three"]
}

# main.tf
resource "aws_instance" "sandbox" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = length(var.sandboxes)

  tags = {
    Name = var.sandboxes[count.index]
  }
}

#example-3 creating IAM users 
# variable "user_names" {
#   description = "IAM usernames"
#   type        = list(string)
#   default     = ["user1", "user2", "user3"]
# }
# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }