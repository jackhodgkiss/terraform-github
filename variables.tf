variable "GITHUB_TOKEN" {
  type        = string
  description = "GitHub token required for authentication"
}

variable "owner" {
  default = "a-demo-org"
}

variable "teams" {
  default = {
    "Ansible" = {
      description = "Team responsible for Ansible development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [
          "jackhodgkiss"
        ],
      }
    },
    "Azimuth" = {
      description = "Team responsible for Azimuth development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [
          "jackhodgkiss"
        ],
      }
    },
    "Batch" = {
      description = "Team responsible for Batch development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [
          "jackhodgkiss"
        ],
      }
    },
    "Developers" = {
      description = "Team responsible for Developers development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [
          "jackhodgkiss"
        ],
      }
    },
    "Kayobe" = {
      description = "Team responsible for Kayobe development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [
          "jackhodgkiss"
        ],
      }
    },
    "OpenStack" = {
      description = "Team responsible for OpenStack development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [
          "jackhodgkiss"
        ],
      }
    },
    "ReleaseTrain" = {
      description = "Team responsible for Release Train development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [
          "jackhodgkiss"
        ],
      }
    },
    "SMSLab" = {
      description = "Team responsible for SMS Lab development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [
          "jackhodgkiss"
        ],
      }
    },
  }
}