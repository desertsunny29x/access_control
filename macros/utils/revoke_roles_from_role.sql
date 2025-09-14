{% macro revoke_roles_from_role(role) %}

    {%- set get_roles_query -%}
    grant usage, operate on warehouse transforming_{{ target.name }}_xs_wh to role securityadmin;
    use warehouse transforming_{{ target.name }}_xs_wh;
    show roles;
    select "name" from table(result_scan(last_query_id()));

    {%- endset -%}

    {%- set results = run_query(get_roles_query) -%}

    {%- set roles = results.columns[0].values() -%}

    {# Check if role already exists otherwise do nothing #}
    {%- if role.upper() in roles -%}

        {%- set get_grantees_query -%}
        grant usage, operate on warehouse transforming_{{ target.name }}_xs_wh to role securityadmin;
        use warehouse transforming_{{ target.name }}_xs_wh;
        show grants on role {{ role }};
        select "grantee_name" from table(result_scan(last_query_id()))
        where "privilege" = 'USAGE';

        {%- endset -%}

        {%- set results = run_query(get_grantees_query) -%}

        {# Return the first column #}
        {%- set grantees = results.columns[0].values() -%}

        {%- if grantees|length > 0 -%}

            {%- for grantee in grantees %}

            revoke role {{ role }} from role "{{ grantee }}";

            {%- endfor -%}

        {%- endif -%}

    {%- endif -%}

{% endmacro %}