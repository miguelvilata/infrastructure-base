###################
## DEPLOY REGION ##
###################
variable "region" {
  default = "ap-northeast-1"
}
##############
## KEY PAIR ##
##############
variable  "key_list" {
  type      = list
  default   = ["zignaly-prod"]
}

##############
## ADD TAGS ##
##############
variable "project" {
  description = "Project name" 
  default = "zignaly"
}
variable "application" {
  description = "Application name"
  default = "core"
}
variable "env" {
  description = "Environment type"
  default = "prod"
}
variable "creator" {
  description = "Deploymente by"
  default = "Devops Team"
}
variable "terraform" {
  description = "Terraform Template"
  default = "True"
}

