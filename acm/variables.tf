############
## REGION ##
############
variable "region" {
  default = "eu-west-1"
}

variable "region_cloudfront" {
  default = "us-east-1"
}

##########################################################
## DEFINE THE NAME APROVISIONET FOR CERTIFICATE MANAGER ##
##########################################################
variable "domain_name" {
  default   =   "infra.devopsgeekshubsacademy.click"  ##CAMBIAR
}

variable "subject_alternative_names" {
  default   =   [
      "*.infra.devopsgeekshubsacademy.click", ## CAMBIAR
      "infra.devopsgeekshubsacademy.click"    ## CAMBIAR
  ]
}
variable "validation_method" {
  default   =   "DNS"
}
##################
## DNS ROUTE 53 ##
##################
variable "dns_zone_name" {
  default   =   "infra.devopsgeekshubsacademy.click."  ## IMPORTANT THE FINAL POINT ## CAMBIAR
}
variable "private_zone" {
  default   =   "false"
}

##############
## ADD TAGS ##
##############
variable "project" {
  default = "devops"
}
variable "env" {
  default = "dev"
}
variable "creator" {
  default = "DevOps Team"
}
variable  "application" {
  default = "base"
}
variable "terraform" {
  default = "True"
}