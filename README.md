# Access Control DBT Project

This repository contains a dbt project focused on **Access Control**. It provides reusable macros and models to manage, validate, and enforce access control logic within your data platform.

## Macros
The following macros are available in the `macros` folder (excluding any in `utils`):

| Macro | Description |
|-------|-------------|
| `create_byod_roles.sql` | {% macro create_byod_roles(revoke_first=false) %} |
| `create_database_roles.sql` | {% macro create_database_roles(revoke_first=false) %} |
| `create_raw_roles.sql` | =========================================================================== |
| `create_sensitive_roles.sql` | COBRAND |
| `create_sensitive_roles_with_masking_policies.sql` | ANALYTICS |
| `grant_core_roles.sql` | =========================================================================== |
| `grant_functional_roles.sql` | =========================================================================== |
| `run_grants.sql` | {% macro run_grants(revoke_first=false) %} |

## Latest Build & Changes
- 📅 Last updated: **2025-09-14**
- 📝 Latest merged PR: **Access Control - Update run_grants** (PR [#15](https://github.com/desertsunny29x/access_control/pull/15)) by @desertsunny29x
- ✅ CI/CD ensures PRs are validated before merging (branch name, title, justification, labels, assignees, reviewers).
- 📖 `CHANGELOG.md` is auto-updated whenever a PR is merged, keeping track of changes per day.
- 🛠️ dbt macros here are designed to be reusable and efficient, reducing boilerplate in your models.

## How to Use
1. Review macros above to understand available functionality.
2. Import macros in your dbt models using `{{ macro_name() }}` syntax.
3. Check the `CHANGELOG.md` file for the latest merged PRs and updates.
