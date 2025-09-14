{% macro create_byod_roles(revoke_first=false) %}

  {{ log("Creating BYOD roles", info=true) }}

  {% set query %}

  {{ create_byod_role(schema='airport_standards', role='byod_airport_standards', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='aircraft_data_programs', role='byod_aircraft_data_programs', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='airlineoptimization', role='byod_airlineoptimization', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='areq', role='byod_areq', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='bcg_gamma', role='byod_bcg_gamma', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='blue_alliances', role='byod_blue_alliances', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='blueloyalty', role='byod_blueloyalty', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='bluemktanalytics', role='byod_bluemktanalytics', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='bluereliabilityengineering', role='byod_bluereliabilityengineering', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='bluestrategicmxplan', role='byod_bluestrategicmxplan', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='bluerevforecasting', role='byod_bluerevforecasting', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='bluerm', role='byod_bluerm', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='bluetax', role='byod_bluetax', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='cbacrewdata', role='byod_cbacrewdata', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='cex_analytics', role='byod_cex_analytics', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='cofstandards', role='byod_cofstandards', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='corporate_audit', role='byod_corporate_audit', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='crew_analytics', role='byod_crewanalytics', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='crewstaffingdl', role='byod_crewstaffingdl', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='csplanning', role='byod_csplanning', revoke_first=revoke_first) }} 
  {{ create_byod_role(schema='customer_support', role='byod_customer_support', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='customer_insights', role='byod_customer_insights', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='digitalcommerce', role='byod_digitalcommerce', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='enterprise_architecture', role='byod_enterprise_architecture', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='enterprise_planning', role='byod_enterprise_planning', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='eeyore_mg', role='byod_eeyore_mg', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='fbi', role='byod_fbi', revoke_first=revoke_first) }}  
  {{ create_byod_role(schema='finance', role='byod_finance', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='fleetengineering', role='byod_fleetengineering', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='flight_ops_team', role='byod_flight_ops_team', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='flight_schedules', role='byod_flight_schedules', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='flight_schedules_dev', role='byod_flight_schedules_dev', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='fpa', role='byod_fpa', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='fuelalert', role='byod_fuelalert', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='interiors_engineering', role='byod_interiors_engineering', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='itbi', role='byod_itbi', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='itdataops', role='byod_itdataops', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='itdatascience', role='byod_itdatascience', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='itdigitaloperations', role='byod_itdigitaloperations', revoke_first=revoke_first) }} 
  {{ create_byod_role(schema='itloyaltysolutions', role='byod_itloyaltysolutions', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='itqa', role='byod_itqa', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='it_data_engineering', role='byod_it_data_engineering', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='it_data_engineering_qa', role='byod_it_data_engineering_qa', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='it_security_crew', role='byod_it_security_crew', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='it_self_service', role='byod_it_self_service', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='ixcoreteam', role='byod_ixcoreteam', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='jbscoaches', role='byod_jbscoaches', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='jbu_planning', role='byod_jbu_planning', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='jbu_ame', role='byod_jbu_ame', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='jetboardsupport', role='byod_jetboardsupport', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='jfk_mx', role='byod_jfk_mx', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='mckinsey_cx_nps', role='byod_mckinsey_cx_nps', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='navigation_database', role='byod_navigation_database', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='opa', role='byod_opa', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='osda', role='byod_osda', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='operations_engineering', role='byod_operations_engineering', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='payroll', role='byod_payroll', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='pdi', role='byod_pdi', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='revenue_forecast_itds', role='byod_revenue_forecast_itds', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='route_planning', role='byod_route_planning', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='rpa', role='byod_rpa', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='safety_analytics', role='byod_safety_analytics', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='safety_bi', role='byod_safety_bi', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='sales', role='byod_sales', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='soc_programs', role='byod_soc_programs', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='strategic_sourcing', role='byod_strategic_sourcing', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='sscstrategicplanning', role='byod_sscstrategicplanning', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='systemsengineering', role='byod_systemsengineering', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='trackddb', role='byod_trackddb', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='technology_finance_and_portfolio_management', role='byod_technology_finance_and_portfolio_management', revoke_first=revoke_first) }}
  {{ create_byod_role(schema='wpa', role='byod_wpa', revoke_first=revoke_first) }}
  {% endset %}

  {{ log(query, info=true) }}

  {% do run_query(query) %}

{% endmacro %}
