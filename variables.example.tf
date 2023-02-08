
#####################
# AWS configuration #
#####################

variable "region" {
  type = string
  description = "Region to create resources in"
  default = "eu-west-3"
}

variable "availability_zone" {
  type = string
  description = "Availability zone to create resources in"
  default = "eu-west-3b"
}

#######################
# Cloudflare config   #
#######################

variable "cloudflare_api_key" {
  type = string
  description = "Cloudflare API key"
  default = ""
}

variable "cloudflare_zone_id" {
  type = string
  description = "value of the zone id"
  default = ""
}

variable "dns_zone" {
  type = string
  description = "DNS zone to create records in"
  default = "wordpress"
}

#######################
# Database config     #
#######################

variable "database_name" {
  type = string
  description = "Name of the database to create"
  default = "MyBigDb"
}

variable "database_user" {
  type = string
  description = "Name of the database user to create"
  default = "MyBigDbUser"
}
  
variable "database_password" {
  type = string
  description = "Password for the database user"
  default = ""
}



