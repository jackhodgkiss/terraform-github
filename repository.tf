resource "github_repository" "kolla-ansible" {
  name = "kolla-ansible"
  delete_branch_on_merge = true
  lifecycle {
    ignore_changes = [
      description,
      homepage_url,
      private,
      visibility,
      has_issues,
      has_projects,
      has_wiki,
      is_template,
      allow_merge_commit,
      allow_squash_merge,
      allow_rebase_merge,
      has_downloads,
      auto_init,
      gitignore_template,
      license_template,
      default_branch,
      archived,
      archive_on_destroy,
      pages,
      topics,
      template,
      vulnerability_alerts,
      ignore_vulnerability_alerts_during_read
    ]
  }
}

resource "github_repository" "kolla" {
  name = "kolla"
  delete_branch_on_merge = true
  lifecycle {
    ignore_changes = [
      description,
      homepage_url,
      private,
      visibility,
      has_issues,
      has_projects,
      has_wiki,
      is_template,
      allow_merge_commit,
      allow_squash_merge,
      allow_rebase_merge,
      has_downloads,
      auto_init,
      gitignore_template,
      license_template,
      default_branch,
      archived,
      archive_on_destroy,
      pages,
      topics,
      template,
      vulnerability_alerts,
      ignore_vulnerability_alerts_during_read
    ]
  }
}

data "github_repository" "repositories" {
  for_each = toset(var.all_repositories)
  full_name = format("%s/%s", var.owner, each.value)
}