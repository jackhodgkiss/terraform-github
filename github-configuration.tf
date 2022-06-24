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
}

data "github_user" "current" {
  username = ""
}

output "current_github_login" {
  value = "${data.github_user.current.login}"
}