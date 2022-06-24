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


provider "github" {
  token = var.GITHUB_TOKEN
  owner = "jackhodgkiss"
}

data "github_branch" "default" {
  repository = "kolla"
  branch = "master"
}

output "branch" {
  value = "${data.github_branch.default}"
}
