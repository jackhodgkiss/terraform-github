variable GITHUB_TOKEN {
  type        = string
  description = "GitHub token required for authentication"
}

variable "OPENSTACK_REPOSITORIES" {
  default = [
    "kolla",
    "kolla-ansible"
  ]
}

variable "teams" {
  default = {
    "Developers" = {
      description = "All developers are included within this team", 
      privacy = "closed"
      members = [
        "jackhodgkiss", "MrJHBauer"
      ]
    },
    "OpenStack" = {
      description = "Team responsible for OpenStack development"
      privacy = "closed"
      members = [
        "MrJHBauer"
      ]
    }
  }
}