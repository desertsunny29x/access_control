# Access Control DBT Project

[![PR Validation](https://github.com/desertsunny29x/access_control/actions/workflows/pr-validation.yml/badge.svg)](https://github.com/desertsunny29x/access_control/actions/workflows/pr-validation.yml)

This repository contains a dbt project focused on **Access Control**. It provides reusable macros and models to manage, validate, and enforce access control logic within your data platform.

## Macros
Here are the main macros available in the `macros` folder (excluding any in `utils`):

| Macro | What it does |
|-------|---------------|
| `create_byod_roles.sql` | Creates roles for BYOD (Bring Your Own Data) access. |
| `create_database_roles.sql` | Sets up database-level roles for access control. |
| `create_raw_roles.sql` | Defines roles for raw data sources. |
| `create_sensitive_roles.sql` | Manages sensitive data access roles. |
| `create_sensitive_roles_with_masking_policies.sql` | Manages sensitive data roles with masking policies. |
| `grant_core_roles.sql` | Reusable dbt macro for access control. |
| `grant_functional_roles.sql` | Reusable dbt macro for access control. |
| `run_grants.sql` | Reusable dbt macro for access control. |

## Latest Build & Changes
- 📅 Last updated: **2025-09-15**
- 📝 Latest merged PR: **Access Control - Run grants is failing** (PR [#19](https://github.com/desertsunny29x/access_control/pull/19)) by @desertsunny29x
- 📖 `CHANGELOG.md` is auto-updated whenever a PR is merged, keeping track of changes per day.
- 🛠️ dbt macros are designed to be reusable and efficient, reducing boilerplate in your models.

## How to Use
1. Review the macros above to understand available functionality in simple terms.
2. Import macros in your dbt models using `{{ macro_name() }}` syntax.
3. Check the `CHANGELOG.md` file for the latest merged PRs and updates.
