{% macro create_raw_roles(revoke_first=false) %}

  {{ log("Creating RAW roles", info=true) }}

  {% set query %}

-- ===========================================================================
-- ===========================================================================
--                          RAW DATA SOURCE ROLES

{{ create_raw_role(schema='accelya_mis', role='raw_accelya_mis_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='aerodata', role='raw_aerodata_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='aircom', role='raw_aircom_read', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='arc', role='raw_arc_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='aqd', role='raw_aqd_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='asapp', role='raw_asapp_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='astute', role='raw_astute_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='atpco', role='raw_atpco_read', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='avaya_cms', role='raw_avaya_cms_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='baggage', role='raw_baggage_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='barclays', role='raw_barclays_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='bill_of_rights', role='raw_bill_of_rights_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='cardinal_commerce', role='raw_cardinal_commerce_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='ccure', role='raw_ccure_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='collins_aerospace', role='raw_collins_aerospace_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='comarch', role='raw_comarch_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='comarch_bi_prod_dbo', role='raw_comarch_bi_prod_dbo_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='comarch_bi_prod_rep', role='raw_comarch_bi_prod_rep_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='comarch_dbo', role='raw_comarch_dbo_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='comply365', role='raw_comply365', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='comply365_feed', role='raw_comply365_feed', revoke_first=revoke_first) }}
{{ create_raw_role(schema='concur', role='raw_concur_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='cobrand_audit', role='raw_cobrand_audit_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='cobrand_audit_legacy', role='raw_cobrand_audit_legacy_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='crew', role='raw_crew_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='crewqual', role='raw_crewqual_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='crew_services', role='raw_crew_services_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='credit_card_sales', role='raw_credit_card_sales_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='customers_rt', role='raw_customers_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='customer_support', role='raw_customer_support_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='cybersecurity_roadmaps_cybersecurity_roadmap_interface_apphsv09fxpfva1r8', role='raw_cybersecurity_roadmaps_cybersecurity_roadmap_interface_apphsv09fxpfva1r8_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='datacamp', role='raw_datacamp_read', revoke_first=revoke_first) }} 
{{ create_raw_role(schema='dbt', role='raw_dbt_read', revoke_first=revoke_first) }} 
{{ create_raw_role(schema='egor', role='raw_egor_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='egor_aps', role='raw_egor_aps_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='federal_aviation', role='raw_federal_aviation_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='flight_link', role='raw_flight_link_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='flightkeys', role='raw_flightkeys_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='flight_oal_rt', role='raw_flight_oal_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='flight_rt', role='raw_flight_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='flight_rt_bpmart', role='raw_flight_rt_bpmart_read', revoke_first=revoke_first) }} 
{{ create_raw_role(schema='flyr', role='raw_flyr_read', revoke_first=revoke_first) }} 
{{ create_raw_role(schema='ifsa_rt', role='raw_ifsa_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='infare', role='raw_infare_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='inflight_survey', role='raw_inflight_survey_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='inflight_entertainment', role='raw_inflight_entertainment_read', revoke_first=revoke_first) }} 
{{ create_raw_role(schema='informatica_customers_rt', role='raw_informatica_customers_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='invoiceworks', role='raw_invoiceworks_read', revoke_first=revoke_first) }} 
{{ create_raw_role(schema='irops_reaccom', role='raw_irops_reaccom_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='itdatascience', role='raw_itdatascience_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='it_leadership_roadmaps_leadership_roadmaps_appapc9dpbizpphch', role='raw_it_leadership_roadmaps_leadership_roadmaps_appapc9dpbizpphch_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='jbu', role='raw_jbu_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='jira', role='raw_jira_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='kiosk', role='raw_kiosk_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='reference_legacy', role='raw_reference_legacy_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='lift', role='raw_lift_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='loyalty', role='raw_loyalty_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='loyalty_rt', role='raw_loyalty_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='metar', role='raw_metar_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='mparticle', role='raw_mparticle_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='notam', role='raw_notam_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='notification_manager', role='raw_notification_manager_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='okta', role='raw_okta_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='omniture', role='raw_omniture_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='planitas', role='raw_planitas_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='rainmaker', role='raw_rainmaker_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='reference', role='raw_reference_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='reference_archive', role='raw_reference_archive_read', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='reference_clone', role='raw_reference_clone_read', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='responsys', role='raw_responsys_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_accb', role='raw_sabre_accb_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_acs_rt', role='raw_sabre_acs_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_acs_batch', role='raw_sabre_acs_batch_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_csa', role='raw_sabre_csa_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_emd_batch', role='raw_sabre_emd_batch_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_epr', role='raw_sabre_epr_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_flight_plan_manager', role='raw_sabre_flight_plan_manager_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_excess_baggage', role='raw_sabre_excess_baggage_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_fee_collect', role='raw_sabre_fee_collect_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_fee_override', role='raw_sabre_fee_override_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_intelligence_exchange', role='raw_sabre_intelligence_exchange_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_ind', role='raw_sabre_ind_read', revoke_first=revoke_first) }}   
{{ create_raw_role(schema='sabre_ind_rt', role='raw_sabre_ind_rt_read', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='sabre_pnr_batch', role='raw_sabre_pnr_batch_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_pnr_rt', role='raw_sabre_pnr_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_queue', role='raw_sabre_queue_read', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='sabre_revenue_optimizer', role='raw_sabre_revenue_optimizer_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_revenue_integrity', role='raw_sabre_revenue_integrity_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_ssi', role='raw_sabre_ssi_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_ticket_batch', role='raw_sabre_ticket_batch_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_ticket_rt', role='raw_sabre_ticket_rt_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_travel_bank', role='raw_travelbank_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sabre_vcr_flown', role='raw_sabre_vcr_flown_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='safety', role='raw_safety_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='salesforce_poc', role='raw_salesforce_poc_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='salesforce', role='raw_salesforce_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sap_bpc', role='raw_sap_bpc_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sap_reports', role='raw_sap_reports_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='sap_s4_hana', role='raw_sap_s4_hana_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='security_emails', role='raw_security_emails_read', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='servicenow', role='raw_servicenow_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='solution_tek', role='raw_solution_tek_read', revoke_first=revoke_first) }} 
{{ create_raw_role(schema='success_factors', role='raw_success_factors_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='surveys', role='raw_surveys_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='system_operations', role='raw_system_operations_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='task_audit', role='raw_task_audit_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='transtats', role='raw_transtats_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='trax', role='raw_trax_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='vendor_spend', role='raw_vendor_spend_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='viasat', role='raw_viasat_read', revoke_first=revoke_first) }}
{{ create_raw_role(schema='web_logs_rt', role='raw_web_logs_rt_read', revoke_first=revoke_first) }}  
{{ create_raw_role(schema='wheelchair', role='raw_wheelchair_read', revoke_first=revoke_first) }}

-- SNOWFLAKE
create role if not exists raw_snowflake_read;
-- databases, schemas
grant imported privileges on database snowflake to role raw_snowflake_read;
-- members
grant role raw_snowflake_read to role bi_prd;

  {% endset %}

  {{ log(query, info=true) }}

  {% do run_query(query) %}

{% endmacro %}
