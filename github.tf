resource "github_team" "organisation_teams" {
  for_each = var.teams
  name = "${each.key}"
  description = "${each.value.description}"
  privacy = "${each.value.privacy}"
}

data "github_team" "organisation_teams" {
  for_each = var.teams
  slug = "${each.key}"
}

resource "github_team_members" "team_membership" {
  for_each = {
    for team in data.github_team.organisation_teams: team.id => [
      for member in var.teams[team.name].members: member
    ]
  }
  team_id = "${each.key}"
  dynamic "members" {
    for_each = "${each.value}"
    content {
      username = "${members.value}"
      role = "maintainer"
    }
  }
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