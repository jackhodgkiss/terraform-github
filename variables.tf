variable GITHUB_TOKEN {
  type        = string
  description = "GitHub token required for authentication"
}

variable owner {
  default = "a-demo-org"
}

variable "repositories" {
  default = {
    "OpenStack" = [
      "kolla",
      "kolla-ansible"
    ],
    "Ansible" = [
      "ansible-collection-pulp",
      "ansible-role-os-images"
    ],
    "Kayobe" = [
      "stackhpc-kayobe-config"
    ]
  }
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
    },
    "Ansible" = {
      description = "Team responsible for Ansible development"
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