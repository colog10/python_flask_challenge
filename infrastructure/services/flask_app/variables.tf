variable "ecs_web_template_file" {
  default     = "task-definition-flask.tpl"
  type        = string
  description = "Name of the task definition template file"
}

variable "image_version" {
  default     = "latest"
  type        = string
  description = "Version of the container image to use"
}