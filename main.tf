provider "aws" {
     region = var.aws_region
        
  
}
resource "aws_instance" "foo" {
  ami           = var.ami
  key_name   = "aws-key"

   instance_type = var.instance_type
   subnet_id = aws_subnet.pb-subnet.id
   vpc_security_group_ids = [ aws_security_group.aws-sg.id ]
 
 tags = {
    Name = var.name_tag

  }
user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              EOF  
      
}
