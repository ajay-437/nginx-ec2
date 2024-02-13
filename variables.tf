variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ca-central-1"
}
variable "avl_zone" {
   type        = string
   description = "zone"
   default     = "ca-central-1a" 
}
variable "ami" {
   type        = string
   description = "Ubuntu AMI ID"
   default     = "ami-0a2e7efb4257c0907" 
}
variable "instance_type" {
   type        = string
   description = "Instance type"
   default     = "t2.micro"
}
variable "name_tag" {
   type        = string
   description = "Name of the EC2 instance"
   default     = "jenkinsEc2"
}

variable "cidr" {
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  type        = string
  default     = "10.0.0.0/16"
}
