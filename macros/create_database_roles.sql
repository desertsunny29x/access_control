{% macro create_database_roles(revoke_first=false) %}
  {%- set databases = ["analytics", "analytics_qa"] -%}
  {%- for database in databases -%}      
    {{ log(("Creating reader role for the database "~database)|upper, info=true) }}
    {%- set query -%}
      {{ create_database_role(database, revoke_first=revoke_first) }}
    {%- endset -%}
    {{ log(query, info=true) }}
    {%- do run_query(query) -%}
    {%- set schemata = get_schemata(database) -%}
    {%- for schema in schemata -%}
      {%- if schema not in ['BCUS_TRANSACTIONS', 'CREW_PAY', 'FLIGHTS_LEGACY', 'INFORMATICA_CUSTOMERS_RT', 'INFORMATION_SCHEMA', 'PUBLIC', 'SAFETY', 'TALENT_ACQUISITION', 'TRAX', 'PERFORMITIV', 'ANTIFRAUD'] and not schema.endswith('_PRIVATE') and not schema.startswith('STG_') %}
        {{ log(("Creating reader role for the schema "~database~"."~schema)|upper, info=true) }}
        {%- set query -%}
          {{ create_schema_role(database, schema, revoke_first=revoke_first) }}
        {%- endset -%}
        {{ log(query, info=true) }}
        {%- do run_query(query) -%}
      {%- endif -%}
    {%- endfor -%}
  {%- endfor -%}
{% endmacro %}
