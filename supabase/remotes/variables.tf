variable "supabase_access_token" {}
variable "org_id" {}
variable "project_name" {}
variable "db_password" {}
variable "terraform_organization" {
  type        = string
  description = "Terraform Cloud organization name"
}

variable "terraform_workspace" {
  type        = string
  description = "Terraform Cloud workspace name"
}

