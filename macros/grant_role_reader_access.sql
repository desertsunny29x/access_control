{% macro grant_role_reader_access(role_name, databases, revoke_first=false) %}
    {#-
        Grants a role reader-level access to multiple databases,
        including current and future objects.
        Params:
          role_name (string)  – the Snowflake role
          databases (list)    – list of databases
          revoke_first (bool) – revoke role relationships first if true
    -#}

    {% if revoke_first %}
        {{ revoke_roles_from_role(role_name) }}
    {% endif %}

    {%- for database in databases %}

        grant usage on database {{ database }} to role {{ role_name }};

        {% set schemata = get_schemata(database) -%}

        {%- for schema in schemata %}

            {# Exclude system/private/staging schemas #}
            {% if schema not in [
                'INFORMATION_SCHEMA',
                'PUBLIC'
              ]
              and not schema.endswith('_PRIVATE')
              and not schema.startswith('STG_')
            %}

                grant usage on schema {{ database }}.{{ schema }} to role {{ role_name }};

                -- Tables & Views
                grant select on all tables in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant select on future tables in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant select on all views in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant select on future views in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant select on all dynamic tables in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant select on future dynamic tables in schema {{ database }}.{{ schema }} to role {{ role_name }};

                -- Stages
                grant usage on all stages in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant usage on future stages in schema {{ database }}.{{ schema }} to role {{ role_name }};

                -- File formats
                grant usage on all file formats in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant usage on future file formats in schema {{ database }}.{{ schema }} to role {{ role_name }};

                -- Stored Procedures
                grant usage on all procedures in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant execute on all procedures in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant usage on future procedures in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant execute on future procedures in schema {{ database }}.{{ schema }} to role {{ role_name }};

                -- Tasks (monitor only for readers)
                grant monitor on all tasks in schema {{ database }}.{{ schema }} to role {{ role_name }};
                grant monitor on future tasks in schema {{ database }}.{{ schema }} to role {{ role_name }};

            {% endif %}

        {%- endfor %}

    {%- endfor %}

{% endmacro %}
