{% macro create_sensitive_roles(revoke_first=false) %}

  {{ log("Creating sensitive roles", info=true) }}

  {% set query %}

-- COBRAND
{{ create_sensitive_role(
    database='analytics',
    schema='stg_cobrand_audit_private',
    role='sensitive_cobrand_audit_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='cobrand_audit_private',
    role='sensitive_cobrand_audit_read',
    revoke_first=revoke_first
)}}

-- EGOR
{{ create_sensitive_role(
    database='analytics',
    schema='stg_egor_private',
    role='sensitive_egor_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='aircraft_turns_private',
    role='sensitive_egor_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='training',
    role='sensitive_training_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='egor',
    schema='dbo_private',
    role='sensitive_egor_read',
    revoke_first=revoke_first
)}}

-- MARKET REGIONS
{{ create_sensitive_role(
    database='analytics',
    schema='stg_market_regions',
    role='sensitive_market_regions_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='market_regions',
    role='sensitive_market_regions_read',
    revoke_first=revoke_first
)}}


-- OMNITURE
{{ create_sensitive_role(
    database='analytics',
    schema='stg_web_analytics_private',
    role='sensitive_web_analytics_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='web_analytics_private',
    role='sensitive_web_analytics_read',
    revoke_first=revoke_first
)}}

-- SENSITIVE ROLE FOR SCHEMA S3C_CREDIT_PRIVATE
{{ create_sensitive_role(
    database='analytics',
    schema='s3c_credit_private',
    role='sensitive_s3c_credit_read',
    revoke_first=revoke_first
)}}

-- SABRE ACS BATCH & RT
{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_acs_batch_private',
    role='sensitive_sabre_acs_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_acs_rt_private',
    role='sensitive_sabre_acs_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='check_ins_private',
    role='sensitive_sabre_acs_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='check_ins_rt_private',
    role='sensitive_sabre_acs_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='ACS',
    schema='dbo_private',
    role='sensitive_sabre_acs_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='ACS',
    schema='scmvwedw_private',
    role='sensitive_sabre_acs_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='ACS',
    schema='scmcurrvwacsedw_private',
    role='sensitive_sabre_acs_read',
    revoke_first=revoke_first
)}}

-- VOUCHERS - SABRE CSA
{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_csa_private',
    role='sensitive_sabre_csa_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='vouchers_private',
    role='sensitive_sabre_csa_read',
    revoke_first=revoke_first
)}}


-- SABRE EPR
{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_epr_private',
    role='sensitive_sabre_epr_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='employee_profile_record_private',
    role='sensitive_sabre_epr_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='EPR',
    schema='dbo_private',
    role='sensitive_sabre_epr_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='EPR',
    schema='scmvwedw_private',
    role='sensitive_sabre_epr_read',
    revoke_first=revoke_first
)}}

-- SABRE FEES
{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_fee_override',
    role='sensitive_sabre_fees_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='fees_private',
    role='sensitive_sabre_fees_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='feecollect',
    schema='dbo_private',
    role='sensitive_sabre_fees_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='feecollect',
    schema='scmvwedw_private',
    role='sensitive_sabre_fees_read',
    revoke_first=revoke_first
)}}

-- SABRE PNR BATCH & RT
{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_pnr_batch_private',
    role='sensitive_sabre_pnr_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='bookings_private',
    role='sensitive_sabre_pnr_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='dwjetblue2',
    schema='dbo_private',
    role='sensitive_sabre_pnr_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='dwjetblue2',
    schema='dw_private',
    role='sensitive_sabre_pnr_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='bookings_rt_private',
    role='sensitive_sabre_pnr_read',
    revoke_first=revoke_first
)}}


{{ create_sensitive_role(
    database='dwjetblue2',
    schema='dbo_private',
    role='sensitive_sabre_pnr_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='dwjetblue2',
    schema='dw_private',
    role='sensitive_sabre_pnr_read',
    revoke_first=revoke_first
)}}

-- SABRE TCN
{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_tcn_private',
    role='sensitive_sabre_tcn_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='ticket_audits_private',
    role='sensitive_sabre_tcn_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='tktexchangeservice',
    schema='dbo_private',
    role='sensitive_sabre_tcn_read',
    revoke_first=revoke_first
)}}

-- SABRE TICKET BATCH & RT
{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_ticket_batch_private',
    role='sensitive_sabre_ticket_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_ticket_rt_private',
    role='sensitive_sabre_ticket_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='tickets_private',
    role='sensitive_sabre_ticket_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='tickets_rt_private',
    role='sensitive_sabre_ticket_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='dwjetblue2',
    schema='dbo_private',
    role='sensitive_sabre_ticket_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='dwjetblue2',
    schema='dw_private',
    role='sensitive_sabre_ticket_read',
    revoke_first=revoke_first
)}}

-- TRAVELBANK
{{ create_sensitive_role(
    database='analytics',
    schema='stg_sabre_travel_bank_private',
    role='sensitive_sabre_travel_bank_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='sabre_travel_bank_private',
    role='sensitive_sabre_travel_bank_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='travelbank',
    schema='dbo_private',
    role='sensitive_sabre_travel_bank_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='travelbank',
    schema='ScmVwEdw_private',
    role='sensitive_sabre_travel_bank_read',
    revoke_first=revoke_first
)}}

-- WHEELCHAIR
{{ create_sensitive_role(
    database='analytics',
    schema='stg_wheelchair_private',
    role='sensitive_wheelchair_read',
    revoke_first=revoke_first
)}}

{{ create_sensitive_role(
    database='analytics',
    schema='wheelchair_private',
    role='sensitive_wheelchair_read',
    revoke_first=revoke_first
)}}

  {% endset %}

  {{ log(query, info=true) }}

  {% do run_query(query) %}

{% endmacro %}
