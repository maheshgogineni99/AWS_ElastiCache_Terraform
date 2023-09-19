variable "additionaltag1" {
  description = "Additional tags to be added to ElastiCache clusters"
  type        = string
  
}

variable "available_regions" {
  description = "List of AWS regions where clusters should be deployed"
  type        = list(string)
  default     = ["us-east-2", "eu-west-1", "ap-east-1"]
}

variable "subnet1" {
   type        = string
}

variable "subnet2" {
   type        = string
}

variable "nodegroup" {
   type        = string
}

variable "replicapernode" {
   type        = string
}

variable "env" {
   type        = string
}

variable "node_type" {
   type = string
}


variable "Owner" {
  type = string
  description = "Owner"
  validation {
    condition = contains(["Data Services", "Platform API", "Infrastructure", "Web"], var.Owner)
    error_message = "Valid value is one of the following: Data Services, Platform API, Infrastructure, Web"
  }
}

variable "Service" {
   type = string
}

variable "Classification" {
  type = string
  description = "Owner"
  validation {
    condition = contains(["Internal", "Confidential", "Public"], var.Classification)
    error_message = "Valid value is one of the following: Internal, Confidential, Public"
  }
}

