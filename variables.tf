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