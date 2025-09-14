{% macro grant_core_roles(environments=['dev', 'qa', 'prd'], revoke_first=false) %}

  {{ log("Granting core roles", info=true) }}

  {%- set query -%}

-- ===========================================================================
-- ===========================================================================
--                                CORE ROLES

{% for environment in environments %}

{%- if environment != 'prd' -%}
  {%- set raw_database = 'raw_' ~ environment -%}
{%- elif environment == 'prd_clone' -%}
  {%- set raw_database = 'raw_clone' -%}
{%- else -%}
  {%- set raw_database = 'raw' -%}
{%- endif -%}

-- LOADER
create role if not exists loader_{{ environment }};
{% if revoke_first %}
{{ revoke_roles_from_role('loader_' ~ environment) }}
{% endif %}
-- warehouses
grant usage, operate on warehouse loading_{{ environment }}_xs_wh to role loader_{{ environment }};
grant usage, operate on warehouse loading_{{ environment }}_s_wh to role loader_{{ environment }};
grant usage, operate on warehouse loading_{{ environment }}_m_wh to role loader_{{ environment }};
grant usage, operate on warehouse loading_{{ environment }}_l_wh to role loader_{{ environment }};
-- databases
grant usage, create schema on database {{ raw_database }} to role loader_{{ environment }};
grant usage on all schemas in database {{ raw_database }} to role loader_{{ environment }};
-- tasks
grant execute task on account to role loader_{{ environment }};
-- integrations
grant usage on integration azure_int to role loader_{{ environment }};
-- members
grant role loader_{{ environment }} to role sysadmin;


-- TRANSFORMER
create role if not exists transformer_{{ environment }};
{% if revoke_first %}
{{ revoke_roles_from_role('transformer_' ~ environment) }}
{% endif %}
-- warehouses
  grant usage, operate on warehouse transforming_{{ environment }}_xs_wh to role transformer_{{ environment }};
  grant usage, operate on warehouse transforming_{{ environment }}_s_wh to role transformer_{{ environment }};
  grant usage, operate on warehouse transforming_{{ environment }}_m_wh to role transformer_{{ environment }};
  grant usage, operate on warehouse transforming_{{ environment }}_l_wh to role transformer_{{ environment }};
-- databases, schema
-- read
grant imported privileges on database snowflake to role transformer_{{ environment }};
grant usage on database {{ raw_database }} to role transformer_{{ environment }};
grant usage on all schemas in database {{ raw_database }} to role transformer_{{ environment }};
grant usage on future schemas in database {{ raw_database }} to role transformer_{{ environment }};
grant select on all tables in database {{ raw_database }} to role transformer_{{ environment }};
grant select on future tables in database {{ raw_database }} to role transformer_{{ environment }};
grant select on all views in database {{ raw_database }} to role transformer_{{ environment }};
grant select on future views in database {{ raw_database }} to role transformer_{{ environment }};
-- BYOD
grant usage on database BYOD to role transformer_{{ environment }};
grant usage on all schemas in database BYOD to role transformer_{{ environment }};
grant usage on future schemas in database BYOD to role transformer_{{ environment }};
grant select on all tables in database BYOD to role transformer_{{ environment }};
grant select on future tables in database BYOD to role transformer_{{ environment }};
grant select on all views in database BYOD to role transformer_{{ environment }};
grant select on future views in database BYOD to role transformer_{{ environment }};
grant usage, create schema on database BYOD to role transformer_{{ environment }};
-- write
grant usage, create schema on database analytics{{'_' ~ environment if environment != 'prd' else ''}} to role transformer_{{ environment }};
grant usage, create schema on database Egor{{'_' ~ environment if environment != 'prd' else ''}} to role transformer_{{ environment }};
grant usage, create schema on database FlightAnalytics{{'_' ~ environment if environment != 'prd' else ''}} to role transformer_{{ environment }};
-- members
grant role transformer_{{ environment }} to role sysadmin;
grant role transformer_{{ environment }} to user dbt_cloud_{{ environment }};

-- FLIGHT IN TROUBLE
create role if not exists flight_in_trouble_{{ environment }};
{% if revoke_first %}
{{ revoke_roles_from_role('flight_in_trouble_' ~ environment) }}
{% endif %}
grant role loader_{{ environment }} to role flight_in_trouble_{{ environment }};
grant role transformer_{{ environment }} to role flight_in_trouble_{{ environment }};
grant role flight_in_trouble_{{ environment }} to user dbt_cloud_{{ environment }};

-- REPORTER
create role if not exists reporter_{{ environment }};
{% if revoke_first %}
{{ revoke_roles_from_role('reporter_' ~ environment) }}
{% endif %}
-- warehouses
grant usage, operate on warehouse reporting_{{ environment }}_xs_wh to role reporter_{{ environment }};
grant usage, operate on warehouse reporting_{{ environment }}_s_wh to role reporter_{{ environment }};
-- databases
{{
    grant_reporter_access(
        [
            'analytics'
        ],
        environment
    )
}}
{% if environment == "dev" %}{{ grant_reporter_access(['raw'], environment) }}{% endif %}

-- BI
create role if not exists bi_{{ environment }};
{%- if revoke_first -%}
{{ revoke_roles_from_role('bi_' ~ environment) }}
{%- endif -%}
-- warehouses
-- grant usage, operate on warehouse bi_{{ environment }}_xs_wh to role bi_{{ environment }};
-- grant usage, operate on warehouse bi_{{ environment }}_s_wh to role bi_{{ environment }};
-- grant usage, operate on warehouse bi_{{ environment }}_m_wh to role bi_{{ environment }};
-- grant usage, operate on warehouse bi_{{ environment }}_l_wh to role bi_{{ environment }};
-- members
grant role bi_{{ environment }} to role sysadmin;
grant role bi_{{ environment }} to user spotfire_{{ environment }};
grant role reporter_{{ environment }} to role bi_{{ environment }};
grant role byod_itbi to role bi_{{ environment }};

{% endfor %}

  {% endset %}

  {{ log(query, info=true) }}

  {% do run_query(query) %}

{% endmacro %}
