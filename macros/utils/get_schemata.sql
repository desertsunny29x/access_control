{% macro get_schemata(database) %}

    {% set get_schemata_query %}

    grant usage on database {{ database }} to role securityadmin;
    grant usage on all schemas in database {{ database }} to role securityadmin;
    grant usage, operate on warehouse transforming_{{ target.name }}_xs_wh to role securityadmin;
    use warehouse transforming_{{ target.name }}_xs_wh;
    select schema_name from {{ database }}.information_schema.schemata;

    {% endset %}

    {% set results = run_query(get_schemata_query) %}

    {% if execute %}
        
        {% set schemata = results.columns[0].values() %}

    {% else %}

        {% set schemata = [] %}

    {% endif %}

    {{ return(schemata) }}

{% endmacro %}