resource "github_team" "organisation_teams" {
  for_each    = var.teams
  name        = each.key
  description = each.value.description
  privacy     = each.value.privacy
}

resource "github_team_repository" "developer_repositories" {
  for_each   = toset(flatten(values(var.repositories)))
  team_id    = resource.github_team.organisation_teams["Developers"].id
  repository = each.value
  permission = "maintain"
}

resource "github_team_repository" "openstack_repositories" {
  for_each   = toset(var.repositories["OpenStack"])
  team_id    = resource.github_team.organisation_teams["OpenStack"].id
  repository = each.value
  permission = "admin"
}

resource "github_team_repository" "ansible_repositories" {
  for_each   = toset(var.repositories["Ansible"])
  team_id    = resource.github_team.organisation_teams["Ansible"].id
  repository = each.value
  permission = "admin"
}

resource "github_team_repository" "kayobe_repositories" {
  for_each   = toset(var.repositories["Kayobe"])
  team_id    = resource.github_team.organisation_teams["Kayobe"].id
  repository = each.value
  permission = "admin"
}

resource "github_team_members" "team_membership" {
  for_each = {
    for team in resource.github_team.organisation_teams : team.name =>
    team
  }
  team_id = each.value.id
  dynamic "members" {
    for_each = var.teams[each.value.name].users["maintainers"]
    content {
      username = members.value
      role     = "maintainer"
    }
  }

  dynamic "members" {
    for_each = var.teams[each.value.name].users["members"]
    content {
      username = members.value
      role     = "member"
    }
  }
}