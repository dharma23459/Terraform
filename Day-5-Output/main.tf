resource "aws_instance" "deva" {
    ami = "ami-0ddfba243cbee3768"
    instance_type = "t2.micro"
    key_name = "sainikudu"
    tags = {
        name = "deva"
    }
}

terraform {
  backend "s3" {
    bucket = "justacasulabucket"
    region = "ap-south-1"
    key = "day-5/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true
    
  }
}

