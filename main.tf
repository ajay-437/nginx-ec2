

provider "aws" {
     region = "ca-central-1"
 profile = "terraform-user"
    
    }
resource "aws_instance" "foo" {
  ami           = "ami-0a2e7efb4257c0907"  
  
  instance_type = "t2.micro"  
  tags = {
      Name = "TF-Instance"   

}
}


