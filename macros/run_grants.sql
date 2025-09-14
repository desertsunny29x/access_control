{% macro run_grants(revoke_first=false) %}

  {{ grant_core_roles(revoke_first=revoke_first) }}
  {{ create_raw_roles(revoke_first=revoke_first) }}
  {{ create_database_roles(revoke_first=revoke_first) }}
  {## {{ create_sensitive_roles(revoke_first=revoke_first) }} ##}
  {{ create_sensitive_roles_with_masking_policies(revoke_first=revoke_first) }}
  {{ create_byod_roles(revoke_first=revoke_first) }}
  {{ grant_functional_roles(revoke_first=revoke_first) }}

{% endmacro %}