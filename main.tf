 provider "aws" {
     region = "ca-central-1"
     profile = "terraform-user"
     access_key = "AKIAYS2NVRSRPUD5FP5T"
	   secret_key = "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"
    
    
  
}
resource "aws_instance" "nginx-ins" {
  ami           = "ami-0a2e7efb4257c0907"  
  key_name   = "key-pair1"
  instance_type = "t2.micro"  
  subnet_id = aws_subnet.public-subnet.id
 vpc_security_group_ids = [ aws_security_group.aws-sg.id ]

user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              EOF  
      
      
      
    }
  


