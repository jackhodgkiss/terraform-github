resource "github_team" "organisation_teams" {
  for_each = var.teams
  name = "${each.key}"
  description = "${each.value.description}"
  privacy = "${each.value.privacy}"
}

resource "github_team_repository" "developer_repositories" {
  for_each = toset(var.all_repositories)
  team_id = resource.github_team.organisation_teams["Developers"].id
  repository = "${each.value}"
  permission = "maintain"
}

resource "github_team_members" "team_membership" {
  for_each = {
    for team in resource.github_team.organisation_teams: team.id => 
      var.teams[team.name].users
  }
  team_id = "${each.key}"
  dynamic "members" {
    for_each = "${each.value["maintainers"]}"
    content {
      username = "${members.value}"
      role = "maintainer"
    }
  }

  dynamic "members" {
    for_each = "${each.value["members"]}"
    content {
      username = "${members.value}"
      role = "member"
    }
  }
}