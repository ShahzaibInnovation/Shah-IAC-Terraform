variable "aws_region" {
  default = "ap-southeast-2"
}

variable "env" {
  description = "The environment for the My Infra-App"
  type        = string
}

variable "bucket_name" {
  description = "This is bucket for my infra app"
  type        = string
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number

}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string

}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "hash_key" {
  description = "Hash key for MyInfra DynamoDB table"
  type        = string
}