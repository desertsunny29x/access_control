{% macro create_sensitive_role_with_masking_policy(database, schema, role, revoke_first=true) %}

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
    {%- endif %}

    grant create masking policy on schema {{ database }}.{{ schema }} to role securityadmin;

    create masking policy if not exists {{ database }}.{{ schema }}.masking_policy__text as (val text) returns text ->
        case
            when current_role() like 'TRANSFORMER_%' then val
            when is_role_in_session('{{ role }}') = true then val
            when val is null then val
        else '******'
        end;

    alter masking policy if exists {{ database }}.{{ schema }}.masking_policy__text set body ->
        case
            when current_role() like 'TRANSFORMER_%' then val
            when is_role_in_session('{{ role }}') = true then val
            when val is null then val
        else '******'
        end;

    create masking policy if not exists {{ database }}.{{ schema }}.masking_policy__date as (val date) returns date ->
        case
            when current_role() like 'TRANSFORMER_%' then val
            when is_role_in_session('{{ role }}') = true then val
            when val is null then val
        else '2999-01-01'
        end;

    alter masking policy if exists {{ database }}.{{ schema }}.masking_policy__date set body ->
        case
            when current_role() like 'TRANSFORMER_%' then val
            when is_role_in_session('{{ role }}') = true then val
            when val is null then val
        else '2999-01-01'
        end;

    grant apply on masking policy {{ database }}.{{ schema }}.masking_policy__text to role transformer_{{ environment }};
    grant apply on masking policy {{ database }}.{{ schema }}.masking_policy__date to role transformer_{{ environment }};

    {% endfor -%}

{%- endif -%}

{% endmacro %}