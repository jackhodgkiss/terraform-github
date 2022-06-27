terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "4.26.1"
    }
  }
}

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

provider "github" {
  token = var.GITHUB_TOKEN
  owner = "a-demo-org"
}

resource "github_branch_protection" "OPENSTACK_REPOSITORIES" {

  for_each = toset(var.OPENSTACK_REPOSITORIES)
  repository_id = each.key

  pattern = "stackhpc/**"
  require_conversation_resolution = true
  allows_deletions = false
  allows_force_pushes = false

  push_restrictions = [
    data.github_user.jackhodgkiss.node_id,
  ]

  required_status_checks {
    contexts = [
      "tox / Tox pep8 with Python 3.8",
      "tox / Tox py36 with Python 3.6",
      "tox / Tox py38 with Python 3.8",
    ]
    strict = true
  }

  required_pull_request_reviews {
    require_code_owner_reviews = true
  }
}

data "github_user" "jackhodgkiss" {
  username = "jackhodgkiss"
}