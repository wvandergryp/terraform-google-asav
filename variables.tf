# This variable defines the GCP project ID where resources will be created.
variable "project" {
    description = "The GCP project ID"
    type        = string
}

# This variable specifies the GCP region where resources will be deployed.
variable "region" {
    description = "The GCP region"
    type        = string
}

# This variable sets the name of the inside VPC.
variable "inside_vpc_name" {
    description = "The name of the inside VPC"
    type        = string
}

# This variable sets the name of the inside subnet.
variable "inside_subnet_name" {
    description = "The name of the inside subnet"
    type        = string
}

# This variable defines the CIDR block for the inside subnet.
variable "inside_subnet_cidr" {
    description = "The CIDR block for the inside subnet"
    type        = string
}

# This variable sets the name of the manage VPC.
variable "manage_vpc_name" {
    description = "The name of the manage VPC"
    type        = string
}

# This variable sets the name of the manage subnet.
variable "manage_subnet_name" {
    description = "The name of the manage subnet"
    type        = string
}

# This variable defines the CIDR block for the manage subnet.
variable "manage_subnet_cidr" {
    description = "The CIDR block for the manage subnet"
    type        = string
}

# This variable sets the name of the outside VPC.
variable "outside_vpc_name" {
    description = "The name of the outside VPC"
    type        = string
}

# This variable sets the name of the outside subnet.
variable "outside_subnet_name" {
    description = "The name of the outside subnet"
    type        = string
}

# This variable defines the CIDR block for the outside subnet.
variable "outside_subnet_cidr" {
    description = "The CIDR block for the outside subnet"
    type        = string
}

# This variable sets the name of the ASAv instance.
variable "asav_name" {
    description = "The name of the ASAv instance"
    type        = string
}