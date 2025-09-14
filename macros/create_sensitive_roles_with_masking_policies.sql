{% macro create_sensitive_roles_with_masking_policies(revoke_first=false) %}

    {{ log("Creating sensitive roles", info=true) }}

    {% set query %}
    
        -- ANALYTICS
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='analytics',
            role='sensitive_analytics_read',
            revoke_first=revoke_first
        )}}

        -- COBRAND AUDIT
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_cobrand_audit',
            role='sensitive_cobrand_audit_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='cobrand_audit',
            role='sensitive_cobrand_audit_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='cobrand',
            role='sensitive_cobrand_read',
            revoke_first=revoke_first
        )}}

        -- CUSTOMERS RT
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='customers_rt',
            role='sensitive_customers_rt_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_customers_rt',
            role='sensitive_customers_rt_read',
            revoke_first=revoke_first
        )}}
            
        -- EGOR
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_egor',
            role='sensitive_egor_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='aircraft_turns',
            role='sensitive_egor_read',
            revoke_first=revoke_first
        )}}

        -- LOYALTY
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_loyalty_rt',
            role='sensitive_loyalty_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='loyalty',
            role='sensitive_loyalty_read',
            revoke_first=revoke_first
        )}}

        -- MARKET REGIONS
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_market_regions',
            role='sensitive_market_regions_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='reference',
            role='sensitive_market_regions_read',
            revoke_first=revoke_first
        )}}

        -- NETTRACER
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_nettracer',
            role='sensitive_nettracer_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='missing_baggage',
            role='sensitive_nettracer_read',
            revoke_first=revoke_first
        )}}

        -- NOTIFICATION MANAGER
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_notification_manager',
            role='sensitive_notification_manager_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='notification_manager',
            role='sensitive_notification_manager_read',
            revoke_first=revoke_first
        )}}

        -- QUALTRICS
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_qualtrics',
            role='sensitive_qualtrics_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='surveys',
            role='sensitive_qualtrics_read',
            revoke_first=revoke_first
        )}}

        -- RESPONSYS
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_responsys',
            role='sensitive_responsys_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='email_marketing',
            role='sensitive_responsys_read',
            revoke_first=revoke_first
        )}}

        -- SABRE ACS BATCH
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_acs_batch',
            role='sensitive_sabre_acs_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='check_ins',
            role='sensitive_sabre_acs_read',
            revoke_first=revoke_first
        )}}

        -- SABRE ACS RT
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_acs_rt',
            role='sensitive_sabre_acs_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='check_ins_rt',
            role='sensitive_sabre_acs_read',
            revoke_first=revoke_first
        )}}

        -- SABRE CREWTRAC
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_crewtrac',
            role='sensitive_crew_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='crew',
            role='sensitive_crew_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='crew_rt',
            role='sensitive_crew_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='analytics',
            role='sensitive_crew_read',
            revoke_first=revoke_first
        )}}

        -- SABRE CSA
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_csa',
            role='sensitive_sabre_csa_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='vouchers',
            role='sensitive_sabre_csa_read',
            revoke_first=revoke_first
        )}}

        -- SABRE EPR
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_epr',
            role='sensitive_sabre_epr_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='employee_profile_record',
            role='sensitive_sabre_epr_read',
            revoke_first=revoke_first
        )}}

        -- SABRE FEE OVERRIDE
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_fee_override',
            role='sensitive_sabre_fees_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='fees',
            role='sensitive_sabre_fees_read',
            revoke_first=revoke_first
        )}}

        -- SABRE PNR BATCH & RT
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_pnr_batch',
            role='sensitive_sabre_pnr_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_pnr_rt',
            role='sensitive_sabre_pnr_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='bookings',
            role='sensitive_sabre_pnr_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='bookings_rt',
            role='sensitive_sabre_pnr_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='intermediary',
            role='sensitive_sabre_pnr_read',
            revoke_first=revoke_first
        )}}

        -- SABRE TCN
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_tcn',
            role='sensitive_sabre_tcn_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='ticket_audits',
            role='sensitive_sabre_tcn_read',
            revoke_first=revoke_first
        )}}

        -- SABRE TICKET BATCH & RT
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_ticket_batch',
            role='sensitive_sabre_ticket_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_ticket_rt',
            role='sensitive_sabre_ticket_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='tickets',
            role='sensitive_sabre_ticket_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='tickets_rt',
            role='sensitive_sabre_ticket_read',
            revoke_first=revoke_first
        )}}

        -- SABRE TRAVEL BANK
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_sabre_travel_bank',
            role='sensitive_sabre_travel_bank_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='sabre_travel_bank',
            role='sensitive_sabre_travel_bank_read',
            revoke_first=revoke_first
        )}}

        -- WEB ANALYTICS (OMNITURE)
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_web_analytics',
            role='sensitive_web_analytics_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='web_analytics',
            role='sensitive_web_analytics_read',
            revoke_first=revoke_first
        )}}

        -- WHEELCHAIR
        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='stg_wheelchair',
            role='sensitive_wheelchair_read',
            revoke_first=revoke_first
        )}}

        {{ create_sensitive_role_with_masking_policy(
            database='analytics',
            schema='wheelchair',
            role='sensitive_wheelchair_read',
            revoke_first=revoke_first
        )}}

    {% endset %}

    {{ log(query, info=true) }}

    {% do run_query(query) %}

{% endmacro %}
