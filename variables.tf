# variable "project_name" {
#     type = string
  
# }

# variable "vpc_cidr" {
#   type = string
#   default = "10.0.0.0/16"
# }


# variable "vpc_tags" {
#   type = map
#   default = {}
# }


# variable "igw_tags" {
#   type = map
#   default = {}
# }

# variable "public_subnet_tags" {
#   type = map
#   default = {}
# }


# variable "public_subnet_cidr" {
#   type = list
#   validation {
#     condition = (
#       length(var.public_subnet_cidr) == 2
#     )
#     error_message = "CIDR list must be 2"
#   }
# }

# variable "public_route_table_tags" {
#   type = map
#   default = {}
# }


# variable "eip_tags" {
#   type = map
#   default = {}
# }

# variable "nat_gateway_tags" {
#   type = map
#   default = {}
# }

# variable "database_subnet_tags" {
#   type = map
#   default = {}
# }

# variable "database_route_table_tags" {
#   type = map
#   default = {}
# }

# variable "db_subnet_group_tags" {
#   type = map
#   default = {}
# }

# variable "database_subnet_cidr" {
#   type = list
#   validation {
#     condition = (
#       length(var.database_subnet_cidr) == 2
#     )
#     error_message = "CIDR list must be 2"
#   }
# }


variable "project_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}
variable "vpc_tags" {
  type = map
  default = {}
}
variable "igw_tags" {
  type = map
  default = {}
}
variable "public_subnet_tags" {
  type = map
  default = {}
}

variable "public_subnet_cidr" {
  type = list
  validation {
        condition = (
            length(var.public_subnet_cidr) == 2
        )
        error_message = "CIDR list must be 2"
    }
}

variable "public_route_table_tags" {
  type = map
  default = {}
}
variable "eip_tags" {
  type = map
  default = {}
}
variable "nat_gateway_tags" {
  type = map
  default = {}
}

variable "private_subnet_cidr" {
  type = list
  validation {
        condition = (
        length(var.private_subnet_cidr) == 2
        )
        error_message = "CIDR list must be 2"
    }
}

variable "private_subnet_tags" {
  type = map
  default = {}
}

variable "private_route_table_tags" {
  type = map
  default = {}
}

variable "database_subnet_cidr" {
  type = list
  validation {
        condition = (
            length(var.database_subnet_cidr) == 2
        )
        error_message = "CIDR list must be 2"
    }
}

variable "database_subnet_tags" {
  type = map
  default = {}
}

variable "database_route_table_tags" {
  type = map
  default = {}
}

variable "db_subnet_group_tags" {
  type = map
  default = {}
}