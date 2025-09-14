{% macro grant_reporter_access(databases, environment) %}

{%- for database in databases -%}

    {%- if environment != 'prd' -%}

        {%- set database = database ~ '_' ~ environment -%}

    {%- elif environment == 'prd_clone' -%}

        {%- set raw_database = 'raw_clone' -%}

    {%- endif %}

    grant usage on database {{ database }} to role reporter_{{ environment }};

    {% set schemata = get_schemata(database) -%}

    {%- for schema in schemata -%}

        {%- if schema not in ['BCUS_TRANSACTIONS', 'CREW_PAY', 'FLIGHTS_LEGACY', 'INFORMATICA_CUSTOMERS_RT', 'INFORMATION_SCHEMA', 'PUBLIC', 'SAFETY', 'TALENT_ACQUISITION', 'TRAX', 'PERFORMITIV', 'ANTIFRAUD'] and not schema.endswith('_PRIVATE') and not schema.startswith('STG_') %}

        grant usage on schema {{ database }}.{{ schema }} to role reporter_{{ environment }};
        grant select on all tables in schema {{ database }}.{{ schema }} to role reporter_{{ environment }};
        grant select on future tables in schema {{ database }}.{{ schema }} to role reporter_{{ environment }};
        grant select on all dynamic tables in schema {{ database }}.{{ schema }} to role reporter_{{ environment }};
        grant select on future dynamic tables in schema {{ database }}.{{ schema }} to role reporter_{{ environment }};
        grant select on all views in schema {{ database }}.{{ schema }} to role reporter_{{ environment }};
        grant select on future views in schema {{ database }}.{{ schema }} to role reporter_{{ environment }};
      
        {% endif -%}

    {%- endfor %}

{%- endfor -%}

{% endmacro %}
