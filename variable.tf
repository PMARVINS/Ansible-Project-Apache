#Variable for Prod-rock-VPC CIDR
variable "rock-vpc-cidr" {
  type        = string
  description = "Rock-Vpc Cidr block"
  default     = "10.0.0.0/16"
}

# Variable for Public Subnet 1 variable
variable "pub-subnet1" {
  type        = string
  description = "public subnet 1 cidr block"
  default     = "10.0.1.0/24"
}

# Variable for Public Subnet 2 variable
variable "pub-subnet2" {
  type        = string
  description = "public subnet 2 cidr block"
  default     = "10.0.2.0/24"
}

# Variable for Private Subnet 1 variable
variable "Priv-subnet1" {
  type        = string
  description = "Private subnet 1 cidr block"
  default     = "10.0.3.0/24"
}

# Variable for Private Subnet 2 variable
variable "Priv-subnet2" {
  type        = string
  description = "Private subnet 2 cidr block"
  default     = "10.0.4.0/24"
}