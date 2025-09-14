{% macro create_database_role(database, revoke_first=true) %}
  {% set role = (database~"_read")|lower -%}
  create role if not exists {{ role }};
  {%- if revoke_first -%}
    {{ revoke_roles_from_role(role) }}
  {%- endif %}
  grant usage on database {{ database }} to role {{ role }};
  grant usage on all schemas in database {{ database }} to role {{ role }};
  grant select on all tables in database {{ database }} to role {{ role }};
  grant select on future tables in database {{ database }} to role {{ role }};
  grant select on all dynamic tables in database {{ database }} to role {{ role }};
  grant select on future dynamic tables in database {{ database }} to role {{ role }};
  grant select on all views in database {{ database }} to role {{ role }};
  grant select on future views in database {{ database }} to role {{ role }};
  grant role analyst to role {{ role }};
  grant role {{ role }} to role sysadmin;
{% endmacro %}
