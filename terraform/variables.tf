variable "do_token" {
  description = "This is the DO API token"
  type        = string
  sensitive   = true
}

variable "public_key" {
  description = "The public key"
  type        = string
  default     = ""
}

variable "region" {
  description = "The region to start in"
  type        = string
  default     = "fra1"
}

variable "web" {
  type = object({
    image       = string
    name_prefix = string
    size        = string
    count       = number
  })
}

variable "loadbalancer_public" {
  type = object({
    name                = string
    web_app_target_port = number
  })
}

variable "root_domain_name" {
  description = "The name of the domain"
  type        = string
  default     = "devops-for-programmers-prod.club"
}

variable "www_sub_domain_names" {
  type    = string
  default = "www"
}

variable "database" {
  type = object({
    name       = string
    version    = string
    size       = string
    node_count = number
  })
}

variable "datadog_api_key" {
  description = "Datadog API key"
  type        = string
  sensitive   = true
}

variable "datadog_app_key" {
  description = "Datadog APP key"
  type        = string
  sensitive   = true
}

variable "datadog_api_url" {
  description = "The API URL"
  type        = string
  default     = "https://api.datadoghq.eu/"
}
