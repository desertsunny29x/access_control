{% macro create_raw_role(schema, role, revoke_first=true) %}

create role if not exists {{ role }};

{%- if revoke_first -%}
{{ revoke_roles_from_role(role) }}
{%- endif %}

grant usage on database raw to role {{ role }};
grant usage on schema raw.{{ schema }} to role {{ role }};
grant select on all tables in schema raw.{{ schema }} to role {{ role }};
grant select on future tables in schema raw.{{ schema }} to role {{ role }};
grant role {{ role }} to role sysadmin;
grant role {{ role }} to role bi_prd;

{% endmacro %}