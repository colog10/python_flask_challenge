variable "cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID in which the ECS cluster will be created"
}

variable "vpc_subnets" {
  type        = list(string)
  description = "The VPC subnets IDs in which the ECS cluster will be created"
}

variable "max_size" {
  type        = number
  description = "The maximum size of the auto scale group"
}

variable "min_size" {
  type        = number
  description = "The minimum size of the auto scale group"
}

variable "desired_size" {
  type        = number
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable "instance_type" {
  type        = string
  description = "The type of instance to launch"
}

variable "key_name" {
  type        = string
  description = "The key name that should be used for the instance"
  default = ""
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
}

variable "cooldown" {
  description = "Time between a scaling activity and the succeeding scaling activity"
  default     = 300
}

variable "tags" {
  description = "Tags to be applied to ecs"
  type        = map
  default = {
    terraform = "true"
  }
}

variable "container_insights" {
  type        = bool
  description = "Enable Disable cloudwatch containers insights. (BOOL) default:false"
  default     = false
}

variable "public_ip" {
  description = "Associate a public ip address with an instance"
  default     = true
  type        = bool
}

variable "enable_monitoring" {
  type        = bool
  description = "Enables/disables detailed monitoring"
  default     = false
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = " "
  type        = string
}


variable "root_vol_size" {
  description = "The size of the volume in gigabytes"
  default     = "30"
  type        = string
}

variable "health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
  default     = "EC2"
  type        = string
}
