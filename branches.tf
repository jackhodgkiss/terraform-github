resource "github_branch_protection" "openstack_branch_protection" {
  for_each = toset(var.repositories["OpenStack"])
  repository_id = each.key

  pattern = "stackhpc/**"
  require_conversation_resolution = true
  allows_deletions = false
  allows_force_pushes = false

  push_restrictions = [
    resource.github_team.organisation_teams["Developers"].node_id
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