{% macro create_sensitive_role(database, schema, role, revoke_first=true) %}

{%- set schemata = get_schemata(database) -%}

{%- if schema.upper() in schemata -%}

    {%- set environments = ['qa', 'prd'] -%}

    {%- for environment in environments -%}

    {%- set database = database ~ '_qa' if environment == 'qa' else database -%}
    {%- set role = role ~ '_qa' if environment == 'qa' else role %}

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
    grant role {{ role }} to role sysadmin;
    grant role {{ role }} to role bi_{{ environment }};
    {%- if environment == 'qa' -%}
    grant role {{ role }} to role uat_testing_sensitive;
    {%- endif -%}

    {% endfor -%}

{%- endif -%}

{% endmacro %}