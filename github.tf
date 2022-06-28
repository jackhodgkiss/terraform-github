resource "github_team" "organisation_teams" {
  for_each = {for team in var.teams: team.name => team}
  name = "${each.value.name}"
  description = "${each.value.description}"
  privacy = "${each.value.privacy}"
}

data "github_team" "organisation_teams" {
  for_each = {for team in var.teams: team.name => team}
  slug = "${each.value.name}"
}

resource "github_team_members" "team_members" {
  for_each = data.github_team.organisation_teams
  team_id = "${each.value.id}"

  members {
    username = "jackhodgkiss"
    role = "member"
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