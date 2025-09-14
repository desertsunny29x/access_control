{% macro create_byod_role(schema, role, revoke_first=true) %}

-- writer
create role if not exists {{ role }};

{%- if revoke_first -%}
{{ revoke_roles_from_role(role) }}
{%- endif %}

grant usage on database byod to role {{ role }};
grant all on schema byod.{{ schema }} to role {{ role }};
grant role {{ role }} to role sysadmin;

-- reader
{% set role = role ~ '_read' %}
create role if not exists {{ role }};

{%- if revoke_first -%}
{{ revoke_roles_from_role(role) }}
{%- endif %}

create role if not exists analyst;

grant usage on database byod to role {{ role }};
grant usage on schema byod.{{ schema }} to role {{ role }};
grant select on all tables in schema byod.{{ schema }} to role {{ role }};
grant select on future tables in schema byod.{{ schema }} to role {{ role }};
grant select on all views in schema byod.{{ schema }} to role {{ role }};
grant select on future views in schema byod.{{ schema }} to role {{ role }};
grant role analyst to role {{ role }};
grant role {{ role }} to role sysadmin;
grant role {{ role }} to role bi_prd;

{% endmacro %}
