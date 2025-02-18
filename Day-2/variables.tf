variable "ami_id" {
    description = "inserting ami value"
    type = string
    default = "ami-0ddfba243cbee3768"
}

variable "type" {
    description = "instance type"
    type = string
    default = "t2.micro"
}

variable "key" {
    description = "inserting key value"
    type = string
    default = "sainikudu"
}