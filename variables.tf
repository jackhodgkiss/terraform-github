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

variable "all_repositories" {
  default = [
    "kolla",
    "kolla-ansible",
    "ansible-collection-pulp",
    "ansible-role-os-images"
  ]
}

variable "teams" {
  default = {
    "Developers" = {
      description = "All developers are included within this team"
      privacy = "closed"
      users = {
        maintainers = [
          "MrJHBauer"
        ],
        members = [
          "jackhodgkiss"
        ]
      }
    },
    "OpenStack" = {
      description = "Team responsible for OpenStack development"
      privacy = "closed"
      users = {
        maintainers = [
          "MrJHBauer"
        ],
        members = [
          "jackhodgkiss"
        ]
      }
    },
    "Kayobe" = {
      description = "Team responsible for Kayobe development"
      privacy = "closed"
      users = {
        maintainers = [
          "MrJHBauer"
        ],
        members = [
          "jackhodgkiss"
        ]
      }
    }
  }
}