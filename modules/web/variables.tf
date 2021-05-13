variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
}

variable "cpu_units" {
  default     = 512
  type        = number
  description = "The number of cpu units the Amazon ECS container agent will reserve for the container"
}

# container settings
variable "desired_count" {
  default     = 2
  type        = number
  description = "The number of instances of the task definition to place and keep running."
}

# cluster settings
variable "ecs_cluster_name" {
  type        = string
  description = "Name of the ECS cluster"
}

variable "ecs_service_role" {
  default     = "ecsServiceRole"
  description = "Name of the ECS service role"
  type        = string
}

# Docker Image configuration
variable "ecr_repo" {
  type        = string
  description = "Name of the ECR repository to pull the container image"
}

variable "container_port" {
  type        = number
  description = "Application port to use"
}

variable "health_check" {
  type        = string
  description = "Path to check health of application"
}

variable "health_check_status" {
  default     = "200,401"
  type        = string
  description = "The HTTP codes to use when checking for a successful response from a target."

}

variable "image_version" {
  type        = string
  description = "Version of the container image to be used"
}

# logs settings
variable "logs_region" {
  type        = string
  description = "Specifies the region you want to retain log events in the specified log group."
}

variable "log_retention" {
  default     = 30
  type        = number
  description = "Specifies the number of days you want to retain log events in the specified log group."
}

variable "max_memory" {
  default     = 1024
  type        = number
  description = "Maximum amount of memory the task can use"
}

variable "min_memory" {
  default     = 512
  type        = number
  description = "The amount of memory reserved for the task"
}

variable "service_name" {
  type        = string
  description = "Name of the service"
}

# networking configuration
variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "run_command" {
  default     = ""
  description = "List of commands to be run"
  type        = string
}

variable "protocol" {
  default     = "tcp"
  type        = string
  description = "Network protocol to use"
}

variable "task_role_arn" {
  default     = ""
  type        = string
  description = "ARN of task role"
}

variable "ecs_template_file" {
  default     = "ecs-definition-web.tpl"
  type        = string
  description = "ECS task definition template file name"
}

variable "template_vars" {
  type        = map(string)
  default     = {}
  description = "map of parameter=value to be configured in task definition"
}

variable "interval" {
  default     = 10
  type        = number
  description = "The approximate amount of time, in seconds, between health checks of an individual target. Minimum value 5 seconds, Maximum value 300 seconds."
}
variable "timeout" {
  default     = 7
  type        = number
  description = "The amount of time, in seconds, during which no response means a failed health check. For Application Load Balancers, the range is 2 to 120 seconds"
}

variable "healthy_threshold" {
  default     = 2
  type        = number
  description = "The number of consecutive health checks successes required before considering an unhealthy target healthy."
}

variable "unhealthy_threshold" {
  default     = 10
  type        = number
  description = "The number of consecutive health check failures required before considering the target unhealthy."
}

variable "deregistration_delay" {
  default     = 60
  type        = number
  description = "The amount time for ELB to wait before changing the state of a deregistering target from 'draining' to 'unused'"
}

variable "tags" {
  description = "tags to be applied to the ecs service"
  type        = map
  default = {
    terraform = "true"
  }
}