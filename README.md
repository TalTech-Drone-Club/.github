# .github

Default issue and pull request templates for the TalTech-Drone-Club organisation.
GitHub uses them in every repository of the org that has no templates of its own,
private repositories included.

| File | What it is |
|---|---|
| `.github/ISSUE_TEMPLATE/default.md` | Default issue: goal, context and links, steps |
| `.github/ISSUE_TEMPLATE/bug.md` | Bug report: what happened, how to reproduce, versions and logs |
| `.github/ISSUE_TEMPLATE/config.yml` | Template chooser settings |
| `.github/pull_request_template.md` | PR: what and why, the issue it closes, how to check |
| `scripts/sync-labels.sh` | Creates or updates the shared labels in a repository |

## Rules

- Don't add a `.github/ISSUE_TEMPLATE` folder to a single repository. One file there
  switches off all of these issue templates in that repository.
- Priority is the org's Priority issue field, set in the issue sidebar at triage.
  Status, size, estimate and iteration live in the project, not in labels.
- Change these files only by a reviewed pull request.
