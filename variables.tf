variable "GITHUB_TOKEN" {
  type        = string
  description = "GitHub token required for authentication"
}

variable "owner" {
  default = "a-demo-org"
}

variable "repositories" {
  default = {
    "Ansible" = [],
    "Azimuth" = [],
    "Batch" = [],
    "Kayobe" = [],
    "OpenStack" = [],
    "ReleaseTrain" = [],
    "SMSLab" = [],
  }
}

variable "teams" {
  default = {
    "Ansible" = {
      description = "Team responsible for Ansible development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [],
      }
    },
    "Azimuth" = {
      description = "Team responsible for Azimuth development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [],
      }
    },
    "Batch" = {
      description = "Team responsible for Batch development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [],
      }
    },
    "Developers" = {
      description = "Team responsible for Developers development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [],
      }
    },
    "Kayobe" = {
      description = "Team responsible for Kayobe development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [],
      }
    },
    "OpenStack" = {
      description = "Team responsible for OpenStack development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [],
      }
    },
    "ReleaseTrain" = {
      description = "Team responsible for Release Train development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [],
      }
    },
    "SMSLab" = {
      description = "Team responsible for SMS Lab development"
      privacy = "closed"
      users = {
        maintainers = [],
        members = [],
      }
    },
  }
}