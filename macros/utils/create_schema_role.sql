{% macro create_schema_role(database, schema, revoke_first=true) %}
  {% set role = (database~"_"~schema~"_read")|lower -%}
  create role if not exists {{ role }};
  {%- if revoke_first -%}
    {{ revoke_roles_from_role(role) }}
  {%- endif %}
  grant usage on database {{ database }} to role {{ role }};
  grant usage on schema {{ database }}.{{ schema }} to role {{ role }};
  grant select on all tables in schema {{ database }}.{{ schema }} to role {{ role }};
  grant select on future tables in schema {{ database }}.{{ schema }} to role {{ role }};
  grant select on all views in schema {{ database }}.{{ schema }} to role {{ role }};
  grant select on future views in schema {{ database }}.{{ schema }} to role {{ role }};
  grant role analyst to role {{ role }};
  grant role {{ role }} to role sysadmin;
{% endmacro %}