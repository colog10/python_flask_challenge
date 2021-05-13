variable "idle_timeout" {
  default     = 60
  description = "connection idle time out, default=60"
  type        = number
}

variable "name" {
  description = "Load balancer name"
  type        = string
}

variable "is_internal" {
  description = "set true if the load balancer is private. this seting will not expose the elb to internet. default=false"
  default     = false
  type        = bool
}
variable "alb_sg" {
  description = "Security group assinged to the LB"
  type        = string
}

variable "subnets_id" {
  description = "List of subnets where the LB will place it's terminations"
  type        = list
}

variable "delete_protection" {
  default     = false
  description = "Protect this resource for accidental deletion. values: true or false [default: false]"
  type        = bool
}

variable "cross_zone_lb" {
  default     = true
  description = "Allow cross zone load balancing, this setting allows to LB vpc terminations to reach targets in a different az that the assigned. [default=true]"
  type        = bool
}

variable "vpc_id" {
  description = "VPC id where the ALB will be placed"
  type        = string
}

variable "tags" {
  description = "Tags that will be applied to the components related with this module default: { terraform = true }"
  default = {
    terraform = true
  }
  type = map
}
