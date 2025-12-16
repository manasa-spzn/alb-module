variable "region" {
    description = "The AWS region to deploy resources in - same as vpc"
    type        = string  
}

variable "sg_alb_id" {
    description = "The security group ID for the application load balancer"
    type        = string
}

variable "subnet_1_id" {
    description = "The ID of the first public subnet for the ALB"
    type        = string
}

variable "subnet_2_id" {
    description = "The ID of the second public subnet for the ALB"
    type        = string
}

variable "id_vpc" {
    description = "The ID of the VPC where resources will be deployed"
    type        = string
}

variable "id_asg" {
    description = "The ID of the Auto Scaling Group to attach to the ALB target group"
    type        = string 
}