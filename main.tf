

provider "aws" {
     region = "ca-central-1"
AWS_ACCESS_KEY_ID     = credentials('aws_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    
    }
resource "aws_instance" "foo" {
  ami           = "ami-0a2e7efb4257c0907"  
  
  instance_type = "t2.micro"  
  tags = {
      Name = "TF-Instance"   

}
}


