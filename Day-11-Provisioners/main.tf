# Define the AWS provider configuration.
provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region.
}


resource "aws_key_pair" "gudachari" {
  key_name   = "task"  # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub") 

}

resource "aws_instance" "EC2Server" {
  ami                    = "ami-00bb6a80f01f03502"
  instance_type          = "t2.micro"
  key_name      = aws_key_pair.gudachari.key_name
  

  connection {
    type        = "ssh"
    user        = "ubuntu"  # Replace with the appropriate username for your EC2 instance
    # private_key = file("C:\Users\dharm\.ssh/id_rsa")
    private_key = file("~/.ssh/id_rsa")  #private key path
    host        = self.public_ip
  }
  # local execution process
 provisioner "local-exec" {
    command = "touch file100" #mysql -h -u user -p
   
 }
  # File provisioner to copy a file from local to the remote EC2 instance
  provisioner "file" {
    source      = "file25"  # Replace with the path to your local file
    destination = "/home/ubuntu/file25"  # Replace with the path on the remote instance
  }
  # remote execution process 
  provisioner "remote-exec" {
    inline = [
"touch file300",
"echo remote executed by dharma in file300 >> file300", ##mysql -h -u user -p
]
 }
}
