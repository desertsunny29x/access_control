{% macro grant_functional_roles(revoke_first=false) %}

  {{ log("Granting functional roles", info=true) }}

  {% set query %}

-- ===========================================================================
-- ===========================================================================
--                          FUNCTIONAL ROLES

-- LOADER
grant role loader_dev to role loader_prd;
grant role loader_qa to role loader_prd;
grant usage on database byod to role loader_dev;
grant usage on database byod to role loader_qa;
grant usage on database byod to role loader_prd;
grant usage on schema byod.bluerm to role loader_dev;
grant usage on schema byod.bluerm to role loader_qa;
grant usage on schema byod.bluerm to role loader_prd;
grant select on table byod.bluerm.diio_flight_nm to role loader_dev;
grant select on table byod.bluerm.diio_flight_nm to role loader_qa;
grant select on table byod.bluerm.diio_flight_nm to role loader_prd;

-- FIVETRAN
create user if not exists fivetran;
grant role loader_prd to user fivetran;
alter user fivetran set default_role = loader_prd;
alter user fivetran set default_warehouse = 'LOADING_PRD_XS_WH';

-- DEVELOPER
create role if not exists developer;
{% if revoke_first %}
{{ revoke_roles_from_role('developer') }}
{% endif %}
grant role loader_dev to role developer;
grant role loader_qa to role developer;
grant role transformer_dev to role developer;
grant role reporter_dev to role developer;
grant role reporter_qa to role developer;
grant role reporter_prd to role developer;
-- members
grant role developer to role sysadmin;
grant role developer to role FINANCEBUSINESSINTELLIGENCE;
grant role developer to role ITDATAENGINEERINGCREW;
grant role developer to role ITANALYTICSENGINEERINGCREW;
grant role developer to role ITBUSINESSINTELLIGENCECREW;
grant role developer to role "ITCEXCMSYSTEMS_SG";
grant role developer to role ITDATAOPSCREW;
grant role developer to role ITDATASCIENCECREW;
grant role developer to role ITREFERENCEDOMAIN;
grant role developer to role ITLOYALTYPARTNERSHIPS;
grant role developer to role "IT PRODUCT ENGINEERING DOMAINS";
grant role developer to role TCSBUSINESSINTELLIGENCE;
grant role developer to role TCSDATAENGINEERING;
grant role developer to role TCSDATAOPS;
grant role developer to role "TCS PRODUCT ENGINEERING DOMAINS";
grant role developer to role VISUALBI;
grant role developer to role "ITDATAQA-NONPROD";
grant role developer to role "ITDATAQA-PROD";
grant role developer to role "IT ENTERPRISE ARCHITECTURE BP";

-- AZURE DATA BOX
create role if not exists analyst_azure_data_box;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_azure_data_box') }}
{% endif %}
grant usage on database azuredatabox to role analyst_azure_data_box;
grant usage on all schemas in database azuredatabox to role analyst_azure_data_box;
grant select on all tables in database azuredatabox to role analyst_azure_data_box;
grant select on future tables in database azuredatabox to role analyst_azure_data_box;
grant select on all views in database azuredatabox to role analyst_azure_data_box;
grant select on future views in database azuredatabox to role analyst_azure_data_box;

-- ANALYST
create role if not exists analyst;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst') }}
{% endif %}
grant role reporter_prd to role analyst;
grant role analyst to role sysadmin;
-- grant role analyst to role "IT LOYALTY TEAM";
grant role analyst to role "ACCOUNTPAYABLE_MONDIFY";
grant role analyst to role "AIRPORT DIRECTORS";
grant role analyst to role "AIRPORT TECH SUPPORT";
grant role analyst to role "AIRPORT TECHNOLOGY";
grant role analyst to role "AIRPORTS STRUCTURAL PROGRAMS-MODIFY";
grant role analyst to role "AIRPORTSERVICES";
grant role analyst to role "AIRPORTSSAFETYTEAM";
grant role analyst to role "AP CREW";
grant role analyst to role "APS-ACTIVE-USERS";
grant role analyst to role "BCG GAMMA RM";
grant role analyst to role BLUEEMAILMKTDEV;
grant role analyst to role "BLUE DIGITAL & CUSTOMER PRODUCTS";
grant role analyst to role "BLUE MARKETING ALL";
grant role analyst to role "BLUE OPS ENGINEERING";
grant role analyst to role "BLUE TAX";
grant role analyst to role "BLUEFP&A";
grant role analyst to role "BLUEHMVPLNANALYSIS";
grant role analyst to role "BLUEMX BOS SUPS";
grant role analyst to role "BLUEMX FLL";
grant role analyst to role "BLUETLB_DR";
grant role analyst to role "BOSAOMANAGERS";
grant role analyst to role "BYOD_OPA";
grant role analyst to role "CBS AIRPORTS LEADERSHIP";
grant role analyst to role "CCAAS_CONNECT";
grant role analyst to role "CENTRALIZEDPUBS INTERNAL";
grant role analyst to role "CEX ANALYTICS";
grant role analyst to role "CEX&CMTECHTEAM";
grant role analyst to role "CHIEFPILOTS";
grant role analyst to role "COMPENSATION TEAM";
grant role analyst to role "CONSUMER PROMOTIONS";
grant role analyst to role "CORP SECURITY PPM2000";
grant role analyst to role "CORPORATE AUDIT DATA WAREHOUSE READONLY";
grant role analyst to role "CORPORATE AUDIT";
grant role analyst to role "CORPORATETA";
grant role analyst to role "CREWPLANNINGDL";
grant role analyst to role "CS PLANNING & PRODUCTS";
grant role analyst to role "CSPRODUCTS";
grant role analyst to role "CUNLEADERSHIP";
grant role analyst to role "CUSTOMER CONTACT CENTER";
grant role analyst to role "CUSTOMER EXPERIENCE PROGRAMS";
grant role analyst to role "CUSTOMER PRODUCTS ENGINEERING-CMS";
grant role analyst to role "CUSTOMER SUPPORT BPO - WH";
grant role analyst to role "CUSTOMER SUPPORT SUPES SSC";
grant role analyst to role "CUSTOMER360";
grant role analyst to role "CUSTOMERACCESSIBILITY";
grant role analyst to role "CUSTOMERANALYTICS-SNOWFLAKE";
grant role analyst to role "CUSTOMERPRODUCTSENGINEERING-ADM";
grant role analyst to role "DIGITAL AIO TECHNOLOGY PRODUCTS";
grant role analyst to role "DIGB DEVELOPERS";
grant role analyst to role "DIGITAL EXPERIENCE MOBILE";
grant role analyst to role "DIGITAL EXPERIENCE NOTIFICATIONS";
grant role analyst to role "DIGITAL EXPERIENCE WEB";
grant role analyst to role "DIGITAL EXPERIENCE";
grant role analyst to role "DIGITALANALYTICS-SNOWFLAKE";
grant role analyst to role "DOSMS";
grant role analyst to role "EGOR TEAM";
grant role analyst to role "FINANCIAL SYSTEMS CONTROLLER GROUP";
grant role analyst to role "FLEET CAPTAINS" ;
grant role analyst to role "FLIGHT OPS LEADERSHIP";
grant role analyst to role "FLIGHT OPS LOGS";
grant role analyst to role "FLIGHT OPS TEAM";
grant role analyst to role "FRMSSUPPORT";
grant role analyst to role "FUEL OPTIMIZATION TEAM";
-- grant role analyst to role "Foundations_Team";
grant role analyst to role "GROUPS LEADERSHIP";
grant role analyst to role "HOSPITALITY PROGRAMS";
grant role analyst to role "IGT QUALITY SNOWFLAKE";
grant role analyst to role "INDUSTRIAL ENGINEERING TEAM";
grant role analyst to role "INFRASTRUCTURE ARCHITECTURE AUTOMATION";
grant role analyst to role INFLIGHTDUTYMANAGERS;
grant role analyst to role "INFLIGHT BASE COORDINATORS DL";
grant role analyst to role "IT AIRPORT OPS PROGRAMS";
grant role analyst to role "IT AI AND ML ENGINEERING CREW";
grant role analyst to role "IT COBRAND & EMAIL";
grant role analyst to role "IT COMMON USE";
grant role analyst to role "IT CTS OSC";
grant role analyst to role "IT CTS SD";
grant role analyst to role "IT CTS";
grant role analyst to role "IT DIRECTORS";
grant role analyst to role "IT ENTERPRISE ARCHITECTURE BP";
grant role analyst to role "IT ENTERPRISE ARCHITECTURE CM";
grant role analyst to role "IT ENTERPRISE QUALITY ASSURANCE";
grant role analyst to role "IT EQA GLOBAL TEAM";
grant role analyst to role "ITLOYALTYPARTNERSHIPS";
grant role analyst to role "IT MANAGE YOUR BOOKING";
grant role analyst to role "IT NETWORK ENGINEERING";
grant role analyst to role "IT OPERATIONS PRODUCT SUPPORT TECHOPS";
grant role analyst to role "ITDATAPRODUCTSCREW";
grant role analyst to role "IT OPS PRODUCTS CREW";
grant role analyst to role "IT PRODUCT ENGINEERING DOMAINS";
grant role analyst to role "IT QUALITYCOE";
grant role analyst to role "IT SECURITY CREW";
grant role analyst to role "IT SERVICE MANAGEMENT";
grant role analyst to role "IT_SELF_SERVICE";
grant role analyst to role "ITDATAQA-NONPROD";
grant role analyst to role "ITDATAQA-PROD";
grant role analyst to role "ITDATATESTING-SG";
grant role analyst to role "ITPE_AD_SUPPORT";
grant role analyst to role "ITSM APPLICATION SUPPORT";
grant role analyst to role "JB_SAP_BO_FINANCIALREPORTING";
grant role analyst to role "JBU AME";
GRANT ROLE ANALYST TO ROLE "JBU COA FACULTY";
grant role analyst to role "JBU SCHEDULING TEAM";
grant role analyst to role "JBU TECH OPS";
grant role analyst to role "JBCP_IAC_ADMINS_SG";
grant role analyst to role "JET PATHWAY ASSOCIATES";
grant role analyst to role "JFK MX";
grant role analyst to role "JTP FINANCE";
grant role analyst to role "JTPCC CREWLEADERS";
grant role analyst to role "JTPCC LEADERSHIP";
grant role analyst to role "LAXOPERATIONSCREW";
grant role analyst to role "LEARNING SYSTEM ADMIN";
grant role analyst to role LEADERSHIPFLYING;
grant role analyst to role "LIRCREWMEMBERS";
grant role analyst to role "LOYALTYTECHNOLOGY";
grant role analyst to role "MATERIAL.PLANNING";
grant role analyst to role "MC BUSINESS ACCOUNTS";
grant role analyst to role "MX_SNOWFLAKE";
grant role analyst to role "NORTHEAST ALLIANCE (NEA)";
grant role analyst to role "ONBOARD EXPERIENCE";
grant role analyst to role "OPERATIONSANALYSIS";
grant role analyst to role "PAYROLL PROCESSING TEAM";
grant role analyst to role "PAYROLL TAXES";
grant role analyst to role "PEOPLE DATA INSIGHTS";
grant role analyst to role "PRODUCT DEVELOPMENT";
grant role analyst to role "QACUSTOMERSUPPORT";
grant role analyst to role "QMS";
grant role analyst to role "REVENUE ACCOUNTING";
grant role analyst to role "RM EAST";
grant role analyst to role "ROUTE PLANNING";
grant role analyst to role "RYAN LLC";
grant role analyst to role STRATEGY;
grant role analyst to role "SAFETY ANALYTICS";
grant role analyst to role "SAFETY PROGRAMS";
grant role analyst to role "SEC_BLUEWATCH";
grant role analyst to role SELFSERVICEENGINEERING;
grant role analyst to role "SJU OPERATIONS CENTER";
grant role analyst to role "SPOTFIRE_ INTERNAL_REVFORECAST_USERS";
grant role analyst to role "SUSTAINABILITYESGDIVERSITYINCLUSION";
grant role analyst to role "SYSTEMSENGINEERING";
grant role analyst to role "TA DATA & REPORTING";
grant role analyst to role "TCS DATA SCIENCE";
grant role analyst to role "TECH OPS SNOWFLAKE USERS";
grant role analyst to role "TRACK DATA TEAM";
grant role analyst to role "TRAINING PLANNING";
grant role analyst to role "WPA LEADERSHIP";
grant role analyst to role "WPA TEAM";
grant role analyst to role A220COFSTDS;
grant role analyst to role AIRPORTPROGRAMSSUPPORT;
grant role analyst to role AIRPORTSSERVICESTEAM;
grant role analyst to role AVIONICSENGINEERING;
grant role analyst to role B2BLEADERSHIP;
grant role analyst to role BLUEALLIANCES;
grant role analyst to role BLUECITYSUPPORTCMX;
grant role analyst to role BLUECORPSALES;
grant role analyst to role BLUEDIRECTOR_ONLY;
grant role analyst to role BLUELOYALTY;
grant role analyst to role BLUEMARKETING;
grant role analyst to role BLUEMKTANALYTICS;
grant role analyst to role BLUEMOD;
grant role analyst to role BLUEPROPERTY;
grant role analyst to role BLUERELIABILITYENGINEERING;
grant role analyst to role BLUEREVFORECASTING;
grant role analyst to role BLUERM;
grant role analyst to role BLUERMSYSTEMS;
grant role analyst to role BLUESALES;
grant role analyst to role BLUESALESOPS;
grant role analyst to role BLUESOURCINGTEAM;
grant role analyst to role BLUESTRATBIZDEV;
grant role analyst to role BLUETATLSALES;
grant role analyst to role BLUETECHOPS;
grant role analyst to role BLUEVP_ONLY;
grant role analyst to role BQNLEADERSHIP;
grant role analyst to role BURLEADERSHIP;
grant role analyst to role CATERINGOPERATIONS;
grant role analyst to role CATERINGSTANDARDS;
grant role analyst to role CBACREWDATA;
grant role analyst to role CBPREQUESTS;
grant role analyst to role CEXOPSDM;
grant role analyst to role CEXSNOWFLAKEDATA;
grant role analyst to role CHIEFPILOTADMIN;
grant role analyst to role CHIEFPILOTSBOS;
grant role analyst to role CLELEADERSHIP;
grant role analyst to role CNS_NAVDB;
grant role analyst to role CNST_TABLEAU_VIEWERS;
grant role analyst to role CNSTDISTRO;
grant role analyst to role CNSTECHNICALPROGRAMS;
grant role analyst to role COBRANDCUSTOMERSUPPORT;
grant role analyst to role COBRANDLOYALTYTEAM;
grant role analyst to role COENTERPRISE;
grant role analyst to role COFSTANDARDS;
grant role analyst to role CONFIGURATIONCONTROLENGINEERING;
grant role analyst to role CORPCOMMTEAM;
grant role analyst to role CREW_DOMAIN;
grant role analyst to role CREWANALYTICS;
grant role analyst to role CREWPLANNING_PAIRINGS;
grant role analyst to role CREWTRAVEL_MODIFY;
grant role analyst to role CSSPWORKINGTEAM;
grant role analyst to role CUSTOMERSURVEYDATA;
grant role analyst to role DISPATCHDESKASSIGNMENTADMIN;
grant role analyst to role DISPATCHSNOWFLAKE;
grant role analyst to role EWRLeadership;
grant role analyst to role FINANCEBUSINESSINTELLIGENCE;
grant role analyst to role FLEETENGINEERING;
grant role analyst to role FLIGHTOPSDATAADMINS;
grant role analyst to role FLLOPSMOD;
grant role analyst to role FODP;
grant role analyst to role FUELALERT;
grant role analyst to role HPNLEADERSHIP;
grant role analyst to role INFLIGHTSAFETY;
grant role analyst to role INTERIORSENGINEERING;
grant role analyst to role INVESTIGATIONS;
grant role analyst to role IT_SELF_BOARDING;
grant role analyst to role ITANALYTICSENGINEERINGCREW;
grant role analyst to role ITBUSINESSINTELLIGENCECREW;
grant role analyst to role ITCEXCMSYSTEMS_SG;
grant role analyst to role ITCONSULTING;
grant role analyst to role ITCONVERSIONPRODUCTS;
grant role analyst to role ITDATAENGINEERINGCREW;
grant role analyst to role ITDATAOPSCREW;
grant role analyst to role ITDATASCIENCEBP;
grant role analyst to role ITDATASCIENCECREW;
grant role analyst to role ITLOYALTYSOLUTIONS;
grant role analyst to role ITPRODUCTENGINEERINGDOMAINSALL;
grant role analyst to role ITQUALITYASSURANCEDW;
grant role analyst to role ITREFERENCEDOMAIN;
grant role analyst to role ITSOCENTADMIN;
grant role analyst to role IXCORETEAM;
grant role analyst to role J5PRODKBANALYST;
grant role analyst to role JBSCOACHES;
grant role analyst to role JBUDISP;
grant role analyst to role JETBOARDSUPPORT;
grant role analyst to role JTV_SAP_ESS_USER;
grant role analyst to role LAXLEADERSHIP;
grant role analyst to role LAXSNOWFLAKE;
grant role analyst to role LGWLEADERSHIP;
grant role analyst to role LHRLEADERSHIP;
grant role analyst to role loyalty_teampartners;
grant role analyst to role loyaltyairpartners;
grant role analyst to role LOYALTYANALYSIS;
grant role analyst to role loyaltytechsupport;
grant role analyst to role MCOOPERATIONSCENTER;
grant role analyst to role MSPleadership;
grant role analyst to role MSYLEADERSHIP;
grant role analyst to role namdataops;
grant role analyst to role ONPREM;
grant role analyst to role PAIRINGANALYSIS;
grant role analyst to role PERSONALIZATION;
grant role analyst to role powerplantengineering;
grant role analyst to role QCCOORDINATORS;
grant role analyst to role QUEUESCREW;
grant role analyst to role qvest;
grant role analyst to role REPORTS_DEV_TRAX;
grant role analyst to role ReqCoor;
grant role analyst to role RESSPIDER;
grant role analyst to role RPAREPORTING;
grant role analyst to role SAFETYINSIGHTS;
grant role analyst to role SAPQLEADERSHIP;
grant role analyst to role SEALEADERSHIP;
grant role analyst to role SEAP;
grant role analyst to role SJOLEADERSHIP;
grant role analyst to role SJUMPCS;
grant role analyst to role SLT;
grant role analyst to role SNOWFLAKEANALYST;
grant role analyst to role soc_crewqualtosnowflake_data_migration;
grant role analyst to role SOCIALMEDIATEAM;
grant role analyst to role SRQLEADERSHIP;
grant role analyst to role SSCSTRATEGICPLANNING;
grant role analyst to role SYSOPSSAFETY;
grant role analyst to role SYSTEMGSE;
grant role analyst to role  "WPA AA";
grant role analyst to role TABLEAUONLINECREATOR;
grant role analyst to role TCSBUSINESSINTELLIGENCE;
grant role analyst to role TCSDATAENGINEERING;
grant role analyst to role TCSDATAOPS;
grant role analyst to role USR_SYSPLANNINGANALYSISRO;
grant role analyst to role Verizon_Billing_Reporting;
grant role analyst to role VISUALBI;

-- UAT
create role if not exists uat_testing;
{% if revoke_first %}
{{ revoke_roles_from_role('uat_testing') }}
{% endif %}
grant role reporter_dev to role uat_testing;
grant role reporter_qa to role uat_testing;
grant role uat_testing to role sysadmin;
grant role uat_testing to role B2BLEADERSHIP;
grant role uat_testing to role BLUEMKTANALYTICS;
grant role uat_testing to role BLUEREVFORECASTING;
grant role uat_testing to role BLUERMSYSTEMS;
grant role uat_testing to role CEXOPSDM;
grant role uat_testing to role CNS_NAVDB;
grant role uat_testing to role CREW_DOMAIN;
grant role uat_testing to role "INDUSTRIAL ENGINEERING TEAM";
grant role uat_testing to role ITBUSINESSINTELLIGENCECREW;
grant role uat_testing to role "IT QUALITYCOE";
grant role uat_testing to role "ITDATAQA-NONPROD";
grant role uat_testing to role "ITDATAQA-PROD";
grant role uat_testing to role "ITDATATESTING-SG";
grant role uat_testing to role "IT ENTERPRISE ARCHITECTURE CM";
grant role uat_testing to role "IT ENTERPRISE ARCHITECTURE BP";
grant role uat_testing to role IXCORETEAM;
grant role uat_testing to role ITCONVERSIONPRODUCTS;
grant role uat_testing to role QUEUESCREW;
grant role analyst to role sustainabilityesg_team;
grant role uat_testing to role USR_SYSPLANNINGANALYSISRO;

-- UAT sensitive
create role if not exists uat_testing_sensitive;
{% if revoke_first %}
{{ revoke_roles_from_role('uat_testing') }}
{% endif %}
grant role uat_testing to role uat_testing_sensitive;
grant role uat_testing_sensitive to role sysadmin;
grant role uat_testing_sensitive to role ITDATAENGINEERINGCREW;

-- securityadmin
grant usage on database analytics_clone_egor_v1 to role securityadmin;
grant usage on database analytics_clone_egor_v2 to role securityadmin;

-- analyst_airportssafetyteam
create role if not exists analyst_airportssafetyteam;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_airportssafetyteam') }}
{% endif %}
grant usage on schema analytics.safety to role analyst_airportssafetyteam;
grant select on all tables in schema analytics.safety to role analyst_airportssafetyteam;
grant select on all views in schema analytics.safety to role analyst_airportssafetyteam;
grant select on future tables in schema analytics.safety to role analyst_airportssafetyteam;
grant select on future views in schema analytics.safety to role analyst_airportssafetyteam;
grant role analyst_airportssafetyteam to role sysadmin;
grant role analyst_airportssafetyteam to role AIRPORTSSAFETYTEAM;

-- analyst_airlineoptimization
create role if not exists analyst_airlineoptimization;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_airlineoptimization') }}
{% endif %}
grant role analyst to role analyst_airlineoptimization;
grant role pairinganalysis to role analyst_airlineoptimization;
grant role byod_airlineoptimization to role analyst_airlineoptimization;
grant role byod_flight_schedules_read to role analyst_airlineoptimization;
grant role byod_flight_schedules_dev to role analyst_airlineoptimization;
grant role byod_opa_read to role analyst_airlineoptimization;
--byod.crewanalytics
grant role byod_crewanalytics_read to role analyst_airlineoptimization;
grant usage on schema byod.flight_ops_team to role analyst_airlineoptimization;
grant select on table byod.flight_ops_team.pairing_leg_fact to role analyst_airlineoptimization;
grant imported privileges on database masflight to role analyst_airlineoptimization;
grant role "BYOD_OPA" to role "AIRLINE OPTIMIZATION";
-- byod.route_planning
grant role byod_route_planning_read to role analyst_airlineoptimization;
-- PII Roles
grant role sensitive_analytics_prd__crew_pay to role analyst_airlineoptimization;
grant role analytics_crew_pay_read to role analyst_airlineoptimization;
grant role analyst_airlineoptimization to role sysadmin;
--BYOD.CREW_ANALYTICS.VW_CREW_DATA_FLOWN
grant usage on schema byod.crew_analytics to role "AIRLINE OPTIMIZATION";
grant select on view byod.crew_analytics.vw_crew_data_flown to role "AIRLINE OPTIMIZATION";
grant role analyst_airlineoptimization to role sysadmin;
grant role analyst_airlineoptimization to role "AIRLINE OPTIMIZATION";

-- analyst_airport_standards
create role if not exists analyst_airport_standards;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_airport_standards') }}
{% endif %}
grant role analyst to role analyst_airport_standards;
grant role byod_airport_standards to role analyst_airport_standards;
grant role analyst_airport_standards to role sysadmin;
grant role analyst_airport_standards to role CEXSNOWFLAKEDATA;

-- analyst_ao11063 (Alyssa Ockerbloom)
create role if not exists analyst_ao11063;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ao11063') }}
{% endif %}
grant role analyst to role analyst_ao11063;
grant role "BLUEFP&A" to role analyst_ao11063;
grant role "ANALYTICS_CREW_PAY_READ" to role analyst_ao11063;
grant select on table analytics.crew.master_history to role analyst_ao11063;
grant role analyst_ao11063 to role sysadmin;
grant role analyst_ao11063 to user "AO11063@JETBLUE.COM";

-- analyst_a320standards (a320standards)
create role if not exists analyst_a320standards;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_a320standards') }}
{% endif %}
grant role analyst to role analyst_a320standards;
grant role "FLEET CAPTAINS" to role analyst_a320standards;
--BYOD.OPA
grant role byod_opa_read to role analyst_a320standards;
grant role analyst_a320standards to role sysadmin;
grant role analyst_a320standards to role A320STANDARDS;

-- analyst_bi_qa
create role if not exists analyst_bi_qa;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bi_qa') }}
{% endif %}
grant role analyst to role analyst_bi_qa;
grant role sensitive_analytics_qa__bookings_rt__passenger_travel_document to role analyst_bi_qa; 
grant role sensitive_analytics_qa__tickets_rt to role analyst_bi_qa;
grant role analyst_bi_qa to role BI_QA;

-- analyst_bigid_scanner (BIGID_SCANNER)
create role if not exists analyst_bigid_scanner;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bigid_scanner') }}
{% endif %}
grant role analyst to role analyst_bigid_scanner;
grant role "SCANNER" to role analyst_bigid_scanner;
-- analytics
grant usage on database analytics to role analyst_bigid_scanner;
grant usage on all schemas in database analytics to role analyst_bigid_scanner;
grant select on all tables in database analytics to role analyst_bigid_scanner;
grant select on future tables in database analytics to role analyst_bigid_scanner;
grant select on all views in database analytics to role analyst_bigid_scanner;
grant select on future views in database analytics to role analyst_bigid_scanner;
grant role analytics_prd__all_schemas_sensitive_analytics_roles to role analyst_bigid_scanner;
grant role analyst_bigid_scanner to role sysadmin;
grant role analyst_bigid_scanner to user "BIGID_SCANNER";

-- analyst_bluealliances
create role if not exists analyst_bluealliances;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluealliances') }}
{% endif %}
grant role analyst to role analyst_bluealliances;
grant role byod_blue_alliances to role analyst_bluealliances;
grant role sensitive_sabre_acs_read to role analyst_bluealliances;
grant role sensitive_sabre_epr_read to role analyst_bluealliances;
grant role sensitive_sabre_pnr_read to role analyst_bluealliances;
grant role sensitive_sabre_ticket_read to role analyst_bluealliances;
grant role analyst_bluealliances to role BLUEALLIANCES;

-- analyst_bluecitysupportcmx
create role if not exists analyst_bluecitysupportcmx;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluecitysupportcmx') }}
{% endif %}
grant role analyst to role analyst_bluecitysupportcmx;
grant role sensitive_analytics_prd__surveys__customer_to_crewmember_feedback to role analyst_bluecitysupportcmx;
grant role analyst_bluecitysupportcmx to role sysadmin;
grant role analyst_bluecitysupportcmx to role BLUECITYSUPPORTCMX;

-- analyst_bluecorpsales
create role if not exists analyst_bluecorpsales;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluecorpsales') }}
{% endif %}
grant role analyst to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_bluecorpsales;
grant role sensitive_analytics_prd__loyalty__users to role analyst_bluecorpsales;
grant role byod_sales_read to role analyst_bluecorpsales;
grant role sensitive_sabre_pnr_read to role analyst_bluecorpsales;
grant role analyst_bluecorpsales to role BLUECORPSALES;

-- analyst_bluefp_a (BLUEFP&A)
create role if not exists analyst_bluefp_a;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluefp_a') }}
{% endif %}
grant role analyst to role analyst_bluefp_a;
grant role analyst_financial_planning_analysis to role analyst_bluefp_a;
--BYOD
grant usage on schema byod.opa to role analyst_bluefp_a;
-- BYOD.OPA
grant select on view byod.opa.vw_controllable_cancels_delays_for_fpa to role analyst_bluefp_a;
-- masflight shared database access
grant imported privileges on database masflight to role analyst_bluefp_a;
grant role byod_fpa to role analyst_bluefp_a;
grant role analyst_bluefp_a to role sysadmin;
grant role analyst_bluefp_a to role "BLUEFP&A";

-- analyst_blueinventory&faresleadership
create role if not exists "analyst_blueinventory&faresleadership";
{% if revoke_first %}
{{ revoke_roles_from_role("analyst_blueinventory&faresleadership") }}
{% endif %}
grant role analyst to role "analyst_blueinventory&faresleadership";
grant role byod_sales_read to role "analyst_blueinventory&faresleadership";
grant role byod_route_planning_read to role "analyst_blueinventory&faresleadership";
grant role "analyst_blueinventory&faresleadership" to role "BLUEINVENTORY&FARESLEADERSHIP";

-- analyst_blueloyalty
create role if not exists analyst_blueloyalty;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_blueloyalty') }}
{% endif %}
grant role analyst to role analyst_blueloyalty;
grant role byod_blueloyalty to role analyst_blueloyalty;
grant role byod_sales_read to role analyst_blueloyalty;
grant role byod_blueloyalty_read to role analyst_blueloyalty;
grant usage on schema byod.blueloyalty to role analyst_blueloyalty; 
grant select on table byod.blueloyalty.delta_impacted_customer_list_072524 to role analyst_blueloyalty;
-- BYOD.BLUEMKTANALYTICS
grant usage on schema byod.bluemktanalytics to role analyst_blueloyalty;
grant select on view byod.bluemktanalytics.customer_segmentation_2023 to role analyst_blueloyalty;
--BYOD.BLUEREVFORECASTING
grant role byod_bluerevforecasting_read to role analyst_blueloyalty;
-- Analytics db PII roles
grant role sensitive_analytics_read to role analyst_blueloyalty;
grant role sensitive_customers_rt_read to role analyst_blueloyalty;
grant role sensitive_analytics_prd__cybersource_payments__transaction_requests__bill_to_state to role analyst_blueloyalty;
grant role sensitive_analytics_prd__cybersource_payments__transaction_requests__bill_to_zip to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_blueloyalty;
grant role sensitive_analytics_prd__loyalty__users to role analyst_blueloyalty;
grant role sensitive_analytics_prd__email_marketing to role analyst_blueloyalty;
grant role sensitive_sabre_pnr_read to role analyst_blueloyalty;
grant role sensitive_sabre_ticket_read to role analyst_blueloyalty;
grant role sensitive_sabre_tcn_read to role analyst_blueloyalty;
grant role raw_comarch_dbo_read to role analyst_blueloyalty;
grant role analyst_blueloyalty to role sysadmin;
grant role analyst_blueloyalty to role BLUELOYALTY;

-- analyst_blue_ops_engineering
create role if not exists analyst_blue_ops_engineering;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_blue_ops_engineering') }}
{% endif %}
grant role analyst to role analyst_blue_ops_engineering;
grant role analyst to role byod_operations_engineering;
grant role analyst_opa to role analyst_blue_ops_engineering;
grant role byod_operations_engineering to role analyst_blue_ops_engineering;
grant role operationsstrategyandengineering to role analyst_blue_ops_engineering;
grant role analyst_blue_ops_engineering to role sysadmin;
grant role analyst_blue_ops_engineering to role "BLUE OPS ENGINEERING";

-- analyst_bluemktanalytics
create role if not exists analyst_bluemktanalytics;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluemktanalytics') }}
{% endif %}
grant role analyst to role analyst_bluemktanalytics;
grant role byod_bluemktanalytics to role analyst_bluemktanalytics;
grant role raw_comarch_read to role analyst_bluemktanalytics;
grant role sensitive_responsys_read to role analyst_bluemktanalytics;
grant role sensitive_sabre_pnr_read to role analyst_bluemktanalytics;
grant role analyst_bluemktanalytics to role BLUEMKTANALYTICS;

-- analyst_bluereliabilityengineering
create role if not exists analyst_bluereliabilityengineering;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluereliabilityengineering') }}
{% endif %}
grant role analyst to role analyst_bluereliabilityengineering;
grant role byod_bluereliabilityengineering to role analyst_bluereliabilityengineering;
grant role BLUEENGINEERING to role analyst_bluereliabilityengineering;
--sensitive roles
grant role sensitive_analytics_prd__stg_trax__relation_master to role bluereliabilityengineering;
grant role sensitive_analytics_prd__intermediary__inter_trax__relation_master to role bluereliabilityengineering;
grant role sensitive_analytics_prd__aircraft_maintenance__relation_master to role bluereliabilityengineering;
grant role analyst_bluereliabilityengineering to role sysadmin;
grant role analyst_bluereliabilityengineering to role bluereliabilityengineering;

-- analyst_bluestrategicmxplan (BLUESTRATEGICMXPLAN)
create role if not exists analyst_bluestrategicmxplan;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluestrategicmxplan') }}
{% endif %}
grant role analyst to role analyst_bluestrategicmxplan;
grant role bluetechops to role analyst_bluestrategicmxplan;
grant role bluetechopslsc to role analyst_bluestrategicmxplan;
grant role byod_bluestrategicmxplan to role analyst_bluestrategicmxplan;
grant role analyst_bluestrategicmxplan to role sysadmin;
grant role analyst_bluestrategicmxplan to role BLUESTRATEGICMXPLAN;

-- analyst_bluerevforecasting
create role if not exists analyst_bluerevforecasting;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluerevforecasting') }}
{% endif %}
grant role analyst to role analyst_bluerevforecasting;
-- BYOD.BLUEREVFORECASTING
grant role byod_flight_schedules_read to role analyst_bluerevforecasting;
-- BYOD.BLUEMKTANALYTICS
grant role byod_bluemktanalytics_read to role analyst_bluerevforecasting;
-- BYOD.BLUEREVFORECASTING
grant role byod_bluerevforecasting to role analyst_bluerevforecasting;
-- BYOD.BLUERM 
grant role byod_bluerm to role analyst_bluerevforecasting;
grant select, insert, update, delete, truncate on table byod.bluerm.diio_flight_nm to role analyst_bluerevforecasting;
-- byod.blerm
grant role byod_bluerm to role analyst_bluerevforecasting;
grant role byod_bluerm_read to role analyst_bluerevforecasting;
-- BYOD.IT_DATA_ENGINEERING
grant role byod_it_data_engineering_qa to role analyst_bluerevforecasting;
-- BYOD.SALES
grant role byod_sales_read to role analyst_bluerevforecasting;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bookings to role analyst_bluerevforecasting;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_bluerevforecasting;
grant role sensitive_sabre_travel_bank_read to role analyst_bluerevforecasting;
grant role analyst_bluerevforecasting to role sysadmin;
grant role analyst_bluerevforecasting to role bluerevforecasting;
grant role analyst_bluerevforecasting to user "SVC_REVENUE_ANALYSIS";

-- analyst_bluerm
create role if not exists analyst_bluerm;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluerm') }}
{% endif %}
--analytics clone read
grant role analytics_clone_read to role analyst_bluerm;
--BYOD roles
grant role byod_bluerm to role analyst_bluerm;
grant role analyst to role analyst_bluerm;
grant role analyst_blueloyalty to role analyst_bluerm;
--analytics_clone roles
grant role analytics_clone_read to role analyst_bluerm;
--BYOD roles
grant role byod_bluerm to role analyst_bluerm;
grant role byod_enterprise_architecture_read to role analyst_bluerm;
grant role byod_bcg_gamma to role analyst_bluerm;
grant role byod_bluerevforecasting_read to role analyst_bluerm;
grant role byod_sales to role analyst_bluerm;
grant usage on schema byod.flight_schedules to role analyst_bluerm;
grant select on view byod.flight_schedules.vw_finalized_schedules to role analyst_bluerm;
grant select on table byod.flight_schedules.processed_low to role analyst_bluerm;
grant select on future views in database analytics_clone to role analyst_bluerm;
--sensitive roles
grant role sensitive_sabre_pnr_read to role analyst_bluerm;
grant role sensitive_sabre_ticket_read to role analyst_bluerm;
grant role sensitive_sabre_pnr_read_qa to role analyst_bluerm;
grant role sensitive_sabre_ticket_read_qa to role analyst_bluerm;
--other roles
grant role analyst to role analyst_bluerm;
grant role uat_testing to role analyst_bluerm;
grant role analyst_bluerm to role sysadmin;
grant role analyst_bluerm to role bluerm;

-- analyst_BlueProperty
create role if not exists analyst_BlueProperty;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_BlueProperty') }}
{% endif %}
grant role analyst to role analyst_BlueProperty;
grant role byod_finance_read to role analyst_BlueProperty;
grant usage on database byod to role analyst_BlueProperty;
grant role analyst_BlueProperty to role sysadmin;
grant role analyst_BlueProperty to role BlueProperty;

-- analyst_bluesales
create role if not exists analyst_bluesales;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluesales') }}
{% endif %}
grant role analyst to role analyst_bluesales;
-- masflight shared database
grant imported privileges on database masflight to role analyst_bluesales;
grant role analyst_bluesales to role sysadmin;
grant role analyst_bluesalesops to role BLUESALES;

-- analyst_bluesalesops
create role if not exists analyst_bluesalesops;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluesalesops') }}
{% endif %}
grant role analyst to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_bluesalesops;
grant role sensitive_analytics_prd__loyalty__users to role analyst_bluesalesops;
grant role raw_salesforce_poc_read to role analyst_bluesalesops;
grant role raw_salesforce_read to role analyst_bluesalesops;
grant role byod_bluerm_read to role analyst_bluesalesops;
grant role byod_sales to role analyst_bluesalesops;
grant role sensitive_sabre_pnr_read to role analyst_bluesalesops;
grant usage on schema byod.bluerevforecasting to role analyst_bluesalesops;
grant select on table byod.bluerevforecasting.gross_customer_data to role analyst_bluesalesops;
-- masflight shared database
grant imported privileges on database masflight to role analyst_bluesalesops;
grant role analyst_bluesalesops to role sysadmin;
grant role analyst_bluesalesops to role BLUESALESOPS;

-- analyst_bluesourcingteam;
create role if not exists analyst_bluesourcingteam;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluesourcingteam') }}
{% endif %}
grant role analyst to role analyst_bluesourcingteam;
grant role byod_strategic_sourcing to role analyst_bluesourcingteam;
grant role analyst_bluesourcingteam to role sysadmin;
grant role analyst_bluesourcingteam to role BLUESOURCINGTEAM;

-- analyst_bluestratbizdev
create role if not exists analyst_bluestratbizdev;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluestratbizdev') }}
{% endif %}
grant role analyst to role analyst_bluestratbizdev;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_bluestratbizdev;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_bluestratbizdev;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_bluestratbizdev;
grant role analyst_bluestratbizdev to role BLUESTRATBIZDEV;

--analyst_bluetax (BLUE TAX)
create role if not exists analyst_bluetax;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluetax') }}
{% endif %}
grant role analyst to role analyst_bluetax;
grant role analyst_financial_systems_controller to role analyst_bluetax;
grant role byod_bluetax to role analyst_bluetax;
grant role byod_bluerevforecasting_read to role analyst_bluetax;
grant role analyst_bluetax to role "BLUE TAX";

-- analyst_bluetlb_dr
create role if not exists analyst_bluetlb_dr;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bluetlb_dr') }}
{% endif %}
grant role analyst to role analyst_bluetlb_dr;
grant role reporter_qa to role analyst_bluetlb_dr;
grant usage on schema analytics.stg_sabre_intelligence_exchange to role analyst_bluetlb_dr;
grant select on all tables in schema analytics.stg_sabre_intelligence_exchange to role analyst_bluetlb_dr;
grant select on all views in schema analytics.stg_sabre_intelligence_exchange to role analyst_bluetlb_dr;
grant select on future tables in schema analytics.stg_sabre_intelligence_exchange to role analyst_bluetlb_dr;
grant select on future views in schema analytics.stg_sabre_intelligence_exchange to role analyst_bluetlb_dr;
grant role analyst_bluetlb_dr to role sysadmin;
grant role analyst_bluetlb_dr to role "BLUETLB_DR";

-- analyst_bpbigroup (BPBIGroup)
create role if not exists analyst_bpbigroup;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bpbigroup') }}
{% endif %}
grant role tableauonlinecreator to role analyst_bpbigroup;
grant usage on database byod to role analyst_bpbigroup;
grant usage on schema byod.itbi to role analyst_bpbigroup;
grant select on table byod.itbi.airport to role analyst_bpbigroup;
grant select on table byod.itbi.dim_iroplevel3 to role analyst_bpbigroup;
grant usage on schema byod.opa to role analyst_bpbigroup;
grant select on table byod.opa.goals_station to role analyst_bpbigroup;
grant select on table byod.opa.goals_system to role analyst_bpbigroup;
grant role analyst_bpbigroup to role sysadmin;
grant role analyst_bpbigroup to role bpbigroup;

-- analyst_cbacrewdata
create role if not exists analyst_cbacrewdata;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cbacrewdata') }}
{% endif %}
grant role analyst to role analyst_cbacrewdata; 
grant role byod_cbacrewdata to role analyst_cbacrewdata;
grant usage on schema analytics.crew_pay to role analyst_cbacrewdata;
grant select on all tables in schema analytics.crew_pay to role analyst_cbacrewdata;
grant select on all views in schema analytics.crew_pay to role analyst_cbacrewdata;
grant select on future tables in schema analytics.crew_pay to role analyst_cbacrewdata;
grant select on future views in schema analytics.crew_pay to role analyst_cbacrewdata;
grant role analyst_cbacrewdata to role sysadmin;
grant role analyst_cbacrewdata to role cbacrewdata;

-- analyst_cex_analytics
create role if not exists analyst_cex_analytics;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cex_analytics') }}
{% endif %}
grant role analyst to role analyst_cex_analytics;
grant role byod_cex_analytics to role analyst_cex_analytics;
grant role byod_cex_analytics to role QCCOORDINATORS;
grant role analyst_cex_analytics to role sysadmin;
grant role analyst_cex_analytics to role "CEX ANALYTICS";

-- analyst_cex_ap_flt_data
create role if not exists analyst_cex_ap_flt_data;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cex_ap_flt_data') }}
{% endif %}
grant usage on warehouse reporting_prd_xs_wh to role analyst_cex_ap_flt_data;
grant usage on warehouse reporting_prd_s_wh to role analyst_cex_ap_flt_data;
grant usage on warehouse reporting_prd_m_wh to role analyst_cex_ap_flt_data;
grant usage on database analytics_dev to role analyst_cex_ap_flt_data;
-- analytics db
grant usage on database analytics to role analyst_cex_ap_flt_data;
-- analytics.weather
grant usage on schema analytics.weather to role analyst_cex_ap_flt_data;
grant select on all tables in schema analytics.weather to role analyst_cex_ap_flt_data;
grant select on all views in schema analytics.weather to role analyst_cex_ap_flt_data;
grant select on future tables in schema analytics.weather to role analyst_cex_ap_flt_data;
grant select on future views in schema analytics.weather to role analyst_cex_ap_flt_data;
-- analytics_dev db
grant usage on schema analytics_dev.flights_rt to role analyst_cex_ap_flt_data;
grant select on all tables in schema analytics_dev.flights_rt to role analyst_cex_ap_flt_data;
grant select on all views in schema analytics_dev.flights_rt to role analyst_cex_ap_flt_data;
grant select on future tables in schema analytics_dev.flights_rt to role analyst_cex_ap_flt_data;
grant select on future views in schema analytics_dev.flights_rt to role analyst_cex_ap_flt_data;
grant role analyst_cex_ap_flt_data to user svc_cex_ap_flt_data;
grant role analyst_cex_ap_flt_data to role sysadmin;
grant role analyst_cex_ap_flt_data to role cbacrewdata;

-- analyst_cex_ops
create role if not exists analyst_cex_ops;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cex_ops') }}
{% endif %}
grant role analyst to role analyst_cex_ops;
--byod roles
grant usage on database byod to role analyst_cex_ops;
grant usage on schema byod.airport_standards to role analyst_cex_ops;
grant select on table byod.airport_standards.lyft_data to role analyst_cex_ops;
grant select on table byod.airport_standards.dpax_data to role analyst_cex_ops;
grant role byod_wpa_read to role analyst_cex_ops;
--raw roles
grant role raw_avaya_cms_read to role analyst_cex_ops;
grant role raw_irops_reaccom_read to role analyst_cex_ops;
grant role raw_sabre_acs_rt_read to role analyst_cex_ops;
grant role raw_sabre_pnr_rt_read to role analyst_cex_ops;
--sensitive roles
grant role sensitive_analytics_prd__bookings to role analyst_cex_ops;
grant role sensitive_analytics_prd__bookings_rt to role analyst_cex_ops;
grant role sensitive_analytics_prd__check_ins to role analyst_cex_ops;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_cex_ops;
grant role sensitive_analytics_prd__irops_reaccom to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_irops_reaccom__impacted_pnrs to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_irops_reaccom__solution_pnrs to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_cex_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_cex_ops;
grant role sensitive_analytics_prd__stg_irops_reaccom to role analyst_cex_ops;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_cex_ops;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_cex_ops;
grant role sensitive_sabre_acs_read to role analyst_cex_ops;
grant role sensitive_sabre_epr_read to role analyst_cex_ops;
grant role sensitive_sabre_fees_read to role analyst_cex_ops;
grant role sensitive_sabre_pnr_read to role analyst_cex_ops;
grant role sensitive_sabre_ticket_read to role analyst_cex_ops;
grant role sensitive_sabre_tcn_read to role analyst_cex_ops;
grant role sensitive_sabre_travel_bank_read to role analyst_cex_ops;
--other roles
grant role analyst_cex_ops to role CEXOPSDM;
grant role analyst_cex_ops to role CUSTOMERSURVEYDATA;

-- analyst_cexsnowflakedata
create role if not exists analyst_cexsnowflakedata;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cexsnowflakedata') }}
{% endif %}
grant role analyst to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__comply365__users__username to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__comply365__users__first_name to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__comply365__users__last_name to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__comply365__users__email to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__check_ins__passengers to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__comply365__crewmember to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__employee_profile_record to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__bookings__remarks_history to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__bookings__remarks_history__remark_text to role analyst_cexsnowflakedata; 
grant role sensitive_analytics_prd__lift__award_activity__nominator_firstname to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__lift__award_activity__nominator_lastname to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__lift__award_activity__recipient_firstname to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__lift__award_activity__recipient_lastname to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__lift__award_activity__recipient_cm_email_address to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__lift__award_activity__recipient_cl_email_address to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__lift__award_activity__approver_firstname to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__lift__award_activity__approver_lastname to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__sharepoint_airport_applications__cs_100_reports_v2 to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__stg_sharepoint_airport_applications__cs_100_reports_v2 to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__sharepoint_airport_applications__ecs_101_main_report to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__tickets__payments__payment_remarks to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_detailed_report__block_authorized_by to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_detailed_report__cancellation_requested_by to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_detailed_report__rate_above_maximum_cap_authorized_by to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_detailed_report__rate_maximum_cap_authorized_by to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_detailed_report__passenger_firstname to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_detailed_report__passenger_lastname to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_detailed_report__other_passenger_names to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_accounting_report__passenger_email_address to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_accounting_report__reference_number to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_accounting_report__other_passenger_names to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_accounting_report__passenger_last_name to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_accounting_report__passenger_first_name to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__api_global_hotels__dpax_accounting_report__booking_agent_id to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_cexsnowflakedata;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_cexsnowflakedata;
-- analytics.stg_sharepoint_airport_applications
grant usage on schema analytics.stg_sharepoint_airport_applications to role analyst_cexsnowflakedata;
grant select on view analytics.stg_sharepoint_airport_applications.cs_100_reports_v2 to role analyst_cexsnowflakedata;
-- raw.sharepoint_airport_applications
grant usage on database raw to role analyst_cexsnowflakedata;
grant usage on schema raw.sharepoint_airport_applications to role analyst_cexsnowflakedata;
grant select on table raw.sharepoint_airport_applications.cs100_reports_v2 to role analyst_cexsnowflakedata; 
grant role analyst_cexsnowflakedata to role sysadmin;
grant role analyst_cexsnowflakedata to role cexsnowflakedata;

-- analyst_chiefpilots(CHIEFPILOTS)
create role if not exists analyst_chiefpilots;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_chiefpilots') }}
{% endif %}
grant role analyst to role analyst_chiefpilots;
grant role sensitive_analytics_prd__flight_operations__acars_cpdlc to role analyst_chiefpilots;
grant role analyst_chiefpilots to role CHIEFPILOTS;

-- analyst_cnstdistro
create role if not exists analyst_cnstdistro;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cnstdistro') }}
{% endif %}
grant role analyst to role analyst_cnstdistro;
grant role analyst_flight_ops to role analyst_cnstdistro;
grant role analyst_navigation to role analyst_cnstdistro;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__analytics__beta_flight_plans_fact to role analyst_cnstdistro;
grant role sensitive_analytics_prd__crew to role analyst_cnstdistro;
grant role sensitive_analytics_prd__flight_operations__acars_cpdlc to role analyst_cnstdistro;
grant role sensitive_analytics_prd__flight_operations__flight_approaches to role analyst_cnstdistro;
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging to role analyst_cnstdistro;
grant role sensitive_analytics_prd__flight_plan_manager__flight_crews to role analyst_cnstdistro;
grant role sensitive_analytics_prd__intermediary__inter_flight_plan_manager__flight_crews to role analyst_cnstdistro;
grant role analyst_cnstdistro to role sysadmin;
grant role analyst_cnstdistro to role cnstdistro;

-- analyst_cnstaircraftdataprograms
create role if not exists analyst_cnstaircraftdataprograms;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cnstaircraftdataprograms') }}
{% endif %}
grant role analyst to role analyst_cnstaircraftdataprograms;
grant role byod_aircraft_data_programs to role analyst_cnstaircraftdataprograms;
grant role byod_navigation_database to role analyst_cnstaircraftdataprograms;
grant select on all tables in schema byod.navigation_database to role analyst_cnstaircraftdataprograms;
grant select on future tables in schema byod.navigation_database to role analyst_cnstaircraftdataprograms;
grant select on all views in schema byod.navigation_database to role analyst_cnstaircraftdataprograms;
grant select on future views in schema byod.navigation_database to role analyst_cnstaircraftdataprograms;
grant role analyst_cnstaircraftdataprograms to role sysadmin;
grant role analyst_cnstaircraftdataprograms to role cnstaircraftdataprograms;

-- analyst_corporate_audit
create role if not exists analyst_corporate_audit;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_corporate_audit') }}
{% endif %}
grant role analyst to role analyst_corporate_audit;
grant role byod_corporate_audit to role analyst_corporate_audit;
grant role sensitive_analytics_prd__employee_profile_record__header__agent_full_name to role analyst_corporate_audit;
grant role sensitive_analytics_prd__ticket_audits__base_sale__passenger_name to role analyst_corporate_audit;
grant role sensitive_sabre_travel_bank_read to role analyst_corporate_audit;
grant role analyst_corporate_audit to role sysadmin;
grant role analyst_corporate_audit to role "CORPORATE AUDIT";

-- analyst_crewanalytics
create role if not exists analyst_crewanalytics;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_crewanalytics') }}
{% endif %}
grant role analyst to role analyst_crewanalytics;
grant role analyst_ops_planning to role analyst_crewanalytics;
-- ANALYTICS.CREW_PAY
grant role analytics_crew_pay_read to role analyst_crewanalytics;
-- ANALYTICS.STG_SAP_REPORTS
grant usage on schema analytics.stg_sap_reports to role analyst_crewanalytics;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_crewanalytics;
-- ANALYTICS_QA.CREW_PAY
grant role analytics_qa_crew_pay_read to role analyst_crewanalytics;
-- BYOD
-- BYOD.CBACREWDATA
grant role byod_cbacrewdata_read to role analyst_crewanalytics;
-- BYOD.CREWANALYTICS
grant role byod_crewanalytics to role analyst_crewanalytics;
-- BYOD.CREW_ANALYTICS
grant select on view byod.crew_analytics.vw_inflight_leaders_flying to role analyst_crewanalytics;
-- BYOD.ENTERPRISE_PLANNING
grant role byod_enterprise_planning to role analyst_crewanalytics;
grant role byod_enterprise_planning_read to role analyst_crewanalytics;
-- BYOD.FLIGHT_OPS_TEAM
grant usage on schema byod.flight_ops_team to role analyst_crewanalytics;
grant select on table byod.flight_ops_team.pairing_leg_fact to role analyst_crewanalytics;
-- BYOD.OPA
grant role byod_opa_read to role analyst_crewanalytics;
-- RAW.SAP_REPORTS
grant usage on database raw to role analyst_crewanalytics;
grant usage on schema raw.sap_reports to role analyst_crewanalytics;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_crewanalytics;
--SENSITIVE ROLES
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_crewanalytics;
grant role sensitive_analytics_prd__crew_pay to role analyst_crewanalytics;
grant role sensitive_analytics_prd__crew_pay__crew_data_history to role analyst_crewanalytics;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_crewanalytics;
grant role sensitive_analytics_prd__training__flight_training_plans to role analyst_crewanalytics;
grant role analyst_crewanalytics to role sysadmin;
grant role analyst_crewanalytics to role crewanalytics;

-- analyst_crewstaffingdl
create role if not exists analyst_crewstaffingdl;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_crewstaffingdl') }}
{% endif %}
grant role analyst to role analyst_crewstaffingdl;
grant role flightopsdata to role analyst_crewstaffingdl;
-- BYOD 
grant role byod_crewstaffingdl to role analyst_crewstaffingdl;
grant role analyst_crewstaffingdl to role sysadmin;
grant role analyst_crewstaffingdl to role crewstaffingdl;

-- analyst_csbussol
create role if not exists analyst_csbussol;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_csbussol') }}
{% endif %}
grant role analyst to role analyst_csbussol;
grant role analyst_csbussol to role sysadmin;
grant role sensitive_crew_read to role analyst_csbussol;
grant role analyst_csbussol to role csbussol;

-- analyst_csplanning&products
create role if not exists "analyst_csplanning&products";
{% if revoke_first %}
{{ revoke_roles_from_role("analyst_csplanning&products") }}
{% endif %}
grant role analyst to role "analyst_csplanning&products";
grant role byod_csplanning to role "analyst_csplanning&products";
grant role "analyst_csplanning&products" to role sysadmin;
grant role "analyst_csplanning&products" to role "CS PLANNING & PRODUCTS";

-- analyst_csproducts
create role if not exists analyst_csproducts;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_csproducts') }}
{% endif %}
grant role analyst to role analyst_csproducts;
-- ANALYTICS_CLONE
grant usage on database analytics_clone to role analyst_csproducts;
-- ANALYTICS_CLONE.SOLUTION_TEK
grant usage on schema analytics_clone.solution_tek to role analyst_csproducts;
grant select on all tables in schema analytics_clone.solution_tek to role analyst_csproducts;
grant select on future tables in schema analytics_clone.solution_tek to role analyst_csproducts;
grant select on all views in schema analytics_clone.solution_tek to role analyst_csproducts;
grant select on future views in schema analytics_clone.solution_tek to role analyst_csproducts;
-- BYOD Roles
grant role byod_cex_analytics_read to role analyst_csproducts;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bookings__remarks_history__remark_text to role analyst_csproducts;
grant role sensitive_analytics_prd__sabre_travel_bank__account_details to role analyst_csproducts;
grant role sensitive_analytics_prd__sabre_travel_bank__error_transactions to role analyst_csproducts;
grant role analyst_csproducts to role sysadmin;
grant role analyst_csproducts to role "CSPRODUCTS";

-- analyst_cssmodernizationcoreteam
create role if not exists analyst_cssmodernizationcoreteam;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cssmodernizationcoreteam') }}
{% endif %}
grant role analyst to role analyst_cssmodernizationcoreteam;
grant role analyst_cssmodernizationcoreteam to role sysadmin;
grant role analyst_cssmodernizationcoreteam to role "CSS MODERNIZATION CORE TEAM";

--analyst_customer360 (CUSTOMER360)
create role if not exists analyst_customer360;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_customer360') }}
{% endif %}
-- Sensitive roles
grant role sensitive_analytics_prd__loyalty_rt to role analyst_customer360;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_customer360;
grant role byod_blueloyalty_read to role analyst_customer360;
grant role sensitive_analytics_prd__analytics__beta_customers_fact to role analyst_customer360;
-- ANALYTICS.WEB_LOGS_RT
grant usage on schema analytics.web_logs_rt to role analyst_customer360;
grant select on all dynamic tables in schema analytics.web_logs_rt to role analyst_customer360;
grant select on future dynamic tables in schema analytics.web_logs_rt to role analyst_customer360;
-- ANALYTICS.STG_WEB_LOGS_RT
grant usage on schema analytics.stg_web_logs_rt to role analyst_customer360;
grant select on all dynamic tables in schema analytics.stg_web_logs_rt to role analyst_customer360;
grant select on future dynamic tables in schema analytics.stg_web_logs_rt to role analyst_customer360;
-- ANALYTICS.INTERMEDIARY
grant usage on schema analytics.intermediary to role analyst_customer360;
grant select on all dynamic tables in schema analytics.intermediary to role analyst_customer360;
grant select on future dynamic tables in schema analytics.intermediary to role analyst_customer360;
-- ANALYTICS_CLONE
grant usage on database analytics_clone to role analyst_customer360;
grant usage on schema analytics_clone.web_logs_rt to role analyst_customer360;
grant select on all tables in schema analytics_clone.web_logs_rt to role analyst_customer360;
grant select on future tables in schema analytics_clone.web_logs_rt to role analyst_customer360;
grant select on all views in schema analytics_clone.web_logs_rt to role analyst_customer360;
grant select on future views in schema analytics_clone.web_logs_rt to role analyst_customer360;
grant select on all dynamic tables in schema analytics_clone.web_logs_rt to role analyst_customer360;
grant select on future dynamic tables in schema analytics_clone.web_logs_rt to role analyst_customer360;
grant usage on schema analytics_clone.intermediary to role analyst_customer360;
--analytics.web_logs_rt
grant usage on schema analytics.web_logs_rt to role analyst_customer360;
grant select on table analytics.web_logs_rt.page_views to role analyst_customer360;
grant select on table analytics.web_logs_rt.rpt_aggregate_sessions to role analyst_customer360;
grant select on table analytics.web_logs_rt.rpt_email_marketing to role analyst_customer360;
grant select on table analytics.web_logs_rt.rpt_funnel_advancement to role analyst_customer360;
grant select on table analytics.web_logs_rt.rpt_region_capacity_arc_shares to role analyst_customer360;
grant select on table analytics.web_logs_rt.user_agents to role analyst_customer360;
--analytics.intermediary
--grant select on table analytics.intermediary.session_by_page to role analyst_customer360;
--grant select on table analytics.intermediary.session_by_page_aggregate to role analyst_customer360;
--grant select on table analytics.intermediary.session_by_page_prep to role analyst_customer360;
--grant select on table analytics.intermediary.aggregate_sessions_prep to role analyst_customer360;
--grant select on table analytics.intermediary.arc_shares to role analyst_customer360;
--grant select on table analytics.intermediary.capacity to role analyst_customer360;
--grant select on table analytics.intermediary.credit_card_customers to role analyst_customer360;
--grant select on table analytics.intermediary.customers to role analyst_customer360;
--grant select on table analytics.intermediary.max_airport_region to role analyst_customer360;
--grant select on table analytics.intermediary.max_airport_region_extract_od_pair to role analyst_customer360;
--grant select on table analytics.intermediary.max_airport_region_prep to role analyst_customer360;
--grant select on table analytics.intermediary.min_referring_channels to role analyst_customer360;
--grant select on table analytics.intermediary.min_referring_channels_prep to role analyst_customer360;
--grant select on table analytics.intermediary.min_user_agent to role analyst_customer360;
--grant select on table analytics.intermediary.min_user_agent_prep to role analyst_customer360;
--grant select on table analytics.intermediary.mosaic_customers to role analyst_customer360;
--grant select on table analytics.intermediary.one_row_per_session to role analyst_customer360;
--grant select on table analytics.intermediary.one_row_per_session_prep to role analyst_customer360;
--grant select on table analytics.intermediary.ordered_sessions to role analyst_customer360;
--grant select on table analytics.intermediary.ordered_sessions_session_break_count to role analyst_customer360;
--grant select on table analytics.intermediary.ordered_sessions_session_break_flag to role analyst_customer360;
--grant select on table analytics.intermediary.page_views_filtered to role analyst_customer360;
--grant select on table analytics.intermediary.region_capacity to role analyst_customer360;
--grant select on table analytics.intermediary.region_capacity_arc_shares_prep to role analyst_customer360;
--grant select on table analytics.intermediary.region_routes to role analyst_customer360;
grant usage on schema analytics.stg_web_logs_rt to role analyst_customer360;
grant select on table analytics.stg_web_logs_rt.stg_page_view_parameters to role analyst_customer360;
grant select on table analytics.stg_web_logs_rt.stg_user_agents to role analyst_customer360;
grant role byod_trackddb_read to role analyst_customer360;
grant role analyst_customer360 to role sysadmin;
grant role analyst_customer360 to role CUSTOMER360;

-- analyst_customeraccessibility
create role if not exists analyst_customeraccessibility;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_customeraccessibility') }}
{% endif %}
grant role analyst to role analyst_customeraccessibility;
grant role sensitive_analytics_prd__bookings to role analyst_customeraccessibility;
grant role analyst_customeraccessibility to role sysadmin;
grant role analyst_customeraccessibility to role customeraccessibility;

-- analyst_customeranalytics_snowflake
create role if not exists analyst_customeranalytics_snowflake;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cobrandcustomersupport') }}
{% endif %}
grant role analyst to role analyst_customeranalytics_snowflake;
grant role analyst_customer_analytics to role analyst_customeranalytics_snowflake;
grant role byod_bluemktanalytics to role analyst_customeranalytics_snowflake;
-- SIMON DATA SHARE
grant role simon_data_share_read to role analyst_customeranalytics_snowflake;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__inflight_entertainment__passenger to role analyst_customeranalytics_snowflake;
grant role sensitive_analytics_prd__intermediary__inter__inflight_entertainment__passenger to role analyst_customeranalytics_snowflake;
grant role analyst_customeranalytics_snowflake to role sysadmin;
grant role analyst_customeranalytics_snowflake to role "CUSTOMERANALYTICS-SNOWFLAKE";

-- analyst_cobrandcustomersupport
create role if not exists analyst_cobrandcustomersupport;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cobrandcustomersupport') }}
{% endif %}
grant role analyst to role analyst_cobrandcustomersupport;
grant usage on schema analytics.loyalty to role analyst_cobrandcustomersupport;
grant role sensitive_analytics_prd__loyalty__barclays_loyalty_cobrand_business_accounts to role analyst_cobrandcustomersupport;
grant role sensitive_analytics_prd__loyalty__barclays_loyalty_cobrand_consumer_accounts to role analyst_cobrandcustomersupport;
grant role analyst_cobrandcustomersupport to role sysadmin;
grant role analyst_cobrandcustomersupport to role cobrandcustomersupport;

-- creating analytics_dev PII roles
create role if not exists sensitive_analytics_dev__call_management;
{% if revoke_first %}
{{ revoke_roles_from_role('sensitive_analytics_dev__call_management') }}
{% endif %}
grant role sensitive_analytics_dev__call_management to role analyst_customer_contact_center;

-- analyst_customer_contact_center
create role if not exists analyst_customer_contact_center;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_customer_contact_center') }}
{% endif %}
grant role analyst to role analyst_customer_contact_center;
-- ANALYSTCS_DEV
grant usage on database analytics_dev to role analyst_customer_contact_center;
-- ANALYTICS_DEV.AMAZON_CONNECT
--grant usage on schema analytics_dev.amazon_connect to role analyst_customer_contact_center;
---grant select on all tables in schema analytics_dev.amazon_connect to role analyst_customer_contact_center;
--grant select on future tables in schema analytics_dev.amazon_connect to role analyst_customer_contact_center;
---grant select on all views in schema analytics_dev.amazon_connect to role analyst_customer_contact_center;
--grant select on future views in schema analytics_dev.amazon_connect to role analyst_customer_contact_center;
--analytics_dev.call_management
grant usage on schema analytics_dev.call_management to role analyst_customer_contact_center;
grant select on all tables in schema analytics_dev.call_management to role analyst_customer_contact_center;
grant select on all views in schema analytics_dev.call_management to role analyst_customer_contact_center;
grant select on future tables in schema analytics_dev.call_management to role analyst_customer_contact_center;
grant select on future views in schema analytics_dev.call_management to role analyst_customer_contact_center;
-- ANALYTICS_QA ROLES
grant usage on database analytics_qa to role analyst_customer_contact_center;
grant role analytics_qa_amazon_connect_read to role analyst_customer_contact_center;
grant role analytics_qa_call_management_read to role analyst_customer_contact_center;
grant role sensitive_analytics_qa__call_management to role analyst_customer_contact_center;
--OTHER ROLES
grant role analyst_customer_contact_center to role sysadmin;
grant role analyst_customer_contact_center to role "CUSTOMER CONTACT CENTER";

-- analyst_customer_support
create role if not exists analyst_customer_support;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_customer_support') }}
{% endif %}
grant role analyst to role analyst_customer_support;
grant role byod_customer_support to role analyst_customer_support;
grant role sensitive_analytics_prd__bookings to role analyst_customer_support;
grant role sensitive_sabre_pnr_read to role analyst_customer_support;
grant role analyst_customer_support to role CEXOPSDM;
grant role analyst_customer_support to role CUSTOMERSURVEYDATA;

-- analyst_customer_survey_data
create role if not exists analyst_customer_survey_data;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_customer_survey_data') }}
{% endif %}
grant role analyst to role analyst_customer_support;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_birth_date to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__crew_fact to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__loyalty_fact to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__crew to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__stg_sap_reports to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__date_of_birth to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__email_address_text to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__first_name to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__last_name to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__postal_address_postal_code to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__postal_country_name to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_first_name to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_last_name to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_middle_name to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__first_name to role analyst_customer_survey_data;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__last_name to role analyst_customer_survey_data;
--byod roles
grant usage on database byod to role analyst_customer_survey_data;
grant role byod_opa_read to role analyst_customer_survey_data;
grant role byod_sales_read to role analyst_customer_survey_data;
grant usage on schema byod.wpa to role analyst_customer_survey_data;
grant select on table byod.wpa.mnl to role analyst_customer_survey_data;
grant role byod_customer_insights to role analyst_customer_survey_data;
grant role analyst_customer_survey_data to role sysadmin;
grant role analyst_customer_survey_data to role CUSTOMERSURVEYDATA;

-- analyst_customer_analytics
create role if not exists analyst_customer_analytics;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_customer_analytics') }}
{% endif %}
grant role analyst to role analyst_customer_analytics;
grant role byod_bluemktanalytics to role analyst_customer_analytics;
grant role sensitive_cobrand_read to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_customer_analytics;
grant role sensitive_analytics_prd__loyalty__users to role analyst_customer_analytics;
grant role sensitive_analytics_prd__notification_manager__delivery_channel__email_id to role analyst_customer_analytics;
grant role sensitive_analytics_qa__web_analytics__beta_abandoned_search to role analyst_customer_analytics;
grant role sensitive_analytics_prd__web_analytics__beta_abandoned_search to role analyst_customer_analytics;
grant role sensitive_responsys_read to role analyst_customer_analytics;
grant role sensitive_sabre_pnr_read to role analyst_customer_analytics;
grant role sensitive_sabre_acs_read to role analyst_customer_analytics;
grant role "CUSTOMERANALYTICS-SNOWFLAKE" to role "CUSTOMER360";

-- analyst_customer_experience_programs
create role if not exists analyst_customer_experience_programs;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_customer_experience_programs') }}
{% endif %}
grant role analyst to role analyst_customer_experience_programs;
grant role sensitive_sabre_acs_read to role analyst_customer_experience_programs;
grant role sensitive_sabre_epr_read to role analyst_customer_experience_programs;
grant role analyst_customer_experience_programs to role "CUSTOMER EXPERIENCE PROGRAMS";

-- analyst_customer_insights
create role if not exists analyst_customer_insights;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_customer_insights') }}
{% endif %}
grant role analyst to role analyst_customer_insights;
grant role sensitive_qualtrics_read_qa to role analyst_customer_insights;
grant role analyst_customer_insights to role CUSTOMERSURVEYDATA;

-- analyst_cc21623 (Cohen, Crystal)
create role if not exists analyst_cc21623;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cc21623') }}
{% endif %}
grant role analyst to role analyst_cc21623;
grant role "CENTRALIZEDPUBS INTERNAL" to role analyst_cc21623;
grant role sensitive_analytics_prd__comply365 to role analyst_cc21623;
grant role sensitive_analytics_prd__servicenow to role analyst_cc21623;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_cc21623;
grant role analyst_cc21623 to role sysadmin;
grant role analyst_cc21623 to user "CC21623@JETBLUE.COM";

-- analyst_mdinh (Dinh, Mary)
create role if not exists analyst_mdinh;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mdinh') }}
{% endif %}
grant role analyst to role analyst_mdinh;
grant role "CENTRALIZEDPUBS INTERNAL" to role analyst_mdinh;
grant role sensitive_analytics_prd__comply365 to role analyst_mdinh;
grant role sensitive_analytics_prd__servicenow to role analyst_mdinh;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_mdinh;
grant role analyst_mdinh to role sysadmin;
grant role analyst_mdinh to user "MDINH@JETBLUE.COM";

-- analyst_digbdevelopers (DIGB DEVELOPERS)
create role if not exists analyst_digbdevelopers;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_digbdevelopers') }}
{% endif %}
grant role analyst to role analyst_digbdevelopers;
grant role analytics_web_logs_rt_read to role analyst_digbdevelopers;
grant role analytics_stg_web_logs_rt_read to role analyst_digbdevelopers;
grant role raw_web_logs_rt_read to role analyst_digbdevelopers;
grant role analyst_digbdevelopers to role sysadmin;
grant role analyst_digbdevelopers to role "DIGB DEVELOPERS";

-- analyst_dispatchsnowflake
create role if not exists analyst_dispatchsnowflake;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_dispatchsnowflake') }}
{% endif %}
grant role analyst to role analyst_dispatchsnowflake;
grant role cnst_tableau_viewers to role analyst_dispatchsnowflake;
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging__message to role analyst_dispatchsnowflake;
-- masflight shared database access
grant imported privileges on database masflight to role analyst_dispatchsnowflake;
grant role analyst_dispatchsnowflake to role sysadmin;
grant role analyst_dispatchsnowflake to role DISPATCHSNOWFLAKE;

-- analyst_egor_team
create role if not exists analyst_egor_team;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_egor_team') }}
{% endif %}
grant role analyst to role analyst_egor_team;
grant usage on database analytics_qa to role analyst_egor_team;
grant usage on schema analytics_qa.aircraft_turns to role analyst_egor_team;
grant select on all tables in schema analytics_qa.aircraft_turns to role analyst_egor_team;
grant select on future tables in schema analytics_qa.aircraft_turns to role analyst_egor_team;
grant role analyst_egor_team to role sysadmin;
grant role analyst_egor_team to role "EGOR TEAM";

-- analyst_enterprise_architecture
create role if not exists analyst_enterprise_architecture;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_enterprise_architecture') }}
{% endif %}
grant role analyst to role analyst_enterprise_architecture;
grant role byod_enterprise_architecture to role analyst_enterprise_architecture;
grant role analyst_enterprise_architecture to role sysadmin;
grant role raw_comarch_read to role "IT ENTERPRISE ARCHITECTURE CM";
grant role raw_okta_read to role "IT ENTERPRISE ARCHITECTURE CM";
grant role raw_loyalty_read to role "IT ENTERPRISE ARCHITECTURE CM";
grant role sensitive_sabre_pnr_read_qa to role "IT ENTERPRISE ARCHITECTURE CM";
grant role sensitive_sabre_pnr_read_qa to role "IT ENTERPRISE ARCHITECTURE BP";
grant role sensitive_sabre_ticket_read_qa to role "IT ENTERPRISE ARCHITECTURE CM";
grant role sensitive_sabre_ticket_read_qa to role "IT ENTERPRISE ARCHITECTURE BP";
grant role analyst_enterprise_architecture to role "IT ENTERPRISE ARCHITECTURE CM";
grant role analyst_enterprise_architecture to role "IT ENTERPRISE ARCHITECTURE BP";

-- analyst_financebusinessintelligence
create role if not exists analyst_financebusinessintelligence;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_financebusinessintelligence') }}
{% endif %}
grant role sensitive_sabre_acs_read to role analyst_financebusinessintelligence;
grant role sensitive_s3c_credit_read to role analyst_financebusinessintelligence;
grant role sensitive_sabre_csa_read to role analyst_financebusinessintelligence;
grant role sensitive_sabre_fees_read to role analyst_financebusinessintelligence;
grant role sensitive_sabre_epr_read to role analyst_financebusinessintelligence;
grant role sensitive_sabre_pnr_read to role analyst_financebusinessintelligence;
grant role sensitive_sabre_tcn_read to role analyst_financebusinessintelligence;
grant role sensitive_sabre_ticket_read to role analyst_financebusinessintelligence;
grant role sensitive_sabre_travel_bank_read to role analyst_financebusinessintelligence;
grant role analyst to role analyst_financebusinessintelligence;
grant role byod_fbi to role analyst_financebusinessintelligence;
grant role analyst_financebusinessintelligence to role financebusinessintelligence;

-- analyst_financial_planning_analysis;
create role if not exists analyst_financial_planning_analysis;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_financial_planning_analysis') }}
{% endif %}
grant role analyst to role analyst_financial_planning_analysis;
grant role sensitive_analytics_prd__crew_rt to role analyst_financial_planning_analysis;
grant role sensitive_analytics_prd__crew to role analyst_financial_planning_analysis;
grant role analyst_financial_planning_analysis to role "BLUEFP&A";

-- analyst_finance_transformation
create role if not exists analyst_finance_transformation;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_finance_transformation') }}
{% endif %}
grant role analyst to role analyst_finance_transformation;
grant role byod_payroll to role analyst_finance_transformation;
--BYOD.BLUERM
grant role byod_fpa to role analyst_finance_transformation;
grant role byod_bluerm_read to role analyst_finance_transformation;
grant role analyst_finance_transformation to role sysadmin;
grant role analyst_finance_transformation to role "FINANCE TRANSFORMATION";
grant select on all tables in schema byod.fpa to role analyst_finance_transformation;
grant select on future tables in schema byod.fpa to role analyst_finance_transformation;
grant select on all views in schema byod.fpa to role analyst_finance_transformation;
grant select on future views in schema byod.fpa to role analyst_finance_transformation;

-- analyst_financial_systems_controller
create role if not exists analyst_financial_systems_controller;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_financial_systems_controller') }}
{% endif %}
grant role analyst to role analyst_financial_systems_controller;
grant role byod_finance to role analyst_financial_systems_controller;
grant role byod_itbi_read to role analyst_financial_systems_controller;
grant role byod_bluerevforecasting_read to role analyst_financial_systems_controller;
grant role analyst_financial_systems_controller to role sysadmin;
grant role sensitive_sabre_pnr_read to role analyst_financial_systems_controller;
grant role sensitive_sabre_travel_bank_read to role analyst_financial_systems_controller;
grant role sensitive_sabre_tcn_read to role analyst_financial_systems_controller;
grant role sensitive_sabre_ticket_read to role analyst_financial_systems_controller;
grant role uat_testing to role analyst_financial_systems_controller;
grant usage on schema byod.finance to role analyst_financial_systems_controller;
grant select on all tables in schema byod.finance to role analyst_financial_systems_controller;
grant select on all views in schema byod.finance to role analyst_financial_systems_controller;
grant select on future tables in schema byod.finance to role analyst_financial_systems_controller;
grant select on future views in schema byod.finance to role analyst_financial_systems_controller;
grant role analyst_financial_systems_controller to role sysadmin;
--member
grant role analyst_rpareporting to role analyst_financial_systems_controller;
grant role analyst_financial_systems_controller to role "FINANCIAL SYSTEMS CONTROLLER GROUP";
grant role analyst_financial_systems_controller to role TCSBUSINESSINTELLIGENCE;

-- analyst_flight_ops
create role if not exists analyst_flight_ops;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_flight_ops') }}
{% endif %}
grant role analyst to role analyst_flight_ops;
-- BYOD
-- BYOD.OPA
grant select on view BYOD.OPA.vw_flightkeys_flight_plans to role Analyst_Flight_ops;
-- BYOD.FLIGHT_OPS_TEAM
grant role byod_flight_ops_team to role analyst_flight_ops;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bookings_rt__passenger to role analyst_flight_ops;
grant role sensitive_analytics_prd__bookings_rt__pnr_ticket_association to role analyst_flight_ops;
grant role sensitive_analytics_prd__bookings_rt__remark to role analyst_flight_ops;
grant role sensitive_analytics_prd__flight_operations__acars_cpdlc to role analyst_flight_ops;
grant role sensitive_analytics_prd__flight_operations__acars_cpdlc to role analyst_flight_ops;
grant role sensitive_analytics_prd__flight_operations__flight_approaches to role analyst_flight_ops;
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging to role analyst_flight_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_flight_ops;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_flight_ops;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger to role analyst_flight_ops;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_aps to role analyst_flight_ops;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_snowflake to role analyst_flight_ops;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__remark to role analyst_flight_ops;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__remark_aps to role analyst_flight_ops;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__remark_snowflake to role analyst_flight_ops;
grant role sensitive_crew_read to role analyst_flight_ops;
grant role analyst_flight_ops to role sysadmin;
grant role analyst_flight_ops to role "FLIGHT OPS LEADERSHIP";
grant role analyst_flight_ops to role "FLIGHT OPS LOGS";
grant role analyst_flight_ops to role "FLIGHT OPS TEAM";
grant role analyst_flight_ops to role "FUEL OPTIMIZATION TEAM";
grant role analyst_flight_ops to role FLIGHTOPSDATAADMINS;
grant role analyst_flight_ops to role CHIEFPILOTADMIN;
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging__message to role jbudisp;
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging__message to role dispatchsnowflake;
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging__message to role cnst_tableau_viewers;

-- analyst_fleetengineering
create role if not exists analyst_fleetengineering;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_fleetengineering') }}
{% endif %}
grant role analyst to role analyst_fleetengineering;
grant role byod_fleetengineering to role analyst_fleetengineering;
grant role analyst_fleetengineering to role sysadmin;
grant role analyst_fleetengineering to role FLEETENGINEERING;

-- analyst_fleet_captains (FLEET CAPTAINS)
create role if not exists analyst_fleet_captains;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_fleet_captains') }}
{% endif %}
grant role analyst to role analyst_fleet_captains;
grant role sensitive_analytics_prd__crew__crewmember_master__first_name to role analyst_fleet_captains;
grant role sensitive_analytics_prd__crew__crewmember_master__last_name to role analyst_fleet_captains;
grant role sensitive_analytics_prd__crew__crewmember_master__legal_first_name to role analyst_fleet_captains;
grant role sensitive_analytics_prd__crew__crewmember_master__middle_name to role analyst_fleet_captains;
grant role sensitive_analytics_prd__crew__crewmember_master__phone_number_1 to role analyst_fleet_captains;
grant role sensitive_analytics_prd__crew__crewmember_master__phone_number_2 to role analyst_fleet_captains;
grant role sensitive_analytics_prd__crew__check_airmen to role analyst_fleet_captains;
grant role sensitive_analytics_prd__flight_operations__acars_cpdlc to role analyst_fleet_captains;
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging to role analyst_fleet_captains;
grant usage on database analytics_qa to role analyst_fleet_captains;
grant role analytics_qa_tops_crew_read to role analyst_fleet_captains;
grant role analytics_qa_stg_tops_crew_read to role analyst_fleet_captains;
grant usage on schema analytics_qa.intermediary to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__bid_period_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__bid_period_details_crew_applicability to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__flights to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__flight_deadhead_bookings to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__flight_duty_period_exceedance to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__flight_duty_period_exceedance_extension_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__flight_pairing_lookup_flight_complement_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__flight_pairing_lookup_flight_qualification_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__flight_time_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__hotels to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairings to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairings_change_type_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairings_complement_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairings_complement_item_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairings_credit_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairings_indicator_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairings_qualification_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairing_duty_items to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairing_duty_items_duty_credits to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairing_duty_items_duty_item_credits to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairing_duty_items_flight_complement_requirements to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairing_duty_items_flight_qualification_requirements to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairing_duty_items_ground_movement_transport_reservations to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairing_duty_items_hotel_reservations to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__pairing_duty_items_non_paring_duty_item_credits to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_address_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_category_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_communication_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_contract_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_designation_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_document_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_employment_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_non_availability_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__profiles_placement_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__prospective_rest to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__qualifications to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__reserve_grid_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__reserve_minima_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_activity to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_activity_activity_indicator_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_activity_change_type_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_activity_credit_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_day_level_indicator to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_day_level_indicator_change_type_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_day_level_indicator_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairings to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairings_change_type_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairings_complement_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairings_complement_item_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairings_credit_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairings_pay_bucket_credit_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairings_roster_indicator_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairing_duty_items to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairing_duty_items_duty_credits to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairing_duty_items_duty_item_credits to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairing_duty_items_ground_movement_transport_reservations to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairing_duty_items_hotel_reservation_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairing_duty_items_non_pairing_duty_item_credits to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairing_duty_items_roster_item_indicator_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_pairing_duty_items_segment_complement_details to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__roster_status to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__search_by_flight_crew_member_lookup to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__search_by_flight_pairing_lookup to role analyst_fleet_captains;
grant select on table analytics_qa.intermediary.inter_tops_crew__trainings to role analyst_fleet_captains;
grant role analyst_fleet_captains to role sysadmin;
grant role analyst_fleet_captains to role "FLEET CAPTAINS";

-- analyst_flight_ops_data
create role if not exists analyst_flight_ops_data;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_flight_ops_data') }}
{% endif %}
grant role analyst to role analyst_flight_ops_data;
grant role byod_eeyore_mg to role analyst_flight_ops_data;
grant role sensitive_crew_read to role analyst_flight_ops_data;
grant role analyst_flight_ops_data to role sysadmin;
grant role analyst_flight_ops_data to role FLIGHTOPSDATA;

-- analyst_frmssupport
create role if not exists analyst_frmssupport;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_frmssupport') }}
{% endif %}
grant role analyst to role analyst_frmssupport;
grant usage on schema analytics.safety to role analyst_frmssupport;
grant select on all tables in schema analytics.safety to role analyst_frmssupport;
grant select on all views in schema analytics.safety to role analyst_frmssupport;
grant select on future tables in schema analytics.safety to role analyst_frmssupport;
grant select on future views in schema analytics.safety to role analyst_frmssupport;
grant usage on database byod to role analyst_frmssupport;
grant usage on schema byod.flight_ops_team to role analyst_frmssupport;
grant role analyst_frmssupport to role sysadmin;
grant role analyst_frmssupport to role FRMSSUPPORT;

-- analyst_operationsstrategyandengineering;
create role if not exists analyst_operationsstrategyandengineering;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_operationsstrategyandengineering') }}
{% endif %}
grant role analyst to role analyst_operationsstrategyandengineering;
grant usage on database raw to role analyst_operationsstrategyandengineering;
grant usage on schema raw.aqd to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.occurrences to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.occurrence_add_ons to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.occurrence_events to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.occurrence_type_classifications to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.event_descriptors to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.qoccurrences to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.qoccurrence_add_ons to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.qoccurrence_events to role analyst_operationsstrategyandengineering;
grant select on table raw.aqd.qoccurrence_types to role analyst_operationsstrategyandengineering;
grant usage on schema analytics.safety to role analyst_operationsstrategyandengineering;
grant select on all tables in schema analytics.safety to role analyst_operationsstrategyandengineering;
grant select on all views in schema analytics.safety to role analyst_operationsstrategyandengineering;
grant select on future tables in schema analytics.safety to role analyst_operationsstrategyandengineering;
grant select on future views in schema analytics.safety to role analyst_operationsstrategyandengineering;
grant usage on schema analytics.stg_aqd to role analyst_operationsstrategyandengineering;
grant select on all tables in schema analytics.stg_aqd to role analyst_operationsstrategyandengineering;
grant select on all views in schema analytics.stg_aqd to role analyst_operationsstrategyandengineering;
grant select on future tables in schema analytics.stg_aqd to role analyst_operationsstrategyandengineering;
grant select on future views in schema analytics.stg_aqd to role analyst_operationsstrategyandengineering;
grant select on view analytics.safety.ap_dbr_ereports to role analyst_operationsstrategyandengineering;
grant select on view analytics.safety.ap_dbr_occurrences to role analyst_operationsstrategyandengineering;
grant role analyst_operationsstrategyandengineering to role sysadmin;
grant role analyst_operationsstrategyandengineering to role operationsstrategyandengineering;

-- analyst_th90849 (Hinds, Taylor)
create role if not exists analyst_th90849;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_th90849') }}
{% endif %}
grant role analyst to role analyst_th90849;
grant role "CENTRALIZEDPUBS INTERNAL" to role analyst_th90849;
grant role sensitive_analytics_prd__comply365 to role analyst_th90849;
grant role sensitive_analytics_prd__servicenow to role analyst_th90849;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_th90849;
grant role analyst_th90849 to role sysadmin;
grant role analyst_th90849 to user "TH90849@JETBLUE.COM";

-- analyst_hospitality_programs;
create role if not exists analyst_hospitality_programs;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_hospitality_programs') }}
{% endif %}
grant role analyst to role analyst_hospitality_programs;  
-- byod
grant usage on database byod to role analyst_hospitality_programs;
--byod.airport_standards
grant usage on schema byod.airport_standards to role analyst_hospitality_programs;
grant select on future tables in schema byod.airport_standards to role analyst_hospitality_programs;
grant select, insert, update on table byod.airport_standards.lift_data to role analyst_hospitality_programs;
grant select on table analytics.lift.award_activity to role analyst_hospitality_programs;
grant role analyst_hospitality_programs to role sysadmin;
grant role analyst_hospitality_programs to role "HOSPITALITY PROGRAMS";

-- analyst_industrial_engineering_team (INDUSTRIAL ENGINEERING TEAM)
create role if not exists analyst_industrial_engineering_team;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_industrial_engineering_team') }}
{% endif %}
grant role analyst to role analyst_industrial_engineering_team;
grant role analyst_opa to role analyst_industrial_engineering_team;
grant role operationsstrategyandengineering to role analyst_industrial_engineering_team;
grant role raw_sabre_cdd_read to role analyst_industrial_engineering_team;
grant role uat_testing to role analyst_industrial_engineering_team;
--analytics.safety
grant usage on database analytics to role analyst_industrial_engineering_team;
grant usage on schema analytics.safety to role analyst_industrial_engineering_team;
grant select on table analytics.safety.event_descriptors to role analyst_industrial_engineering_team;
grant select on table analytics.safety.occurrences to role analyst_industrial_engineering_team;
grant select on table analytics.safety.occurrence_add_ons to role analyst_industrial_engineering_team;
grant select on table analytics.safety.occurrence_events to role analyst_industrial_engineering_team;
grant select on table analytics.safety.occurrence_type_classifications to role analyst_industrial_engineering_team;
grant select on table analytics.safety.qoccurrences to role analyst_industrial_engineering_team;
grant select on table analytics.safety.qoccurrence_types to role analyst_industrial_engineering_team;
grant select on table analytics.safety.qoccurrence_add_ons to role analyst_industrial_engineering_team;
grant select on table analytics.safety.qoccurrence_events to role analyst_industrial_engineering_team;
grant select on view analytics.safety.ap_dbr_ereports to role analyst_industrial_engineering_team;
grant select on view analytics.safety.ap_dbr_occurrences to role analyst_industrial_engineering_team;
grant role analyst_operationsstrategyandengineering to role analyst_industrial_engineering_team;
grant role analyst_industrial_engineering_team to role sysadmin;
grant role analyst_industrial_engineering_team to role "INDUSTRIAL ENGINEERING TEAM";

-- analyst_inflightsafety
create role if not exists analyst_inflightsafety;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_inflightsafety') }}
{% endif %}
grant role analyst to role analyst_inflightsafety;
grant usage on schema analytics.safety to role analyst_inflightsafety;
grant select on all tables in schema analytics.safety to role analyst_inflightsafety;
grant select on all views in schema analytics.safety to role analyst_inflightsafety;
grant select on future tables in schema analytics.safety to role analyst_inflightsafety;
grant select on future views in schema analytics.safety to role analyst_inflightsafety;
grant role analyst_inflightsafety to role "INFLIGHTSAFETY";

--analyst_itdataengineeringcrew
create role if not exists analyst_itdataengineeringcrew;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itdataengineeringcrew') }}
{% endif %}
-- ANALYTICS.BCUS_TRANSACTIONS
grant role analytics_bcus_transactions_read to role analyst_itdataengineeringcrew;
-- ANALYTICS.SAFETY
grant usage on schema analytics.safety to role analyst_itdataengineeringcrew;
grant select on all tables in schema analytics.safety to role analyst_itdataengineeringcrew;
grant select on all views in schema analytics.safety to role analyst_itdataengineeringcrew;
grant select on future tables in schema analytics.safety to role analyst_itdataengineeringcrew;
grant select on future views in schema analytics.safety to role analyst_itdataengineeringcrew;
-- ANALYTICS.STG_AQD
grant usage on schema analytics.stg_aqd to role analyst_itdataengineeringcrew;
grant select on all tables in schema analytics.stg_aqd to role analyst_itdataengineeringcrew;
grant select on all views in schema analytics.stg_aqd to role analyst_itdataengineeringcrew;
grant select on future tables in schema analytics.stg_aqd to role analyst_itdataengineeringcrew;
grant select on future views in schema analytics.stg_aqd to role analyst_itdataengineeringcrew;
-- BYOD ROLES
grant role byod_it_data_engineering to role analyst_itdataengineeringcrew;
grant role byod_it_data_engineering_qa to role analyst_itdataengineeringcrew;
-- RAW ROLES
grant role raw_aqd_read to role analyst_itdataengineeringcrew;
-- RAW
grant usage on database raw to role analyst_itdataengineeringcrew;
grant usage on all schemas in database raw to role analyst_itdataengineeringcrew;
grant create alert on all schemas in database raw to role analyst_itdataengineeringcrew;
grant select on table raw.ifsa_rt.mosaic_greetings to role analyst_itdataengineeringcrew;
grant select on all tables in database raw to role analyst_itdataengineeringcrew;
grant select on all views in database raw to role analyst_itdataengineeringcrew;
grant select on future tables in database raw to role analyst_itdataengineeringcrew;
grant select on future views in database raw to role analyst_itdataengineeringcrew;
-- RAW_DEV
grant usage on database raw_dev to role analyst_itdataengineeringcrew;
grant usage on all schemas in database raw_dev to role analyst_itdataengineeringcrew;
grant create alert on all schemas in database raw_dev to role analyst_itdataengineeringcrew;
-- RAW_QA
grant role raw_qa_read to role analyst_itdataengineeringcrew;
grant usage on database raw_qa to role analyst_itdataengineeringcrew; 
grant usage on all schemas in database raw_qa to role analyst_itdataengineeringcrew; 
grant create alert on all schemas in database raw_qa to role analyst_itdataengineeringcrew;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__vip_customer_travel__vip_customers to role analyst_itdataengineeringcrew;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings to role analyst_itdataengineeringcrew;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings to role analyst_itdataengineeringcrew;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings to role analyst_itdataengineeringcrew;
grant role sensitive_cobrand_audit_read to role analyst_itdataengineeringcrew;
grant role sensitive_crew_read to role analyst_itdataengineeringcrew;
grant role sensitive_egor_read to role analyst_itdataengineeringcrew;
grant role sensitive_market_regions_read to role analyst_itdataengineeringcrew;
grant role sensitive_reference_read to role analyst_itdataengineeringcrew;
grant role sensitive_responsys_read to role analyst_itdataengineeringcrew;
grant role sensitive_sabre_acs_read to role analyst_itdataengineeringcrew;
grant role sensitive_sabre_csa_read to role analyst_itdataengineeringcrew;
grant role sensitive_sabre_epr_read to role analyst_itdataengineeringcrew;
grant role sensitive_sabre_fees_read to role analyst_itdataengineeringcrew;
grant role sensitive_sabre_pnr_read to role analyst_itdataengineeringcrew;
grant role sensitive_sabre_tcn_read to role analyst_itdataengineeringcrew;
grant role sensitive_sabre_ticket_read to role analyst_itdataengineeringcrew;
grant role sensitive_sabre_travel_bank_read to role analyst_itdataengineeringcrew;
grant role sensitive_web_analytics_read to role analyst_itdataengineeringcrew;
grant role sensitive_wheelchair_read to role analyst_itdataengineeringcrew;
--other roles
grant role email_notification_role__jb_notification_integration__itdataengineeringcrew to role analyst_itdataengineeringcrew;
grant role analyst_itdataengineeringcrew to role ITDATAENGINEERINGCREW;

-- analyst_itdataopscrew (ITDATAOPSCREW)
create role if not exists analyst_itdataopscrew;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itdataopscrew') }}
{% endif %}
grant role analyst to role analyst_itdataopscrew;
grant role developer to role analyst_itdataopscrew;
grant role tcsdataops to role analyst_itdataopscrew;
grant role email_notification_role__jb_notification_integration__itdataengineeringcrew to role analyst_itdataopscrew;
-- SENSITIVE ROLES
grant role sensitive_loyalty_read to role analyst_itdataopscrew;
grant role analyst_itdataopscrew to role sysadmin;
grant role analyst_itdataopscrew to role ITDATAOPSCREW;

-- analyst_itdataqa_nonprod
create role if not exists analyst_itdataqa_nonprod;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itdataqa_nonprod') }}
{% endif %}
grant role analyst to role analyst_itdataqa_nonprod;
grant role analyst_itqualityassurance_nonprod to role analyst_itdataqa_nonprod;
grant role analyst_qa to role analyst_itdataqa_nonprod;
grant role byod_it_data_engineering_qa to role analyst_itdataqa_nonprod;
grant role developer to role analyst_itdataqa_nonprod;
grant role transformer_dev to role analyst_itdataqa_nonprod;
grant role uat_testing to role analyst_itdataqa_nonprod;
--analytics roles
grant usage on schema analytics.stg_aircraft_sensors to role analyst_itdataqa_nonprod;
grant select on all views in schema analytics.stg_aircraft_sensors to role analyst_itdataqa_nonprod;
grant select on future views in schema analytics.stg_aircraft_sensors to role analyst_itdataqa_nonprod;
grant select on all tables in schema analytics.stg_aircraft_sensors to role analyst_itdataqa_nonprod;
grant select on future tables in schema analytics.stg_aircraft_sensors to role analyst_itdataqa_nonprod;
grant usage on schema analytics.stg_reference_legacy to role analyst_itdataqa_nonprod;
grant select on view analytics.stg_reference_legacy.dim_locations to role analyst_itdataqa_nonprod;
grant select on view analytics.aircraft_turns.gate_operations_reports to role analyst_itdataqa_nonprod;
grant usage on schema analytics.stg_egor to role analyst_itdataqa_nonprod;
grant select on all views in schema analytics.stg_egor to role analyst_itdataqa_nonprod;
grant select on future views in schema analytics.stg_egor to role analyst_itdataqa_nonprod;
grant select on all tables in schema analytics.stg_egor to role analyst_itdataqa_nonprod;
grant select on future views in schema analytics.stg_egor to role analyst_itdataqa_nonprod;
grant role analytics_reference_read to role analyst_itdataqa_nonprod;
grant role analytics_stg_reference_read to role analyst_itdataqa_nonprod;
--analytics_clone roles
grant usage on database analytics_clone to role analyst_itdataqa_nonprod;
grant usage on schema analytics_clone.reference to role analyst_itdataqa_nonprod;
grant select on all tables in schema analytics_clone.reference to role analyst_itdataqa_nonprod;
grant select on all views in schema analytics_clone.reference to role analyst_itdataqa_nonprod;
grant select on future tables in schema analytics_clone.reference to role analyst_itdataqa_nonprod;
grant select on future views in schema analytics_clone.reference to role analyst_itdataqa_nonprod;
grant usage on schema analytics_clone.stg_reference to role analyst_itdataqa_nonprod;
grant select on all tables in schema analytics_clone.stg_reference to role analyst_itdataqa_nonprod;
grant select on all views in schema analytics_clone.stg_reference to role analyst_itdataqa_nonprod;
grant select on future tables in schema analytics_clone.stg_reference to role analyst_itdataqa_nonprod;
grant select on future views in schema analytics_clone.stg_reference to role analyst_itdataqa_nonprod;
-- raw 
grant usage on database raw to role analyst_itdataqa_nonprod;
-- RAW.ASTUTE
grant role raw_astute_read to role analyst_itdataqa_nonprod;
-- RAW.CARDINAL_COMMERCE
grant role raw_cardinal_commerce_read to role analyst_itdataqa_nonprod;
-- RAW.CREW
grant role raw_crew_read to role analyst_itdataqa_nonprod;
-- RAW.EGOR
grant usage on schema raw.egor to role analyst_itdataqa_nonprod;
grant select on table raw.egor.egor_rt_messages to role analyst_itdataqa_nonprod;
-- RAW.FLIGHTKEYS
grant role raw_flightkeys_read to role analyst_itdataqa_nonprod;
-- RAW.FLIGHT_LINK
grant role raw_flight_link_read to role analyst_itdataqa_nonprod;
-- RAW.NOTIFICATION_MANAGER
grant usage on schema raw.notification_manager to role analyst_itdataqa_nonprod;
grant select on table raw.notification_manager.notification_manager_events to role analyst_itdataqa_nonprod;
-- RAW.REFERENCE
grant role raw_reference_read to role analyst_itdataqa_nonprod;
-- RAW.REFERENCE_CLONE
grant role raw_reference_clone_read to role analyst_itdataqa_nonprod;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__aircraft_turns__gate_operations_reports_history to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_prd__baggage to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_prd__fees to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_prd__stg_egor__egor_rt to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__agent_sales_reports to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__analytics__travelers_fact to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__bookings_rt__passenger to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__check_ins_rt__passengers to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__intermediary__inter_acs_rt__acs_passenger_records to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__intermediary__inter_analytics__travelers_fact to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__intermediary__inter_pnr_rt__pnr_passenger to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__loyalty to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__stg_sabre_acs_rt__passengers to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__stg_sabre_asr_batch to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__stg_sabre_pnr_rt__passenger_snowflake to role analyst_itdataqa_nonprod;
grant role sensitive_analytics_qa__stg_sabre_pnr_rt__travelers_fact to role analyst_itdataqa_nonprod;
grant role sensitive_raw_prd__comarch to role analyst_itdataqa_nonprod;
grant role sensitive_raw_qa__comarch to role analyst_itdataqa_nonprod;
grant role sensitive_sabre_acs_read_qa to role analyst_itdataqa_nonprod;
grant role sensitive_sabre_tcn_read_qa to role analyst_itdataqa_nonprod;
grant role analyst_itdataqa_nonprod to role sysadmin;
grant role analyst_itdataqa_nonprod to role "ITDATAQA-NONPROD";

-- analyst_itdigitaloperations (IT DIGITAL OPERATIONS)
create role if not exists analyst_itdigitaloperations;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itdigitaloperations') }}
{% endif %}
grant role analyst to role analyst_itdigitaloperations;
grant role "BLUE DIGITAL & CUSTOMER PRODUCTS" to role analyst_itdigitaloperations;
grant role byod_itdigitaloperations to role analyst_itdigitaloperations;
grant usage on database byod to role analyst_itdigitaloperations;
grant usage on schema byod.itdigitaloperations to role analyst_itdigitaloperations;
grant select on all tables in schema byod.itdigitaloperations to role analyst_itdigitaloperations;
grant select on table byod.itdigitaloperations.intent_product_map to role analyst_itdigitaloperations;
grant role analyst_itdigitaloperations to role sysadmin;
grant role analyst_itdigitaloperations to role "IT DIGITAL OPERATIONS";

-- analyst_inflightanalysts
create role if not exists analyst_inflightanalysts;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_inflightanalysts') }}
{% endif %}
grant role analyst to role analyst_inflightanalysts;
grant role sensitive_crew_read to role analyst_inflightanalysts;
grant role analyst_inflightanalysts to role INFLIGHTANALYSTS;
grant role analyst_inflightanalysts to role sysadmin;

-- analyst_interiorsengineering
create role if not exists analyst_interiorsengineering;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_interiorsengineering') }}
{% endif %}
grant role analyst to role analyst_interiorsengineering;
grant role byod_interiors_engineering to role analyst_interiorsengineering;
grant role analyst_interiorsengineering to role sysadmin;
grant role analyst_interiorsengineering to role INTERIORSENGINEERING;

-- analyst_itbusinessintelligence
create role if not exists analyst_itbusinessintelligence;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itbusinessintelligence') }}
{% endif %}
grant select on view analytics.crew.crewmember_badges_sap to role analyst_itbusinessintelligence;
--analytics.intermediary
grant usage on schema analytics.intermediary to role analyst_itbusinessintelligence;
grant select on table analytics.intermediary.inter_loyalty_rt__member_profile to role analyst_itbusinessintelligence;
-- analytics.loyalty_rt
grant usage on schema analytics.loyalty_rt to role analyst_itbusinessintelligence;
grant select on view analytics.loyalty_rt.member_profiles to role analyst_itbusinessintelligence;
--analytics.stg_loyalty_rt
grant usage on schema analytics.stg_loyalty_rt to role analyst_itbusinessintelligence;
grant select on view analytics.stg_loyalty_rt.member_profile to role analyst_itbusinessintelligence;
--analytics.stg_sap_reports
grant usage on schema analytics.stg_sap_reports to role analyst_itbusinessintelligence;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_itbusinessintelligence;
grant usage on schema raw.loyalty_rt to role analyst_itbusinessintelligence;
grant select on table raw.loyalty_rt.member_profile to role analyst_itbusinessintelligence;
grant usage on schema raw.sap_reports to role analyst_itbusinessintelligence;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_itbusinessintelligence;
grant usage on schema raw.rainmaker to role analyst_itbusinessintelligencecrew;
grant select on future tables in schema raw.rainmaker to role analyst_itbusinessintelligencecrew;
grant select on all tables in schema raw.rainmaker to role analyst_itbusinessintelligencecrew;
grant role raw_trax_read to role analyst_itbusinessintelligence;
grant role raw_servicenow_read to role analyst_itbusinessintelligence;
grant role byod_finance to role analyst_itbusinessintelligence;
grant role byod_itbi to role analyst_itbusinessintelligence;
grant role byod_opa_read to role analyst_itbusinessintelligence;
-- ANALYTICS_QA.ANALYTICS
grant usage on schema ANALYTICS_QA.ANALYTICS to role analyst_itbusinessintelligence;
grant select on table ANALYTICS_QA.ANALYTICS.CREW_FACT_RT to role analyst_itbusinessintelligence;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_itbusinessintelligence;
grant role sensitive_analytics_prd__data_exports__delivery_channel to role analyst_itbusinessintelligence;
grant role sensitive_analytics_prd__data_exports__notification_recipient to role analyst_itbusinessintelligence;
grant role sensitive_analytics_prd__datacamp to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles to role analyst_itbusinessintelligence;
grant role sensitive_analytics_prd__safety to role analyst_itbusinessintelligence;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_itbusinessintelligence;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_itbusinessintelligence;
grant role sensitive_analytics_qa__analytics__crew_fact_rt to role analyst_itbusinessintelligence;
grant role sensitive_analytics_qa__crew__crewmember_master to role analyst_itbusinessintelligence;
grant role sensitive_analytics_qa__crew_rt__crewmember_master to role analyst_itbusinessintelligence;
grant role sensitive_analytics_qa__stg_sabre_crewtrac__crewmember_master to role analyst_itbusinessintelligence;
grant role sensitive_cobrand_audit_read to role analyst_itbusinessintelligence;
grant role sensitive_crew_read to role analyst_itbusinessintelligence;
grant role sensitive_customers_rt_read to role analyst_itbusinessintelligence;
grant role sensitive_s3c_credit_read to role analyst_itbusinessintelligence;
grant role sensitive_sabre_acs_read to role analyst_itbusinessintelligence;
grant role sensitive_sabre_csa_read to role analyst_itbusinessintelligence;
grant role sensitive_sabre_epr_read to role analyst_itbusinessintelligence;
grant role sensitive_sabre_fees_read to role analyst_itbusinessintelligence;
grant role sensitive_sabre_pnr_read to role analyst_itbusinessintelligence;
grant role sensitive_sabre_tcn_read to role analyst_itbusinessintelligence;
grant role sensitive_sabre_ticket_read to role analyst_itbusinessintelligence;
grant role sensitive_sabre_travel_bank_read to role analyst_itbusinessintelligence;
grant role sensitive_wheelchair_read to role analyst_itbusinessintelligence;
--warehouse
grant monitor on warehouse reporting_prd_xs_wh to role analyst_itbusinessintelligence;
grant monitor on warehouse reporting_prd_s_wh to role analyst_itbusinessintelligence;
grant monitor on warehouse reporting_prd_m_wh to role analyst_itbusinessintelligence;
grant monitor on warehouse reporting_prd_l_wh to role analyst_itbusinessintelligence;
-- grant monitor on warehouse bi_prd_xs_wh to role analyst_itbusinessintelligence;
-- grant monitor on warehouse bi_prd_s_wh to role analyst_itbusinessintelligence;
-- grant monitor on warehouse bi_prd_m_wh to role analyst_itbusinessintelligence;
-- grant monitor on warehouse bi_prd_l_wh to role analyst_itbusinessintelligence;
--member bi_prd
grant role analyst_itbusinessintelligence to role bi_prd;
grant role sensitive_analytics_prd__data_exports__delivery_channel to role bi_prd;
grant role sensitive_analytics_prd__data_exports__notification_recipient to role bi_prd;
grant role sensitive_analytics_prd__loyalty__account_merges to role bi_prd;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role bi_prd;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role bi_prd;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role bi_prd;
grant role sensitive_analytics_prd__loyalty__card_moves to role bi_prd;
grant role sensitive_analytics_prd__loyalty__card_move_history to role bi_prd;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role bi_prd;
grant role sensitive_analytics_prd__loyalty__corporate to role bi_prd;
grant role sensitive_analytics_prd__loyalty__corporate_history to role bi_prd;
grant role sensitive_analytics_prd__loyalty__member_profiles to role bi_prd;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role bi_prd;
grant role sensitive_analytics_prd__loyalty__partners to role bi_prd;
grant role sensitive_analytics_prd__loyalty__redemptions to role bi_prd;
grant role sensitive_analytics_prd__loyalty__redemption_history to role bi_prd;
grant role sensitive_analytics_prd__loyalty__users to role bi_prd;
grant role analyst_itbusinessintelligence to role ITBUSINESSINTELLIGENCECREW;
grant role sensitive_analytics_prd__notification_manager__bso_reflight_regid to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__bso_unload_regid to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__cc_reassigned_guardian_to_old to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__close_to_mosaic to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__cobrand_anniversary to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__delivery_channel to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__family_pooling_invite_accepted_inviter to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__itinerary_receipt_email_confirmation to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__messages to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__mosaic_20k_benefit to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__notification_recipient to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__responsys_itinerary_emails to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__responsys_marketing_emails to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__trueblue_activate_password_terms_conditions to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__trueblue_child_registration to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__trueblue_password_reset to role itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__trueblue_password_reset_confirmation to role itbusinessintelligencecrew;

-- analyst_itbusinessintelligence_qa
create role if not exists analyst_itbusinessintelligence_qa;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itbusinessintelligence_qa') }}
{% endif %}
grant role sensitive_cobrand_audit_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_crew_read to role analyst_itbusinessintelligence_qa;
grant role sensitive_s3c_credit_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_sabre_csa_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_sabre_fees_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_sabre_epr_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_sabre_pnr_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_sabre_tcn_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_sabre_ticket_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_sabre_travel_bank_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_wheelchair_read_qa to role analyst_itbusinessintelligence_qa;
grant role sensitive_analytics_qa__analytics to role analyst_itbusinessintelligence_qa;
grant role sensitive_analytics_qa__crew to role analyst_itbusinessintelligence_qa;
--member
grant role analyst_itbusinessintelligence_qa to role ITBUSINESSINTELLIGENCECREW;
grant role analyst_itbusinessintelligence_qa to role TCSBUSINESSINTELLIGENCE;

-- analyst_itbusinessintelligencecrew
create role if not exists analyst_itbusinessintelligencecrew;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itbusinessintelligencecrew') }}
{% endif %}
grant role analyst to role analyst_itbusinessintelligencecrew;
-- analytics_clone
grant usage on database analytics_clone to role analyst_itbusinessintelligencecrew;
-- analytics_clone.bookings_rt
grant usage on schema analytics_clone.bookings_rt to role analyst_itbusinessintelligencecrew;
grant select on all tables in schema analytics_clone.bookings_rt to role analyst_itbusinessintelligencecrew;
grant select on all views in schema analytics_clone.bookings_rt to role analyst_itbusinessintelligencecrew;
-- analytics_clone.intermediary
grant usage on schema analytics_clone.intermediary to role analyst_itbusinessintelligencecrew;
grant select on all tables in schema analytics_clone.intermediary to role analyst_itbusinessintelligencecrew;
grant select on all views in schema analytics_clone.intermediary to role analyst_itbusinessintelligencecrew;
-- analytics_clone.stg_sabre_pnr_rt
grant usage on schema analytics_clone.stg_sabre_pnr_rt to role analyst_itbusinessintelligencecrew;
grant select on all tables in schema analytics_clone.stg_sabre_pnr_rt to role analyst_itbusinessintelligencecrew;
grant select on all views in schema analytics_clone.stg_sabre_pnr_rt to role analyst_itbusinessintelligencecrew;
--analytics roles
grant usage on schema analytics.crew to role analyst_itbusinessintelligencecrew;
grant select on all tables in schema analytics.crew to role analyst_itbusinessintelligencecrew;
grant select on all views in schema analytics.crew to role analyst_itbusinessintelligencecrew;
grant select on future tables in schema analytics.crew to role analyst_itbusinessintelligencecrew;
grant select on future views in schema analytics.crew to role analyst_itbusinessintelligencecrew;
grant usage on schema analytics.stg_sap_reports to role analyst_itbusinessintelligencecrew; 
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_itbusinessintelligencecrew;
grant usage on schema analytics.safety to role analyst_itbusinessintelligencecrew;
grant select on all tables in schema analytics.safety to role analyst_itbusinessintelligencecrew;
grant select on all views in schema analytics.safety to role analyst_itbusinessintelligencecrew;
grant select on future tables in schema analytics.safety to role analyst_itbusinessintelligencecrew;
grant select on future views in schema analytics.safety to role analyst_itbusinessintelligencecrew;
grant usage on schema analytics.stg_sap_reports to role analyst_itbusinessintelligencecrew; 
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_itbusinessintelligencecrew;
--byod roles
grant usage on database byod to role analyst_itbusinessintelligencecrew;
grant usage on schema byod.bluerm to role analyst_itbusinessintelligencecrew;
grant select on table byod.bluerm.flight_leg_revenue_forecast to role analyst_itbusinessintelligencecrew;
grant usage on schema byod.crew_analytics to role analyst_itbusinessintelligencecrew;
grant select on view byod.crew_analytics.vw_premiumdashboard_daily to role analyst_itbusinessintelligencecrew;
grant select on view byod.crew_analytics.vw_premium_and_financeforecast to role analyst_itbusinessintelligencecrew;
grant role byod_itdatascience_read to role analyst_itbusinessintelligencecrew;
--raw roles
grant usage on database raw to role analyst_itbusinessintelligencecrew;
grant usage on schema raw.sap_reports to role analyst_itbusinessintelligencecrew;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_itbusinessintelligencecrew;
grant role raw_baggage_read to role analyst_itbusinessintelligencecrew;
grant role raw_mparticle_read to role analyst_itbusinessintelligencecrew;
--sensitive roles
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__comply365 to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__springshot__crewmember_messages to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__vip_customer_travel__vip_customers to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__crew__crewmember_sap_details to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__data_exports__delivery_channel__email_id to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__data_exports__notification_recipient__first_name to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__data_exports__notification_recipient__last_name to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__delivery_channel__email_id to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__notification_recipient__first_name to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__notification_manager__notification_recipient__last_name to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__servicenow__comply_form_comply_data to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__stg_notification_manager__stg_delivery_channel__email_id to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__stg_notification_manager__stg_notification_recipient__first_name to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__stg_notification_manager__stg_notification_recipient__last_name to role analyst_itbusinessintelligencecrew;
grant role sensitive_analytics_prd__aircraft_turns__egor_crew_checkins__crewmember_name to role analyst_itbusinessintelligencecrew;
-- raw roles
-- raw.sabre_pnr_rt_read
grant role raw_sabre_pnr_rt_read to role analyst_itbusinessintelligencecrew;
--other roles
grant role analyst_itbusinessintelligencecrew to role sysadmin;
grant role analyst_itbusinessintelligencecrew to role itbusinessintelligencecrew;

-- analyst_itcexcmsystems_sg
create role if not exists analyst_itcexcmsystems_sg;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itcexcmsystems_sg') }}
{% endif %}
grant role analyst to role analyst_itcexcmsystems_sg;
grant role sensitive_analytics_prd__check_ins to role analyst_itcexcmsystems_sg;
grant role byod_sscstrategicplanning to role analyst_itcexcmsystems_sg;
grant role raw_sabre_pnr_rt_read to role analyst_itcexcmsystems_sg;
grant role sensitive_analytics_prd__bookings_rt__remark_history to role analyst_itcexcmsystems_sg;
grant role sensitive_analytics_prd__employee_profile_record to role analyst_itcexcmsystems_sg;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_itcexcmsystems_sg;
grant role sensitive_sabre_travel_bank_read to role analyst_itcexcmsystems_sg;
grant role analyst_itcexcmsystems_sg to role sysadmin;
grant role analyst_itcexcmsystems_sg to role itcexcmsystems_sg;

-- analyst_itconsulting
create role if not exists analyst_itconsulting;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itconsulting') }}
{% endif %}
grant role analyst to role analyst_itconsulting;
grant role sensitive_analytics_prd__tickets to role analyst_itconsulting;
grant role analyst_itconsulting to role sysadmin;
grant role analyst_itconsulting to role ITCONSULTING;

-- analyst_itcts
create role if not exists analyst_itcts;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itcts') }}
{% endif %}
grant role analyst to role analyst_itcts;
grant role raw_servicenow_read to role analyst_itcts;
grant role raw_avaya_cms_read to role analyst_itcts;
grant role analyst_itcts to role "IT CTS";

--  analyst_itdataproductscrew
create role if not exists analyst_itdataproductscrew;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itdataproductscrew') }}
{% endif %}
grant role analyst to role analyst_itdataproductscrew;
grant usage on database raw to role analyst_itdataproductscrew;
grant usage on all schemas in database raw to role analyst_itdataproductscrew;
grant select on all tables in database raw to role analyst_itdataproductscrew;
grant select on future tables in database raw to role analyst_itdataproductscrew;
grant select on all views in database raw to role analyst_itdataproductscrew;
grant select on future views in database raw to role analyst_itdataproductscrew;
grant usage on database raw_qa to role analyst_itdataproductscrew;
grant usage on all schemas in database raw_qa to role analyst_itdataproductscrew;
grant select on all tables in database raw_qa to role analyst_itdataproductscrew;
grant select on future tables in database raw_qa to role analyst_itdataproductscrew;
grant select on all views in database raw_qa to role analyst_itdataproductscrew;
grant select on future views in database raw_qa to role analyst_itdataproductscrew;
grant role analyst_itdataproductscrew to role sysadmin;
grant role analyst_itdataproductscrew to role ITDATAPRODUCTSCREW;

-- analyst_itdatascience
create role if not exists analyst_itdatascience;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itdatascience') }}
{% endif %}
grant role analyst to role analyst_itdatascience;
-- analytics
grant usage on database analytics to role analyst_itdatascience;
-- analytics.crew_pay
grant usage on schema analytics.crew_pay to role analyst_itdatascience;
grant select on all tables in schema analytics.crew_pay to role analyst_itdatascience;
grant select on future tables in schema analytics.crew_pay to role analyst_itdatascience;
grant select on all views in schema analytics.crew_pay to role analyst_itdatascience;
grant select on future views in schema analytics.crew_pay to role analyst_itdatascience;
--Sensitive Access
grant role sensitive_analytics_read to role analyst_itdatascience;
grant role sensitive_analytics_prd__crew to role analyst_itdatascience;
grant role sensitive_sabre_tcn_read to role analyst_itdatascience;
grant role sensitive_sabre_ticket_read to role analyst_itdatascience;
grant role sensitive_sabre_travel_bank_read to role analyst_itdatascience;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__first_name to role analyst_itdatascience;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__first_name to role analyst_itdatascience;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__first_name to role analyst_itdatascience;
grant usage on schema analytics.stg_loyalty_rt to role analyst_itdatascience; 
grant select on view analytics.stg_loyalty_rt.member_profile to role analyst_itdatascience;
-- byod.route_planning
grant usage on schema byod.route_planning to analyst_itdatascience; 
grant select on table byod.route_planning.pl_data_v2 to analyst_itdatascience;
--byod
grant role byod_bluemktanalytics to role analyst_itdatascience;
grant role byod_bluereliabilityengineering to role analyst_itdatascience;
grant role byod_crewanalytics to role analyst_itdatascience;
grant role byod_it_data_engineering_qa to role analyst_itdatascience;
grant role byod_itdatascience to role analyst_itdatascience;
-- raw
grant usage on database raw to role analyst_itdatascience;
-- raw.rainmaker
grant usage on schema raw.rainmaker to role analyst_itdatascience;
grant select on all tables in schema raw.rainmaker to role analyst_itdatascience;
grant select on future tables in schema raw.rainmaker to role analyst_itdatascience;
grant select on all views in schema raw.rainmaker to role analyst_itdatascience;
grant select on future views in schema raw.rainmaker to role analyst_itdatascience;
grant role analyst_itdatascience to role sysadmin;
grant role analyst_itdatascience to role ITDATASCIENCECREW;

-- ANALYST_ITDATAQA-PROD
create role if not exists "ANALYST_ITDATAQA-PROD";
{% if revoke_first %}
{{ revoke_roles_from_role('"ANALYST_ITDATAQA-PROD"') }}
{% endif %}
grant role analyst to role "ANALYST_ITDATAQA-PROD";
grant role developer to role "ANALYST_ITDATAQA-PROD";
grant role uat_testing to role "ANALYST_ITDATAQA-PROD";
-- RAW
grant usage on database raw to role "ANALYST_ITDATAQA-PROD";
-- RAW.ASTUTE
grant usage on schema raw.astute to role "ANALYST_ITDATAQA-PROD";
grant select on all tables in schema raw.astute to role "ANALYST_ITDATAQA-PROD";
grant select on all views in schema raw.astute to role "ANALYST_ITDATAQA-PROD";
grant select on future tables in schema raw.astute to role "ANALYST_ITDATAQA-PROD";
grant select on future views in schema raw.astute to role "ANALYST_ITDATAQA-PROD";
--ANALYTICS
grant usage on database analytics to role "ANALYST_ITDATAQA-PROD";
-- ANALYTICS.ASTUTE
grant usage on schema analytics.astute to role "ANALYST_ITDATAQA-PROD";
grant select on all tables in schema analytics.astute to role "ANALYST_ITDATAQA-PROD";
grant select on all views in schema analytics.astute to role "ANALYST_ITDATAQA-PROD";
grant select on future tables in schema analytics.astute to role "ANALYST_ITDATAQA-PROD";
grant select on future views in schema analytics.astute to role "ANALYST_ITDATAQA-PROD";
grant role "ANALYST_ITDATAQA-PROD" to role sysadmin;
grant role "ANALYST_ITDATAQA-PROD" to role "ITDATAQA-PROD";

-- analyst_itloyaltysolutions
create role if not exists analyst_itloyaltysolutions;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itloyaltysolutions') }}
{% endif %}
grant role analyst to role analyst_itloyaltysolutions;
grant role analyst to role byod_itloyaltysolutions;
grant role byod_itloyaltysolutions to role analyst_itloyaltysolutions;
grant role analyst_itloyaltysolutions to role sysadmin;
grant role analyst_itloyaltysolutions to role itloyaltysolutions;

-- analyst_it_manage_your_booking
create role if not exists analyst_it_manage_your_booking;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_it_manage_your_booking') }}
{% endif %}
grant role analyst to role analyst_it_manage_your_booking;
grant usage on database analytics_qa to role analyst_it_manage_your_booking;
grant usage on all schemas in database analytics_qa to role analyst_it_manage_your_booking;
grant select on all tables in database analytics_qa to role analyst_it_manage_your_booking;
grant select on future tables in database analytics_qa to role analyst_it_manage_your_booking;
grant select on all views in database analytics_qa to role analyst_it_manage_your_booking;
grant select on future views in database analytics_qa to role analyst_it_manage_your_booking;
grant role analyst_it_manage_your_booking to role sysadmin;
grant role analyst_it_manage_your_booking to role "IT MANAGE YOUR BOOKING";

-- analyst_it_product_engineering_domains
create role if not exists analyst_it_product_engineering_domains;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_it_product_engineering_domains') }}
{% endif %}
grant role analyst to role analyst_it_product_engineering_domains;
grant role raw_customers_rt_read to role analyst_it_product_engineering_domains;
grant role raw_baggage_read to role analyst_it_product_engineering_domains;
grant role raw_sabre_pnr_rt_read to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__baggage to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__bookings to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__bookings_rt to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__cobrand to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__cobrand_audit to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__crew to role analyst_it_product_engineering_domains; 
grant role sensitive_analytics_prd__crew_rt to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__customers_rt to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__intermediary to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__loyalty to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__notification_manager to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__stg_baggage to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_it_product_engineering_domains;
-- analytics.stg_notification_manager
grant usage on schema analytics.stg_notification_manager to role analyst_it_product_engineering_domains;
grant select on all tables in schema analytics.stg_notification_manager to role analyst_it_product_engineering_domains;
grant select on all views in schema analytics.stg_notification_manager to role analyst_it_product_engineering_domains;
grant select on future tables in schema analytics.stg_notification_manager to role analyst_it_product_engineering_domains;
grant select on future views in schema analytics.stg_notification_manager to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_it_product_engineering_domains;
--raw.notification_manager
grant role raw_notification_manager_read to role analyst_it_product_engineering_domains;
grant role sensitive_analytics_prd__tickets_rt to role analyst_it_product_engineering_domains;
grant role analyst_it_product_engineering_domains to role sysadmin;
grant role analyst_it_product_engineering_domains to role "IT PRODUCT ENGINEERING DOMAINS";

-- analyst_it_cobrand_and_email
create role if not exists analyst_it_cobrand_and_email;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_it_cobrand_and_email') }}
{% endif %}
grant role analyst to role analyst_it_cobrand_and_email;
grant role byod_digitalcommerce to role analyst_it_cobrand_and_email;
grant role sensitive_analytics_qa__sabre_travel_bank to role analyst_it_cobrand_and_email;
grant role analyst_it_cobrand_and_email to role sysadmin;
grant role analyst_it_cobrand_and_email to role "IT COBRAND & EMAIL";

-- analyst_itqualityassurance
create role if not exists analyst_itqualityassurance;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itqualityassurance') }}
{% endif %}
grant role analyst to role analyst_itqualityassurance;
grant role byod_itqa to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_itqualityassurance;
grant role sensitive_analytics_prd__loyalty__users to role analyst_itqualityassurance;
grant role sensitive_analytics_qa__crew to role analyst_itqualityassurance;
grant role sensitive_analytics_qa__crew_rt to role analyst_itqualityassurance;
grant role sensitive_analytics_qa__stg_crew to role analyst_itqualityassurance;
grant role sensitive_analytics_qa__stg_sabre_crewtrac to role analyst_itqualityassurance;
grant role sensitive_cobrand_audit_read to role analyst_itqualityassurance;
-- raw 
grant role raw_baggage_read to role analyst_itqualityassurance;
grant role raw_bill_of_rights_read to role analyst_itqualityassurance;
-- raw.crew
grant usage on schema raw.crew to role analyst_itqualityassurance;
grant select on table raw.crew.fh to role analyst_itqualityassurance;
grant select on table raw.crew.fl to role analyst_itqualityassurance; 
grant select on table raw.crew.mp to role analyst_itqualityassurance;
grant role raw_customers_rt_read to role analyst_itqualityassurance;
grant role raw_flight_rt_read to role analyst_itqualityassurance;
grant role raw_loyalty_rt_read to role analyst_itqualityassurance;
grant usage on schema raw.flight_rt to role analyst_itqualityassurance_nonprod;
grant role analyst_itqualityassurance to role sysadmin;
grant role analyst_itqualityassurance to role "ITDATATESTING-SG";

-- analyst_itqualityassurance_nonprod
create role if not exists analyst_itqualityassurance_nonprod;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itqualityassurance_nonprod') }}
{% endif %}
grant role analyst to role analyst_itqualityassurance_nonprod;
grant role byod_itqa to role analyst_itqualityassurance_nonprod;
grant role raw_barclays_read to role analyst_itqualityassurance_nonprod;
grant role raw_responsys_read to role analyst_itqualityassurance_nonprod;
grant role sensitive_raw_prd__responsys to role analyst_itqualityassurance_nonprod;
grant role raw_trax_read to role analyst_itqualityassurance_nonprod;
grant role raw_customers_rt_read to role analyst_itqualityassurance_nonprod;
grant role raw_irops_reaccom_read to role analyst_itqualityassurance_nonprod;
grant role raw_flight_rt_read to role analyst_itqualityassurance_nonprod;
grant usage on schema raw.flight_rt to role  analyst_itqualityassurance_nonprod;
grant select on all tables in schema raw.flight_rt to role  analyst_itqualityassurance_nonprod;
grant select on all views in schema raw.flight_rt to role  analyst_itqualityassurance_nonprod;
grant select on future tables in schema raw.flight_rt to role  analyst_itqualityassurance_nonprod;
grant select on future views in schema raw.flight_rt to role  analyst_itqualityassurance_nonprod;
grant usage on database analytics to role analyst_itqualityassurance_nonprod;
grant usage on schema analytics.stg_barclays to role analyst_itqualityassurance_nonprod;
grant select on all tables in schema analytics.stg_barclays to role analyst_itqualityassurance_nonprod;
grant select on all views in schema analytics.stg_barclays to role analyst_itqualityassurance_nonprod;
grant select on future tables in schema analytics.stg_barclays to role analyst_itqualityassurance_nonprod;
grant select on future views in schema analytics.stg_barclays to role analyst_itqualityassurance_nonprod;
grant usage on schema analytics.stg_irops_reaccom to role analyst_itqualityassurance_nonprod;
grant select on all tables in schema analytics.stg_irops_reaccom to role analyst_itqualityassurance_nonprod;
grant select on all views in schema analytics.stg_irops_reaccom to role analyst_itqualityassurance_nonprod;
grant select on future tables in schema analytics.stg_irops_reaccom to role analyst_itqualityassurance_nonprod;
grant select on future views in schema analytics.stg_irops_reaccom to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__customers_rt to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__customers to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__email_addresses to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__identifications to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__phone_numbers to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__postal_addresses to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_qa__crew to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_qa__crew_rt to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_qa__stg_crew to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_qa__stg_sabre_crewtrac to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_qa__stg_sabre_asr_batch to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_qa__agent_sales_reports to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__baggage to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_qa__crew to role analyst_itqualityassurance_nonprod;
grant role sensitive_analytics_prd__email_marketing__subscribers to role analyst_itqualityassurance_nonprod;
grant role analyst_itqualityassurance_nonprod to role sysadmin;
grant role analyst_itqualityassurance_nonprod to role "ITDATAQA-NONPROD";

-- analyst_itqualitycoe
create role if not exists analyst_itqualitycoe;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itqualitycoe') }}
{% endif %}
grant role analyst to role analyst_itqualitycoe;
grant role sensitive_analytics_qa__sabre_travel_bank to role analyst_itqualitycoe;
grant role analyst_itqualitycoe to role "IT QUALITYCOE";

-- analyst_itreferencedomain;
create role if not exists analyst_itreferencedomain;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itreferencedomain') }}
{% endif %}
grant role analyst to role analyst_itreferencedomain;
grant role raw_loyalty_rt_read to role analyst_itreferencedomain;
grant role raw_customers_rt_read to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__customers_rt to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__cobrand to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__cobrand_audit to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__stg_cobrand_audit to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__loyalty to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__notification_manager to role analyst_itreferencedomain;
-- analytics.stg_notification_manager
grant usage on schema analytics.stg_notification_manager to role analyst_itreferencedomain;
grant select on all tables in schema analytics.stg_notification_manager to role analyst_itreferencedomain;
grant select on all views in schema analytics.stg_notification_manager to role analyst_itreferencedomain;
grant select on future tables in schema analytics.stg_notification_manager to role analyst_itreferencedomain;
grant select on future views in schema analytics.stg_notification_manager to role analyst_itreferencedomain;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_itreferencedomain;
--raw.notification_manager
grant role raw_notification_manager_read to role analyst_itreferencedomain;
grant role transformer_dev to role analyst_itreferencedomain;
grant role analyst_itreferencedomain to role sysadmin;
grant role analyst_itreferencedomain to role itreferencedomain;

-- analyst_it_rm_products (IT RM PRODUCTS)
create role if not exists analyst_it_rm_products;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_it_rm_products') }}
{% endif %}
grant role analyst to role analyst_it_rm_products;
grant role BLUETLB_DR to role analyst_it_rm_products;
-- analytics.stg_sabre_intelligence_exchange
grant usage on schema analytics.stg_sabre_intelligence_exchange to role analyst_it_rm_products;
grant select on all tables in schema analytics.stg_sabre_intelligence_exchange to role analyst_it_rm_products;
grant select on all views in schema analytics.stg_sabre_intelligence_exchange to role analyst_it_rm_products;
grant select on future tables in schema analytics.stg_sabre_intelligence_exchange to role analyst_it_rm_products;
grant select on future views in schema analytics.stg_sabre_intelligence_exchange to role analyst_it_rm_products;
grant role analyst_it_rm_products to role sysadmin;
grant role analyst_it_rm_products to role "IT RM PRODUCTS";

-- analyst_itsecuritycrew
create role if not exists analyst_itsecuritycrew;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itsecuritycrew') }}
{% endif %}
grant role analyst to role analyst_itsecuritycrew;
grant role byod_it_security_crew to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__analytics__beta_customers_fact to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__bookings_rt to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__bookings to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__baggage to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__customers_rt to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__loyalty to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__check_ins to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__check_ins_rt__passengers_history to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__loyalty to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_itsecuritycrew;
grant role analytics_qa_antifraud_read to role analyst_itsecuritycrew;
grant role analytics_antifraud_read to role analyst_itsecuritycrew;
grant usage on schema analytics.stg_market_regions to role analyst_itsecuritycrew;
grant select on all tables in schema analytics.stg_market_regions to role analyst_itsecuritycrew;
grant select on all views in schema analytics.stg_market_regions to role analyst_itsecuritycrew;
grant select on future tables in schema analytics.stg_market_regions to role analyst_itsecuritycrew;
grant select on future views in schema analytics.stg_market_regions to role analyst_itsecuritycrew;
grant usage on schema analytics.stg_sabre_epr to role analyst_itsecuritycrew;
grant select on all tables in schema analytics.stg_sabre_epr to role analyst_itsecuritycrew;
grant select on all views in schema analytics.stg_sabre_epr to role analyst_itsecuritycrew;
grant select on future tables in schema analytics.stg_sabre_epr to role analyst_itsecuritycrew;
grant select on future views in schema analytics.stg_sabre_epr to role analyst_itsecuritycrew;
grant usage on schema analytics.stg_sabre_fee_override to role analyst_itsecuritycrew;
grant select on all tables in schema analytics.stg_sabre_fee_override to role analyst_itsecuritycrew;
grant select on all views in schema analytics.stg_sabre_fee_override to role analyst_itsecuritycrew;
grant select on future tables in schema analytics.stg_sabre_fee_override to role analyst_itsecuritycrew;
grant select on future views in schema analytics.stg_sabre_fee_override to role analyst_itsecuritycrew;
grant usage on schema analytics.stg_sabre_tcn to role analyst_itsecuritycrew;
grant select on all tables in schema analytics.stg_sabre_tcn to role analyst_itsecuritycrew;
grant select on all views in schema analytics.stg_sabre_tcn to role analyst_itsecuritycrew;
grant select on future tables in schema analytics.stg_sabre_tcn to role analyst_itsecuritycrew;
grant select on future views in schema analytics.stg_sabre_tcn to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__stg_market_regions to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__stg_sabre_epr to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__stg_sabre_fee_override to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__stg_sabre_tcn to role analyst_itsecuritycrew;
grant role sensitive_sabre_acs_read to role analyst_itsecuritycrew;
grant role sensitive_sabre_ticket_read to role analyst_itsecuritycrew;
grant select on table byod.it_security_crew.splunk__pnr_redemptions to role analyst_itsecuritycrew;
grant select on table byod.it_security_crew.splunk__trueblue_accounts to role analyst_itsecuritycrew;
grant usage on database analytics_qa to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.antifraud to role analyst_itsecuritycrew;
grant select on view analytics_qa.antifraud.suspected_fraudster_bookings to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.loyalty_rt to role analyst_itsecuritycrew;
grant select on view analytics_qa.loyalty_rt.loyalty_fraud_customer_list to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.stg_loyalty_rt to role analyst_itsecuritycrew;
grant select on view analytics_qa.stg_loyalty_rt.loyalty_fraud_customer_list to role analyst_itsecuritycrew;
grant usage on database raw_qa to role analyst_itsecuritycrew;
grant usage on schema raw_qa.sharepoint_loyalty_fraud to role analyst_itsecuritycrew;
grant select on table raw_qa.sharepoint_loyalty_fraud.customer_tracking to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.bookings_rt to role analyst_itsecuritycrew;
grant select on view analytics_qa.bookings_rt.passenger_travel_document to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.intermediary to role analyst_itsecuritycrew;
grant select on table analytics_qa.intermediary.inter_pnr_rt__pnr_passenger_travel_document to role analyst_itsecuritycrew;
grant select on view analytics_qa.stg_sabre_pnr_rt.passenger_travel_document_snowflake to role analyst_itsecuritycrew;
grant select on table analytics_qa.intermediary.inter_tkt_rt__ticket_coupon to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.tickets_rt to role analyst_itsecuritycrew;
grant select on view analytics_qa.tickets_rt.coupon to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.stg_sabre_ticket_rt to role analyst_itsecuritycrew;
grant select on view analytics_qa.stg_sabre_ticket_rt.coupon_snowflake to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.bookings_rt to role analyst_itsecuritycrew;
grant select on view analytics_qa.bookings_rt.itinerary_air_segment to role analyst_itsecuritycrew;
grant select on table analytics_qa.intermediary.inter_pnr_rt__pnr_itinerary_air_segment to role analyst_itsecuritycrew;
grant usage on schema analytics_qa.stg_sabre_pnr_rt to role analyst_itsecuritycrew;
grant select on view analytics_qa.stg_sabre_pnr_rt.itinerary_air_segment_snowflake to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__antifraud__suspected_fraudster_bookings to role analyst_itsecuritycrew;
grant role sensitive_analytics_qa__bookings_rt__passenger_travel_document to role analyst_itsecuritycrew;
grant role sensitive_analytics_qa__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_itsecuritycrew;
grant role sensitive_analytics_qa__stg_sabre_pnr_rt__passenger_travel_document to role analyst_itsecuritycrew;
grant role sensitive_analytics_qa__loyalty_rt__loyalty_fraud_customer_list to role analyst_itsecuritycrew;
grant role sensitive_analytics_qa__stg_loyalty_rt__loyalty_fraud_customer_list to role analyst_itsecuritycrew;
-- raw cybersecurity roles
-- raw.cybersecurity_roadmaps_cybersecurity_roadmap_interface_apphsv09fxpfva1r8
grant role raw_cybersecurity_roadmaps_cybersecurity_roadmap_interface_apphsv09fxpfva1r8_read to role analyst_itsecuritycrew;
grant role analyst_itsecuritycrew to role sysadmin;
-- RAW ROLES
grant role raw_it_leadership_roadmaps_leadership_roadmaps_appapc9dpbizpphch_read to role analyst_itsecuritycrew;
grant role analyst_itsecuritycrew to role "IT SECURITY CREW";

-- analyst_ixcoreteam
create role if not exists analyst_ixcoreteam;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ixcoreteam') }}
{% endif %}
grant role analyst to role analyst_ixcoreteam;
grant role byod_ixcoreteam to role analyst_ixcoreteam;
grant role uat_testing to role analyst_ixcoreteam;
grant role sensitive_sabre_pnr_read_qa to role analyst_ixcoreteam;
grant role sensitive_sabre_ticket_read_qa to role analyst_ixcoreteam;
grant role sensitive_analytics_prd__bookings to role analyst_ixcoreteam;
grant role sensitive_analytics_prd__bookings_rt to role analyst_ixcoreteam;
grant role sensitive_analytics_prd__tickets to role analyst_ixcoreteam;
-- analytics.stg_sabre_intelligence_exchange
grant usage on schema analytics.stg_sabre_intelligence_exchange to role analyst_ixcoreteam;
grant select on all tables in schema analytics.stg_sabre_intelligence_exchange to role analyst_ixcoreteam;
grant select on table byod.enterprise_architecture.fa_analysis to role analyst_ixcoreteam;
grant select on table byod.enterprise_architecture.tb_load to role analyst_ixcoreteam;
grant select on all views in schema analytics.stg_sabre_intelligence_exchange to role analyst_ixcoreteam;
grant select on future tables in schema analytics.stg_sabre_intelligence_exchange to role analyst_ixcoreteam;
grant select on future views in schema analytics.stg_sabre_intelligence_exchange to role analyst_ixcoreteam;
grant role analyst_ixcoreteam to role sysadmin;
grant role analyst_ixcoreteam to role IXCORETEAM;

-- analyst_jbscoaches
create role if not exists analyst_jbscoaches;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jbscoaches') }}
{% endif %}
grant role analyst to role analyst_jbscoaches;
grant role analyst to role byod_jbscoaches;
grant role byod_jbscoaches to role analyst_jbscoaches;
grant role analyst_jbscoaches to role jbscoaches;

-- analyst_jbu_ame
create role if not exists analyst_jbu_ame;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jbu_ame') }}
{% endif %}
grant role analyst to role analyst_jbu_ame;
grant role byod_jbu_ame to role analyst_jbu_ame;
grant usage on database analytics to role analyst_jbu_ame;
-- analytics
grant usage on schema analytics.performitiv to role analyst_jbu_ame;
grant select on table analytics.performitiv.survey_data to role analyst_jbu_ame;
grant role sensitive_analytics_prd__performitiv__survey_data to role analyst_jbu_ame;
grant role analyst_jbu_ame to role sysadmin;
grant role analyst_jbu_ame to role "JBU AME";

-- analyst_jbu_scheduling
create role if not exists analyst_jbu_scheduling;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jbu_scheduling') }}
{% endif %}
grant role analyst to role analyst_jbu_scheduling;
grant role byod_jbu_planning to role analyst_jbu_scheduling;
grant role analytics_qa_crew_read to role analyst_jbu_scheduling;
grant role analytics_qa_crew_rt_read to role analyst_jbu_scheduling;
grant role analytics_qa_tops_crew_read to role analyst_jbu_scheduling;
grant role analyst_jbu_scheduling to role sysadmin;
grant role analyst_jbu_scheduling to role "JBU SCHEDULING TEAM";

-- analyst_jd02904 (Degeorge,Jean)
create role if not exists analyst_jd02904;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jd02904') }}
{% endif %}
grant role analyst to role analyst_jd02904;
grant role itdatasciencecrew to role analyst_jd02904;
grant usage on database raw to role analyst_jd02904;
grant usage on schema raw.servicenow to role analyst_jd02904;
grant select on future tables in schema raw.servicenow to role analyst_jd02904;
grant select on table raw.servicenow.kb_knowledge to role analyst_jd02904;
grant select on table raw.servicenow.sys_user_group to role analyst_jd02904;
grant select on table raw.servicenow.kb_category to role analyst_jd02904;
grant select on table raw.servicenow.kb_knowledge_base to role analyst_jd02904;
grant select on table raw.servicenow.user_criteria to role analyst_jd02904;
grant select on table raw.servicenow.sys_user_role to role analyst_jd02904;
grant select on table raw.servicenow.sys_user_has_role to role analyst_jd02904;
grant select on table raw.servicenow.sys_group_has_role to role analyst_jd02904;
grant role analyst_jd02904 to user "JD02904@JETBLUE.COM";

-- analyst_jday (Jeff Day)
create role if not exists analyst_jday;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jday') }}
{% endif %}
grant role analyst to role analyst_jday;
grant role loyaltytechnology to role analyst_jday;
-- BYOD.BLUELOYALTY
grant role byod_blueloyalty_read to role analyst_jday;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_jday;
grant role sensitive_analytics_prd__loyalty to role analyst_jday;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_jday;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_jday;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_jday;
grant role analyst_jday to role sysadmin;
grant role analyst_jday to user "JDAY@JETBLUE.COM";

-- analyst_jetboardsupport (jetboardsupport)
create role if not exists analyst_jetboardsupport;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jetboardsupport') }}
{% endif %}
grant role analyst to role analyst_jetboardsupport;
grant role byod_jetboardsupport to role analyst_jetboardsupport;
grant role analytics_qa_read to role analyst_jetboardsupport;
grant role analyst_jetboardsupport to role sysadmin;
grant role analyst_jetboardsupport to role  jetboardsupport;

-- analyst_jfk_mx
create role if not exists analyst_jfk_mx;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jfk_mx') }}
{% endif %}
grant role analyst to role analyst_jfk_mx;
grant role byod_jfk_mx to role analyst_jfk_mx;
grant role byod_jfk_mx_read to role analyst_jfk_mx;
grant role byod_jfk_mx_read to role monte_carlo;
grant role analyst_jfk_mx to role sysadmin;
grant role analyst_jfk_mx to role "JFK MX";

-- analyst_jtpcc_analytics_and_planning 
create role if not exists analyst_jtpcc_analytics_and_planning;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jtpcc_analytics_and_planning') }}
{% endif %}
grant role analyst to role analyst_jtpcc_analytics_and_planning;
grant role byod_wpa_read to role analyst_jtpcc_analytics_and_planning;
grant role analyst_jtpcc_analytics_and_planning to role sysadmin;
grant role analyst_jtpcc_analytics_and_planning to role "JTPCC ANALYTICS & PLANNING";

-- analyst_ka70929 (Kelcey Arnold)
create role if not exists analyst_ka70929;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ka70929') }}
{% endif %}
grant role analyst to role analyst_ka70929;
grant role "ONBOARD EXPERIENCE" to role analyst_ka70929;
grant role bluesourcingteam to role analyst_ka70929;
grant role byod_onboard_products to role analyst_ka70929;
-- RAW
grant usage on database raw to role analyst_ka70929;
-- RAW.ONBOARD_EXPERIENCE 
grant usage on schema raw.onboard_experience to role analyst_ka70929;
grant select on table raw.onboard_experience.electronic_point_of_sale to role analyst_ka70929;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__analytics__crew_fact to role analyst_ka70929;
grant role sensitive_analytics_prd__crew to role analyst_ka70929;
grant role analyst_ka70929 to role sysadmin;
grant role analyst_ka70929 to user "KA70929@JETBLUE.COM";

-- analyst_khodges (Kelly Hodges)
create role if not exists analyst_khodges;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_khodges') }}
{% endif %}
grant role analyst to role analyst_khodges;
grant role sensitive_analytics_prd__call_management to role analyst_khodges;
grant role sensitive_analytics_prd__customers_rt__phone_numbers to role analyst_khodges;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_khodges;
grant role sensitive_analytics_prd__stg_customers_rt__phone_numbers to role analyst_khodges;
grant select on table raw.informatica_customers_rt.customers to role analyst_khodges;
grant role analyst_itcexcmsystems_sg to role analyst_khodges;
grant role analyst_khodges to role sysadmin;
grant role analyst_khodges to user "KHODGES@JETBLUE.COM";

-- analyst_kihoward (Kimberly,Howard ) 
create role if not exists analyst_kihoward;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kihoward') }}
{% endif %}
grant role analyst to role analyst_kihoward;
grant role ITCEXCMSYSTEMS_SG to role analyst_kihoward;
grant role "IT SABRE CSS BAU SUPPORT" to role analyst_kihoward;
grant role "IT CEX CREWMEMBER PRODUCTS" to role analyst_kihoward;
grant role analyst_qa to role analyst_kihoward;
grant role analyst_kihoward to role sysadmin;
grant role analyst_kihoward to user "KIHOWARD@JETBLUE.COM";

-- analyst_learning_system_admin
create role if not exists analyst_learning_system_admin;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_learning_system_admin') }}
{% endif %}
grant role analyst to role analyst_learning_system_admin;
grant role analyst_learning_system_admin to role sysadmin;
grant role byod_jbu_ame to role analyst_learning_system_admin;
grant role sensitive_crew_read to role analyst_learning_system_admin;
grant role analyst_learning_system_admin to role "LEARNING SYSTEM ADMIN";

-- analyst_lgwleadership
create role if not exists analyst_lgwleadership;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_lgwleadership') }}
{% endif %}
grant role analyst to role analyst_lgwleadership;
grant role analyst_lgwleadership to role sysadmin;
grant role analyst_lgwleadership to role LGWLEADERSHIP;

-- analyst_lhrleadership
create role if not exists analyst_lhrleadership;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_lhrleadership') }}
{% endif %}
grant role analyst to role analyst_lhrleadership;
grant role analyst_lhrleadership to role sysadmin;
grant role analyst_lhrleadership to role LHRLEADERSHIP;

-- analyst_loyalty_teampartners
create role if not exists analyst_loyalty_teampartners;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_loyalty_teampartners') }}
{% endif %}
grant role analyst to role analyst_loyalty_teampartners;
grant role blueloyalty to role analyst_loyalty_teampartners;
grant role analyst_loyalty_teampartners to role sysadmin;
grant role analyst_loyalty_teampartners to role loyalty_teampartners;

-- analyst_material_planning
create role if not exists analyst_material_planning;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_material_planning') }}
{% endif %}
grant role analyst to role analyst_material_planning;
grant usage on schema analytics.aircraft_maintenance to role analyst_material_planning;
grant select on all tables in schema analytics.aircraft_maintenance to role analyst_material_planning;
grant select on future tables in schema analytics.aircraft_maintenance to role analyst_material_planning;
grant select on all views in schema analytics.aircraft_maintenance to role analyst_material_planning;
grant select on future views in schema analytics.aircraft_maintenance to role analyst_material_planning;
grant role analyst_material_planning to role sysadmin;
grant role analyst_material_planning to role "MATERIAL.PLANNING";

-- analyst_mckinsey_cx_nps
create role if not exists analyst_mckinsey_cx_nps;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mckinsey_cx_nps') }}
{% endif %}
grant role analyst to role analyst_mckinsey_cx_nps;
-- byod roles
grant role byod_mckinsey_cx_nps to role analyst_mckinsey_cx_nps;
-- sensitive roles
grant role sensitive_analytics_prd__loyalty__transaction_billings to role analyst_mckinsey_cx_nps;
--other roles 
grant role analyst_mckinsey_cx_nps to role MCKINSEY_CX_NPS;
grant role CUSTOMERSURVEYDATA to role analyst_mckinsey_cx_nps;
grant role analyst_mckinsey_cx_nps to role sysadmin;

-- analyst_mmehta (Mehta, Mehul)
create role if not exists analyst_mmehta;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mmehta') }}
{% endif %}
grant role analyst to role analyst_mmehta;
grant role "ITDATAQA-NONPROD" to role analyst_mmehta;
-- RAW_QA 
grant usage on database raw_qa to role analyst_mmehta;
grant usage on schema raw_qa.tops_crew to role analyst_mmehta;
grant select on all tables in schema raw_qa.tops_crew to role analyst_mmehta;
grant usage on schema raw_qa.crewqual to role analyst_mmehta;
grant select on table raw_qa.crewqual.pilot_time to role analyst_mmehta;
grant select on table raw_qa.crewqual.med_data to role analyst_mmehta;
-- ANALYTICS_QA
grant usage on database analytics_qa to role analyst_mmehta;
grant usage on schema analytics_qa.crew_rt to role analyst_mmehta;
grant role ANALYTICS_QA_CREW_RT_READ to role analyst_mmehta;
--sensitive roles
grant role sensitive_analytics_qa__crewqual__med_data to role analyst_mmehta;
grant role sensitive_analytics_qa__crewqual__pilot_time to role analyst_mmehta;
grant role sensitive_analytics_qa__stg_crewqual__med_data to role analyst_mmehta;
grant role sensitive_analytics_qa__stg_crewqual__pilot_time to role analyst_mmehta;
-- sensitive crewqual roles
grant role sensitive_analytics_prd__crewqual__med_data to role analyst_mmehta;
grant role sensitive_analytics_prd__crewqual__pilot_employee to role analyst_mmehta;
grant role sensitive_analytics_prd__crewqual__pilot_entry to role analyst_mmehta;
grant role sensitive_analytics_prd__crewqual__pilot_time to role analyst_mmehta;
-- sensitive qa role 
grant role sensitive_analytics_qa__crewqual__pilot_employee to role analyst_mmehta;
grant role sensitive_analytics_qa__crewqual__pilot_entry to role analyst_mmehta;
-- raw roles
grant role raw_crewqual_read to role analyst_mmehta;
-- raw_qa.crewqual
grant usage on database raw_qa to role analyst_mmehta;
grant usage on schema raw_qa.crewqual to role analyst_mmehta;
grant select on table raw_qa.crewqual.pilot_entry to role analyst_mmehta;
grant select on table raw_qa.crewqual.pilot_employee to role analyst_mmehta;
--other roles
grant role analyst_mmehta to role sysadmin;
grant role analyst_mmehta to user "MMEHTA@JETBLUE.COM";

-- analyst_mr26882 (Mitchell Rollins)
create role if not exists analyst_mr26882;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mr26882') }}
{% endif %}
grant role analyst to role analyst_mr26882;
grant role rpareporting to role analyst_mr26882;
grant role "FINANCIAL SYSTEMS CONTROLLER GROUP" to role analyst_mr26882;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__vouchers to role analyst_mr26882;
grant role analyst_mr26882 to role sysadmin;
grant role analyst_mr26882 to user "MR26882@JETBLUE.COM";

-- analyst_onprem
create role if not exists analyst_onprem;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_onprem') }}
{% endif %}
grant role analyst to role analyst_onprem;
grant usage on schema analytics_qa.intermediary to role analyst_onprem;
grant usage on schema analytics.intermediary to role analyst_onprem;
grant select on table analytics_qa.intermediary.sessions_staging to role analyst_onprem;
grant select on table analytics.intermediary.sessions_staging to role analyst_onprem;
-- analytics.stg_asapp
grant usage on schema analytics.stg_asapp to role analyst_onprem; 
grant select on all tables in schema analytics.stg_asapp to role analyst_onprem; 
grant select on all views in schema analytics.stg_asapp to role analyst_onprem;
grant select on future tables in schema analytics.stg_asapp to role analyst_onprem;
grant select on future views in schema analytics.stg_asapp to role analyst_onprem;
-- raw.asapp
grant role raw_asapp_read to role analyst_onprem;
grant role analyst_onprem to role onprem;

-- analyst_opa
create role if not exists analyst_opa;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_opa') }}
{% endif %}
grant role analyst to role analyst_opa;
grant role byod_opa to role analyst_opa;
grant role analyst_azure_data_box to role analyst_opa;
grant role byod_flight_schedules to role analyst_opa;
grant role byod_flight_schedules_dev to role analyst_opa;
grant role sensitive_egor_read to role analyst_opa;
grant role sensitive_sabre_acs_read to role analyst_opa;
grant role sensitive_sabre_epr_read to role analyst_opa;
grant role sensitive_sabre_pnr_read to role analyst_opa;
grant role sensitive_sabre_ticket_read to role analyst_opa;
grant role sensitive_sabre_travel_bank_read to role analyst_opa;
grant role analyst_opa to role sysadmin;
grant role analyst_opa to role USR_SYSPLANNINGANALYSISRO;
grant role analyst_opa to role "INDUSTRIAL ENGINEERING TEAM";
grant role analyst_opa to role "BLUE OPS ENGINEERING";
grant role analyst_opa to user SVC_AZURE_DATA_FACTORY_OPA;

-- analyst_ops_planning
create role if not exists analyst_ops_planning;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ops_planning') }}
{% endif %}
grant role analyst to role analyst_ops_planning;
grant role byod_enterprise_planning to role analyst_ops_planning;
grant usage on schema byod.enterprise_planning to role analyst_ops_planning;
grant select on all tables in schema byod.enterprise_planning to role analyst_ops_planning;
grant select on future tables in schema byod.enterprise_planning to role analyst_ops_planning;
grant select on all views in schema byod.enterprise_planning to role analyst_ops_planning;
grant select on future views in schema byod.enterprise_planning to role analyst_ops_planning;
grant role sensitive_crew_read to role analyst_ops_planning;
grant role analyst_ops_planning to role sysadmin;
grant role analyst_ops_planning to role "OPS PLANNING";

-- analyst_pairinganalysis
create role if not exists analyst_pairinganalysis;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_pairinganalysis') }}
{% endif %}
grant role analyst to role analyst_pairinganalysis;
grant role byod_airlineoptimization to role analyst_pairinganalysis;
grant role byod_flight_schedules_read to role analyst_pairinganalysis;
grant role byod_flight_schedules_dev to role analyst_pairinganalysis;
grant role byod_opa_read to role analyst_pairinganalysis;
grant usage on schema byod.flight_ops_team to role analyst_pairinganalysis;
grant select on table byod.flight_ops_team.pairing_leg_fact to role analyst_pairinganalysis;
grant role byod_crewanalytics_read to role analyst_pairinganalysis;
grant role analyst_pairinganalysis to role sysadmin;
grant role analyst_pairinganalysis to role "PAIRINGANALYSIS";

-- analyst_payroll_processing_team
create role if not exists analyst_payroll_processing_team;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_payroll_processing_team') }}
{% endif %}
grant role analyst to role analyst_payroll_processing_team;
grant role byod_payroll to role analyst_payroll_processing_team;
--sensitive roles
grant role analytics_crew_read to role analyst_payroll_processing_team;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy__crewmember_email_address to role analyst_payroll_processing_team;
grant role sensitive_analytics_prd__stg_crew__crewmember_hierarchy__crewmember_email_address to role analyst_payroll_processing_team;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy__crewleader_level_1_name to role analyst_payroll_processing_team;
grant role sensitive_analytics_prd__stg_crew__crewmember_hierarchy__crewleader_level_1_name to role analyst_payroll_processing_team;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy__crewleader_level_2_name to role analyst_payroll_processing_team;
grant role sensitive_analytics_prd__stg_crew__crewmember_hierarchy__crewleader_level_2_name to role analyst_payroll_processing_team;
--other roles
grant role analyst_payroll_processing_team to role sysadmin;
grant role analyst_payroll_processing_team to role "PAYROLL PROCESSING TEAM";

-- analyst_payroll_taxes
create role if not exists analyst_payroll_taxes;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_payroll_taxes') }}
{% endif %}
grant role analyst to role analyst_payroll_taxes;
grant role byod_payroll to role analyst_payroll_taxes;
grant role analyst_payroll_taxes to role sysadmin;
grant role analyst_payroll_taxes to role "PAYROLL TAXES";

-- analyst_pdi
create role if not exists analyst_pdi;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_opa') }}
{% endif %}
grant role analyst to role analyst_pdi;
grant role byod_pdi to role analyst_pdi;
-- BYOD
grant usage on database byod to role analyst_pdi;
--BYOD.OPA
grant usage on schema byod.opa to role analyst_pdi;
grant select on table byod.opa.delay_codes to role analyst_pdi; 
grant select on table byod.opa.goals_station to role analyst_pdi; 
grant select on table byod.opa.mishandled_baggage to role analyst_pdi; 
grant select on view byod.opa.vw_station_performance_vs_goal to role analyst_pdi; 
grant select on view byod.opa.vw_b6_bluestats to role analyst_pdi;
grant select on view byod.opa.vw_delayed_flts_info to role analyst_pdi;
grant select on view byod.opa.vw_flightkeys_flight_plans to role analyst_flight_ops;

--analyst_nh21004 (Nicole Hindle)
create role if not exists analyst_nh21004;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nh21004') }}
{% endif %}

grant role analyst to role analyst_nh21004;
grant usage on schema byod.opa to role analyst_nh21004;
grant usage on schema analytics.analytics to role analyst_nh21004;
grant select on table byod.opa.dw_air_looker_logs to role analyst_nh21004;
grant select on table analytics.analytics.flights_fact to role analyst_nh21004; 
grant role analyst_nh21004 to role sysadmin;
grant role analyst_nh21004 to user "NH21004@JETBLUE.COM";

-- analyst_ps13646 (Puneet Singh)
create role if not exists analyst_ps13646;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ps13646') }}
{% endif %}
grant role analyst to role analyst_ps13646;
grant role "CENTRALIZEDPUBS INTERNAL" to role analyst_ps13646;
grant role sensitive_analytics_prd__comply365 to role analyst_ps13646;
grant role sensitive_analytics_prd__servicenow to role analyst_ps13646;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_ps13646;
grant role analyst_ps13646 to role sysadmin;
grant role analyst_ps13646 to user "PS13646@JETBLUE.COM";
  
-- BYOD.SAFETY_BI
grant usage on schema byod.safety_bi to role analyst_pdi;
grant role raw_success_factors_read to role analyst_pdi;
grant usage on schema analytics.crew_pay to role analyst_pdi;
grant usage on schema analytics.talent_acquisition to role analyst_pdi;
grant select on all tables in schema analytics.crew_pay to role analyst_pdi;
grant select on future tables in schema analytics.crew_pay to role analyst_pdi;
grant select on all tables in schema analytics.talent_acquisition to role analyst_pdi;
grant select on all views in schema analytics.talent_acquisition to role analyst_pdi;
grant select on future tables in schema analytics.talent_acquisition to role analyst_pdi;
grant select on future views in schema analytics.talent_acquisition to role analyst_pdi;
grant usage on schema analytics_qa.talent_acquisition to role analyst_pdi;
grant select on all tables in schema analytics_qa.talent_acquisition to role analyst_pdi;
grant select on all views in schema analytics_qa.talent_acquisition to role analyst_pdi;
grant select on future views in schema analytics_qa.talent_acquisition to role analyst_pdi;
grant select on future tables in schema analytics_qa.talent_acquisition to role analyst_pdi;
--SENSITIVE ROLES
grant role sensitive_analytics_prd__crew_pay to role analyst_pdi;
grant role sensitive_analytics_prd__safety__occurrences to role analyst_pdi;
grant role sensitive_analytics_prd__stg_aqd__occurrences to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__customer_experience__recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__customer_experience_final__recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supe_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_leadership_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__diagnostic_2021__m_recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__legacy_diagnostic__m_recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__net_promotor_score_report__recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__net_promotor_scores__recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__oal_partner__m_recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__short_form__m_recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__surveys__short_form__recipient_email to role analyst_pdi;
grant role sensitive_analytics_prd__talent_acquisition__candidate_application_flow to role analyst_pdi;
grant role sensitive_analytics_prd__talent_acquisition__job_applications__gender to role analyst_pdi;
grant role sensitive_analytics_prd__talent_acquisition__job_applications__race to role analyst_pdi;
grant role sensitive_analytics_prd__talent_acquisition__job_applications_history__gender to role analyst_pdi;
grant role sensitive_analytics_prd__talent_acquisition__job_applications_history__race to role analyst_pdi;
-- analytics.safety
grant usage on schema analytics.safety to role analyst_pdi;
grant select on view analytics.safety.occurrence_events to role analyst_pdi;
grant select on view analytics.safety.event_descriptors to role analyst_pdi;
grant select on view analytics.safety.occurrences to role analyst_pdi;
grant select on view analytics.safety.occurrence_type_classifications to role analyst_pdi;
grant select on view analytics.safety.occurrence_add_ons to role analyst_pdi;
--analytics_qa.tops_crew
grant role analytics_qa_tops_crew_read to role analyst_pdi;
-- analytics.stg_aqd
grant usage on schema analytics.stg_aqd to role analyst_pdi;
grant select on view analytics.stg_aqd.event_descriptors to role analyst_pdi;
grant select on view analytics.stg_aqd.occurrences to role analyst_pdi;
grant select on view analytics.stg_aqd.occurrence_events to role analyst_pdi;
grant select on view analytics.stg_aqd.occurrence_type_classifications to role analyst_pdi;
grant select on view analytics.stg_aqd.occurrence_add_ons to role analyst_pdi;
grant usage on database raw to role analyst_pdi;
-- raw.aqd
grant usage on schema raw.aqd to role analyst_pdi;
grant select on table raw.aqd.event_descriptors to role analyst_pdi;
grant select on table raw.aqd.occurrences to role analyst_pdi;
grant select on table raw.aqd.occurrence_type_classifications to role analyst_pdi;
grant select on table raw.aqd.occurrence_events to role analyst_pdi;
grant select on table raw.aqd.occurrence_add_ons to role analyst_pdi;
-- PII Roles for BYOD.SAFETY_BI.CREWMEMBER_INJURY_OCCURRENCES_SLIM view
grant role sensitive_analytics_prd__safety__occurrences to role analyst_pdi;
grant role sensitive_analytics_prd__safety__occurrence_add_ons to role analyst_pdi;
grant role sensitive_analytics_prd__stg_aqd__occurrence_add_ons to role analyst_pdi;
grant role sensitive_analytics_prd__stg_aqd__occurrences to role analyst_pdi;
grant role sensitive_raw_prd__aqd__occurrences to role analyst_pdi;
grant role sensitive_raw_prd__aqd__occurrence_add_ons to role analyst_pdi;
----BYOD.SAFETY_BI
grant select on view byod.safety_bi.crewmember_injury_occurrences_slim to role analyst_pdi;
grant role raw_sap_s4_hana_read to role analyst_pdi;
grant role analyst_pdi to role sysadmin;
grant role analyst_pdi to role "PEOPLE DATA INSIGHTS";
grant role reporter_qa to role "PEOPLE DATA INSIGHTS";

-- analyst_prg
create role if not exists analyst_prg;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_prg') }}
{% endif %}
grant role analyst to role analyst_prg;
grant role analyst_opa to role analyst_prg;
grant role "AIRLINE OPTIMIZATION" to role analyst_prg;
grant role CREWANALYTICS to role analyst_prg;
grant role CREWPLANNING_PAIRINGS to role analyst_prg;
grant role USR_SYSPLANNINGANALYSISRO to role analyst_prg;
grant role analyst_prg to role sysadmin;

-- analyst_qa sensitive
create role if not exists analyst_qa;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_qa') }}
{% endif %}
grant role analyst to role analyst_qa;
grant role byod_enterprise_architecture_read to role analyst_qa;
grant role sensitive_sabre_fees_read_qa to role analyst_qa;
grant role sensitive_sabre_pnr_read_qa to role analyst_qa;
grant role sensitive_sabre_tcn_read_qa to role analyst_qa;
grant role sensitive_sabre_ticket_read_qa to role analyst_qa;
grant role sensitive_wheelchair_read_qa to role analyst_qa;
grant role sensitive_notification_manager_read_qa to role analyst_qa;
grant role analyst_qa to role "ITDATAQA-NONPROD";
grant role analyst_qa to role "ITDATATESTING-SG";

-- analyst_qms
create role if not exists analyst_qms;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_qms') }}
{% endif %}
grant role analyst to role analyst_qms;
grant usage on schema analytics.safety to role analyst_qms;
grant select on all tables in schema analytics.safety to role analyst_qms;
grant select on all views in schema analytics.safety to role analyst_qms;
grant select on future tables in schema analytics.safety to role analyst_qms;
grant select on future views in schema analytics.safety to role analyst_qms;
grant role analyst_qms to role "QMS";

-- analyst_revenue_accounting ( REVENUE ACCOUNTING )
create role if not exists analyst_revenue_accounting;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_revenue_accounting') }}
{% endif %}
grant role analyst to role analyst_revenue_accounting;
grant role analyst_revenue_accounting to role sysadmin;
grant role analyst_revenue_accounting to role "REVENUE ACCOUNTING";

-- analyst_revenue_forecast_itds
create role if not exists analyst_revenue_forecast_itds;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_revenue_forecast_itds') }}
{% endif %}
grant role analyst to role analyst_revenue_forecast_itds;
grant usage on database byod to role analyst_revenue_forecast_itds;
grant usage on schema byod.bluerm to role analyst_revenue_forecast_itds;
grant select on table byod.bluerm.flight_leg_revenue_forecast to role analyst_revenue_forecast_itds;
grant select on table byod.bluerm.flight_leg_revenue_forecast_backtests to role analyst_revenue_forecast_itds;
grant select on table byod.bluerm.flight_leg_revenue_forecast_dampening_factor to role analyst_revenue_forecast_itds;
-- byod.revenue_forecast_itds
grant role byod_revenue_forecast_itds to role analyst_revenue_forecast_itds;
grant role byod_revenue_forecast_itds_read to role analyst_revenue_forecast_itds;
grant role analyst_revenue_forecast_itds to role sysadmin;
grant role analyst_revenue_forecast_itds to role REVENUE_FORECAST_ITDS;

-- analyst_rikumar (Ritesh Kumar)
create role if not exists analyst_rikumar;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rikumar') }}
{% endif %}
grant role analyst to role analyst_rikumar;
--analytics roles
grant usage on database analytics to role analyst_rikumar;
grant usage on schema analytics.flights_rt to role analyst_rikumar;
grant select on all tables in schema analytics.flights_rt to role analyst_rikumar;
grant select on all views in schema analytics.flights_rt to role analyst_rikumar;
grant select on future tables in schema analytics.flights_rt to role analyst_rikumar;
grant select on future views in schema analytics.flights_rt to role analyst_rikumar;
--analytics_qa roles
grant role analytics_qa_read to role analyst_rikumar;
--raw roles
grant usage on database raw to role analyst_rikumar;
grant role raw_flight_rt_read to role analyst_rikumar;
grant role raw_sabre_pnr_rt_read to role analyst_rikumar;
grant role raw_sabre_ticket_rt_read to role analyst_rikumar;
grant role raw_sabre_acs_rt_read to role analyst_rikumar;
grant role raw_customers_rt_read to role analyst_rikumar;
grant role raw_loyalty_rt_read to role analyst_rikumar;
grant role raw_baggage_read to role analyst_rikumar;
grant role raw_salesforce_poc_read to role analyst_rikumar;
grant role raw_salesforce_read to role analyst_rikumar;
--sentitive roles
grant role sensitive_analytics_prd__flightkeys to role analyst_rikumar;
grant role sensitive_analytics_prd__flight_plan_manager to role analyst_rikumar;
grant role sensitive_analytics_prd__stg_flight_plan_manager to role analyst_rikumar;
grant role sensitive_analytics_prd__intermediary__inter_analytics__flight_plans_flightkeys to role analyst_rikumar;
grant role sensitive_analytics_prd__bookings to role analyst_rikumar;
grant role sensitive_analytics_prd__bookings_rt to role analyst_rikumar;
grant role sensitive_analytics_prd__tickets to role analyst_rikumar;
grant role sensitive_analytics_prd__tickets_rt to role analyst_rikumar;
grant role sensitive_analytics_prd__check_ins to role analyst_rikumar;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_rikumar;
grant role sensitive_analytics_prd__reference to role analyst_rikumar;
grant role sensitive_analytics_prd__notification_manager to role analyst_rikumar;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_rikumar;
grant role sensitive_analytics_prd__crew to role analyst_rikumar;
grant role sensitive_analytics_prd__stg_crew to role analyst_rikumar;
grant role sensitive_analytics_prd__loyalty to role analyst_rikumar;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_rikumar;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_rikumar;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_rikumar;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_rikumar;
--other roles
grant role "IT ENTERPRISE ARCHITECTURE BP" to role analyst_rikumar;
grant role "IT ENTERPRISE ARCHITECTURE CM" to role analyst_rikumar;
grant role analyst_rikumar to role sysadmin;
grant role analyst_rikumar to user "ADMRIKUMAR@JETBLUE.COM";

-- analyst_route_planning
create role if not exists analyst_route_planning;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_route_planning') }}
{% endif %}
grant role analyst to role analyst_route_planning;
-- byod roles
grant role byod_bluerevforecasting_read to role analyst_route_planning;
grant role byod_bluerm_read to role analyst_route_planning;
grant role byod_route_planning to role analyst_route_planning;
grant role byod_flight_schedules_read to role analyst_route_planning;
grant usage on database byod to role analyst_route_planning;
grant usage on schema byod.bluerevforecasting to role analyst_route_planning;
grant select on table byod.bluerevforecasting.five_year_data_dep_dt to role analyst_route_planning;
grant role byod_fpa_read to role analyst_route_planning;
grant role analyst_route_planning to role sysadmin;
grant role analyst_route_planning to role "ROUTE PLANNING";

 -- analyst_rpareporting
create role if not exists analyst_rpareporting;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rpareporting') }}
{% endif %}
grant role analyst to role analyst_rpareporting;
grant role byod_rpa to role analyst_rpareporting;
grant role sensitive_analytics_prd__check_ins to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_rpareporting;
grant role sensitive_analytics_prd__loyalty__users to role analyst_rpareporting;
grant role sensitive_market_regions_read to role analyst_rpareporting;
grant role sensitive_sabre_acs_read to role analyst_rpareporting;
grant role sensitive_sabre_epr_read to role analyst_rpareporting;
grant role sensitive_sabre_fees_read to role analyst_rpareporting;
grant role sensitive_sabre_tcn_read to role analyst_rpareporting;
grant role sensitive_sabre_ticket_read to role analyst_rpareporting;
grant role sensitive_sabre_travel_bank_read to role analyst_rpareporting;
grant role sensitive_sabre_pnr_read to role analyst_rpareporting;      
grant role sensitive_sabre_ticket_read to role analyst_rpareporting;
grant role analyst_rpareporting to role rpareporting;

-- analyst_rp42696 (Rachel Pena)
create role if not exists analyst_rp42696;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rp42696') }}
{% endif %}
grant role analyst to role analyst_rp42696;
grant role "JTPCC ANALYTICS & PLANNING" to role analyst_rp42696;
grant role "JTPCC CREWLEADERS" to role analyst_rp42696;
grant role "WPA TEAM" to role analyst_rp42696;
-- byod.wpa
grant role byod_wpa_read to role analyst_rp42696;
-- byod Roles
grant role byod_customer_support to role analyst_rp42696;
grant role byod_customer_support_read to role analyst_rp42696;
grant role byod_itbi_read to role analyst_rp42696;
-- raw roles
grant role raw_avaya_cms_read to role analyst_rp42696;
grant role byod_blueloyalty_read to role analyst_rp42696;
-- pii roles
grant role sensitive_analytics_dev__amazon_connect to role analyst_rp42696;
grant role sensitive_analytics_prd__amazon_connect to role analyst_rp42696;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents to role analyst_rp42696;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_rp42696;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_rp42696;
grant role sensitive_analytics_prd__concentrix__employees to role analyst_rp42696;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_rp42696;
grant role sensitive_analytics_prd__stg_concentrix__employees to role analyst_rp42696;
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analyst_rp42696;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cmname to role analyst_rp42696;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supervisor to role analyst_rp42696;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supe_email to role analyst_rp42696;
grant role analytics_stg_sabre_travel_bank_read to role analyst_rp42696;
grant usage on database analytics_dev to role analyst_rp42696;
--grant usage on schema analytics_dev.amazon_connect to role analyst_rp42696;
--grant select on all tables in schema analytics_dev.amazon_connect to role analyst_rp42696;
--grant select on all views in schema analytics_dev.amazon_connect to role analyst_rp42696;
--grant select on future tables in schema analytics_dev.amazon_connect to role analyst_rp42696;
--grant select on future views in schema analytics_dev.amazon_connect to role analyst_rp42696;
grant role analyst_rp42696 to role sysadmin;
grant role analyst_rp42696 to user "RP42696@JETBLUE.COM";

-- give raw access to ITDATAENGINEERINGCREW
grant role raw_crew_read to role ITDATAENGINEERINGCREW;
grant role raw_sabre_acs_rt_read to role ITDATAENGINEERINGCREW;
grant role raw_sabre_pnr_rt_read to role ITDATAENGINEERINGCREW;
grant role raw_sabre_ticket_rt_read to role ITDATAENGINEERINGCREW;
grant role raw_flight_rt_read to role ITDATAENGINEERINGCREW;
grant role raw_responsys_read to role ITDATAENGINEERINGCREW;
grant role raw_egor_read to role ITDATAENGINEERINGCREW;

-- analyst_jtp_tech_data_snowflake(JTP_TECH_DATA_SNOWFLAKE)
create role if not exists analyst_jtp_tech_data_snowflake;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jtp_tech_data_snowflake') }}
{% endif %}
grant usage, operate on warehouse reporting_prd_xs_wh to role analyst_jtp_tech_data_snowflake;
grant usage, operate on warehouse reporting_prd_s_wh to role analyst_jtp_tech_data_snowflake;
grant usage, operate on warehouse reporting_prd_m_wh to role analyst_jtp_tech_data_snowflake; 
grant role analytics_email_marketing_read to role analyst_jtp_tech_data_snowflake;
grant role analytics_loyalty_rt_read to role analyst_jtp_tech_data_snowflake;
grant role analytics_loyalty_read to role analyst_jtp_tech_data_snowflake;
grant role analytics_bookings_rt_read to role analyst_jtp_tech_data_snowflake;
grant role analytics_call_management_read to role analyst_jtp_tech_data_snowflake;
grant role analytics_check_ins_read to role analyst_jtp_tech_data_snowflake;
grant role analyst_jtp_tech_data_snowflake to role sysadmin;
grant role analyst_jtp_tech_data_snowflake to role JTP_TECH_DATA_SNOWFLAKE;

-- give raw access to individual TCS data engineers

-- analyst_namdataops
create role if not exists analyst_namdataops;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_namdataops') }}
{% endif %}
grant role analyst to role analyst_namdataops;
grant role tcsdataops to role analyst_namdataops;
grant role analyst_namdataops to role sysadmin;
grant role analyst_namdataops to role namdataops;

-- analyst_navigation
create role if not exists analyst_navigation;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_navigation') }}
{% endif %}
grant role analyst to role analyst_navigation;
grant role byod_navigation_database to role analyst_navigation;
grant role analyst_navigation to role sysadmin;
grant role analyst_navigation to role CNS_NAVDB;

-- analyst_safetyinsights
create role if not exists analyst_safetyinsights;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_safetyinsights') }}
{% endif %}
grant role analyst to role analyst_safetyinsights;
grant role byod_safety_analytics to role analyst_safety_analytics;
--ANALYTICS ROLES
grant usage on schema analytics.safety to role analyst_safetyinsights;
grant select on all tables in schema analytics.safety to role analyst_safetyinsights;
grant select on all views in schema analytics.safety to role analyst_safetyinsights;
grant select on future tables in schema analytics.safety to role analyst_safetyinsights;
grant select on future views in schema analytics.safety to role analyst_safetyinsights;
grant usage on schema analytics.stg_safety to role analyst_safetyinsights;
grant select on view analytics.stg_safety.hours_master to role analyst_safetyinsights;
grant select on view analytics.stg_safety.inspection_feeds to role analyst_safetyinsights;
grant select on view analytics.stg_safety.user_feeds to role analyst_safetyinsights;
-- analytics_qa_safety
grant role analytics_qa_safety_read to role analyst_safetyinsights;
-- RAW ROLES
grant usage on database raw to role analyst_safetyinsights;
grant usage on schema raw.safety to role analyst_safetyinsights;
grant select on table raw.safety.hours_master to role analyst_safetyinsights;
grant select on table raw.safety.inspection_feeds to role analyst_safetyinsights;
grant select on table raw.safety.user_feeds to role analyst_safetyinsights;
--SENSITIVE ROLES
grant role sensitive_analytics_prd__crew_pay__crew_man_day_stats_activity to role analyst_safetyinsights;
grant role sensitive_analytics_prd__stg_crew_pay__crew_man_day_stats_activity to role analyst_safetyinsights;
grant role sensitive_analytics_prd__crew_pay__employees to role analyst_safetyinsights;
grant role sensitive_analytics_prd__stg_crew_pay__employees to role analyst_safetyinsights;
grant role sensitive_analytics_prd__intermediary__user_feeds to role analyst_safetyinsights;
grant role sensitive_analytics_prd__safety__user_feeds to role analyst_safetyinsights;
grant role sensitive_analytics_prd__stg_safety__user_feeds to role analyst_safetyinsights;
grant role sensitive_analytics_prd__intermediary__inspection_feeds__author_name to role analyst_safetyinsights;
grant role sensitive_analytics_prd__safety__inspection_feeds__author_name to role analyst_safetyinsights;
grant role sensitive_analytics_prd__stg_safety__inspection_feeds__author_name to role analyst_safetyinsights;
grant role sensitive_analytics_prd__safety__inspection_feeds to role analyst_safetyinsights;
grant role sensitive_analytics_prd__stg_safety__inspection_feeds to role analyst_safetyinsights;
grant role sensitive_analytics_prd__intermediary__inspection_feeds to role analyst_safetyinsights;
grant role sensitive_analytics_prd__analytics__crew_fact to role analyst_safetyinsights;
grant role sensitive_analytics_prd__crew__crewmember_master__hire_date to role analyst_safetyinsights;
grant role sensitive_analytics_qa__safety to role analyst_safetyinsights;
grant role sensitive_analytics_qa__stg_aqd to role analyst_safetyinsights;
grant role byod_safety_bi to role analyst_safetyinsights;
grant role sensitive_analytics_prd__safety to role analyst_safetyinsights;
grant role analyst_safetyinsights to role safetyinsights;

-- analyst_safety_analytics
create role if not exists analyst_safety_analytics;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_safety_analytics') }}
{% endif %}
grant role analyst to role analyst_safety_analytics;  
--ANALYTICS ROLES
grant usage on schema analytics.safety to role analyst_safety_analytics;
grant select on all tables in schema analytics.safety to role analyst_safety_analytics;
grant select on all views in schema analytics.safety to role analyst_safety_analytics;
grant select on future tables in schema analytics.safety to role analyst_safety_analytics;
grant select on future views in schema analytics.safety to role analyst_safety_analytics;
grant usage on schema analytics.stg_aqd to role analyst_safety_analytics;
grant select on all tables in schema analytics.stg_aqd to role analyst_safety_analytics;
grant select on all views in schema analytics.stg_aqd to role analyst_safety_analytics;
grant select on future tables in schema analytics.stg_aqd to role analyst_safety_analytics;
grant select on future views in schema analytics.stg_aqd to role analyst_safety_analytics;
--ANALYTICS_DEV ROLES
grant usage on database analytics_dev to role analyst_safety_analytics;
grant usage on schema analytics_dev.safety to role analyst_safety_analytics;
grant select on all tables in schema analytics_dev.safety to role analyst_safety_analytics;
grant select on all views in schema analytics_dev.safety to role analyst_safety_analytics;
grant select on future tables in schema analytics_dev.safety to role analyst_safety_analytics;
grant select on future views in schema analytics_dev.safety to role analyst_safety_analytics;
grant usage on schema analytics_dev.stg_vistair to role analyst_safety_analytics;
grant select on all tables in schema analytics_dev.stg_vistair to role analyst_safety_analytics;
grant select on all views in schema analytics_dev.stg_vistair to role analyst_safety_analytics;
grant select on future tables in schema analytics_dev.stg_vistair to role analyst_safety_analytics;
grant select on future views in schema analytics_dev.stg_vistair to role analyst_safety_analytics;
--BYOD ROLES
grant usage on database byod to role analyst_safety_analytics;
grant usage on schema byod.itbi to role analyst_safety_analytics;
grant select on all tables in schema byod.itbi to role analyst_safety_analytics;
grant select on all views in schema byod.itbi to role analyst_safety_analytics;
grant select on future tables in schema byod.itbi to role analyst_safety_analytics;
grant select on future views in schema byod.itbi to role analyst_safety_analytics;
--SENSITIVE ROLES
grant role sensitive_analytics_prd__aircraft_sensors__ems_flight_primary_key to role analyst_safety_analytics;
grant role sensitive_analytics_prd__safety to role analyst_safety_analytics;
grant role sensitive_analytics_prd__stg_aqd to role analyst_safety_analytics; 
grant role sensitive_raw_prd__aqd to role analyst_safety_analytics;
grant role sensitive_analytics_prd__crew_pay__crew_man_day_stats_activity to role analyst_safety_analytics;
grant role sensitive_analytics_prd__crew_pay__employees to role analyst_safety_analytics;
grant role sensitive_analytics_prd__stg_crew_pay__crew_man_day_stats_activity to role analyst_safety_analytics;
grant role sensitive_analytics_prd__stg_crew_pay__employees to role analyst_safety_analytics;
--RAW ROLES
grant role raw_aqd_read to role analyst_safety_analytics;
grant usage on database raw_dev to role analyst_safety_analytics;
grant usage on schema raw_dev.vistair to role analyst_safety_analytics;
grant select on all tables in schema raw_dev.vistair to role analyst_safety_analytics;
grant select on all views in schema raw_dev.vistair to role analyst_safety_analytics;
grant select on future tables in schema raw_dev.vistair to role analyst_safety_analytics;
grant select on future views in schema raw_dev.vistair to role analyst_safety_analytics;
--OTHER ROLES
grant role analyst_safety_analytics to role sysadmin;
grant role analyst_safety_analytics to role "SAFETY ANALYTICS";

-- analyst_sec_bluewatch
create role if not exists analyst_sec_bluewatch;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sec_bluewatch') }}
{% endif %}
grant role analyst to role analyst_sec_bluewatch;
grant usage on schema analytics.stg_customers_rt to role analyst_sec_bluewatch;
grant select on all views in schema analytics.stg_customers_rt to role analyst_sec_bluewatch;
grant select on future views in schema analytics.stg_customers_rt to role analyst_sec_bluewatch;
grant select on all tables in schema analytics.stg_customers_rt to role analyst_sec_bluewatch;
grant select on future tables in schema analytics.stg_customers_rt to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__customers to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__email_addresses to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__identifications to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__phone_numbers to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__postal_addresses to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__missing_baggage to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__customers_rt to role analyst_sec_bluewatch; 
grant role sensitive_analytics_prd__check_ins to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_sec_bluewatch;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_sec_bluewatch;
grant role raw_sabre_acs_rt_read to role analyst_sec_bluewatch;
grant role raw_customers_rt_read to role analyst_sec_bluewatch;
grant role analyst_sec_bluewatch to role "SEC_BLUEWATCH";

-- analyst_schedule_planning
create role if not exists analyst_schedule_planning;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_schedule_planning') }}
{% endif %}
grant role analyst to role analyst_schedule_planning;
grant role byod_flight_schedules to role analyst_schedule_planning;
grant role analyst_schedule_planning to role "SCHEDULE PLANNING";

-- analyst_si95890
create role if not exists analyst_si95890;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_si95890') }}
{% endif %}
grant role analyst to role analyst_si95890;
grant role inflightanalysts to role analyst_si95890;
-- ANALYTICS.CREW_PAY
grant usage on schema analytics.crew_pay to role analyst_si95890;
grant select on all tables in schema analytics.crew_pay to role analyst_si95890;
grant select on all views in schema analytics.crew_pay to role analyst_si95890;
grant select on future tables in schema analytics.crew_pay to role analyst_si95890;
grant select on future views in schema analytics.crew_pay to role analyst_si95890;
-- sensitive roles
grant role sensitive_analytics_prd__crew_pay to role analyst_si95890;
grant role sensitive_analytics_prd__bluebucks__customer_compliments__feedback_comment to role analyst_si95890;
grant role sensitive_analytics_prd__bluebucks__clean_customer_compliments__feedback_comment to role analyst_si95890;
grant role sensitive_analytics_prd__onboard_experience__inflight_transactions__crewmember_id to role analyst_si95890;
grant role sensitive_analytics_prd__onboard_experience__inflight_transactions__crewmember_name to role analyst_si95890;
grant role analyst_si95890 to role sysadmin;
grant role analyst_si95890 to user "SI95890@JETBLUE.COM";

-- analyst_splunk_dbx_user (SPLUNK_DBX_USER)
create role if not exists analyst_splunk_dbx_user;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_splunk_dbx_user') }}
{% endif %}
grant role analyst to role analyst_splunk_dbx_user;
grant usage on schema analytics.stg_loyalty_rt to role analyst_splunk_dbx_user;
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_splunk_dbx_user;
grant role raw_servicenow_read to role analyst_splunk_dbx_user;
-- sensitive roles
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list to role analyst_splunk_dbx_user;
grant role analyst_splunk_dbx_user to role splunk_role;
grant role analytics_qa_antifraud_read to role analyst_splunk_dbx_user;
grant role analytics_antifraud_read to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__antifraud to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__sap_people_erp to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__employee_profile_record__header to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__tickets__documents to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__bookings_rt__passenger_travel_document to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_travel_document_snowflake to role analyst_splunk_dbx_user;
grant usage on database analytics_clone to role analyst_splunk_dbx_user;
grant usage on schema analytics_clone.antifraud to role analyst_splunk_dbx_user;
grant select on all tables in schema analytics_clone.antifraud to role analyst_splunk_dbx_user;
grant select on future tables in schema analytics_clone.antifraud to role analyst_splunk_dbx_user;
grant select on all views in schema analytics_clone.antifraud to role analyst_splunk_dbx_user;
grant select on future views in schema analytics_clone.antifraud to role analyst_splunk_dbx_user;
grant usage on database analytics_qa to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.antifraud to role analyst_splunk_dbx_user;
grant select on view analytics_qa.antifraud.suspected_fraudster_bookings to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.loyalty_rt to role analyst_splunk_dbx_user;
grant select on view analytics_qa.loyalty_rt.loyalty_fraud_customer_list to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.stg_loyalty_rt to role analyst_splunk_dbx_user;
grant select on view analytics_qa.stg_loyalty_rt.loyalty_fraud_customer_list to role analyst_splunk_dbx_user;
grant usage on database raw_qa to role analyst_splunk_dbx_user;
grant usage on schema raw_qa.sharepoint_loyalty_fraud to role analyst_splunk_dbx_user;
grant select on table raw_qa.sharepoint_loyalty_fraud.customer_tracking to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.bookings_rt to role analyst_splunk_dbx_user;
grant select on view analytics_qa.bookings_rt.passenger_travel_document to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.intermediary to role analyst_splunk_dbx_user;
grant select on table analytics_qa.intermediary.inter_pnr_rt__pnr_passenger_travel_document to role analyst_splunk_dbx_user;
grant select on view analytics_qa.stg_sabre_pnr_rt.passenger_travel_document_snowflake to role analyst_splunk_dbx_user;
grant select on table analytics_qa.intermediary.inter_tkt_rt__ticket_coupon to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.tickets_rt to role analyst_splunk_dbx_user;
grant select on view analytics_qa.tickets_rt.coupon to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.stg_sabre_ticket_rt to role analyst_splunk_dbx_user;
grant select on view analytics_qa.stg_sabre_ticket_rt.coupon_snowflake to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.bookings_rt to role analyst_splunk_dbx_user;
grant select on view analytics_qa.bookings_rt.itinerary_air_segment to role analyst_splunk_dbx_user;
grant select on table analytics_qa.intermediary.inter_pnr_rt__pnr_itinerary_air_segment to role analyst_splunk_dbx_user;
grant usage on schema analytics_qa.stg_sabre_pnr_rt to role analyst_splunk_dbx_user;
grant select on view analytics_qa.stg_sabre_pnr_rt.itinerary_air_segment_snowflake to role analyst_splunk_dbx_user;
grant role sensitive_analytics_prd__antifraud__suspected_fraudster_bookings to role analyst_splunk_dbx_user;
grant role sensitive_analytics_qa__bookings_rt__passenger_travel_document to role analyst_splunk_dbx_user;
grant role sensitive_analytics_qa__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_splunk_dbx_user;
grant role sensitive_analytics_qa__stg_sabre_pnr_rt__passenger_travel_document to role analyst_splunk_dbx_user;
grant role sensitive_analytics_qa__loyalty_rt__loyalty_fraud_customer_list to role analyst_splunk_dbx_user;
grant role sensitive_analytics_qa__stg_loyalty_rt__loyalty_fraud_customer_list to role analyst_splunk_dbx_user;
grant role analyst_splunk_dbx_user to role sysadmin;
grant role splunk_role to role sysadmin;
grant role splunk_role to user splunk_dbx_user;

--analyst_sroy (Sanjukta Roy)
create role if not exists analyst_sroy; 
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sroy') }}
{% endif %}
grant role analyst to role analyst_sroy;
-- RAW.COMARCH_DBO
grant usage on database raw to role analyst_sroy;
grant usage on schema raw.comarch_dbo to role analyst_sroy;
grant select on table raw.comarch_dbo.dim_case to role analyst_sroy;
grant imported privileges on database viasat to role analyst_sroy;
grant role raw_viasat_read to role analyst_sroy;
grant role analyst_sroy to role sysadmin;
grant role analyst_sroy to user "SROY@JETBLUE.COM";

--analyst_ss36482(Sarah Sargent)
create role if not exists analyst_ss36482;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ss36482') }}
{% endif %}
grant role "IT SECURITY CREW" to role analyst_ss36482;
grant role "WPA TEAM" to role analyst_ss36482;  
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_birth_date to role analyst_ss36482;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_first_name to role analyst_ss36482;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_last_name to role analyst_ss36482;
grant role analyst_ss36482 to role sysadmin;
grant role analyst_ss36482 to user "SS36482@JETBLUE.COM";

-- analyst_socialmediateam
create role if not exists analyst_socialmediateam;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_socialmediateam') }}
{% endif %}
grant role analyst to role analyst_socialmediateam;
grant role analyst_socialmediateam to role sysadmin;
grant role sensitive_sabre_pnr_read to role analyst_socialmediateam;
grant role analyst_socialmediateam to role SOCIALMEDIATEAM;

-- analyst_socprogramstechnology_strategy
create role if not exists analyst_socprogramstechnology_strategy;
{% if revoke_first %}
{{ revoke_roles_from_role(analyst_socprogramstechnology_strategy) }}
{% endif %}
grant role analyst to role analyst_socprogramstechnology_strategy;
grant role "SOC PROGRAMS TECHNOLOGY & STRATEGY" to role analyst_socprogramstechnology_strategy;
grant role byod_soc_programs to role analyst_socprogramstechnology_strategy;
grant role byod_soc_programs_read to role analyst_socprogramstechnology_strategy;
grant role byod_opa_read to role analyst_socprogramstechnology_strategy;
grant role analyst_socprogramstechnology_strategy to role sysadmin;

-- analyst_socprogramstechnology&strategy
create role if not exists "analyst_socprogramstechnology&strategy";
{% if revoke_first %}
{{ revoke_roles_from_role("analyst_socprogramstechnology&strategy") }}
{% endif %}
grant role analyst to role "analyst_socprogramstechnology&strategy";
grant role byod_soc_programs to role "analyst_socprogramstechnology&strategy";
grant role byod_soc_programs_read to role "analyst_socprogramstechnology&strategy";
grant role "analyst_socprogramstechnology&strategy" to role sysadmin;
grant role "analyst_socprogramstechnology&strategy" to role "SOC PROGRAMS TECHNOLOGY & STRATEGY";

-- analyst_ssc_strategic_planning
create role if not exists analyst_ssc_strategic_planning;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ssc_strategic_planning') }}
{% endif %}
grant role analyst to role analyst_ssc_strategic_planning;
grant role byod_sscstrategicplanning to role analyst_ssc_strategic_planning;
grant role sensitive_sabre_travel_bank_read to role analyst_ssc_strategic_planning;
grant role analyst_ssc_strategic_planning to role SSCSTRATEGICPLANNING;

-- analyst_svc_b6_datascience
create user if not exists svc_b6_datascience;
create role if not exists analyst_svc_b6_datascience;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_b6_datascience') }}
{% endif %}
grant role analyst to role analyst_svc_b6_datascience;
grant role analyst_bluerm to role analyst_svc_b6_datascience;
grant role analyst_svc_rmo to role analyst_svc_b6_datascience;
-- ANALYTICS.BCUS_TRANSACTIONS
grant role analytics_bcus_transactions_read to role analyst_svc_b6_datascience;
-- ANALYTICS.CREW_PAY
grant usage on schema analytics.crew_pay to role analyst_svc_b6_datascience;
grant select on all tables in schema analytics.crew_pay to role analyst_svc_b6_datascience;
grant select on future tables in schema analytics.crew_pay to role analyst_svc_b6_datascience;
grant select on all views in schema analytics.crew_pay to role analyst_svc_b6_datascience;
grant select on future views in schema analytics.crew_pay to role analyst_svc_b6_datascience;
-- ANALYTICS.LOYALTY_RT
grant role sensitive_analytics_prd__loyalty_rt to role analyst_svc_b6_datascience;
-- BYOD ROLES
grant role byod_airlineoptimization_read to role analyst_svc_b6_datascience;
grant role byod_blueloyalty to role analyst_svc_b6_datascience;
grant role byod_crewanalytics_read to role analyst_svc_b6_datascience;
grant role byod_customer_insights to role analyst_svc_b6_datascience;
grant role byod_flight_ops_team_read to role analyst_svc_b6_datascience;
grant role byod_itdigitaloperations to role analyst_svc_b6_datascience;
grant role byod_opa_read to role analyst_svc_b6_datascience;
grant role byod_route_planning to role analyst_svc_b6_datascience;
-- RAW
grant usage on database raw to role analyst_svc_b6_datascience;
grant usage on all schemas in database raw to role analyst_svc_b6_datascience;
grant select on all tables in database raw to role analyst_svc_b6_datascience;
grant select on future tables in database raw to role analyst_svc_b6_datascience;
grant select on all views in database raw to role analyst_svc_b6_datascience;
grant select on future views in database raw to role analyst_svc_b6_datascience;
grant role itdatasciencecrew to role analyst_svc_b6_datascience;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bluebucks__customer_compliments__feedback_comment to role analyst_svc_b6_datascience;
grant role sensitive_analytics_prd__intermediary__inter__inflight_entertainment__passenger to role analyst_svc_b6_datascience;
grant role sensitive_analytics_prd__inflight_entertainment__passenger to role analyst_svc_b6_datascience;
grant role sensitive_analytics_prd__cobrand__spend to role analyst_svc_b6_datascience;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__first_name to role analyst_svc_b6_datascience;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__first_name to role analyst_svc_b6_datascience;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__first_name to role analyst_svc_b6_datascience;
grant usage on schema analytics.stg_loyalty_rt to role analyst_svc_b6_datascience; 
grant select on view analytics.stg_loyalty_rt.member_profile to role analyst_svc_b6_datascience;
grant role analyst_svc_b6_datascience to role sysadmin;
grant role analyst_svc_b6_datascience to user "SVC_B6_DATASCIENCE";

-- analyst_svc_bluerm_read
create user if not exists svc_bluerm_read;
create role if not exists svc_bluerm_read;
{% if revoke_first %}
{{ revoke_roles_from_role('svc_bluerm_read') }}
{% endif %}
grant role byod_bluerm_read to role svc_bluerm_read;
grant role svc_bluerm_read to role sysadmin;
grant role svc_bluerm_read to user svc_bluerm_read;

-- analyst_svc_bluestrategicmxplan (service account for byod_bluestrategicmxplan)
create user if not exists svc_bluestrategicmxplan comment='creating service account to connect rstudio to snowflake_REQ0350883';
create role if not exists analyst_svc_bluestrategicmxplan;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_bluestrategicmxplan') }}
{% endif %}
grant role analyst to role analyst_svc_bluestrategicmxplan;
grant role byod_bluestrategicmxplan to role analyst_svc_bluestrategicmxplan; 
grant role analyst_svc_bluestrategicmxplan to role sysadmin;
grant role analyst_svc_bluestrategicmxplan to user svc_bluestrategicmxplan;

-- analyst_SVC_MX_TECHOPS
create user if not exists svc_mx_techops;
create role if not exists analyst_svc_mx_techops;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_mx_techops') }}
{% endif %}
grant role analyst to role analyst_svc_mx_techops;
grant role analyst_jfk_mx to role analyst_svc_mx_techops;
-- ANALYTICS.STG_SAP_REPORTS
grant usage on schema analytics.stg_sap_reports to role analyst_svc_mx_techops;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_svc_mx_techops;
-- ANALYTICS.CREW
grant usage on schema analytics.crew to role analyst_svc_mx_techops;
grant select on view analytics.crew.crewmember_badges_sap to role analyst_svc_mx_techops;
-- RAW.SAP_REPORTS
grant usage on schema raw.sap_reports to role analyst_svc_mx_techops;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_svc_mx_techops;
-- ANALYTICS.STG_TRAX
grant usage on schema analytics.stg_trax to role analyst_svc_mx_techops;
grant select on view analytics.stg_trax.planning to role analyst_svc_mx_techops;
grant select on view analytics.stg_trax.defect_report to role analyst_svc_mx_techops;
grant select on view analytics.stg_trax.work_order to role analyst_svc_mx_techops;
grant select on view analytics.stg_trax.work_order_task_card to role analyst_svc_mx_techops;
-- analytics training
grant role sensitive_analytics_prd__training to role analyst_svc_mx_techops;
grant usage on schema analytics.training to role analyst_svc_mx_techops;
grant select on all tables in schema analytics.training to role analyst_svc_mx_techops;
grant select on all views in schema analytics.training to role analyst_svc_mx_techops;
grant select on future tables in schema analytics.training to role analyst_svc_mx_techops;
grant select on future views in schema analytics.training to role analyst_svc_mx_techops;
grant role analyst_svc_mx_techops to role sysadmin;
grant role analyst_svc_mx_techops to user svc_mx_techops;

-- analyst_svc_itdatascience_revforecast (service account for rm byod.revenue_forecast_itds)
create user if not exists svc_itdatascience_revforecast comment='creating service account to write data from Databricks to Snowflake_REQ0348073';
create role if not exists analyst_svc_itdatascience_revforecast;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_itdatascience_revforecast') }}
{% endif %}
grant role analyst to role analyst_svc_itdatascience_revforecast;
grant role byod_revenue_forecast_itds to role analyst_svc_itdatascience_revforecast; 
grant role analyst_svc_itdatascience_revforecast to role sysadmin;
grant role analyst_svc_itdatascience_revforecast to user svc_itdatascience_revforecast;

-- analyst_svc_it_ppm
create role if not exists analyst_svc_it_ppm;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_it_ppm') }}
{% endif %}
grant usage, operate on warehouse reporting_prd_xs_wh to role analyst_svc_it_ppm;
grant usage, operate on warehouse reporting_prd_s_wh to role analyst_svc_it_ppm;
grant usage, operate on warehouse reporting_prd_m_wh to role analyst_svc_it_ppm;
grant role analytics_it_timesheets_read to role analyst_svc_it_ppm;
grant role analytics_qa_it_timesheets_read to role analyst_svc_it_ppm;
grant role sensitive_analytics_prd__it_timesheets to role analyst_svc_it_ppm;
grant role sensitive_analytics_qa__it_timesheets to role analyst_svc_it_ppm;
grant role analyst_svc_it_ppm to role sysadmin;
grant role analyst_svc_it_ppm to user SVC_IT_PPM;

 -- analyst_svc_ose
create role if not exists analyst_svc_ose;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_ose') }}
{% endif %}
grant role analyst to role analyst_svc_ose;
grant role analyst_usr_sysplanninganalysisro to role analyst_svc_ose;
grant role analyst_svc_ose to role sysadmin;
grant role analyst_svc_ose to role svc_ose;

-- analyst_svc_trackddb
create user if not exists svc_trackddb;
create role if not exists analyst_svc_trackddb;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_trackddb') }}
{% endif %}
grant role analyst to role analyst_svc_trackddb;
grant role "TRACK DATA TEAM" to role analyst_svc_trackddb;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile__email_address to role analyst_svc_trackddb;
grant role sensitive_analytics_prd__loyalty__member_profiles__email_address to role analyst_svc_trackddb;
grant role sensitive_analytics_prd__loyalty__member_profiles__trueblue_number to role analyst_svc_trackddb;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__email_address to role analyst_svc_trackddb;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__trueblue_number to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__first_name to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__middle_name to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__last_name to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__email_address to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__date_of_birth to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__gender to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__account_status to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__loyalty__member_profiles__home_airport to role "TRACK DATA TEAM";
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role "TRACK DATA TEAM";
--other roles
grant role analyst_svc_trackddb to role sysadmin;
grant role analyst_svc_trackddb to user svc_trackddb;

--  analyst_systemsengineering (systemsengineering)
create role if not exists analyst_systemsengineering;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_systemsengineering') }}
{% endif %}
grant role analyst to role analyst_systemsengineering;
grant role BYOD_SYSTEMSENGINEERING to role analyst_systemsengineering;
--sensitive roles
grant role sensitive_analytics_prd__aircraft_maintenance__relation_master to role SYSTEMSENGINEERING;
grant role sensitive_analytics_prd__stg_trax__relation_master to role SYSTEMSENGINEERING;
grant role sensitive_analytics_prd__intermediary__inter_trax__relation_master to role SYSTEMSENGINEERING;
grant role analyst_systemsengineering to role sysadmin;
grant role analyst_systemsengineering to role SYSTEMSENGINEERING;

-- dev PII Roles for customers_rt data
create role if not exists sensitive_analytics_dev__customers_rt;
create role if not exists sensitive_analytics_dev__stg_customers_rt;

-- analyst_sarora 
create role if not exists analyst_sarora;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sarora') }}
{% endif %}  
grant role tcsdataengineering to role analyst_sarora;
grant usage on database analytics to role analyst_sarora;
grant usage on database analytics_qa to role analyst_sarora;
-- raw roles
grant role raw_aerodata_read to role analyst_sarora;
grant role raw_customers_rt_read to role analyst_sarora;
grant role raw_reference_read to role analyst_sarora;
grant role raw_trax_read to role analyst_sarora;
-- raw.vendor_spend
grant role raw_vendor_spend_read to role analyst_sarora;
grant role sensitive_analytics_prd__customers_rt to role analyst_sarora;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__customers to role analyst_sarora;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__email_addresses to role analyst_sarora;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__identifications to role analyst_sarora;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__phone_numbers to role analyst_sarora;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__postal_addresses to role analyst_sarora;
-- analytics.aircraft_sensors
grant usage on schema analytics.aircraft_sensors to role analyst_sarora;
grant select on all tables in schema analytics.aircraft_sensors to role analyst_sarora;
grant select on all views in schema analytics.aircraft_sensors to role analyst_sarora;
grant select on future tables in schema analytics.aircraft_sensors to role analyst_sarora;
grant select on future views in schema analytics.aircraft_sensors to role analyst_sarora;
-- analytics.talent_acquisition
grant usage on schema analytics.talent_acquisition to role analyst_sarora;
grant select on all tables in schema analytics.talent_acquisition to role analyst_sarora;
grant select on all views in schema analytics.talent_acquisition to role analyst_sarora;
grant select on future tables in schema analytics.talent_acquisition to role analyst_sarora;
grant select on future views in schema analytics.talent_acquisition to role analyst_sarora;
grant role sensitive_analytics_prd__stg_success_factors to role analyst_sarora;
grant role sensitive_analytics_prd__talent_acquisition to role analyst_sarora;
grant usage on schema analytics.stg_customers_rt to role analyst_sarora;
grant select on all tables in schema analytics.stg_customers_rt to role analyst_sarora;
grant select on all views in schema analytics.stg_customers_rt to role analyst_sarora;
grant select on future tables in schema analytics.stg_customers_rt to role analyst_sarora;
grant select on future views in schema analytics.stg_customers_rt to role analyst_sarora;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_sarora;
grant role sensitive_analytics_prd__stg_cobrand_audit to role analyst_sarora;
grant usage on schema analytics.stg_accelya_mis to role analyst_sarora;
grant usage on schema analytics_qa.stg_accelya_mis to role analyst_sarora;
grant select on all tables in schema analytics.stg_accelya_mis to role analyst_sarora;
grant select on all views in schema analytics.stg_accelya_mis to role analyst_sarora;
grant select on all tables in schema analytics_qa.stg_accelya_mis to role analyst_sarora;
grant select on all views in schema analytics_qa.stg_accelya_mis to role analyst_sarora;
grant select on future tables in schema analytics.stg_accelya_mis to role analyst_sarora;
grant select on future views in schema analytics.stg_accelya_mis to role analyst_sarora;
grant select on future tables in schema analytics_qa.stg_accelya_mis to role analyst_sarora;
grant select on future views in schema analytics_qa.stg_accelya_mis to role analyst_sarora;
grant usage on schema analytics.stg_crew to role analyst_sarora;
grant select on all tables in schema analytics.stg_crew to role analyst_sarora;
grant select on all views in schema analytics.stg_crew to role analyst_sarora;
grant select on future tables in schema analytics.stg_crew to role analyst_sarora;
grant select on future views in schema analytics.stg_crew to role analyst_sarora;
grant usage on schema analytics.stg_jira to role analyst_sarora;
grant select on all tables in schema analytics.stg_jira to role analyst_sarora;
grant select on all views in schema analytics.stg_jira to role analyst_sarora;
grant select on future views in schema analytics.stg_jira to role analyst_sarora;
grant select on future tables in schema analytics.stg_jira to role analyst_sarora;
grant usage on schema analytics.stg_system_operations to role analyst_sarora;
grant select on view analytics.stg_system_operations.shift_logs to role analyst_sarora;
grant role analytics_qa_stg_cass_read to role analyst_sarora;
-- analytics.stg_loyalty_rt
grant usage on schema analytics.stg_loyalty_rt to role analyst_sarora;
grant select on all tables in schema analytics.stg_loyalty_rt to role analyst_sarora;
grant select on all views in schema analytics.stg_loyalty_rt to role analyst_sarora;
grant select on future tables in schema analytics.stg_loyalty_rt to role analyst_sarora;
grant select on future views in schema analytics.stg_loyalty_rt to role analyst_sarora;
-- analytics.stg_vendor_spend
grant role analytics_stg_vendor_spend_read to role analyst_sarora;
grant role sensitive_analytics_qa__crew to role analyst_sarora;
grant usage on schema raw.jira to role analyst_sarora;
grant select on all tables in schema raw.jira to role analyst_sarora;
grant select on all views in schema raw.jira to role analyst_sarora;
grant select on future views in schema raw.jira to role analyst_sarora;
grant select on future tables in schema raw.jira to role analyst_sarora;
grant role raw_system_operations_read to role analyst_sarora;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_sarora;
grant usage on schema analytics.stg_notification_manager to role analyst_sarora;
grant select on all tables in schema analytics.stg_notification_manager to role analyst_sarora;
grant select on all views in schema analytics.stg_notification_manager to role analyst_sarora;
grant select on future tables in schema analytics.stg_notification_manager to role analyst_sarora;
grant select on future views in schema analytics.stg_notification_manager to role analyst_sarora;
grant role sensitive_analytics__stg_notification_manager to role analyst_sarora;
grant role sensitive_analytics__notification_manager to role analyst_sarora;
-- ANALYTICS.STG_SOLUTION_TEK
grant usage on schema analytics.stg_solution_tek to role analyst_sarora;
grant select on all views in schema analytics.stg_solution_tek to role analyst_sarora;
grant select on future views in schema analytics.stg_solution_tek to role analyst_sarora;
-- analytics.stg_success_factors
grant usage on schema analytics.stg_success_factors to role analyst_sarora;
grant select on all tables in schema analytics.stg_success_factors to role analyst_sarora;
grant select on all views in schema analytics.stg_success_factors to role analyst_sarora;
grant select on future tables in schema analytics.stg_success_factors to role analyst_sarora;
grant select on future views in schema analytics.stg_success_factors to role analyst_sarora;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_sarora;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_sarora;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_sarora;
-- analytics_clone.customers_rt
grant usage on schema analytics_clone.customers_rt to role analyst_sarora;
grant select on all tables in schema analytics_clone.customers_rt to role analyst_sarora;
-- raw.airbus
grant usage on schema raw.airbus to role analyst_sarora;
grant select on all tables in schema raw.airbus to role analyst_sarora;
-- raw.loyalty_rt
grant role raw_loyalty_rt_read to role analyst_sarora;
-- raw.baggage
grant role raw_baggage_read to role analyst_sarora;
-- raw.stg_success_factors
grant role raw_success_factors_read to role analyst_sarora;
grant role raw_notification_manager_read to role analyst_sarora;
grant usage on schema raw.system_operations to role analyst_sarora;
grant select on all tables in schema raw.system_operations to role analyst_sarora;
grant select on all views in schema raw.system_operations to role analyst_sarora;
grant select on future views in schema raw.system_operations to role analyst_sarora;
grant select on future tables in schema raw.system_operations to role analyst_sarora;
grant role raw_avaya_cms_read to role analyst_sarora;
grant role raw_customer_support_read to role analyst_sarora;
grant role raw_flight_link_read to role analyst_sarora;
grant role raw_cobrand_audit_read to role analyst_sarora;
grant role raw_kiosk_read to role analyst_sarora;
grant role raw_planitas_read to role analyst_sarora;
grant role raw_servicenow_read to role analyst_sarora;
grant role raw_travelbank_read to role analyst_sarora;
grant role raw_notification_manager_read to role analyst_sarora;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_sarora;
grant usage on schema analytics.stg_servicenow to role analyst_sarora;
grant select on all tables in schema analytics.stg_servicenow to role analyst_sarora;
grant select on all views in schema analytics.stg_servicenow to role analyst_sarora;
grant select on future tables in schema analytics.stg_servicenow to role analyst_sarora;
grant select on future views in schema analytics.stg_servicenow to role analyst_sarora;
-- RAW.SOLUTION_TEK
grant role raw_solution_tek_read to role analyst_sarora;
-- RAW_DEV.SOL_TEK_EDW
grant usage on database raw_dev to role analyst_sarora;
grant usage on schema raw_dev.sol_tek_edw to role analyst_sarora;
grant select on all views in schema raw_dev.sol_tek_edw to role analyst_sarora;
grant select on future views in schema raw_dev.sol_tek_edw to role analyst_sarora;
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analyst_sarora;
grant role analyst_sarora to user "SARORA@JETBLUE.COM";

-- analyst_ta_data_reporting ( TA DATA & REPORTING )
create role if not exists analyst_ta_data_reporting;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ta_data_reporting') }}
{% endif %}
grant role analyst to role analyst_ta_data_reporting;
grant usage on schema analytics.talent_acquisition to role analyst_ta_data_reporting;
grant select on all tables in schema analytics.talent_acquisition to role analyst_ta_data_reporting;
grant select on all views in schema analytics.talent_acquisition to role analyst_ta_data_reporting;
grant select on future tables in schema analytics.talent_acquisition to role analyst_ta_data_reporting;
grant select on future views in schema analytics.talent_acquisition to role analyst_ta_data_reporting;
grant role analyst_ta_data_reporting to role sysadmin;

-- analyst_ta_data_&_reporting ( TA DATA & REPORTING )
create role if not exists "analyst_ta_data_&_reporting";
{% if revoke_first %}
{{ revoke_roles_from_role('"analyst_ta_data_&_reporting"') }}
{% endif %}
grant role analyst to role "analyst_ta_data_&_reporting";
grant usage on schema analytics.talent_acquisition to role "analyst_ta_data_&_reporting";
grant select on all tables in schema analytics.talent_acquisition to role "analyst_ta_data_&_reporting";
grant select on all views in schema analytics.talent_acquisition to role "analyst_ta_data_&_reporting";
grant select on future tables in schema analytics.talent_acquisition to role "analyst_ta_data_&_reporting";
grant select on future views in schema analytics.talent_acquisition to role "analyst_ta_data_&_reporting";
grant role "analyst_ta_data_&_reporting" to role sysadmin;
grant role "analyst_ta_data_&_reporting" to role "TA DATA & REPORTING";

-- analyst_tcsbusinessintelligence
create role if not exists analyst_tcsbusinessintelligence;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_tcsbusinessintelligence') }}
{% endif %}
--analytics roles
grant usage on schema analytics.safety to role analyst_tcsbusinessintelligence;
grant select on all tables in schema analytics.safety to role analyst_tcsbusinessintelligence;
grant select on all views in schema analytics.safety to role analyst_tcsbusinessintelligence; 
grant select on future tables in schema analytics.safety to role analyst_tcsbusinessintelligence; 
grant select on future views in schema analytics.safety to role analyst_tcsbusinessintelligence;
--byod roles
grant role byod_itbi to role analyst_tcsbusinessintelligence;
grant role byod_opa_read to role analyst_tcsbusinessintelligence;
--sensitive roles
grant role sensitive_analytics_prd__comply365 to role analyst_tcsbusinessintelligence;
grant role sensitive_analytics_prd__safety to role analyst_tcsbusinessintelligence;
grant role sensitive_analytics_prd__springshot__crewmember_messages to role analyst_tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__bso_reflight_regid to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__bso_unload_regid to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__cc_reassigned_guardian_to_old to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__close_to_mosaic to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__cobrand_anniversary to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__delivery_channel to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__family_pooling_invite_accepted_inviter to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__itinerary_receipt_email_confirmation to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__messages to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__mosaic_20k_benefit to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__notification_recipient to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__responsys_itinerary_emails to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__responsys_marketing_emails to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__trueblue_activate_password_terms_conditions to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__trueblue_child_registration to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__trueblue_password_reset to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__notification_manager__trueblue_password_reset_confirmation to role tcsbusinessintelligence;
grant role sensitive_analytics_prd__servicenow__comply_form_comply_data to role analyst_tcsbusinessintelligence;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_tcsbusinessintelligence;
--other roles
grant role analyst_tcsbusinessintelligence to role sysadmin;
grant role analyst_tcsbusinessintelligence to role tcsbusinessintelligence;

 -- analyst_tcsdataengineering
create role if not exists analyst_tcsdataengineering;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_tcsdataengineering') }}
{% endif %}
grant role analyst to role analyst_tcsdataengineering;
-- ANALYTICS.STG_AERODATA
grant usage on schema analytics.stg_aerodata to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_aerodata to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_aerodata to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_aerodata to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_aerodata to role analyst_tcsdataengineering; 
--  ANALYTICS.STG_ASAPP
grant usage on schema analytics.stg_asapp to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_asapp to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_asapp to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_asapp to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_asapp to role analyst_tcsdataengineering;
-- ANALYTICS.STG_CALL_MANAGEMENT
grant usage on schema analytics.stg_call_management to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_call_management to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_call_management to role analyst_tcsdataengineering;
-- ANALYTICS.STG_CREDIT_CARD_SALES
grant usage on schema analytics.stg_credit_card_sales to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_credit_card_sales to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_credit_card_sales to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_credit_card_sales to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_credit_card_sales to role analyst_tcsdataengineering;
-- ANALYTICS.STG_FLIGHT_PLAN_MANAGER
grant usage on schema analytics.stg_flight_plan_manager to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_flight_plan_manager to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_flight_plan_manager to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_flight_plan_manager to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_flight_plan_manager to role analyst_tcsdataengineering;
-- ANALYTICS_QA.STG_CREW_PAY
grant usage on schema analytics_qa.stg_crew_pay to role analyst_tcsdataengineering; 
grant select on all tables in schema analytics_qa.stg_crew_pay to role analyst_tcsdataengineering;
grant select on all views in schema analytics_qa.stg_crew_pay to role analyst_tcsdataengineering;
grant select on future tables in schema analytics_qa.stg_crew_pay to role analyst_tcsdataengineering;
grant select on future views in schema analytics_qa.stg_crew_pay to role analyst_tcsdataengineering;
-- ANALYTICS.STG_CREW
grant usage on schema analytics.stg_crew to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_crew to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_crew to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_crew to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_crew to role analyst_tcsdataengineering;
-- ANALYTICS.STG_CREW_PAY
grant usage on schema analytics.stg_crew_pay to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_crew_pay to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_crew_pay to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_crew_pay to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_crew_pay to role analyst_tcsdataengineering;
-- ANALYTICS_CLONE.CREW_PAY
grant usage on schema analytics_clone.crew_pay to role analyst_tcsdataengineering;
grant usage on schema analytics_clone.crew_pay to role analyst_tcsdataengineering;
grant select on all tables in schema analytics_clone.crew_pay to role analyst_tcsdataengineering;
grant select on all views in schema analytics_clone.crew_pay to role analyst_tcsdataengineering;
grant select on future tables in schema analytics_clone.crew_pay to role analyst_tcsdataengineering;
grant select on future views  in schema analytics_clone.crew_pay to role analyst_tcsdataengineering;
-- analytics_clone.solution_tek
grant usage on schema analytics_clone.solution_tek to role analyst_tcsdataengineering;
grant usage on schema analytics_clone.solution_tek to role analyst_tcsdataengineering;
grant select on all tables in schema analytics_clone.solution_tek to role analyst_tcsdataengineering;
grant select on all views in schema analytics_clone.solution_tek to role analyst_tcsdataengineering;
grant select on future tables in schema analytics_clone.solution_tek to role analyst_tcsdataengineering;
grant select on future views  in schema analytics_clone.solution_tek to role analyst_tcsdataengineering;
-- ANALYTICS_QA.CREW_PAY
grant usage on schema analytics_qa.crew_pay to role analyst_tcsdataengineering; 
grant select on all tables in schema analytics_qa.crew_pay to role analyst_tcsdataengineering;
grant select on all views in schema analytics_qa.crew_pay to role analyst_tcsdataengineering;
grant select on future tables in schema analytics_qa.crew_pay to role analyst_tcsdataengineering;
grant select on future views in schema analytics_qa.crew_pay to role analyst_tcsdataengineering;
-- ANALYTICS.STG_SABRE_ACCB
grant usage on schema analytics.stg_sabre_accb to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_sabre_accb to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_sabre_accb to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_sabre_accb to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_sabre_accb to role analyst_tcsdataengineering;
-- ANALYTICS.STG_IROPS_REACCOM
grant usage on schema analytics.stg_irops_reaccom to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_irops_reaccom to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_irops_reaccom to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_irops_reaccom to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_irops_reaccom to role analyst_tcsdataengineering;
-- ANALYTICS.STG_SURVEYS
grant usage on schema analytics.stg_surveys to role analyst_tcsdataengineering;
grant select on all tables in schema analytics.stg_surveys to role analyst_tcsdataengineering;
grant select on all views in schema analytics.stg_surveys to role analyst_tcsdataengineering;
grant select on future tables in schema analytics.stg_surveys to role analyst_tcsdataengineering;
grant select on future views in schema analytics.stg_surveys to role analyst_tcsdataengineering;
-- BYOD ROLES
grant role byod_enterprise_architecture_read to role analyst_tcsdataengineering;
grant role byod_finance to role analyst_tcsdataengineering;
grant role byod_it_data_engineering_qa to role analyst_tcsdataengineering;
-- RAW ROLES
grant role raw_crew_read to role analyst_tcsdataengineering;
-- SENSITIVE ROLES
grant role sensitive_sabre_epr_read_qa to role analyst_tcsdataengineering;
grant role sensitive_sabre_pnr_read_qa to role analyst_tcsdataengineering;
grant role sensitive_sabre_ticket_read_qa to role analyst_tcsdataengineering;
grant role sensitive_sabre_tcn_read_qa to role analyst_tcsdataengineering;
grant role analyst_tcsdataengineering to role sysadmin;
grant role analyst_tcsdataengineering to role TCSDATAENGINEERING;

-- analyst_track_data_team
create role if not exists analyst_track_data_team;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_track_data_team') }}
{% endif %}
grant role analyst to role analyst_track_data_team;
--analytics roles
grant usage on database analytics to role analyst_track_data_team;
grant usage on all schemas in database analytics to role analyst_track_data_team;
grant select on all tables in database analytics to role analyst_track_data_team;
grant select on all views in database analytics to role analyst_track_data_team;
grant select on future tables in database analytics to role analyst_track_data_team;
grant select on future views in database analytics to role analyst_track_data_team;
-- analytics_clone db 
grant usage on database analytics_clone to role analyst_track_data_team;
-- analytics_clone.web_analytics
grant usage on schema analytics_clone.web_analytics to role analyst_track_data_team;
grant select on all tables in schema analytics_clone.web_analytics to role analyst_track_data_team;
grant select on all views in schema analytics_clone.web_analytics to role analyst_track_data_team;
grant select on future tables in schema analytics_clone.web_analytics to role analyst_track_data_team;
grant select on future views in schema analytics_clone.web_analytics to role analyst_track_data_team;
-- analytics_clone.reporting
grant usage on schema analytics_clone.reporting to role analyst_track_data_team;
grant select on all tables in schema analytics_clone.reporting to role analyst_track_data_team;
grant select on all views in schema analytics_clone.reporting to role analyst_track_data_team;
grant select on future tables in schema analytics_clone.reporting to role analyst_track_data_team;
grant select on future views in schema analytics_clone.reporting to role analyst_track_data_team;
--byod roles
grant role byod_bluemktanalytics_read to role analyst_track_data_team;
grant role byod_trackddb to role analyst_track_data_team;
grant usage on database byod to role analyst_track_data_team;
grant usage on all schemas in database byod to role analyst_track_data_team;
grant select on all tables in database byod to role analyst_track_data_team;
grant select on all views in database byod to role analyst_track_data_team;
grant select on future tables in database byod to role analyst_track_data_team;
grant select on future views in database byod to role analyst_track_data_team;
--sensitive roles
grant role sensitive_analytics_prd__analytics to role analyst_track_data_team;
grant role sensitive_analytics_prd__bookings_rt to role analyst_track_data_team;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_track_data_team;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__email to role analyst_track_data_team;
grant role sensitive_analytics_prd__email_marketing to role analyst_track_data_team;
grant role sensitive_sabre_pnr_read to role analyst_track_data_team;
--simon data share read
grant role simon_data_share_read to role analyst_track_data_team;
--other roles
grant role analyst_track_data_team to role sysadmin;
grant role analyst_track_data_team to role "TRACK DATA TEAM";

--analyst_usr_sysplanninganalysisro (usr_sysplanninganalysisro)
create role if not exists analyst_usr_sysplanninganalysisro;
{% if revoke_first %}
{{ revoke_roles_from_role('usr_sysplanninganalysisro') }}
{% endif %}
grant role analyst to role analyst_usr_sysplanninganalysisro;
-- ownership
grant ownership on all tables in schema byod.operations_engineering to role byod_operations_engineering copy current grants;
--analytics roles
grant usage on schema analytics.aircraft_maintenance to role analyst_usr_sysplanninganalysisro;
grant select on all tables in schema analytics.aircraft_maintenance to role analyst_usr_sysplanninganalysisro;
grant select on future tables in schema analytics.aircraft_maintenance to role analyst_usr_sysplanninganalysisro;
grant select on all views in schema analytics.aircraft_maintenance to role analyst_usr_sysplanninganalysisro;
grant select on future views in schema analytics.aircraft_maintenance to role analyst_usr_sysplanninganalysisro;
grant usage on schema analytics.safety to role analyst_usr_sysplanninganalysisro;
grant select on all tables in schema analytics.safety to role analyst_usr_sysplanninganalysisro;
grant select on all views in schema analytics.safety to role analyst_usr_sysplanninganalysisro;
grant select on future tables in schema analytics.safety to role analyst_usr_sysplanninganalysisro;
grant select on future views in schema analytics.safety to role analyst_usr_sysplanninganalysisro;
grant select on view analytics.safety.ap_dbr_ereports to role analyst_usr_sysplanninganalysisro;
grant select on view analytics.safety.ap_dbr_occurrences to role analyst_usr_sysplanninganalysisro;
grant role analytics_clone_read to role analyst_usr_sysplanninganalysisro;
grant role analytics_sharepoint_osda_read to role analyst_usr_sysplanninganalysisro;
--stage
grant usage on schema analytics.stg_sharepoint_osda to role analyst_usr_sysplanninganalysisro;
grant select on view analytics.stg_sharepoint_osda.airport_operations_status_report to role analyst_usr_sysplanninganalysisro;
--byod roles
grant role byod_it_data_engineering to role analyst_usr_sysplanninganalysisro;
grant usage on schema byod.crew_analytics to role analyst_usr_sysplanninganalysisro;
grant select on table byod.crew_analytics.vw_reserves_per_day to role analyst_usr_sysplanninganalysisro;
grant select on table byod.crew_analytics.vw_opentimesummary to role analyst_usr_sysplanninganalysisro;
grant usage on schema byod.enterprise_planning to role analyst_usr_sysplanninganalysisro;
grant select on view byod.enterprise_planning.vw_pilot_inflight_removals to role analyst_usr_sysplanninganalysisro;
grant select on table byod.crew_analytics.premium_cpadaily_timestamp to role analyst_usr_sysplanninganalysisro;
grant usage on schema byod.route_planning to role analyst_usr_sysplanninganalysisro;
grant select on dynamic table BYOD.ROUTE_PLANNING.PL_DATA_V2 to role analyst_usr_sysplanninganalysisro;
grant role byod_enterprise_planning_read to role analyst_usr_sysplanninganalysisro;
grant role byod_it_data_engineering_read to role analyst_usr_sysplanninganalysisro;
grant role byod_itbi_read to role analyst_usr_sysplanninganalysisro;
grant role byod_itdatascience_read to role analyst_usr_sysplanninganalysisro;
grant role byod_crewanalytics_read to role analyst_usr_sysplanninganalysisro;
grant role byod_osda to role analyst_usr_sysplanninganalysisro;
grant role byod_operations_engineering to role analyst_usr_sysplanninganalysisro;
--sensitive roles
grant role sensitive_analytics_prd__flightkeys__flight_plan_header__author_name to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header__author_name to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header__author_name to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__safety to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__safety__qoccurrences to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__safety__qoccurrence_add_ons to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__safety__occurrence_add_ons to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__safety__occurrences to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__stg_sharepoint_osda to role analyst_usr_sysplanninganalysisro;
grant role sensitive_analytics_prd__sharepoint_osda to role analyst_usr_sysplanninganalysisro;
--raw roles
grant usage on database raw to role analyst_usr_sysplanninganalysisro;
grant usage on schema raw.rainmaker to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.factactivity to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.factcrewpayanalyzerdaily to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.FactCrewManDayStatsActivity to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.vEmployee to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.DimActivityCode to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.DimManDay to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.vDate to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.DimRosterLineType to role analyst_usr_sysplanninganalysisro;
grant select on table raw.rainmaker.vcountertype to role analyst_usr_sysplanninganalysisro;
grant role raw_rainmaker_read to role analyst_usr_sysplanninganalysisro;
grant role raw_sabre_pnr_rt_read to role analyst_usr_sysplanninganalysisro;
-- byod.airlineoptimization
grant role byod_airlineoptimization_read to role analyst_usr_sysplanninganalysisro;
--other roles
grant role analyst_usr_sysplanninganalysisro to role sysadmin;
grant role analyst_usr_sysplanninganalysisro to role USR_SYSPLANNINGANALYSISRO;

 -- analyst_queuescrew
create role if not exists analyst_queuescrew;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_queuescrew') }}
{% endif %}
grant role analyst to role analyst_queuescrew;
grant role sensitive_sabre_epr_read to role analyst_queuescrew;
grant role sensitive_sabre_pnr_read to role analyst_queuescrew;
grant role sensitive_sabre_ticket_read to role analyst_queuescrew;
grant role sensitive_sabre_tcn_read to role analyst_queuescrew;
grant role sensitive_sabre_epr_read_qa to role analyst_queuescrew;
grant role sensitive_sabre_pnr_read_qa to role analyst_queuescrew;
grant role sensitive_sabre_ticket_read_qa to role analyst_queuescrew;
grant role sensitive_sabre_tcn_read_qa to role analyst_queuescrew;
grant role analyst_queuescrew to role QUEUESCREW;
grant role analyst_queuescrew to role QCCOORDINATORS;
grant role analyst_queuescrew to user "DWARNER@JETBLUE.COM";

-- analyst_wpa_team
create role if not exists analyst_wpa_team;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_wpa_team') }}
{% endif %}
grant role analyst to role analyst_wpa_team;
-- ANALYTICS.CALL_MANAGEMENT
grant usage on schema analytics.call_management to role analyst_wpa_team;
grant select on table analytics.call_management.amazon_connect_routing_profile_summary to role analyst_wpa_team;
grant select on table analytics.call_management.amazon_connect_queue_summary to role analyst_wpa_team;
grant select on table analytics.call_management.amazon_connect_contact_trace_records to role analyst_wpa_team;
--ANALYTICS.SURVEYS
grant usage on schema analytics.surveys to role analyst_wpa_team;
grant select on table analytics.surveys.post_digital to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analyst_wpa_team; 
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_wpa_team;
-- ANALYTICS.STG_SABRE_TRAVEL_BANK
grant usage on schema analytics.stg_sabre_travel_bank to role analyst_wpa_team;
grant select on all views in schema analytics.stg_sabre_travel_bank to role analyst_wpa_team;
grant select on future views in schema analytics.stg_sabre_travel_bank to role analyst_wpa_team;
grant select on all tables in schema analytics.stg_sabre_travel_bank to role analyst_wpa_team;
grant select on future tables in schema analytics.stg_sabre_travel_bank to role analyst_wpa_team;
-- analytics.stg_aspect_workforce_management
grant usage on schema analytics.stg_aspect_workforce_management to role analyst_wpa_team;
grant select on view analytics.stg_aspect_workforce_management.employees to role analyst_wpa_team;
-- analytics.stg_concentrix 
grant usage on schema analytics.stg_concentrix to role analyst_wpa_team;
grant select on view analytics.stg_concentrix.employees to role analyst_wpa_team;
-- ANALYTICS_DEV
grant usage on database analytics_dev to role analyst_wpa_team;
-- ANALYTICS_DEV.AMAZON_CONNECT
--grant usage on schema analytics_dev.amazon_connect to role analyst_wpa_team;
--grant select on all tables in schema analytics_dev.amazon_connect to role analyst_wpa_team;
--grant select on future tables in schema analytics_dev.amazon_connect to role analyst_wpa_team;
--grant select on all views in schema analytics_dev.amazon_connect to role analyst_wpa_team;
--grant select on future views in schema analytics_dev.amazon_connect to role analyst_wpa_team;
-- BYOD ROLES
grant role byod_customer_support_read to role analyst_wpa_team;
grant role byod_customer_support to role analyst_wpa_team;
grant role byod_itbi_read to role analyst_wpa_team;
--BYOD.WPA
grant usage on schema byod.wpa to role analyst_wpa_team;
grant insert, update on table byod.wpa.bpo_mnl to role analyst_wpa_team;
grant usage on schema byod.wpa to role analyst_wpa_team;
-- RAW ROLES
grant role raw_avaya_cms_read to role analyst_wpa_team;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__concentrix__amazon_connect_agents to role analyst_wpa_team;
grant role sensitive_analytics_prd__concentrix__amazon_connect_agent_summary to role analyst_wpa_team;
grant role sensitive_analytics_prd__concentrix__amazon_connect_login_logout_summary to role analyst_wpa_team;
grant role sensitive_analytics_prd__concentrix__employees to role analyst_wpa_team;
grant role sensitive_analytics_prd__amazon_connect to role analyst_wpa_team;
grant role sensitive_analytics_prd__amazon_connect__agent_summary__agent to role analyst_wpa_team;
grant role sensitive_analytics_prd__amazon_connect__agent_summary__agent_first_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__amazon_connect__agent_summary__agent_last_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__amazon_connect__agent_summary__agent_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__amazon_connect__agents__agent_first_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__amazon_connect__agents__agent_last_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__amazon_connect__agents__agent_username to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_wpa_team;
grant role sensitive_analytics_prd__concentrix__employees to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_concentrix__employees to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_first_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_last_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_name to role analyst_wpa_team;         
grant role sensitive_analytics_prd__stg_concentrix__employees to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_concentrix__employees__full_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_concentrix__employees__supervisor to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_concentrix__employees__manager to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_concentrix__employees__crewmember_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_concentrix__employees__jetblue_email to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_concentrix__employees__user_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_first_name to role analyst_wpa_team; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_last_name to role analyst_wpa_team; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_username to role analyst_wpa_team; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_mobile to role analyst_wpa_team; 
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary__first_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary__last_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_contact_trace_records to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state__agent_first_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state__agent_last_name to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state__agent_username to role analyst_wpa_team;
grant role sensitive_analytics_prd__call_management__aspect_wfm_employees to role analyst_wpa_team;
grant role sensitive_analytics_prd__stg_aspect_workforce_management__employees to role analyst_wpa_team;
grant role sensitive_analytics_prd__intermediary__inter_star_call_management__aspect_wfm_employees to role analyst_wpa_team;
grant role analyst_wpa_team to role sysadmin;
grant role analyst_wpa_team to role "WPA TEAM";

-- bcg_gamma
create role if not exists analyst_bcg_gamma;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bcg_gamma') }}
{% endif %}
grant role analyst to role analyst_bcg_gamma;
grant role byod_bcg_gamma to role analyst_bcg_gamma;
grant role byod_bluerm_read to role analyst_bcg_gamma;
grant role byod_flight_schedules_read to role analyst_bcg_gamma;
grant role byod_flight_schedules_dev_read to role analyst_bcg_gamma;
grant role sensitive_crew_read to role analyst_bcg_gamma;
grant role analyst_bcg_gamma to role sysadmin;
grant role analyst_bcg_gamma to role "BCG GAMMA RM";

-- analyst_tcsdataops
create role if not exists analyst_tcsdataops;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_tcsdataops') }}
{% endif %}
grant role analyst to role analyst_tcsdataops;
-- ANALYTICS
grant usage on database analytics to role analyst_tcsdataops;
grant usage on all schemas in database analytics to role analyst_tcsdataops;
grant select on all tables in database analytics to role analyst_tcsdataops;
grant select on future tables in database analytics to role analyst_tcsdataops;
grant select on all views in database analytics to role analyst_tcsdataops;
grant select on future views in database analytics to role analyst_tcsdataops;
-- ANALYTICS_CLONE
grant role analytics_clone_read to role analyst_tcsdataops;
-- ANALYTICS_QA
grant usage on database analytics_qa to role analyst_tcsdataops;
grant usage on all schemas in database analytics_qa to role analyst_tcsdataops;
grant select on all tables in database analytics_qa to role analyst_tcsdataops;
grant select on future tables in database analytics_qa to role analyst_tcsdataops;
grant select on all views in database analytics_qa to role analyst_tcsdataops;
grant select on future views in database analytics_qa to role analyst_tcsdataops;
-- BYOD ROLES
grant role byod_itdataops to role analyst_tcsdataops;
grant usage on all schemas in database byod to role analyst_tcsdataops;
grant select on all tables in database byod to role analyst_tcsdataops;
grant select on future tables in database byod to role analyst_tcsdataops;
grant select on all views in database byod to role analyst_tcsdataops;
grant select on future views in database byod to role analyst_tcsdataops;
-- RAW
grant usage on database raw to role analyst_tcsdataops;
grant usage on all schemas in database raw to role analyst_tcsdataops;
grant select on all tables in database raw to role analyst_tcsdataops;
grant select on future tables in database raw to role analyst_tcsdataops;
grant select on all views in database raw to role analyst_tcsdataops;
grant select on future views in database raw to role analyst_tcsdataops;
grant insert on table raw.task_audit.azure_data_factory_audit to role analyst_tcsdataops;
-- RAW ROLES
grant role raw__schemas_rt__stages_read to role analyst_tcsdataops;
grant role raw_task_audit_read to role analyst_tcsdataops;
-- SNOWFLAKE INTERNAL ROLES
-- grant role analyst_trust_center_viewer to role tcsdataops;
grant role analyst_tcsdataops to role sysadmin;
grant role analyst_tcsdataops to role tcsdataops;

-- simon_data_share_read
create role if not exists simon_data_share_read;
{% if revoke_first %}
{{ revoke_roles_from_role('simon_data_share_read') }}
{% endif %}
-- grant imported privileges on database simon_data_share to role simon_data_share_read;

-- transformer_prd (its a sensitive role)
create role if not exists transformer_prd;
{% if revoke_first %}
{{ revoke_roles_from_role('transformer_prd') }}
{% endif %}
grant select on table RAW.AQD.OPEN_WORK_ORDER_REVIEW to role transformer_prd;
grant select on table RAW.AQD.CAMP to role transformer_prd;
grant select on table RAW.AQD.BCSA_REGION_AND_BENCHMARKS to role transformer_prd;
grant select on table RAW.AQD.DEFECTIVE_FROM_STOCK_MASTER_SPREADSHEET to role transformer_prd;
grant select on table RAW.AQD.HEAVY_MAINTENANCE to role transformer_prd;
grant select on table RAW.AQD.MEL_EXTENSION to role transformer_prd;
grant select on table RAW.AQD.MX_124_LOGBOOK to role transformer_prd;
grant select on table RAW.AQD.TECH_OPS_SARS_WORK_GROUP_DATA to role transformer_prd;
grant select on table raw.reference_legacy.dim_locations to role transformer_prd;
grant select on table RAW.SURVEYS.OAL_PARTNER to role transformer_prd;
grant select on table RAW.INFLIGHT_SURVEY.RESPONSES to role transformer_prd;
-- raw.trax read role
grant role raw_trax_read to role transformer_prd;
grant role transformer_prd to role sysadmin;
grant role simon_data_share_read to role transformer_prd;

-- transformer_qa
grant usage on schema analytics_qa.stg_pricing_3victors to role transformer_qa;
grant select on table analytics_qa.stg_pricing_3victors.airline_pricing to role transformer_qa;
grant role sensitive_analytics_qa__stg_crew__crewmember_hierarchy to role transformer_qa;
grant role sensitive_analytics_qa__crew__crewmember_hierarchy to role transformer_qa;

-- analyst_technology_finance_and_portfolio_management
create role if not exists analyst_technology_finance_and_portfolio_management;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_technology_finance_and_portfolio_management') }}
{% endif %}
grant role analyst to role analyst_technology_finance_and_portfolio_management;
-- byod.technology_finance_and_portfolio_management
grant role byod_technology_finance_and_portfolio_management_read to role analyst_technology_finance_and_portfolio_management;
grant role byod_technology_finance_and_portfolio_management to role analyst_technology_finance_and_portfolio_management;
grant role analyst_technology_finance_and_portfolio_management to role sysadmin;
grant role analyst_technology_finance_and_portfolio_management to role "TECHNOLOGY FINANCE AND PORTFOLIO MANAGEMENT";

-- analyst_visualbi
create role if not exists analyst_visualbi;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_visualbi') }}
{% endif %}
grant role analyst to role analyst_visualbi;
grant usage on database analytics to role analyst_visualbi;
grant usage on schema analytics.stg_irops_reaccom to role analyst_visualbi;
grant select on all tables in schema analytics.stg_irops_reaccom to role analyst_visualbi;
grant select on all views in schema analytics.stg_irops_reaccom to role analyst_visualbi;
grant select on future tables in schema analytics.stg_irops_reaccom to role analyst_visualbi;
grant select on future views in schema analytics.stg_irops_reaccom to role analyst_visualbi;
grant usage on database analytics_clone to role analyst_visualbi;
grant usage on schema analytics_clone.analytics to role analyst_visualbi;
grant select on all tables in schema analytics_clone.analytics to role analyst_visualbi;
grant select on all views in schema analytics_clone.analytics to role analyst_visualbi;
grant select on future tables in schema analytics_clone.analytics to role analyst_visualbi;
grant select on future views in schema analytics_clone.analytics to role analyst_visualbi;
grant usage on schema analytics_clone.irops_reaccom to role analyst_visualbi;
grant select on all tables in schema analytics_clone.irops_reaccom to role analyst_visualbi;
grant select on all views in schema analytics_clone.irops_reaccom to role analyst_visualbi;
grant select on future tables in schema analytics_clone.irops_reaccom to role analyst_visualbi;
grant select on future views in schema analytics_clone.irops_reaccom to role analyst_visualbi;
grant usage on schema analytics_clone.stg_irops_reaccom to role analyst_visualbi;
grant select on all tables in schema analytics_clone.stg_irops_reaccom to role analyst_visualbi;
grant select on all views in schema analytics_clone.stg_irops_reaccom to role analyst_visualbi;
grant select on future tables in schema analytics_clone.stg_irops_reaccom to role analyst_visualbi;
grant select on future views in schema analytics_clone.stg_irops_reaccom to role analyst_visualbi;
grant role analyst_visualbi to role VISUALBI;

-- PERSONAL ROLES

-- analyst_aballard (Anna Mcintyre-Ballard)
create role if not exists analyst_aballard;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aballard') }}
{% endif %}
grant role analyst to role analyst_aballard;
grant role snowflakeanalyst to role analyst_aballard;
grant usage on schema analytics.baggage to role analyst_aballard;
grant select on all tables in schema analytics.baggage to role analyst_aballard;
grant select on all views in schema analytics.baggage to role analyst_aballard;
grant select on future tables in schema analytics.baggage to role analyst_aballard;
grant select on future views in schema analytics.baggage to role analyst_aballard;
grant role analyst_aballard to role sysadmin;
grant role analyst_aballard to user "ABALLARD@JETBLUE.COM";

-- "IT OPS PRODUCTS CREW"
grant role ANALYTICS_QA_TOPS_CREW_READ to role "IT OPS PRODUCTS CREW";
grant role ANALYTICS_QA_CREW_READ to role "IT OPS PRODUCTS CREW";
grant role ANALYTICS_QA_CREW_RT_READ to role "IT OPS PRODUCTS CREW";
grant role "IT OPS PRODUCTS CREW" to role sysadmin;

-- "JBU SCHEDULING TEAM"
grant role "ANALYTICS_QA_TOPS_CREW_READ" to role "JBU SCHEDULING TEAM";
grant role ANALYTICS_QA_CREW_READ to role "JBU SCHEDULING TEAM";
grant role ANALYTICS_QA_CREW_RT_READ to role "JBU SCHEDULING TEAM";
grant role "JBU SCHEDULING TEAM" to role sysadmin; 

--analyst_aa16441(austin ashcraft)
create role if not exists analyst_aa16441;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aa16441') }}
{% endif %}
grant role analyst to role analyst_aa16441;
grant role "WPA TEAM" to role analyst_aa16441;
grant role J5PRODKBANALYST to role analyst_aa16441;
grant insert,update on table byod.wpa.historical_mnl_bpo to role analyst_aa16441;
grant insert,update on table byod.wpa.bpo_mnl to role analyst_aa16441;
grant usage on database jetblue_share to role analyst_aa16441;
grant usage on schema jetblue_share.cci to role analyst_aa16441;
grant select on all tables in schema jetblue_share.cci to role analyst_aa16441;
grant select on future tables in schema jetblue_share.cci to role analyst_aa16441;
grant select on all views in schema jetblue_share.cci to role analyst_aa16441;
grant select on future views in schema jetblue_share.cci to role analyst_aa16441;
-- BYOD
grant role byod_cex_analytics_read to role analyst_aa16441;
-- sensitive roles
grant role sensitive_analytics_prd__bookings__remarks_history__remark_text to role analyst_aa16441;
grant role sensitive_analytics_prd__bookings__remarks__remark_text to role analyst_aa16441;
grant role sensitive_analytics_prd__tickets_rt__remark__ticket_remark_text to role analyst_aa16441;
grant role sensitive_analytics_prd__tickets_rt__remark_history__ticket_remark_text to role analyst_aa16441;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_snowflake to role analyst_aa16441;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark__ticket_remark_text to role analyst_aa16441;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state to role analyst_aa16441;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark to role analyst_aa16441;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_aps to role analyst_aa16441;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state__previous_agent_username to role analyst_aa16441;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state__previous_agent_last_name to role analyst_aa16441;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state__previous_agent_first_name to role analyst_aa16441;
grant role analyst_aa16441 to role sysadmin;
grant role analyst_aa16441 to user "AA16441@JETBLUE.COM";

--analyst_aa82825 (Alber Almonte)
create role if not exists analyst_aa82825; 
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aa82825') }}
{% endif %}
grant role analyst to role analyst_aa82825;
grant role "JET PATHWAY ASSOCIATES" to role analyst_aa82825;
grant role "TECHNOLOGY FINANCE AND PORTFOLIO MANAGEMENT" to role analyst_aa82825;
grant role sensitive_analytics_prd__crew__crew_and_business_partners to role analyst_aa82825;
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_aa82825;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_aa82825;
grant usage on schema analytics.stg_servicenow to role analyst_aa82825;
grant select on view analytics.stg_servicenow.business_partners_onboard_tsa to role analyst_aa82825;
grant usage on database raw to role analyst_aa82825;
grant usage on schema raw.servicenow to role analyst_aa82825;
grant select on table raw.servicenow.u_bp_onboarding_tsa to role analyst_aa82825;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_aa82825;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_aa82825;
grant role sensitive_analytics_prd__crew__crewmember_profiles to role analyst_aa82825;
grant role sensitive_analytics_prd__comply365__crewmember to role analyst_aa82825;
grant role analyst_aa82825 to role sysadmin;
grant role analyst_aa82825 to user "AA82825@JETBLUE.COM";

-- analyst_ab76211 (Amy Booth)
create role if not exists analyst_ab76211;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ab76211') }}
{% endif %}
grant role analyst to role analyst_ab76211;
grant role CSSPWORKINGTEAM to role analyst_ab76211;
-- byod
grant usage on database byod to role analyst_ab76211;
-- byod.wpa
grant usage on schema byod.wpa to role analyst_ab76211;
grant select on table byod.wpa.mnl to role analyst_ab76211;
grant select on table byod.wpa.mnl_team_summary to role analyst_ab76211;
grant select on table byod.wpa.bpo_mnl to role analyst_ab76211;
grant select on future tables in schema byod.wpa to role analyst_ab76211;
grant role analyst_ab76211 to role sysadmin;
grant role analyst_ab76211 to user "AB76211@JETBLUE.COM";

-- analyst_abchauhan (Abhishek Chauhan)
create role if not exists analyst_abchauhan;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_abchauhan') }}
{% endif %}
grant role analyst to role analyst_abchauhan;
grant role "IT OPS PRODUCTS CREW" to role analyst_abchauhan;
grant role sensitive_analytics_prd__crewqual__med_data__employee_num to role analyst_abchauhan;
grant role sensitive_analytics_prd__crewqual__pilot_employee__employee_num to role analyst_abchauhan;
grant role sensitive_analytics_prd__crewqual__pilot_entry__employee_num to role analyst_abchauhan;
grant role sensitive_analytics_prd__crewqual__pilot_time__employee_num to role analyst_abchauhan;
grant role analyst_abchauhan to role sysadmin;
grant role analyst_abchauhan to user "ABCHAUHAN@JETBLUE.COM";

-- analyst_ai43742 (Allyson Irwin)
create role if not exists analyst_ai43742;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ai43742') }}
{% endif %}  
grant role analyst to role analyst_ai43742;
grant role ITDATAENGINEERINGCREW to role analyst_ai43742;
-- ANALYTICS
grant usage on database analytics to role analyst_ai43742;
grant usage on schema analytics.surveys to role analyst_ai43742;
grant select on table analytics.surveys.diagnostic_2021 to role analyst_ai43742;
-- raw read roles
grant role raw_collins_aerospace_read to role analyst_ai43742;
grant role raw_sabre_revenue_integrity_read to role analyst_ai43742;
grant role raw_sabre_pnr_batch_read to role analyst_ai43742;
grant usage on database raw to role analyst_ai43742;
grant usage on schema raw.homeserv_baggage to role analyst_ai43742;
grant select on all tables in schema raw.homeserv_baggage to role analyst_ai43742;
grant usage on procedure raw.homeserv_baggage.homeserv_baggage_api_call(varchar,varchar) to role analyst_ai43742;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__crew__crewmember_sap_details to role analyst_ai43742;
grant role sensitive_analytics_prd__sap_reports__fieldglass_business_partner to role analyst_ai43742;
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_ai43742;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_sap_details to role analyst_ai43742;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_ai43742;
grant role sensitive_analytics_prd__training to role analyst_ai43742;
--other roles
grant role analyst_ai43742 to role sysadmin;
grant role analyst_ai43742 to user "AI43742@JETBLUE.COM";

-- analyst_as08597 (Andrew Stang)
create role if not exists analyst_as08597;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_as08597') }}
{% endif %}
grant role analyst to role analyst_as08597;
grant role "BLUEFP&A" to role analyst_as08597;
grant role "ANALYTICS_CREW_PAY_READ" to role analyst_as08597;
grant select on table analytics.crew.master_history to role analyst_as08597;
-- analytics.crew_pay
grant usage on database analytics to role analyst_as08597;
grant usage on schema analytics.crew_pay to role analyst_as08597;
grant role sensitive_analytics_prd__crew_pay__crew_pay_analyzer_utilization_daily to role analyst_as08597;
grant role sensitive_analytics_prd__crew_pay__employees to role analyst_as08597;
-- analytics.stg_crew_pay
grant usage on schema analytics.stg_crew_pay to role analyst_as08597;
grant role sensitive_analytics_prd__stg_crew_pay__crew_pay_analyzer_utilization_daily to role analyst_as08597;
grant role sensitive_analytics_prd__stg_crew_pay__employees to role analyst_as08597;
-- raw roles
grant usage on database raw to role analyst_as08597;
grant usage on schema raw.rainmaker to role analyst_as08597;
grant select on table raw.rainmaker.factcrewpayanalyzerutilizationdaily to role analyst_as08597;
grant select on table raw.rainmaker.vEmployee to role analyst_as08597;
grant role raw_concur_read to role analyst_as08597;
--other roles
grant role analyst_as08597 to role sysadmin;
grant role analyst_as08597 to user "AS08597@JETBLUE.COM";

-- analyst_asherkhane (Arti Sherkhane)
create role if not exists analyst_asherkhane;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_asherkhane') }}
{% endif %}
grant role analyst to role analyst_asherkhane;
grant role "IT EQA GLOBAL TEAM" to role analyst_asherkhane;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_asherkhane;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_asherkhane;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_asherkhane;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_asherkhane;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_asherkhane; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_asherkhane;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_asherkhane;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_asherkhane;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_asherkhane;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_asherkhane;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_asherkhane;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_asherkhane;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_asherkhane;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_asherkhane;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_asherkhane;
grant usage on database raw_qa to role analyst_asherkhane;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_asherkhane;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_asherkhane;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_asherkhane;
grant usage on database raw to role analyst_asherkhane;
grant usage on schema raw.c3po_audit_logs to role analyst_asherkhane;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_asherkhane;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_asherkhane;
grant role sensitive_analytics_prd__customers_rt__jetblue_accounts to role analyst_asherkhane;
grant role sensitive_analytics_prd__customers_rt__jetblue_accounts_history to role analyst_asherkhane;
grant role sensitive_analytics_prd__stg_customers_rt__jetblue_accounts to role analyst_asherkhane;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts to role analyst_asherkhane;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts_history to role analyst_asherkhane;
grant role sensitive_analytics_prd__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_asherkhane;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_asherkhane;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_asherkhane;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_asherkhane;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_asherkhane;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_asherkhane;
grant role analyst_asherkhane to role sysadmin;
grant role analyst_asherkhane to user "ASHERKHANE@JETBLUE.COM";

-- analyst_al01727(Anna Sieber)
create role if not exists analyst_al01727;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_al01727') }}
{% endif %}
grant role analyst to role analyst_al01727;
grant role "BLUE MARKETING ALL" to role analyst_al01727;
grant role BLUETECHOPSLSC to role analyst_al01727;
grant role TABLEAUONLINECREATOR to role analyst_al01727;
grant role sensitive_analytics_prd__inflight_entertainment__enhanced_quality_of_experience_minute__flight_number to role analyst_al01727;
grant role sensitive_analytics_prd__inflight_entertainment__enhanced_quality_of_experience_minute__site_code to role analyst_al01727;
grant role analyst_al01727 to role sysadmin;
grant role analyst_al01727 to user "AL01727@JETBLUE.COM";

-- analyst_aq99691(Aleph Queiroz)
create role if not exists analyst_aq99691;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aq99691') }}
{% endif %}
grant role analyst to role analyst_aq99691;
grant role BLUETECHOPS to role analyst_aq99691;
grant role OPERATIONSANALYSIS to role analyst_aq99691;
grant role SVC_OSE to role analyst_aq99691;
grant role TABLEAUONLINECREATOR to role analyst_aq99691;
grant role USR_SYSPLANNINGANALYSISRO to role analyst_aq99691;
grant role sensitive_analytics_prd__inflight_entertainment__enhanced_quality_of_experience_minute__flight_number to role analyst_aq99691;
grant role sensitive_analytics_prd__inflight_entertainment__enhanced_quality_of_experience_minute__site_code to role analyst_aq99691;
grant usage on schema analytics.stg_trax to role analyst_aq99691;
grant select on view analytics.stg_trax.relation_master to role analyst_aq99691;
grant role sensitive_analytics_prd__aircraft_maintenance__relation_master to role analyst_aq99691;
grant role sensitive_analytics_prd__intermediary__inter_trax__relation_master to role analyst_aq99691;
grant role sensitive_analytics_prd__stg_trax__relation_master to role analyst_aq99691;
grant role analyst_aq99691 to role sysadmin;
grant role analyst_aq99691 to user "AQ99691@JETBLUE.COM";

-- analyst_ag06422
create role if not exists analyst_ag06422;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ag06422') }}
{% endif %}
grant role analyst to role analyst_ag06422;
grant role inflightanalysts to role analyst_ag06422;
grant role sensitive_analytics_prd__bluebucks__clean_customer_compliments__feedback_comment to role analyst_ag06422;
grant role analyst_ag06422 to role sysadmin;
grant role analyst_ag06422 to user "AG06422@JETBLUE.COM";

-- analyst_ar29232 (Angeris Roldan)
create role if not exists analyst_ar29232;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ar29232') }}
{% endif %}
grant role analyst to role analyst_ar29232;
grant role "FINANCIAL SYSTEMS CONTROLLER GROUP" to role analyst_ar29232;
grant role "REVENUE ACCOUNTING" to role analyst_ar29232;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__onboard_experience to role analyst_ar29232;
grant role analyst_ar29232 to role sysadmin;
grant role analyst_ar29232 to user "AR29232@JETBLUE.COM";

-- analyst_araut (Abhijit Raut)
create role if not exists analyst_araut;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_araut') }}
{% endif %}
grant role analyst to role analyst_araut;
grant role "ITDATAQA-NONPROD" to role analyst_araut;
grant usage on database analytics_clone to role analyst_araut;
grant usage on schema analytics_clone.aircraft_maintenance  to role analyst_araut;
grant select on all tables in schema analytics_clone.aircraft_maintenance to role analyst_araut;
grant select on all views in schema analytics_clone.aircraft_maintenance to role analyst_araut;
grant select on future tables in schema analytics_clone.aircraft_maintenance to role analyst_araut;
grant select on future views in schema analytics_clone.aircraft_maintenance to role analyst_araut;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_araut;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_araut;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_araut;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_araut;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_araut; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_araut;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_araut;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_araut;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_araut;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_araut;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_araut;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_araut;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_araut;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_araut;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_araut;
grant usage on database raw_qa to role analyst_araut;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_araut;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_araut;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_araut;
grant usage on database raw to role analyst_araut;
grant usage on schema raw.c3po_audit_logs to role analyst_araut;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_araut;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_araut;
grant usage on database analytics_qa to role analyst_araut;
grant usage on schema analytics_qa.stg_customers_rt to role analyst_araut;
grant select on view analytics_qa.stg_customers_rt.jetblue_accounts to role analyst_araut;
grant usage on schema analytics_qa.customers_rt to role analyst_araut;
grant select on view analytics_qa.customers_rt.jetblue_accounts to role analyst_araut;
grant select on view analytics_qa.customers_rt.jetblue_accounts_history to role analyst_araut;
grant select on  table analytics_qa.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_araut;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts to role analyst_araut;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts_history to role analyst_araut;
grant role sensitive_analytics_qa__stg_customers_rt__jetblue_accounts to role analyst_araut;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_araut;
grant usage on database raw_qa to role analyst_araut;
grant usage on schema raw_qa.credit_profiles_rt to role analyst_araut;
grant select on table raw_qa.credit_profiles_rt.jetblue_accounts to role analyst_araut;
grant role analyst_araut to role sysadmin;
grant role analyst_araut to user "ARAUT@JETBLUE.COM";

-- analyst_ar54396(alisha richardson)
create role if not exists analyst_ar54396;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ar54396') }}
{% endif %}
grant role analyst to role analyst_ar54396;
grant role "AIRPORT TECHNOLOGY" to role analyst_ar54396;
grant role ITCEXCMSYSTEMS_SG to role analyst_ar54396;
grant role SNOWFLAKEANALYST to role analyst_ar54396;
grant role "IT COMMON USE" to role analyst_ar54396;
-- Raw roles
grant usage on schema raw.sabre_acs_rt to role analyst_ar54396;
grant select on table raw.sabre_acs_rt.passenger to role analyst_ar54396;
grant usage on schema raw.sabre_pnr_rt to role analyst_ar54396;
grant select on table raw.sabre_pnr_rt.pnr to role analyst_ar54396;
grant select on table raw.sabre_pnr_rt.pnr_contact to role analyst_ar54396;
-- Stage roles
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_ar54396;
grant select on view analytics.stg_sabre_acs_rt.passengers to role analyst_ar54396;
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_ar54396;
grant select on view analytics.stg_sabre_pnr_rt.email_snowflake to role analyst_ar54396;
-- Sensitive roles
grant role sensitive_analytics_prd__bookings to role analyst_ar54396;
grant role sensitive_analytics_prd__bookings_rt__other_supplementary_information to role analyst_ar54396;
grant role sensitive_analytics_prd__employee_profile_record__header to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_ar54396;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__other_supplementary_information_snowflake to role analyst_ar54396;
grant role sensitive_analytics_prd__tickets_rt to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark to role analyst_ar54396;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_ar54396;
grant role sensitive_analytics_prd__bookings to role analyst_ar54396;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_ar54396;
grant role sensitive_analytics_prd__stg_sabre_epr__header to role analyst_ar54396;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers__passenger_first_name to role analyst_ar54396;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers__passenger_last_name to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records__passenger_first_name to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records__passenger_last_name to role analyst_ar54396;
grant role sensitive_analytics_prd__check_ins_rt__passengers__passenger_first_name to role analyst_ar54396;
grant role sensitive_analytics_prd__check_ins_rt__passengers__passenger_last_name to role analyst_ar54396;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__email_snowflake__pnr_email_address to role analyst_ar54396;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email__pnr_email_address to role analyst_ar54396;
grant role sensitive_analytics_prd__bookings_rt__email__pnr_email_address to role analyst_ar54396;
grant role analyst_ar54396 to role sysadmin;
grant role analyst_ar54396 to user "AR54396@JETBLUE.COM";

--analyst_aw10580 (Amanda Williams)
create role if not exists analyst_aw10580;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aw10580') }}
{% endif %}
grant role analyst to role analyst_aw10580;
grant role analyst_wpa_team to role analyst_aw10580;
grant role analyst_csbpo_webhelpworkforce to role analyst_aw10580;
grant role "WPA TEAM" to role analyst_aw10580;
grant role J5PRODKBANALYST to role analyst_aw10580;
-- analytics.stg_concentrix 
grant usage on schema analytics.stg_concentrix to role analyst_csbpo_webhelpworkforce;
grant select on view analytics.stg_concentrix.employees to role analyst_csbpo_webhelpworkforce;
-- PII roles
grant role sensitive_analytics_prd__concentrix__amazon_connect_agents to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__concentrix__amazon_connect_agent_summary to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__concentrix__amazon_connect_login_logout_summary to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__concentrix__employees to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__bookings__passengers__first_name to role analyst_aw10580;
grant role sensitive_analytics_prd__bookings__passengers__last_name to role analyst_aw10580;
grant role sensitive_analytics_prd__bookings__passenger_emails__email_address to role analyst_aw10580;
grant role sensitive_analytics_prd__bookings_rt__email__pnr_email_address to role analyst_aw10580;
grant role sensitive_analytics_prd__bookings_rt__passenger to role analyst_aw10580;
grant role sensitive_analytics_prd__bookings_rt__passenger__first_name to role analyst_aw10580;
grant role sensitive_analytics_prd__bookings_rt__passenger__last_name to role analyst_aw10580;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email__pnr_email_address to role analyst_aw10580;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger__first_name to role analyst_aw10580;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger__last_name to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_snowflake__first_name to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_snowflake__last_name to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__email_snowflake__pnr_email_address to role analyst_aw10580; 
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_aw10580;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent to role analyst_aw10580;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_first_name to role analyst_aw10580;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_last_name to role analyst_aw10580;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_name to role analyst_aw10580;         
grant role sensitive_analytics_prd__stg_concentrix__employees to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_concentrix__employees__full_name to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_concentrix__employees__supervisor to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_concentrix__employees__manager to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_concentrix__employees__crewmember_name to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_concentrix__employees__jetblue_email to role analyst_aw10580;
grant role sensitive_analytics_prd__stg_concentrix__employees__user_name to role analyst_aw10580;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents to role analyst_aw10580; 		
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_first_name to role analyst_aw10580; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_last_name to role analyst_aw10580; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_username to role analyst_aw10580; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_mobile to role analyst_aw10580; 
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_aw10580;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary__first_name to role analyst_aw10580;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary__last_name to role analyst_aw10580;

grant usage on database raw to role analyst_aw10580; 
grant usage on schema raw.sabre_pnr_rt to role analyst_aw10580; 
grant select on table raw.sabre_pnr_rt.pnr to role analyst_aw10580;    
grant role analyst_aw10580 to role sysadmin;
grant role analyst_aw10580 to user "AW10580@JETBLUE.COM";

-- analyst_ah31931 (Amanda Harvey)
create role if not exists analyst_ah31931; 
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ah31931') }}
{% endif %}
grant role analyst to role analyst_ah31931;
grant role "WPA TEAM" to role analyst_ah31931;
grant role J5PRODKBANALYST to role analyst_ah31931;
grant role analyst_ah31931 to role sysadmin;
grant role analyst_ah31931 to user "AH31931@JETBLUE.COM";

-- analyst_amsinghal (Amit Singhal)
create role if not exists analyst_amsinghal;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_amsinghal') }}
{% endif %}
grant role analyst to role analyst_amsinghal;
grant role analyst_itqualityassurance_nonprod to role analyst_amsinghal;
grant usage on database analytics_clone to role analyst_amsinghal;
grant usage on schema analytics_clone.aircraft_maintenance  to role analyst_amsinghal;
grant select on all tables in schema analytics_clone.aircraft_maintenance to role analyst_amsinghal;
grant select on all views in schema analytics_clone.aircraft_maintenance to role analyst_amsinghal;
grant select on future tables in schema analytics_clone.aircraft_maintenance  to role analyst_amsinghal;
grant select on future views in schema analytics_clone.aircraft_maintenance  to role analyst_amsinghal;
-- analytics_qa.cobrand
grant usage on database analytics_qa to role analyst_amsinghal;
grant usage on schema analytics_qa.cobrand to role analyst_amsinghal;
grant select on all tables in schema analytics_qa.cobrand to role analyst_amsinghal;
grant select on all views in schema analytics_qa.cobrand to role analyst_amsinghal;
grant select on future tables in schema analytics_qa.cobrand to role analyst_amsinghal;
grant select on future views in schema analytics_qa.cobrand to role analyst_amsinghal;
-- analytics_qa.cobrand_audit
grant usage on schema analytics_qa.cobrand_audit to role analyst_amsinghal;
grant select on all tables in schema analytics_qa.cobrand_audit to role analyst_amsinghal;
grant select on all views in schema analytics_qa.cobrand_audit to role analyst_amsinghal;
grant select on future tables in schema analytics_qa.cobrand_audit to role analyst_amsinghal;
grant select on future views in schema analytics_qa.cobrand_audit to role analyst_amsinghal;
-- analytics_qa.intermediary
grant usage on schema analytics_qa.intermediary to role analyst_amsinghal;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__alternate_names to role analyst_amsinghal;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__customers to role analyst_amsinghal;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__email_addresses to role analyst_amsinghal;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__identifications to role analyst_amsinghal;
grant select on table analytics_qa.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_amsinghal;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__phone_numbers to role analyst_amsinghal;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__postal_addresses to role analyst_amsinghal;
--raw_qa.cobrand_audit
grant usage on schema raw_qa.cobrand_audit to role analyst_amsinghal;
grant select on all tables in schema raw_qa.cobrand_audit to role analyst_amsinghal;
grant select on all views in schema raw_qa.cobrand_audit to role analyst_amsinghal;
grant select on future tables in schema raw_qa.cobrand_audit to role analyst_amsinghal;
grant select on future views in schema raw_qa.cobrand_audit to role analyst_amsinghal;
--raw_qa.cobrand_audit_legacy
grant usage on schema raw_qa.cobrand_audit_legacy to role analyst_amsinghal;
grant select on all tables in schema raw_qa.cobrand_audit_legacy to role analyst_amsinghal;
grant select on all views in schema raw_qa.cobrand_audit_legacy to role analyst_amsinghal;
grant select on future tables in schema raw_qa.cobrand_audit_legacy to role analyst_amsinghal;
grant select on future views in schema raw_qa.cobrand_audit_legacy to role analyst_amsinghal;
grant role raw_informatica_customers_rt_read to role analyst_amsinghal;
-- raw_qa.customers_rt
grant usage on database raw_qa to role analyst_amsinghal;
grant usage on schema raw_qa.customers_rt to role analyst_amsinghal;
grant select on all tables in schema raw_qa.customers_rt to role analyst_amsinghal;
-- raw roles
grant role raw_informatica_customers_rt_read to role analyst_amsinghal;
-- other sensitive roles
grant role sensitive_analytics_qa__cobrand_audit to role analyst_amsinghal;
grant role sensitive_analytics_qa__cobrand to role analyst_amsinghal;
grant role sensitive_sabre_pnr_read to role analyst_amsinghal;
grant role sensitive_customers_rt_read_qa to role analyst_amsinghal;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__alternate_names to role analyst_amsinghal;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__customers to role analyst_amsinghal;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_amsinghal;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__identifications to role analyst_amsinghal;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_amsinghal;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_amsinghal;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__postal_addresses to role analyst_amsinghal;
-- Analytics_qa.informatica_customers_rt
grant usage on database raw_qa to role analyst_amsinghal;
grant usage on schema raw_qa.informatica_customers_rt to role analyst_amsinghal;
grant select on all tables in schema raw_qa.informatica_customers_rt to role analyst_amsinghal;
grant select on future tables in schema raw_qa.informatica_customers_rt to role analyst_amsinghal;
grant role analytics_qa_informatica_customers_rt_read to role analyst_amsinghal;
grant role analytics_qa_stg_informatica_customers_rt_read to role analyst_amsinghal;
grant role sensitive_analytics_qa__informatica_customers_rt to role analyst_amsinghal;
grant role sensitive_analytics_qa__stg_informatica_customers_rt to role analyst_amsinghal;
-- analytics.stg_customers_rt
grant usage on schema analytics.stg_customers_rt to role analyst_amsinghal;
grant select on all tables in schema analytics.stg_customers_rt to role analyst_amsinghal;
grant select on future tables in schema analytics.stg_customers_rt to role analyst_amsinghal;
grant select on all views in schema analytics.stg_customers_rt to role analyst_amsinghal;
grant select on future views in schema analytics.stg_customers_rt to role analyst_amsinghal;
--analytics_clone.stg_customers_t
grant usage on database analytics_clone to role analyst_amsinghal;
grant usage on schema analytics_clone.stg_customers_rt to role analyst_amsinghal;
grant select on all tables in schema analytics_clone.stg_customers_rt to role analyst_amsinghal; 
grant select on future tables in schema analytics_clone.stg_customers_rt to role analyst_amsinghal;
grant select on all views in schema analytics_clone.stg_customers_rt to role analyst_amsinghal;
grant select on future views in schema analytics_clone.stg_customers_rt to role analyst_amsinghal;
-- analytics_clone.customers_rt
grant usage on schema analytics_clone.customers_rt to role analyst_amsinghal;
grant select on all tables in schema analytics_clone.customers_rt to role analyst_amsinghal;
grant select on future tables in schema analytics_clone.customers_rt to role analyst_amsinghal;
grant select on all views in schema analytics_clone.customers_rt to role analyst_amsinghal;
grant select on future views in schema analytics_clone.customers_rt to role analyst_amsinghal;
-- analytics_clone.intermediary.inter_customers_rt_tables
grant usage on schema analytics_clone.intermediary to role analyst_amsinghal; 
grant select on table analytics_clone.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_amsinghal;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__alternate_names to role analyst_amsinghal;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__customers to role analyst_amsinghal;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__email_addresses to role analyst_amsinghal;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__identifications to role analyst_amsinghal;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__phone_numbers to role analyst_amsinghal;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__postal_addresses to role analyst_amsinghal;
-- pii roles customers_rt
grant role sensitive_analytics_prd__informatica_customers_rt to role analyst_amsinghal;
grant role sensitive_analytics_prd__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_amsinghal;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__alternate_names to role analyst_amsinghal;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__customers to role analyst_amsinghal;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_amsinghal;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__identifications to role analyst_amsinghal;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_amsinghal;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__postal_addresses to role analyst_amsinghal;
-- pii role stg_customers_rt
grant role sensitive_analytics_prd__stg_informatica_customers_rt to role analyst_amsinghal;
grant role analyst_amsinghal to role sysadmin;
grant role analyst_amsinghal to user "AMSINGHAL@JETBLUE.COM";

-- analyst_aj01897 (AnnJillene Johanson)
create role if not exists analyst_aj01897;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aj01897') }}
{% endif %}
grant role analyst to role analyst_aj01897;
grant role analyst_blueloyalty to role analyst_aj01897;
grant role sensitive_responsys_read to role analyst_aj01897;
grant role analyst_aj01897 to user "AJ01897@JETBLUE.COM";

-- analyst_aj45629 (Auria Jorge)
create role if not exists analyst_aj45629;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aj45629') }}
{% endif %}
grant role analyst to role analyst_aj45629;
grant role itdataengineeringcrew to role analyst_aj45629;
-- sensitive roles
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings__trueblue_number to role analyst_aj45629;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings__trueblue_number to role analyst_aj45629;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings__trueblue_number to role analyst_aj45629;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_incentive_payout_history to role analyst_aj45629; 
grant role sensitive_analytics_prd__airports_incentives__airports_commission_seats_ancillary_report to role analyst_aj45629; 
grant role sensitive_analytics_prd__data_exports__airports_commission_incentive_payout to role analyst_aj45629;
grant role sensitive_analytics_prd__crew__crew_and_business_partners to role analyst_aj45629;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_aj45629;
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_aj45629;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_aj45629;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_aj45629;
grant role sensitive_analytics_prd__onboard_experience__inflight_transactions to role analyst_aj45629;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap__first_name to role analyst_aj45629;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap__middle_name to role analyst_aj45629;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap__last_name to role analyst_aj45629;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap__first_name to role analyst_aj45629; 
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap__last_name to role analyst_aj45629;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap__middle_name to role analyst_aj45629;
-- raw roles
grant usage on database raw to role analyst_aj45629;
grant usage on schema raw.sap_reports to role analyst_aj45629;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_aj45629;
grant usage on schema analytics.stg_sap_reports to role analyst_aj45629;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_aj45629;
--analytics_clone roles
grant usage on database analytics_clone to role analyst_aj45629;
grant usage on all schemas in database analytics_clone to role analyst_aj45629;
grant select on all tables in database analytics_clone to role analyst_aj45629;
grant select on all views in database analytics_clone to role analyst_aj45629;
grant select on future tables in database analytics_clone to role analyst_aj45629;
grant select on future views in database analytics_clone to role analyst_aj45629;
grant role analyst_aj45629 to role sysadmin;
grant role analyst_aj45629 to user "AJ45629@JETBLUE.COM";

-- analyst_aj56238 (Ashley Jones)
create role if not exists analyst_aj56238;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aj56238') }}
{% endif %}
grant role analyst to role analyst_aj56238;
grant role "BLUE MARKETING ALL" to role analyst_aj56238;
grant usage on schema analytics.crew_rt to role analyst_aj56238;
grant usage on schema analytics.crew to role analyst_aj56238;
grant select on all tables in schema analytics.crew_rt to role analyst_aj56238;
grant select on all views in schema analytics.crew_rt to role analyst_aj56238;
grant select on future tables in schema analytics.crew_rt to role analyst_aj56238;
grant select on future views in schema analytics.crew_rt to role analyst_aj56238;
-- PII Roles
grant role sensitive_analytics_prd__crew__crewmember_profiles__email_address to role analyst_aj56238;
grant role sensitive_analytics_prd__crew_rt to role analyst_aj56238;
grant role sensitive_analytics_prd__crew__crewmember_master__first_name to role analyst_aj56238;
grant role sensitive_analytics_prd__crew__crewmember_master__last_name to role analyst_aj56238;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings__passenger_last_name to role analyst_aj56238;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings__passenger_first_name to role analyst_aj56238;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings__issuing_crewmember_last_name to role analyst_aj56238;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings__issuing_crewmember_first_name to role analyst_aj56238;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings__issuing_crewmember_first_name to role analyst_aj56238;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings__issuing_crewmember_last_name to role analyst_aj56238;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings__passenger_first_name to role analyst_aj56238;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings__passenger_last_name to role analyst_aj56238;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings__issuing_crewmember_first_name to role analyst_aj56238;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings__issuing_crewmember_last_name to role analyst_aj56238;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings__passenger_first_name to role analyst_aj56238;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings__passenger_last_name to role analyst_aj56238;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings__trueblue_number to role analyst_aj56238;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings__issuing_crewmember_email to role analyst_aj56238;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings__issuing_crewmember_email to role analyst_aj56238;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings__trueblue_number to role analyst_aj56238;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings__trueblue_number to role analyst_aj56238;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings__issuing_crewmember_email to role analyst_aj56238;
grant role BLUELOYALTY to role analyst_aj56238;
grant role byod_bluemktanalytics to role analyst_aj56238;
grant role analyst_aj56238 to role sysadmin;
grant role analyst_aj56238 to user "AJ56238@JETBLUE.COM";

-- analyst_al28186 (Amanda Luna)
create role if not exists analyst_al28186;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_al28186') }}
{% endif %}
grant role analyst to role analyst_al28186;
grant role sensitive_analytics_prd__crew to role analyst_al28186;
grant role sensitive_analytics_prd__servicenow to role analyst_al28186;
-- analytics.stg_servicenow
grant usage on schema analytics.stg_servicenow to role analyst_al28186;
grant select on table analytics.stg_servicenow.business_partners_onboard_tsa to role analyst_al28186;
grant role sensitive_analytics_prd__stg_servicenow to role analyst_al28186;
-- raw.servicenow
grant role raw_servicenow_read to role analyst_al28186;
grant role analyst_al28186 to role sysadmin;
grant role analyst_al28186 to user "AL28186@JETBLUE.COM";
-- PII Roles
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_al28186;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_al28186;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_al28186;
grant role sensitive_analytics_prd__crew__crewmember_profiles to role analyst_al28186;
grant role sensitive_analytics_prd__comply365__crewmember to role analyst_al28186;

-- analyst_ak49533 (Aly Korth)
create role if not exists analyst_ak49533;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ak49533') }}
{% endif %}
grant role analyst to role analyst_ak49533;
grant role analyst_blueloyalty to role analyst_ak49533;
grant role sensitive_responsys_read to role analyst_ak49533;
grant role analyst_ak49533 to user "AK49533@JETBLUE.COM";

-- analyst_ak93547 (arnold kim)
create role if not exists analyst_ak93547;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ak93547') }}
{% endif %}
grant role analyst_mu40876 to role analyst_ak93547;
grant role analyst_ak93547 to role sysadmin;
grant role analyst_ak93547 to user "AK93547@JETBLUE.COM";

-- analyst_ak89406 (Ashit Kumar)
create role if not exists analyst_ak89406;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ak89406') }}
{% endif %}
grant role analyst to role analyst_ak89406;
grant role "IT DIRECTORS" to role analyst_ak89406;
grant role "IT SECURITY CREW" to role analyst_ak89406;
grant role bluedirector_only to role analyst_ak89406;
-- RAW ROLES
grant role raw_servicenow_read to role analyst_ak89406;
grant role analyst_ak89406 to role sysadmin;
grant role analyst_ak89406 to user "AK89406@JETBLUE.COM";

-- analyst_ag17397(Alla Gorelik)
create role if not exists analyst_ag17397;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ag17397') }}
{% endif %}
grant role analyst to role analyst_ag17397;
grant role analyst_bluestratbizdev to role analyst_ag17397;
-- analytics.loyalty_rt 
grant usage on schema analytics.loyalty_rt to role analyst_ag17397;
grant select on table analytics.loyalty_rt.elite_tier_history to role analyst_ag17397;
-- analytics.check_ins
grant usage on schema analytics.check_ins to role analyst_ag17397;
grant select on table analytics.check_ins.passengers to role analyst_ag17397;
--SENSITIVE ROLES
-- grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_ag17397;
-- grant role sensitive_analytics_prd__analytics__beta_customers_fact to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__first_name to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__last_name to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__postal_country_name to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_first_name to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_last_name to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_middle_name to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__first_name to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__last_name to role analyst_ag17397;
grant role sensitive_analytics_prd__bookings__passenger_documents to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_birth_date to role analyst_ag17397;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__date_of_birth to role analyst_ag17397;
grant role sensitive_analytics_prd__check_ins__passengers to role analyst_ag17397;
grant role sensitive_analytics_prd__customers_rt__postal_addresses to role analyst_ag17397;
grant role sensitive_analytics_prd__customers_rt__postal_addresses to role analyst_ag17397;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__postal_addresses to role analyst_ag17397;
grant role sensitive_analytics_prd__stg_customers_rt__initial_postal_addresses to role analyst_ag17397;
grant role sensitive_analytics_prd__stg_customers_rt__postal_addresses to role analyst_ag17397;
--byod roles
grant usage on schema byod.bluerm to role analyst_ag17397;
grant select on table byod.bluerm.diio_flight_nm to role analyst_ag17397;
grant role byod_opa_read to role analyst_ag17397;
grant role byod_bluerm_read to role analyst_ag17397;
--other roles
grant imported privileges on database masflight to role analyst_ag17397;
grant role analyst_ag17397 to role sysadmin;
grant role analyst_ag17397 to user "AG17397@JETBLUE.COM";

-- analyst_yo03736 (Andrew Osman)
create role if not exists analyst_yo03736;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_yo03736') }}
{% endif %}
grant role analyst to role analyst_yo03736;
grant role DISPATCHSNOWFLAKE to role analyst_yo03736;  
grant role JBUDISP to role analyst_yo03736;
grant role usr_sysplanninganalysisro to role analyst_yo03736;
--analytics
grant usage on database analytics to role analyst_yo03736;
grant usage on schema analytics.flightkeys to role analyst_yo03736;
grant select on all tables in schema analytics.flightkeys to role analyst_yo03736;
grant select on all views in schema analytics.flightkeys to role analyst_yo03736;
grant select on future tables in schema analytics.flightkeys to role analyst_yo03736;
grant select on future views in schema analytics.flightkeys to role analyst_yo03736;
-- analytics.stg_flightkeys
grant usage on schema analytics.stg_flightkeys to role analyst_yo03736; 
grant select on view analytics.stg_flightkeys.flight_info_crew_list to role analyst_yo03736;
--analytics_qa
grant usage on database analytics_qa to role analyst_yo03736;
grant usage on schema analytics_qa.flightkeys to role analyst_yo03736;
grant select on all tables in schema analytics_qa.flightkeys to role analyst_yo03736;
grant select on all views in schema analytics_qa.flightkeys to role analyst_yo03736;
grant select on future tables in schema analytics_qa.flightkeys to role analyst_yo03736;
grant select on future views in schema analytics_qa.flightkeys to role analyst_yo03736;
--raw
grant usage on database raw to role analyst_yo03736;
grant usage on schema raw.flightkeys to role analyst_yo03736;
grant select on all tables in schema raw.flightkeys to role analyst_yo03736;
grant select on future tables in schema raw.flightkeys to role analyst_yo03736;
-- BYOD.BLUEREVFORECASTING
grant usage on database byod to role analyst_yo03736;
grant usage on schema byod.bluerevforecasting to role analyst_yo03736;
grant select on table byod.bluerevforecasting.cplf to role analyst_yo03736;
grant role "BLUE OPS ENGINEERING" to role analyst_yo03736;
--sensitive roles
grant role sensitive_analytics_prd__flightkeys__flight_info__captain_name to role analyst_yo03736;
grant role sensitive_analytics_prd__stg_flightkeys__flight_info__captain_name to role analyst_yo03736;
grant role sensitive_analytics_prd__crew__crewmember_master__first_name to role analyst_yo03736;
grant role sensitive_analytics_prd__crew__crewmember_master__last_name to role analyst_yo03736;
grant role sensitive_analytics_prd__flightkeys__flight_info_crew_list__crewmember_name to role analyst_yo03736; 
grant role sensitive_analytics_prd__stg_flightkeys__flight_info_crew_list__crewmember_name to role analyst_yo03736; 
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_info_crew_list__crewmember_name to role analyst_yo03736;
grant role sensitive_analytics_qa__flightkeys__flight_info__captain_name to role analyst_yo03736;
grant role sensitive_analytics_qa__stg_flightkeys__flight_info__captain_name to role analyst_yo03736;
grant role sensitive_analytics_prd__flightkeys__flight_plan_header to role analyst_yo03736;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header to role analyst_yo03736;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header to role analyst_yo03736;
grant role sensitive_analytics_qa__flightkeys__flight_plan_header to role analyst_yo03736;
grant role sensitive_analytics_qa__intermediary__inter_flightkeys__flight_plan_header to role analyst_yo03736;
grant role sensitive_analytics_qa__stg_flightkeys__flight_plan_header to role analyst_yo03736;
--analytics_clone
grant usage on database analytics_clone to role analyst_yo03736;
-- analytics_clone.flight_operations
grant usage on schema analytics_clone.flight_operations to role analyst_yo03736;
-- grant select on table analytics_clone.flight_operations.aircom_apu to role analyst_yo03736;
-- other roles
grant role analyst_yo03736 to role sysadmin;
grant role analyst_yo03736 to user "YO03736@JETBLUE.COM";

-- analyst_am37999(Angela McGovern)
create role if not exists analyst_am37999;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_am37999') }}
{% endif %}
grant role analyst to role analyst_am37999;
grant role "IT EQA GLOBAL TEAM" to role analyst_am37999;
-- analytics_qa
grant usage on database analytics_qa to role analyst_am37999;
grant usage on schema analytics_qa.customers_rt to role analyst_am37999;
grant select on view analytics_qa.customers_rt.jetblue_accounts to role analyst_am37999;
grant usage on schema analytics_qa.stg_customers_rt to role analyst_am37999;
grant select on view analytics_qa.stg_customers_rt.jetblue_accounts to role analyst_am37999;
grant usage on schema analytics_qa.intermediary to role analyst_am37999;
grant select on table analytics_qa.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_am37999;
grant select on view analytics_qa.customers_rt.jetblue_accounts_history to role analyst_am37999;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_am37999;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_am37999;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_am37999;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_am37999;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_am37999;
-- raw_qa
grant usage on database raw_qa to role analyst_am37999;
grant usage on schema raw_qa.credit_profiles_rt to role analyst_am37999;
grant select on table raw_qa.credit_profiles_rt.jetblue_accounts to role analyst_am37999;
-- sensitive
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts to role analyst_am37999;
grant role sensitive_analytics_qa__stg_customers_rt__jetblue_accounts to role analyst_am37999;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_am37999;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts_history to role analyst_am37999;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_am37999;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_am37999;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_am37999;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_am37999;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_am37999;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_am37999;
grant role analyst_am37999 to role sysadmin;
grant role analyst_am37999 to user "AM37999@JETBLUE.COM";

-- analyst_apatil (Anup Patil)
create role if not exists analyst_apatil;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_apatil') }}
{% endif %}
grant role analyst to role analyst_apatil;
grant role "ITDATAQA-NONPROD" to role analyst_apatil;
grant role "ITDATAQA-PROD" to role analyst_apatil;
grant role ITQUALITYASSURANCEDW to role analyst_apatil;
grant role analytics_prd__all_schemas_sensitive_analytics_roles to role analyst_apatil;
-- analytics_clone_read roles
grant role analytics_clone_read to role analyst_apatil;
grant usage on database analytics to role analyst_apatil;
grant usage on all schemas in database analytics to role analyst_apatil;
grant select on all tables in database analytics to role analyst_apatil;
grant select on future tables in database analytics to role analyst_apatil;
grant select on all views in database analytics to role analyst_apatil;
grant select on future views in database analytics to role analyst_apatil;
grant usage on schema analytics.stg_jbu to role analyst_apatil;
grant select on all views in schema analytics.stg_jbu to role analyst_apatil;
grant select on future views in schema analytics.stg_jbu to role analyst_apatil;
grant select on all tables in schema analytics.stg_jbu to role analyst_apatil;
grant select on future tables in schema analytics.stg_jbu to role analyst_apatil;
-- ANALYTICS_QA.SAFETY
grant usage on database analytics_qa to role analyst_apatil;
grant usage on schema analytics_qa.safety to role analyst_apatil;
grant select on all tables in schema analytics_qa.safety to role analyst_apatil;
grant select on future tables in schema analytics_qa.safety to role analyst_apatil;
grant select on all views in schema analytics_qa.safety to role analyst_apatil;
grant select on future views in schema analytics_qa.safety to role analyst_apatil;
grant usage on schema analytics_qa.stg_aqd to role analyst_apatil;
grant select on all views in schema analytics_qa.stg_aqd to role analyst_apatil;
grant select on future views in schema analytics_qa.stg_aqd to role analyst_apatil;
grant usage on schema analytics_qa.stg_vistair to role analyst_apatil;
grant select on all views in schema analytics_qa.stg_vistair to role analyst_apatil;
grant select on future views in schema analytics_qa.stg_vistair to role analyst_apatil;
grant usage on schema raw_qa.aqd to role analyst_apatil;
grant select on all tables in schema raw_qa.aqd to role analyst_apatil;
grant usage on schema raw_qa.vistair to role analyst_apatil;
grant select on all tables in schema raw_qa.vistair to role analyst_apatil;
-- ANALYTICS_QA.STG_VISTAIR
grant usage on schema analytics_qa.stg_vistair to role analyst_apatil;
grant select on all views in schema analytics_qa.stg_vistair to role analyst_apatil;
grant select on future views in schema analytics_qa.stg_vistair to role analyst_apatil;
-- Sensitive Roles
grant role sensitive_analytics_prd__check_ins__documents to role analyst_apatil;
grant role sensitive_analytics_prd__check_ins__passengers to role analyst_apatil;
grant role sensitive_analytics_prd__check_ins__passenger_histories to role analyst_apatil;
grant role sensitive_analytics_prd__training to role analyst_apatil;
grant role sensitive_analytics_prd__stg_jbu to role analyst_apatil;
grant role raw_jbu_read to role analyst_apatil;
-- analytics_qa PII roles
grant role sensitive_raw_qa__aqd to role analyst_apatil;
grant role sensitive_analytics_qa__stg_aqd to role analyst_apatil;
grant role sensitive_analytics_qa__stg_vistair to role analyst_apatil;
grant role sensitive_analytics_qa__safety to role analyst_apatil;
grant role sensitive_analytics_qa__agent_sales_reports to role analyst_apatil;
grant role sensitive_analytics_qa__sabre_travel_bank to role analyst_apatil;
grant role sensitive_analytics_qa__stg_jbu to role analyst_apatil;
grant role sensitive_analytics_qa__training to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__actions to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__findings_acceptance_responses to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__findings to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_do_office to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_environmental_assessments to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_flight_standards to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_international_operations to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_international_system_operations to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_operations_engineer to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_foqa_gatekeeper_contacts to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_generic_investigations to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_airports to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_cnst to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_dispatch_standards to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_dispatch_support to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_fatigue_risk_management to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_flight_standards to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_safety_investigations to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_core to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_crewmember_details to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_cro_reports to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_denied_boarding to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_fuel_chemical_spill to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_medical_injury to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_risk_assessments to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_do_office to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_operations_engineer to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__mitigations to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__risks to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_lost_or_found_items to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_tech_ops_qa_investigation to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_airports to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_tech_operations to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_environmental_assessment to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_international_operations to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_tech_operations to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_voluntary_disclosure_reports to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_person_details to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__audit_plannings to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_flight_operations_risk_assessment to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_inadmissible_customer to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_safety_analysis to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_system_operations_international to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_ground_support_equipment_details to role analyst_apatil;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_wildlife_strike to role analyst_apatil;
-- raw_qa
grant usage on database raw_qa to role analyst_apatil;
-- raw_qa.jbu
grant usage on schema raw_qa.jbu to role analyst_apatil;
grant select on all tables in schema raw_qa.jbu to role analyst_apatil;
grant select on all views in schema raw_qa.jbu to role analyst_apatil;
grant select on future tables in schema raw_qa.jbu to role analyst_apatil;
grant select on future views in schema raw_qa.jbu to role analyst_apatil;
grant role analyst_apatil to role sysadmin;
grant role analyst_apatil to user "APATIL@JETBLUE.COM";
--analytics_clone
grant usage on database analytics_clone to role analyst_apatil;
grant usage on schema analytics_clone.tickets_rt to role analyst_apatil;
grant select on all tables in schema analytics_clone.tickets_rt to role analyst_apatil;
grant select on all views in schema analytics_clone.tickets_rt to role analyst_apatil;
grant select on future tables in schema analytics_clone.tickets_rt to role analyst_apatil;
grant select on future views in schema analytics_clone.tickets_rt to role analyst_apatil;

-- analyst_Brett Stutts
create role if not exists analyst_bs46607;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bs46607') }}
{% endif %}
grant role analyst to role analyst_bs46607;
grant role byod_bluemktanalytics_read to role analyst_bs46607;
grant role "BLUE MARKETING ALL" to role analyst_bs46607;
grant role BLUEMARCOMM to role analyst_bs46607;
grant role BLUEPERSONALIZATION to role analyst_bs46607;
grant role TABLEAUONLINECREATOR to role analyst_bs46607;
grant role sensitive_analytics_prd__email_marketing to role analyst_bs46607;
grant role sensitive_analytics_prd__email_marketing__clicked_marketing to role analyst_bs46607;
grant role sensitive_analytics_prd__email_marketing__clicked_operational to role analyst_bs46607;
grant role sensitive_analytics_prd__email_marketing__opened_marketing to role analyst_bs46607;
grant role sensitive_analytics_prd__email_marketing__opened_operational to role analyst_bs46607;
grant role sensitive_analytics_prd__email_marketing__sent_marketing to role analyst_bs46607;
grant role sensitive_analytics_prd__email_marketing__sent_operational to role analyst_bs46607;
grant role sensitive_analytics_prd__bookings__passenger_emails to role analyst_bs46607;
grant role sensitive_analytics_prd__bookings__passenger_documents to role analyst_bs46607;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_bs46607;
grant role analyst_bs46607 to role sysadmin;
grant role analyst_bs46607 to user "BS46607@JETBLUE.COM";

-- analyst_arunt 
create role if not exists analyst_arunt;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_arunt') }}
{% endif %}  
grant role tcsdataengineering to role analyst_arunt;
--analytics
grant usage on database analytics to role analyst_arunt;
grant usage on all schemas in database analytics to role analyst_arunt;
grant select on all tables in database analytics to role analyst_arunt;
grant select on future tables in database analytics to role analyst_arunt;
grant select on all views in database analytics to role analyst_arunt;
grant select on future views in database analytics to role analyst_arunt;
grant usage on schema analytics.stg_planitas to role analyst_arunt;
grant usage on schema analytics.stg_tomorrow_io_weather to role analyst_arunt;
grant select on all tables in schema analytics.stg_tomorrow_io_weather to role analyst_arunt;
grant select on all views in schema analytics.stg_tomorrow_io_weather to role analyst_arunt;
grant select on future tables in schema analytics.stg_tomorrow_io_weather to role analyst_arunt;
grant select on future views in schema analytics.stg_tomorrow_io_weather to role analyst_arunt;
grant select on view analytics.safety.call_outs to role analyst_arunt;
grant select on view analytics.stg_safety.call_outs to role analyst_arunt;
--analytics_qa
grant usage on database analytics_qa to role analyst_arunt;
grant role analytics_qa_read to role analyst_arunt;
-- analytics_qa.stg_web_logs_rt
grant usage on schema analytics_qa.stg_web_logs_rt to role analyst_arunt; 
grant select on all tables in schema analytics_qa.stg_web_logs_rt to role analyst_arunt;
grant select on all views in schema analytics_qa.stg_web_logs_rt to role analyst_arunt;
grant select on future tables in schema analytics_qa.stg_web_logs_rt to role analyst_arunt;
grant select on future views in schema analytics_qa.stg_web_logs_rt to role analyst_arunt;
-- raw read roles
grant role raw_comarch_bi_prod_dbo_read to role analyst_arunt;
grant role raw_crew_read to role analyst_arunt;
grant role raw_dbt_read to role analyst_arunt;
grant role raw_federal_aviation_read to role analyst_arunt;
grant role raw_flight_oal_rt_read to role analyst_arunt;
grant role raw_flight_rt_read to role analyst_arunt;
grant role raw_planitas_read to role analyst_arunt;
grant role raw_inflight_survey_read to role analyst_arunt;
grant role raw_informatica_customers_rt_read to role analyst_arunt;
grant role raw_sabre_acs_batch_read to role analyst_arunt;
grant role raw_sabre_ticket_batch_read to role analyst_arunt;
grant role raw_sabre_queue_read to role analyst_arunt;
grant role raw_sabre_vcr_flown_read to role analyst_arunt;
grant role raw_salesforce_read to role analyst_arunt;
grant role raw_solution_tek_read to role analyst_arunt;
grant role raw_surveys_read to role analyst_arunt;
grant role raw_trax_read to role analyst_arunt;
grant role raw_web_logs_rt_read to role analyst_arunt;
-- raw.reference
grant role raw_reference_read to role analyst_arunt;
-- raw.reference_archive
grant role raw_reference_archive_read to role analyst_arunt;
--raw
grant usage on database raw to role analyst_arunt; 
grant usage on schema raw.safety to role analyst_arunt;
grant select on table raw.safety.call_outs to role analyst_arunt;
grant usage on schema raw.baggage to role analyst_arunt;
grant usage on schema raw.open_weather_map to role analyst_arunt;
grant select on all tables in schema raw.baggage to role analyst_arunt;
grant select on all tables in schema raw.open_weather_map to role analyst_arunt;
grant select on future tables in schema raw.open_weather_map to role analyst_arunt;
-- analytics.stg_sabre_queue
grant usage on schema analytics.stg_sabre_queue to role analyst_arunt;
grant select on all tables in schema analytics.stg_sabre_queue to role analyst_arunt;
grant select on all views in schema analytics.stg_sabre_queue to role analyst_arunt;
grant select on future tables in schema analytics.stg_sabre_queue to role analyst_arunt;
grant select on future views in schema analytics.stg_sabre_queue to role analyst_arunt;
grant usage on schema analytics.stg_accelya_mis to role analyst_arunt;
grant usage on schema analytics.stg_baggage to role analyst_arunt;
grant usage on schema analytics.stg_inflight_survey to role analyst_arunt;
grant usage on stage raw.sabre_acs_batch.pax_flight_stage to role analyst_arunt;
grant usage on file format raw.sabre_acs_batch.sabre_acs_batch_ff to role analyst_arunt;
grant usage on schema analytics.stg_credit_card_sales to role analyst_arunt;
grant select on all tables in schema analytics.stg_credit_card_sales to role analyst_arunt;
grant select on all views in schema analytics.stg_credit_card_sales to role analyst_arunt;
grant select on future tables in schema analytics.stg_credit_card_sales to role analyst_arunt;
grant select on future views in schema analytics.stg_credit_card_sales to role analyst_arunt;
grant select on all tables in schema analytics.stg_inflight_survey to role analyst_arunt;
grant select on all views in schema analytics.stg_inflight_survey to role analyst_arunt;
grant select on future tables in schema analytics.stg_inflight_survey to role analyst_arunt;
grant select on future views in schema analytics.stg_inflight_survey to role analyst_arunt;
grant select on all tables in schema analytics.stg_accelya_mis to role analyst_arunt;
grant select on all views in schema analytics.stg_accelya_mis to role analyst_arunt;
grant select on all tables in schema analytics_qa.stg_accelya_mis to role analyst_arunt;
grant select on all views in schema analytics_qa.stg_accelya_mis to role analyst_arunt;
grant select on future tables in schema analytics.stg_accelya_mis to role analyst_arunt;
grant select on future views in schema analytics.stg_accelya_mis to role analyst_arunt;
grant select on future tables in schema analytics_qa.stg_accelya_mis to role analyst_arunt;
grant select on future views in schema analytics_qa.stg_accelya_mis to role analyst_arunt;
grant select on all tables in schema analytics.stg_accelya_mis to role analyst_arunt;
grant select on all views in schema analytics.stg_accelya_mis to role analyst_arunt;
grant select on all tables in schema analytics.stg_baggage to role analyst_arunt;
grant select on all views in schema analytics_qa.stg_baggage to role analyst_arunt;
grant select on all views in schema analytics.stg_baggage to role analyst_arunt;
grant select on future views in schema analytics.stg_baggage to role analyst_arunt;
grant select on future tables in schema analytics.stg_baggage to role analyst_arunt;
grant select on future views in schema analytics_qa.stg_baggage to role analyst_arunt;
grant usage on schema analytics.stg_reconciliation_rt to role analyst_arunt;
grant select on all views in schema analytics.stg_reconciliation_rt to role analyst_arunt;
grant select on all tables in schema analytics.stg_reconciliation_rt to role analyst_arunt;
grant select on future tables in schema analytics.stg_reconciliation_rt to role analyst_arunt;
grant select on future views in schema analytics.stg_reconciliation_rt to role analyst_arunt;
grant role analyst_arunt to role sysadmin;
grant role analyst_arunt to user "ARUNT@JETBLUE.COM";

-- analyst_as61408 (Austin Sullins)
create role if not exists analyst_as61408;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_as61408') }}
{% endif %}
grant role analyst to role analyst_as61408;
grant role OPERATIONSANALYSIS to role analyst_as61408;
grant role USR_SYSPLANNINGANALYSISRO to role analyst_as61408;
grant role raw_rainmaker_read to role analyst_as61408;
grant role analyst_as61408 to role sysadmin;
grant role analyst_as61408 to user "AS61408@JETBLUE.COM";

-- analyst_as16596 (Amanda Swenson)
create role if not exists analyst_as16596;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_as16596') }}
{% endif %}
grant role analyst to role analyst_as16596;
grant role "BLUE MARKETING ALL" to role analyst_as16596;
grant role blueloyalty to role analyst_as16596;
grant role loyaltyanalysis to role analyst_as16596;
-- ANALYTICS.BCUS_TRANSACTIONS
grant usage on schema analytics.bcus_transactions to role analyst_as16596;
grant select on table analytics.bcus_transactions.barclays_card_transactions to role analyst_as16596;
-- BYOD ROLES
grant role byod_bluerevforecasting_read to role analyst_as16596;
grant role analyst_as16596 to role sysadmin;
grant role analyst_as16596 to user "AS16596@JETBLUE.COM";

-- analyst_as72189 (atishay saraogi)
create role if not exists analyst_as72189;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_as72189') }}
{% endif %}
grant role analyst to role analyst_as72189;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_as72189;
grant role sensitive_analytics_prd__sharepoint_airport_applications__ecs_101_main_report to role analyst_as72189;
grant role analyst_as72189 to user "AS72189@JETBLUE.COM";
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__crew__crew_and_business_partners to role analyst_as72189;
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_as72189;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_as72189;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_as72189;
 
-- analyst_aw33013 (Alexander Weinstein)
create role if not exists analyst_aw33013;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_aw33013') }}
{% endif %}
grant role analyst to role analyst_aw33013;
grant role ITDATAENGINEERINGCREW to role analyst_aw33013;
-- RAW.SHAREPOINT_CEX
grant usage on schema raw.sharepoint_cex to role analyst_aw33013;
grant select on all tables in schema raw.sharepoint_cex to role analyst_aw33013;
grant select on future tables in schema raw.sharepoint_cex to role analyst_aw33013;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_aw33013;
-- Jetblue_share database access
grant usage on database jetblue_share to role analyst_aw33013;
grant usage on all schemas in database jetblue_share to role analyst_aw33013;
grant select on all tables in database jetblue_share to role analyst_aw33013;
grant select on future tables in database jetblue_share to role analyst_aw33013;
grant select on all views in database jetblue_share to role analyst_aw33013;
grant select on future views in database jetblue_share to role analyst_aw33013;
grant role analyst_aw33013 to role sysadmin;
grant role analyst_aw33013 to user "AW33013@JETBLUE.COM";

-- analyst_bh65119(Bartosz Herdzik)
create role if not exists analyst_bh65119;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bh65119') }}
{% endif %}
grant role analyst to role analyst_bh65119;
grant role bluereliabilityengineering to role analyst_bh65119;
grant role bluetechops to role analyst_bh65119;
grant role itdataengineeringcrew to role analyst_bh65119;
grant role snowflakeanalyst to role analyst_bh65119;
grant role tableauonlinecreator to role analyst_bh65119;
grant role raw_trax_read to role analyst_bh65119;
grant role raw_comarch_read to role analyst_bh65119;
grant role raw_flightkeys_read to role analyst_bh65119;
-- analytics.bcus_transactions
--grant role analytics_bcus_transactions_read to role analyst_bh65119;
-- analytics.aircraft_sensors
grant usage on schema analytics.aircraft_sensors to role analyst_bh65119;
grant select on all tables in schema analytics.aircraft_sensors to role analyst_bh65119;
grant select on all views in schema analytics.aircraft_sensors to role analyst_bh65119;
grant select on future tables in schema analytics.aircraft_sensors to role analyst_bh65119;
grant select on future views in schema analytics.aircraft_sensors to role analyst_bh65119;
-- analytics.stg_aircraft_sensors
grant usage on schema analytics.stg_aircraft_sensors to role analyst_bh65119;
grant select on all tables in schema analytics.stg_aircraft_sensors to role analyst_bh65119;
grant select on all views in schema analytics.stg_aircraft_sensors to role analyst_bh65119;
grant select on future tables in schema analytics.stg_aircraft_sensors to role analyst_bh65119;
grant select on future views in schema analytics.stg_aircraft_sensors to role analyst_bh65119;
-- analytics.stg_barclays
grant role analytics_stg_barclays_read to role analyst_bh65119;
-- analytics.stg_jbu
grant usage on schema analytics.stg_jbu to role analyst_bh65119;
grant select on all tables in schema analytics.stg_jbu to role analyst_bh65119;
grant select on all views in schema analytics.stg_jbu to role analyst_bh65119;
grant select on future tables in schema analytics.stg_jbu to role analyst_bh65119;
grant select on future views in schema analytics.stg_jbu to role analyst_bh65119;
grant usage on schema analytics.stg_flight_plan_manager to role analyst_bh65119;
grant usage on schema analytics.stg_flightkeys to role analyst_bh65119;
grant select on all tables in schema analytics.stg_flightkeys to role analyst_bh65119;
grant select on all views in schema analytics.stg_flightkeys to role analyst_bh65119;
grant select on future tables in schema analytics.stg_flightkeys to role analyst_bh65119;
grant select on future views in schema analytics.stg_flightkeys to role analyst_bh65119;
grant select on all tables in schema analytics.stg_flight_plan_manager to role analyst_bh65119;
grant select on all views in schema analytics.stg_flight_plan_manager to role analyst_bh65119;
grant select on future tables in schema analytics.stg_flight_plan_manager to role analyst_bh65119;
grant select on future views in schema analytics.stg_flight_plan_manager to role analyst_bh65119;
grant usage on schema analytics.stg_sabre_accb to role analyst_bh65119;
grant select on all tables in schema analytics.stg_sabre_accb to role analyst_bh65119;
grant select on all views in schema analytics.stg_sabre_accb to role analyst_bh65119;
grant select on future tables in schema analytics.stg_sabre_accb to role analyst_bh65119;
grant select on future views in schema analytics.stg_sabre_accb to role analyst_bh65119;
grant usage on schema analytics.stg_trax to role analyst_bh65119;
grant select on all tables in schema analytics.stg_trax to role analyst_bh65119;
grant select on all views in schema analytics.stg_trax to role analyst_bh65119;
grant select on future views in schema analytics.stg_trax to role analyst_bh65119;
grant select on future tables in schema analytics.stg_trax to role analyst_bh65119;
grant role raw_sabre_accb_read to role analyst_bh65119;
grant role raw_sabre_flight_plan_manager_read to role analyst_bh65119;
grant usage on database raw to role analyst_bh65119;
grant usage on schema raw.aqd to role analyst_bh65119;
grant select on all tables in schema raw.aqd to role analyst_bh65119;
grant select on all views in schema raw.aqd to role analyst_bh65119;
grant select on future views in schema raw.aqd to role analyst_bh65119;
grant select on future tables in schema raw.aqd to role analyst_bh65119;
-- raw.barclays
grant role raw_barclays_read to role analyst_bh65119;
grant usage on schema analytics.safety to role analyst_bh65119;
grant select on all tables in schema analytics.safety to role analyst_bh65119;
grant select on all views in schema analytics.safety to role analyst_bh65119;
grant select on future views in schema analytics.safety to role analyst_bh65119;
grant select on future tables in schema analytics.safety to role analyst_bh65119;
grant usage on schema analytics.stg_safety to role analyst_bh65119;
grant select on all tables in schema analytics.stg_safety to role analyst_bh65119;
grant select on all views in schema analytics.stg_safety to role analyst_bh65119;
grant select on future views in schema analytics.stg_safety to role analyst_bh65119;
grant select on future tables in schema analytics.stg_safety to role analyst_bh65119;
grant usage on schema analytics.stg_aqd to role analyst_bh65119;
grant select on all tables in schema analytics.stg_aqd to role analyst_bh65119;
grant select on all views in schema analytics.stg_aqd to role analyst_bh65119;
grant select on future views in schema analytics.stg_aqd to role analyst_bh65119;
grant select on future tables in schema analytics.stg_aqd to role analyst_bh65119;
grant usage on schema raw.jbu to role analyst_bh65119;
grant select on all tables in schema raw.jbu to role analyst_bh65119;
grant select on all views in schema raw.jbu to role analyst_bh65119;
grant select on future tables in schema raw.jbu to role analyst_bh65119;
grant select on future views in schema raw.jbu to role analyst_bh65119;
-- raw.flight_link
grant role raw_flight_link_read to role analyst_bh65119;
grant role analyst_bh65119 to role sysadmin;
grant role analyst_bh65119 to user "BH65119@JETBLUE.COM";

-- analyst_bd02602(Bianca Diaz)
create role if not exists analyst_bd02602;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bd02602') }}
{% endif %}
grant role analyst to role analyst_bd02602;
grant role ITCEXCMSYSTEMS_SG to role analyst_bd02602;
grant usage on database analytics_qa to role analyst_bd02602;
grant usage on all schemas in database analytics_qa to role analyst_bd02602;
grant select on all tables in database analytics_qa to role analyst_bd02602;
grant select on future tables in database analytics_qa to role analyst_bd02602;
grant select on all views in database analytics_qa to role analyst_bd02602;
grant select on future views in database analytics_qa to role analyst_bd02602;
grant role sensitive_analytics_prd__bookings to role analyst_bd02602;
grant role sensitive_analytics_prd__tickets_rt to role analyst_bd02602;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_bd02602;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_bd02602;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_bd02602;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_bd02602;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_bd02602;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_bd02602;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark to role analyst_bd02602;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_bd02602;
grant role analyst_bd02602 to role sysadmin;
grant role analyst_bd02602 to user "BD02602@JETBLUE.COM";

-- sensitive role for the schema jetblue_share.cci
create role if not exists sensitive_analytics_prd__cci;
{% if revoke_first %}
{{ revoke_roles_from_role('sensitive_analytics_prd__cci') }}
{% endif %}
grant role sensitive_analytics_prd__cci to role sysadmin;

--analyst_bj28438(brad johnson)
create role if not exists analyst_bj28438;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bj28438') }}
{% endif %}
grant role analyst to role analyst_bj28438;
grant role byod_cex_analytics_read to role analyst_bj28438;
-- analytics_qa
grant usage on database analytics_qa to role analyst_bj28438;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_bj28438;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_bj28438;
grant select on view analytics_qa.credit_issuing_tool.passenger_request to role analyst_bj28438;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_bj28438;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_bj28438;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_bj28438;
grant usage on schema analytics_qa.intermediary to role analyst_bj28438;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_bj28438;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__passenger_request to role analyst_bj28438;
-- CCI_SHARE
grant imported privileges on database cci_share to role analyst_bj28438;
-- JETBLUE_SHARE
grant usage on database jetblue_share to role analyst_bj28438;
-- JETBLUE_SHARE.CCI
grant usage on schema jetblue_share.cci to role analyst_bj28438;
grant select on all tables in schema jetblue_share.cci to role analyst_bj28438;
grant select on future tables in schema jetblue_share.cci to role analyst_bj28438;
grant select on all views in schema jetblue_share.cci to role analyst_bj28438;
grant select on future views in schema jetblue_share.cci to role analyst_bj28438;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__call_management to role analyst_bj28438;
grant role sensitive_analytics_prd__cci to role analyst_bj28438;
grant role sensitive_analytics_prd__concentrix to role analyst_bj28438;
grant role sensitive_analytics_prd__sabre_open_system_payfields to role analyst_bj28438;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_bj28438;
grant role sensitive_analytics_prd__stg_concentrix to role analyst_bj28438;
grant role sensitive_analytics_prd__ticket_audits to role analyst_bj28438;
grant role sensitive_analytics_prd__tickets_rt to role analyst_bj28438;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_bj28438;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_bj28438;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_bj28438;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_bj28438;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_bj28438;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_bj28438;
grant role sensitive_analytics_prd__bookings to role analyst_bj28438;
grant role sensitive_analytics_prd__check_ins to role analyst_bj28438;
grant role analyst_bj28438 to role sysadmin;
grant role analyst_bj28438 to user "BJ28438@JETBLUE.COM";

--analyst_bl01975 (Brian Li)
create role if not exists analyst_bl01975;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bl01975') }}
{% endif %}
grant role analyst to role analyst_bl01975;
grant role SVC_OSE to role analyst_bl01975;
grant role TABLEAUONLINECREATOR to role analyst_bl01975;
grant role USR_SYSPLANNINGANALYSISRO to role analyst_bl01975;
grant select on table analytics.analytics.flights_fact to role analyst_bl01975; 
grant role analyst_bl01975 to role sysadmin;
grant role analyst_bl01975 to user "BL01975@JETBLUE.COM";

-- analyst_bm15598 (Brittney Ma)
create role if not exists analyst_bm15598;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bm15598') }}
{% endif %}
grant role analyst to role analyst_bm15598;
grant role "AIRPORT TECHNOLOGY" to role analyst_bm15598;
grant role "IT COMMON USE" to role analyst_bm15598;
grant role ITCEXCMSYSTEMS_SG to role analyst_bm15598;
grant role SNOWFLAKEANALYST to role analyst_bm15598;
--sensitive roles
grant role sensitive_analytics_prd__employee_profile_record__header to role analyst_bm15598;
grant role sensitive_analytics_prd__stg_sabre_epr__header to role analyst_bm15598;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger__first_name to role analyst_bm15598;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger__last_name to role analyst_bm15598;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger__first_name to role analyst_bm15598;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger__last_name to role analyst_bm15598;
grant role sensitive_analytics_prd__tickets_rt__passenger__first_name to role analyst_bm15598;
grant role sensitive_analytics_prd__tickets_rt__passenger__last_name to role analyst_bm15598;
grant role analyst_bm15598 to role sysadmin;
grant role analyst_bm15598 to user "BM15598@JETBLUE.COM";

-- analyst_bm14019 (Breanne McCormick)
create role if not exists analyst_bm14019;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bm14019') }}
{% endif %}
grant role analyst to role analyst_bm14019;
grant role "BLUE MARKETING ALL" to role analyst_bm14019;
grant role "TRACK DATA TEAM" to role analyst_bm14019;
grant role CUSTOMER360 to role analyst_bm14019;
grant role TABLEAUONLINECREATOR to role analyst_bm14019;
grant role sensitive_analytics_prd__crew__crewmember_profiles__email_address to role analyst_bm14019;
grant role sensitive_analytics_prd__inflight_entertainment__passenger__display_name to role analyst_bm14019;
grant role sensitive_analytics_prd__inflight_entertainment__passenger__email_address to role analyst_bm14019;
grant role sensitive_analytics_prd__inflight_entertainment__passenger__first_name to role analyst_bm14019;
grant role sensitive_analytics_prd__inflight_entertainment__passenger__last_name to role analyst_bm14019;
grant role sensitive_analytics_prd__intermediary__inter__inflight_entertainment__passenger__first_name to role analyst_bm14019;
grant role sensitive_analytics_prd__intermediary__inter__inflight_entertainment__passenger__last_name to role analyst_bm14019;
grant role sensitive_analytics_prd__intermediary__inter__inflight_entertainment__passenger__email_address to role analyst_bm14019;
grant role sensitive_analytics_prd__intermediary__inter__inflight_entertainment__passenger__display_name to role analyst_bm14019;
grant role sensitive_analytics_prd__tickets__payments__account_number to role analyst_bm14019;
grant role sensitive_analytics_prd__sap_people_erp__hr_pa_org_assignment__employee_name to role analyst_bm14019;
grant role sensitive_analytics_prd__sap_people_erp__hr_pa_org_assignment__first_name to role analyst_bm14019;
grant role sensitive_analytics_prd__sap_people_erp__hr_pa_org_assignment__last_name to role analyst_bm14019;
-- analytics.stg_inflight_entertainment
grant usage on schema analytics.stg_inflight_entertainment to role analyst_bm14019;
grant select on view analytics.stg_inflight_entertainment.passenger to role analyst_bm14019;
-- byod
grant usage on database byod to role analyst_bm14019;
-- byod.bluerm
grant usage on schema byod.bluerm to role analyst_bm14019;
grant role analyst_bm14019 to role sysadmin;
grant role analyst_bm14019 to user "BM14019@JETBLUE.COM";

-- analyst_bm65797 (Brady Mortensen)
create role if not exists analyst_bm65797;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bm65797') }}
{% endif %}
grant role analyst to role analyst_bm65797;
grant role byod_customer_support to role analyst_bm65797;
grant role byod_customer_support_read to role analyst_bm65797;
grant role byod_itbi_read to role analyst_bm65797;
grant role raw_avaya_cms_read to role analyst_bm65797;
grant role sensitive_analytics_dev__amazon_connect to role analyst_bm65797;
grant role sensitive_analytics_prd__amazon_connect to role analyst_bm65797;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents to role analyst_bm65797;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_bm65797;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_bm65797;
grant role sensitive_analytics_prd__concentrix__employees to role analyst_bm65797;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_bm65797;
grant role sensitive_analytics_prd__stg_concentrix__employees to role analyst_bm65797;
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analyst_bm65797;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cmname to role analyst_bm65797;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supervisor to role analyst_bm65797;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supe_email to role analyst_bm65797;
grant role analytics_stg_sabre_travel_bank_read to role analyst_bm65797;
grant usage on database analytics_dev to role analyst_bm65797;
--grant usage on schema analytics_dev.amazon_connect to role analyst_bm65797;
--grant select on all tables in schema analytics_dev.amazon_connect to role analyst_bm65797;
--grant select on all views in schema analytics_dev.amazon_connect to role analyst_bm65797;
--grant select on future tables in schema analytics_dev.amazon_connect to role analyst_bm65797;
--grant select on future views in schema analytics_dev.amazon_connect to role analyst_bm65797;
grant role analyst_bm65797 to role sysadmin;
grant role analyst_bm65797 to user "BM65797@JETBLUE.COM";

-- analyst_bp30459 (brian pederson)
create role if not exists analyst_bp30459;
{% if revoke_first %}
{{ revoke_roles_from_role('aanalyst_bp30459') }}
{% endif %}
grant role analyst to role analyst_bp30459;
grant usage on schema analytics.safety to role analyst_bp30459;
grant select on all tables in schema analytics.safety to role analyst_bp30459;
grant select on all views in schema analytics.safety to role analyst_bp30459;
grant select on future tables in schema analytics.safety to role analyst_bp30459;
grant select on future views in schema analytics.safety to role analyst_bp30459;
grant usage on schema analytics.stg_loyalty_rt to role analyst_bp30459;
grant select on all tables in schema analytics.stg_loyalty_rt to role analyst_bp30459;
grant select on all views in schema analytics.stg_loyalty_rt to role analyst_bp30459;
grant select on future tables in schema analytics.stg_loyalty_rt to role analyst_bp30459;
grant select on future views in schema analytics.stg_loyalty_rt to role analyst_bp30459;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_bp30459;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_bp30459;
grant role sensitive_analytics_prd__surveys to role analyst_bp30459;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_bp30459;
grant usage on database analytics_qa to role analyst_bp30459;
grant usage on schema analytics_qa.safety to role analyst_bp30459;
grant select on all tables in schema analytics_qa.safety to role analyst_bp30459;
grant select on all views in schema analytics_qa.safety to role analyst_bp30459;
grant select on future tables in schema analytics_qa.safety to role analyst_bp30459;
grant select on future views in schema analytics_qa.safety to role analyst_bp30459;
grant usage on database analytics_dev to role analyst_bp30459;
grant usage on schema analytics_dev.safety to role analyst_bp30459;
grant select on all tables in schema analytics_dev.safety to role analyst_bp30459;
grant select on all views in schema analytics_dev.safety to role analyst_bp30459;
grant select on future tables in schema analytics_dev.safety to role analyst_bp30459;
grant select on future views in schema analytics_dev.safety to role analyst_bp30459;
grant role itdataengineeringcrew to role analyst_bp30459;
grant role tableauonlinecreator to role analyst_bp30459;
grant role raw_comarch_dbo_read to role analyst_bp30459;
grant role raw_kiosk_read to role analyst_bp30459;
--raw 
grant usage on database raw to role analyst_bp30459;
grant usage on all schemas in database raw to role analyst_bp30459;
grant usage on future schemas in database raw to role analyst_bp30459;
grant select on all tables in database raw to role analyst_bp30459;
grant select on all views in database raw to role analyst_bp30459;
grant select on future tables in database raw to role analyst_bp30459;
grant select on future views in database raw to role analyst_bp30459;
grant role raw_loyalty_rt_read to role analyst_bp30459;
--raw_dev 
grant usage on database raw_dev to role analyst_bp30459;
grant usage on all schemas in database raw_dev to role analyst_bp30459;
grant usage on future schemas in database raw_dev to role analyst_bp30459;
grant select on all tables in database raw_dev to role analyst_bp30459;
grant select on all views in database raw_dev to role analyst_bp30459;
grant select on future tables in database raw_dev to role analyst_bp30459;
grant select on future views in database raw_dev to role analyst_bp30459;
grant role sensitive_analytics_prd__customers_rt to role analyst_bp30459;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__customers to role analyst_bp30459;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_bp30459;
grant role sensitive_analytics_qa__customers_rt to role analyst_bp30459;
grant role sensitive_analytics_qa__intermediary__inter_customers_rt__customers to role analyst_bp30459;
grant role sensitive_analytics_qa__stg_customers_rt to role analyst_bp30459;
grant role sensitive_analytics_prd__notification_manager to role analyst_bp30459;
grant role transformer_dev to role analyst_bp30459;
--raw sabre roles
grant usage on database raw to role analyst_bp30459;
grant role raw_sabre_acs_rt_read to role analyst_bp30459;
grant role raw_sabre_csa_read to role analyst_bp30459;
grant role raw_sabre_epr_read to role analyst_bp30459;
grant role raw_sabre_excess_baggage_read to role analyst_bp30459;
grant role raw_sabre_fee_collect_read to role analyst_bp30459;
grant role raw_sabre_fee_override_read to role analyst_bp30459;
grant role raw_sabre_flight_rt_read to role analyst_bp30459;
grant role raw_sabre_pnr_batch_read to role analyst_bp30459;
grant role raw_sabre_pnr_rt_read to role analyst_bp30459;
grant role raw_sabre_revenue_optimizer_read to role analyst_bp30459;
grant role raw_sabre_ssi_read to role analyst_bp30459;
grant role raw_sabre_ticket_batch_read to role analyst_bp30459;
grant role raw_sabre_ticket_rt_read to role analyst_bp30459;
grant role raw_travelbank_read to role analyst_bp30459;
--raw_qa sabre roles
grant usage on database raw_qa to role analyst_bp30459;
grant usage on schema raw_qa.sabre_accb to role analyst_bp30459;
grant usage on schema raw_qa.sabre_acs_batch to role analyst_bp30459;
grant usage on schema raw_qa.sabre_acs_rt to role analyst_bp30459;
grant usage on schema raw_qa.sabre_asr_batch to role analyst_bp30459;
grant usage on schema raw_qa.sabre_csa to role analyst_bp30459;
grant usage on schema raw_qa.sabre_emd_batch to role analyst_bp30459;
grant usage on schema raw_qa.sabre_epr to role analyst_bp30459;
grant usage on schema raw_qa.sabre_excess_baggage to role analyst_bp30459;
grant usage on schema raw_qa.sabre_fee_collect to role analyst_bp30459;
grant usage on schema raw_qa.sabre_fee_override to role analyst_bp30459;
grant usage on schema raw_qa.sabre_flight_plan_manager to role analyst_bp30459;
grant usage on schema raw_qa.sabre_flight_plan_manager_legacy to role analyst_bp30459;
grant usage on schema raw_qa.sabre_flight_rt to role analyst_bp30459;
grant usage on schema raw_qa.sabre_ind to role analyst_bp30459;
grant usage on schema raw_qa.sabre_pnr_batch to role analyst_bp30459;
grant usage on schema raw_qa.sabre_pnr_rt to role analyst_bp30459;
grant usage on schema raw_qa.sabre_pnr_rt_aps to role analyst_bp30459;
grant usage on schema raw_qa.sabre_revenue_optimizer to role analyst_bp30459;
grant usage on schema raw_qa.sabre_ssi to role analyst_bp30459;
grant usage on schema raw_qa.sabre_tcn to role analyst_bp30459;
grant usage on schema raw_qa.sabre_ticket_batch to role analyst_bp30459;
grant usage on schema raw_qa.sabre_ticket_rt to role analyst_bp30459;
grant usage on schema raw_qa.sabre_ticket_rt_aps to role analyst_bp30459;
grant usage on schema raw_qa.sabre_travel_bank to role analyst_bp30459;
grant usage on schema raw_qa.sabre_vcr_flown to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_accb to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_acs_batch to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_acs_rt to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_asr_batch to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_csa to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_emd_batch to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_epr to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_excess_baggage to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_fee_collect to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_fee_override to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_flight_plan_manager to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_flight_plan_manager_legacy to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_flight_rt to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_ind to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_pnr_batch to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_pnr_rt to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_pnr_rt_aps to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_revenue_optimizer to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_ssi to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_tcn to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_ticket_batch to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_ticket_rt to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_ticket_rt_aps to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_travel_bank to role analyst_bp30459;
grant select on all tables in schema raw_qa.sabre_vcr_flown to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_accb to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_acs_batch to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_acs_rt to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_asr_batch to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_csa to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_emd_batch to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_epr to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_excess_baggage to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_fee_collect to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_fee_override to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_flight_plan_manager to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_flight_plan_manager_legacy to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_flight_rt to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_ind to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_pnr_batch to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_pnr_rt to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_pnr_rt_aps to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_revenue_optimizer to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_ssi to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_tcn to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_ticket_batch to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_ticket_rt to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_ticket_rt_aps to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_travel_bank to role analyst_bp30459;
grant select on all views in schema raw_qa.sabre_vcr_flown to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_accb to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_acs_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_acs_rt to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_asr_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_csa to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_emd_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_epr to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_excess_baggage to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_fee_collect to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_fee_override to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_flight_plan_manager to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_flight_plan_manager_legacy to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_flight_rt to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ind to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_pnr_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_pnr_rt to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_pnr_rt_aps to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_revenue_optimizer to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ssi to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_tcn to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ticket_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ticket_rt to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ticket_rt_aps to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_travel_bank to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_vcr_flown to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_accb to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_acs_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_acs_rt to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_asr_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_csa to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_emd_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_epr to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_excess_baggage to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_fee_collect to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_fee_override to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_flight_plan_manager to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_flight_plan_manager_legacy to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_flight_rt to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ind to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_pnr_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_pnr_rt to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_pnr_rt_aps to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_revenue_optimizer to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ssi to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_tcn to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ticket_batch to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ticket_rt to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_ticket_rt_aps to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_travel_bank to role analyst_bp30459;
grant select on future tables in schema raw_qa.sabre_vcr_flown to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_accb to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_acs_batch to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_acs_rt to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_asr_batch to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_csa to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_emd_batch to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_epr to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_excess_baggage to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_fee_collect to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_fee_override to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_flight_plan_manager to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_flight_plan_manager_legacy to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_flight_rt to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_ind to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_pnr_batch to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_pnr_rt to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_pnr_rt_aps to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_revenue_optimizer to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_ssi to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_tcn to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_ticket_batch to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_ticket_rt to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_ticket_rt_aps to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_travel_bank to role analyst_bp30459;
grant select on future views in schema raw_qa.sabre_vcr_flown to role analyst_bp30459;
--analytics_clone_read
grant role analytics_clone_read to role analyst_bp30459;
--other roles
grant role analyst_bp30459 to role sysadmin;
grant role analyst_bp30459 to user "BP30459@JETBLUE.COM";

-- analyst_bt34526 (Brennen Thorne)
create role if not exists analyst_bt34526;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bt34526') }}
{% endif %}
grant role analyst to role analyst_bt34526;
grant role "JTPCC CREWLEADERS" to role analyst_bt34526;
grant role "WPA TEAM" to role analyst_bt34526;
-- PII Roles
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cmname to role analyst_bt34526;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supervisor to role analyst_bt34526;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supe_email to role analyst_bt34526;
grant role analyst_bt34526 to role sysadmin;
grant role analyst_bt34526 to user "BT34526@JETBLUE.COM";

-- analyst_by02337 (Breanna Young)
create role if not exists analyst_by02337;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_by02337') }}
{% endif %}
grant role analyst to role analyst_by02337;
grant role "JTPCC ANALYTICS & PLANNING" to role analyst_by02337;
--byod roles
grant role byod_customer_support to role analyst_by02337;
grant role byod_customer_support_read to role analyst_by02337;
grant role byod_itbi_read to role analyst_by02337;
--raw roles
grant role raw_avaya_cms_read to role analyst_by02337;
-- PII Roles
grant role sensitive_analytics_dev__amazon_connect to role analyst_by02337;
grant role sensitive_analytics_prd__amazon_connect to role analyst_by02337;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents to role analyst_by02337;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_by02337;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_by02337;
grant role sensitive_analytics_prd__concentrix__employees to role analyst_by02337;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_by02337;
grant role sensitive_analytics_prd__stg_concentrix__employees to role analyst_by02337;
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analyst_by02337;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cmname to role analyst_by02337;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supervisor to role analyst_by02337;
grant role sensitive_analytics_prd__surveys__customer_support_process_improvement_form__m_cs_error_cm_supe_email to role analyst_by02337;
grant role analytics_stg_sabre_travel_bank_read to role analyst_by02337;
grant usage on database analytics_dev to role analyst_by02337;
--grant usage on schema analytics_dev.amazon_connect to role analyst_by02337;
--grant select on all tables in schema analytics_dev.amazon_connect to role analyst_by02337;
--grant select on all views in schema analytics_dev.amazon_connect to role analyst_by02337;
--grant select on future tables in schema analytics_dev.amazon_connect to role analyst_by02337;
--grant select on future views in schema analytics_dev.amazon_connect to role analyst_by02337;
grant role analyst_by02337 to role sysadmin;
grant role analyst_by02337 to user "BY02337@JETBLUE.COM";

-- analyst_cb37543 (Chad Bohan)
create role if not exists analyst_cb37543;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cb37543') }}
{% endif %}
grant role analyst to role analyst_cb37543;
grant role "APS-ACTIVE-USERS" to role analyst_cb37543;
grant role "BLUE MARKETING ALL" to role analyst_cb37543;
grant role customerintel to role analyst_cb37543;
grant role customersurveydata to role analyst_cb37543;
grant role j5prodkbanalyst to role analyst_cb37543;
--ANALYTICS.STG_CUSTOMERS_RT.POSTAL_ADDRESSES
grant usage on schema analytics.stg_customers_rt to role analyst_cb37543;
grant select on view analytics.stg_customers_rt.postal_addresses to role analyst_cb37543;
--RAW
grant usage on database raw to role analyst_cb37543;
grant usage on schema raw.informatica_customers_rt to role analyst_cb37543;
grant select on table raw.informatica_customers_rt.customers to role analyst_cb37543;
-- Sensitive roles
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_birth_date to role analyst_cb37543;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_first_name to role analyst_cb37543;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_last_name to role analyst_cb37543;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_middle_name to role analyst_cb37543;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__first_name to role analyst_cb37543;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__last_name to role analyst_cb37543;
grant role sensitive_analytics_prd__customers_rt__postal_addresses__postal_state_province_name to role analyst_cb37543;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__postal_addresses__postal_state_province_name to role analyst_cb37543;
grant role sensitive_analytics_prd__stg_customers_rt__customer_postal_addresses__postal_state_province_name to role analyst_cb37543;
grant role SENSITIVE_ANALYTICS_PRD__LOYALTY__MEMBER_PROFILE_HISTORY to role analyst_cb37543;
grant role SENSITIVE_ANALYTICS_PRD__LOYALTY__MEMBER_TRANSACTION_HISTORY to role analyst_cb37543;
-- Other roles
grant role analyst_cb37543 to role sysadmin;
grant role analyst_cb37543 to user "CB37543@JETBLUE.COM";

-- analyst_cf08139 (Chisa Fukutome)
create role if not exists analyst_cf08139;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cf08139') }}
{% endif %}
grant role analyst to role analyst_cf08139;
grant role COFSTANDARDS to role analyst_cf08139;
grant role byod_cofstandards to role analyst_cf08139;
grant role byod_jbu_ame to role analyst_cf08139;
grant role analyst_jbu_ame to role analyst_cf08139;
grant role analyst_cf08139 to role sysadmin;
grant role analyst_cf08139 to user "CF08139@JETBLUE.COM";

-- analyst_crogalski(Christopher Rogalski)
create role if not exists analyst_crogalski;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_crogalski') }}
{% endif %}
grant role analyst to role analyst_crogalski;
grant role "FLIGHT OPS LEADERSHIP" to role analyst_crogalski;
grant role "FLIGHT OPS TEAM" to role analyst_crogalski;
grant role CNSTDISTRO to role analyst_crogalski;
grant role CNST_TABLEAU_VIEWERS to role analyst_crogalski;
grant role DISPATCHSNOWFLAKE to role analyst_crogalski;
grant role JBUDISP to role analyst_crogalski;
grant role analyst_crogalski to role sysadmin;
grant role analyst_crogalski to user "CROGALSKI@JETBLUE.COM";

-- analyst_ca62254(Cody Anderson)
create role if not exists analyst_ca62254;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ca62254') }}
{% endif %}
grant role analyst to role analyst_ca62254;
grant role "IT CEX CREWMEMBER PRODUCTS" to role analyst_ca62254;
grant role ITCEXCMSYSTEMS_SG to role analyst_ca62254;
grant role sensitive_analytics_prd__call_management__amazon_connect_contact_trace_records to role analyst_ca62254;
grant role sensitive_analytics_prd__call_management to role analyst_ca62254;
grant role analyst_ca62254 to role sysadmin;
grant role analyst_ca62254 to user "CA62254@JETBLUE.COM";

-- analyst_cg13084 (Corina Geier)
create role if not exists analyst_cg13084;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cg13084') }}
{% endif %}
grant role analyst to role analyst_cg13084;
grant role "BLUEFP&A" to role analyst_cg13084;
grant role cbacrewdata to role analyst_cg13084;
-- ANALYTICS
grant usage on database analytics to role analyst_cg13084; 
-- ANALYTICS.ANALYTICS
grant select on table analytics.analytics.flights_fact to role analyst_cg13084;
-- ANALYTICS.REFERENCE
grant select on table analytics.reference.imputed_income_average_fare to role analyst_cg13084;
-- ANALYTICS.STG_SABRE_PNR_RT
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_cg13084;
grant select on view analytics.stg_sabre_pnr_rt.other_supplementary_information_snowflake to role analyst_cg13084;
-- BYOD
grant usage on database byod to role analyst_cg13084;
-- BYOD.AIRPORT_STANDARDS
grant role byod_airport_standards_read to role analyst_cg13084;
-- BYOD.BLUELOYALTY
grant role byod_blueloyalty_read to role analyst_cg13084;
-- BYOD.BLUERM
grant role byod_bluerm_read to role analyst_cg13084;
-- BYOD.FINANCE
grant role byod_finance_read to role analyst_cg13084;
-- BYOD.OPA
grant usage on schema byod.opa to role analyst_cg13084;
grant select on table byod.opa.delay_codes to role analyst_cg13084;
grant select on table byod.opa.ref_cxl_irop_code_mapping to role analyst_cg13084;
grant select on view byod.opa.vw_controllable_cancels_delays_for_fpa to role analyst_cg13084;
grant select on view byod.opa.vw_b6_bluestats to role analyst_cg13084;
-- BYOD.ROUTE_PLANNING
grant role byod_route_planning_read to role analyst_cg13084;
-- BYOD.WPA
grant role byod_wpa_read to role analyst_cg13084;
-- CCI SHARE
grant imported privileges on database cci_share to role analyst_cg13084;
-- RAW
-- RAW.AVAYA_CMS
grant role raw_avaya_cms_read to role analyst_cg13084;
-- RAW.CONCUR_READ
grant role raw_concur_read to role analyst_cg13084;
-- RAW.INVOICEWORKS
grant role raw_invoiceworks_read to role analyst_cg13084;
-- RAW.RAINMAKER
grant role raw_rainmaker_read to role analyst_cg13084;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bookings_rt__other_supplementary_information to role analyst_cg13084;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_cg13084;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__other_supplementary_information to role analyst_cg13084;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__other_supplementary_information_snowflake to role analyst_cg13084;
grant role sensitive_analytics_prd__tickets__documents__customer_full_name to role analyst_cg13084;
grant role analyst_cg13084 to role sysadmin;
grant role analyst_cg13084 to user "CG13084@JETBLUE.COM";

-- analyst_cheric (charles heric)
create role if not exists analyst_cheric;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cheric') }}
{% endif %}
grant role analyst to role analyst_cheric;
grant role "APS-ACTIVE-USERS" to role analyst_cheric;
grant role operationsanalysis to role analyst_cheric;
grant role tableauonlinecreator to role analyst_cheric;
grant role usr_sysplanninganalysisro to role analyst_cheric;
grant usage on database analytics_clone to role analyst_cheric;
grant usage on schema analytics_clone.analytics to role analyst_cheric;
grant role analyst_cheric to role sysadmin;
grant role analyst_cheric to user "CHERIC@JETBLUE.COM";

-- analyst_chgottlieb (Christopher Gottlieb)
create role if not exists analyst_chgottlieb;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_chgottlieb') }}
{% endif %}
grant role analyst to role analyst_chgottlieb;
-- ANALYTICS.CALL_MANAGEMENT
grant usage on database analytics to role analyst_chgottlieb;
grant usage on schema analytics.call_management to role analyst_chgottlieb; 
grant select on table analytics.call_management.amazon_connect_contact_trace_records to role analyst_chgottlieb;
grant select on table analytics.call_management.amazon_connect_queue_summary to role analyst_chgottlieb;
grant select on table analytics.call_management.amazon_connect_routing_profile_summary to role analyst_chgottlieb;
grant select on table analytics.call_management.amazon_connect_agent_summary to role analyst_chgottlieb;
-- ANALYTICS.SAFETY
grant usage on schema analytics.safety to role analyst_chgottlieb;
grant select on all tables in schema analytics.safety to role analyst_chgottlieb;
grant select on all views in schema analytics.safety to role analyst_chgottlieb;
grant select on future tables in schema analytics.safety to role analyst_chgottlieb;
grant select on future views in schema analytics.safety to role analyst_chgottlieb;
-- ANALYTICS.STG_AQD
grant usage on schema analytics.stg_aqd to role analyst_chgottlieb;
grant select on all tables in schema analytics.stg_aqd to role analyst_chgottlieb;
grant select on all views in schema analytics.stg_aqd to role analyst_chgottlieb;
grant select on future tables in schema analytics.stg_aqd to role analyst_chgottlieb;
grant select on future views in schema analytics.stg_aqd to role analyst_chgottlieb;
-- ANALYTICS.STG_SAP_REPORTS
grant usage on schema analytics.stg_sap_reports to role analyst_chgottlieb; 
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_chgottlieb;
-- BYOD ROLES
grant role byod_customer_support_read to role analyst_chgottlieb;
grant role byod_itdatascience_read to role analyst_chgottlieb;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_chgottlieb;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_first_name to role analyst_chgottlieb;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_last_name to role analyst_chgottlieb;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent to role analyst_chgottlieb;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_first_name to role analyst_chgottlieb;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_last_name to role analyst_chgottlieb;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_name to role analyst_chgottlieb;
grant role sensitive_analytics_prd__crewmember_org_details to role analyst_chgottlieb;
grant role sensitive_analytics_prd__crew to role analyst_chgottlieb;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty__users to role analyst_chgottlieb;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_chgottlieb;
grant role sensitive_analytics_prd__safety to role analyst_chgottlieb;
grant role sensitive_analytics_prd__stg_aqd to role analyst_chgottlieb;
grant role sensitive_analytics_prd__stg_egor__egor_rt__ao_gate_crewmember_name to role analyst_chgottlieb;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_chgottlieb;
grant role sensitive_raw_prd__aqd to role analyst_chgottlieb;
-- RAW
grant usage on database raw to role analyst_chgottlieb;
-- RAW.SAP_REPORTS
grant usage on schema raw.sap_reports to role analyst_chgottlieb;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_chgottlieb;
-- RAW ROLES
grant role raw_aqd_read to role analyst_chgottlieb;
grant role raw_trax_read to role analyst_chgottlieb;
-- RAW_QA ROLES
grant usage on database raw_qa to role analyst_chgottlieb;
grant usage on schema raw_qa.sap_s4_hana to role analyst_chgottlieb;
grant select on all tables in schema raw_qa.sap_s4_hana to role analyst_chgottlieb;
grant select on all views in schema raw_qa.sap_s4_hana to role analyst_chgottlieb;
grant select on future tables in schema raw_qa.sap_s4_hana to role analyst_chgottlieb;
grant select on future views in schema raw_qa.sap_s4_hana to role analyst_chgottlieb;
-- MASFLIGHT SHARED DATABASE ACCESS
grant imported privileges on database masflight to role analyst_chgottlieb;
grant role ITBUSINESSINTELLIGENCECREW to role analyst_chgottlieb;
grant role analyst_chgottlieb to user "CHGOTTLIEB@JETBLUE.COM";

-- analyst_cl43762 (Chris Lum II)
create role if not exists analyst_cl43762;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cl43762') }}
{% endif %}
grant role analyst to role analyst_cl43762;
grant role BLUEDIRECTOR_ONLY to role analyst_cl43762;
grant role "FLIGHT OPS LEADERSHIP" to role analyst_cl43762;
grant role "FLIGHT OPS LOGS" to role analyst_cl43762;
grant role "FLIGHT OPS TEAM" to role analyst_cl43762;
grant role analyst_cl43762 to role sysadmin;
grant role analyst_cl43762 to user "CL43762@JETBLUE.COM";

-- analyst_cd02470 (christina depietro)
create role if not exists analyst_cd02470;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cd02470') }}
{% endif %}
grant role analyst to role analyst_cd02470;
grant role qms to role analyst_cd02470;
-- ANALYTICS roles
grant usage on schema analytics.stg_aqd to role analyst_cd02470;
grant select on all tables in schema analytics.stg_aqd to role analyst_cd02470;
grant select on all views in schema analytics.stg_aqd to role analyst_cd02470;
grant select on future tables in schema analytics.stg_aqd to role analyst_cd02470;
grant select on future views in schema analytics.stg_aqd to role analyst_cd02470;
-- ANALYTICS_QA roles
grant role analytics_qa_tops_crew_read to role analyst_cd02470;
grant role sensitive_analytics_prd__stg_aqd to role analyst_cd02470;
grant role sensitive_analytics_prd__crew to role analyst_cd02470;
grant role sensitive_analytics_prd__safety to role analyst_cd02470;
-- RAW roles
grant role raw_aqd_read to role analyst_cd02470;
-- SENSITIVE roles
grant role sensitive_analytics_prd__check_ins__passenger_histories to role analyst_cd02470;
grant role sensitive_raw_prd__aqd to role analyst_cd02470;
-- other roles
grant role analyst_cd02470 to role sysadmin;
grant role analyst_cd02470 to user "CD02470@JETBLUE.COM";

-- analyst_cferricks  (Christina Ferricks, cferricks@jetblue.com)
create role if not exists analyst_cferricks;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_cferricks') }}
{% endif %}
grant role analyst to role analyst_cferricks;
grant role qms to role analyst_cferricks;
-- ANALYTICS roles
grant usage on schema analytics.stg_aqd to role analyst_cferricks;
grant select on all tables in schema analytics.stg_aqd to role analyst_cferricks;
grant select on all views in schema analytics.stg_aqd to role analyst_cferricks;
grant select on future tables in schema analytics.stg_aqd to role analyst_cferricks;
grant select on future views in schema analytics.stg_aqd to role analyst_cferricks;
-- RAW roles
grant role raw_aqd_read to role analyst_cferricks;
-- SENSITIVE roles
grant role sensitive_analytics_prd__stg_aqd to role analyst_cferricks;
grant role sensitive_analytics_prd__safety to role analyst_cferricks;
grant role sensitive_raw_prd__aqd to role analyst_cferricks;
-- other roles
grant role analyst_cferricks to role sysadmin;
grant role analyst_cferricks to user "CFERRICKS@JETBLUE.COM";

-- analyst_ct94957 (Christina Tudela)
create role if not exists analyst_ct94957;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ct94957') }}
{% endif %}
grant role analyst to role analyst_ct94957;
grant role byod_bluerm to role analyst_ct94957;
grant usage on schema byod.bluerm  to role analyst_ct94957;
grant select on all tables in schema byod.bluerm to role analyst_ct94957;
grant select on future tables in schema byod.bluerm to role analyst_ct94957;
grant select on all views in schema byod.bluerm to role analyst_ct94957;
grant select on future views in schema byod.bluerm to role analyst_ct94957;
grant usage on schema analytics.safety to role analyst_ct94957;
grant select on all tables in schema analytics.safety to role analyst_ct94957;
grant select on all views in schema analytics.safety to role analyst_ct94957;
grant select on future tables in schema analytics.safety to role analyst_ct94957;
grant select on future views in schema analytics.safety to role analyst_ct94957;
grant select on view analytics.safety.ap_dbr_ereports to role analyst_ct94957;
grant role analyst_ct94957 to role sysadmin;
grant role analyst_ct94957 to user "CT94957@JETBLUE.COM";

-- analyst_nm17430 (Naya Murdock)
create role if not exists analyst_nm17430;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nm17430') }}
{% endif %}
grant role analyst to role analyst_nm17430;
grant role LOYALTYTECHNOLOGY to role analyst_nm17430;
grant role BYOD_BLUELOYALTY_READ to role analyst_nm17430;
grant role LOYALTYTECHSUPPORT to role analyst_nm17430;
grant role analyst_nm17430 to role sysadmin;
grant role analyst_nm17430 to user "NM17430@JETBLUE.COM";

-- analyst_jm66111 (Jeanelle Morales)
create role if not exists analyst_jm66111;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jm66111') }}
{% endif %}
grant role analyst to role analyst_jm66111;
grant role "CS PLANNING & PRODUCTS" to role analyst_jm66111;
grant role "WPA TEAM" to role analyst_jm66111;
grant usage on schema byod.cex_analytics  to role analyst_jm66111;
grant select on table byod.cex_analytics.bod_members to role analyst_jm66111;
-- BYOD
grant role byod_cex_analytics_read to role analyst_jm66111;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bookings__hotel_bookings to role analyst_jm66111;
grant role sensitive_analytics_prd__bookings__remarks to role analyst_jm66111;
grant role sensitive_analytics_prd__bookings__remarks_history to role analyst_jm66111;
grant role sensitive_analytics_prd__check_ins__passengers to role analyst_jm66111;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__deadhead_messages to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__organization_hierarchy_vertical to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__organization_hierarchy_top_down to role analyst_jm66111;
grant role sensitive_analytics_prd__employee_profile_record__header__agent_full_name to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_jm66111;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_jm66111;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_jm66111;
grant role sensitive_analytics_prd__tickets__documents to role analyst_jm66111;
grant role sensitive_analytics_prd__tickets_rt__ticket_summary to role analyst_jm66111;
grant role sensitive_analytics_prd__bookings__passenger_documents to role analyst_jm66111;
grant role sensitive_analytics_prd__bookings__passenger_emails to role analyst_jm66111;
grant role sensitive_analytics_prd__check_ins_rt__travel_documents to role analyst_jm66111;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__travel_documents to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_jm66111;
grant select on all views in schema analytics.stg_sabre_acs_rt to role analyst_jm66111;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_jm66111;
grant role sensitive_analytics_prd__bookings to role analyst_jm66111;
grant role sensitive_analytics_prd__bookings_rt to role analyst_jm66111;
grant role sensitive_analytics_prd__check_ins to role analyst_jm66111;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__deadhead_messages__birth_date to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__deadhead_messages__first_name to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__deadhead_messages__last_name to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__deadhead_messages__legal_first_name to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__deadhead_messages__middle_name to role analyst_jm66111;
grant role sensitive_analytics_prd__crew__performance_stats_queues_crew to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_jm66111;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark to role analyst_jm66111;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_jm66111;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_jm66111;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_jm66111;
grant role sensitive_analytics_prd__tickets to role analyst_jm66111;
grant role sensitive_analytics_prd__tickets_rt to role analyst_jm66111;
grant role analytics_stg_sabre_acs_rt_read to role analyst_jm66111;
grant role analytics_stg_sabre_pnr_rt_read to role analyst_jm66111;
grant role analytics_stg_sabre_ticket_rt_read to role analyst_jm66111;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_jm66111;
grant role sensitive_analytics_prd__crew to role analyst_kp06178;
grant role sensitive_analytics_prd__crew_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_kp06178;
grant role analytics_stg_sabre_crewtrac_read to role analyst_kp06178;
-- byod.cex_analytics
grant role byod_cex_analytics to role analyst_jm66111;
grant role byod_cex_analytics_read to role analyst_jm66111;
grant select, insert, update, delete on table byod.cex_analytics.dpax to role analyst_jm66111;
grant select, insert, update, delete on table byod.cex_analytics.digital_pay_2025 to role analyst_jm66111;
grant role analyst_jm66111 to role sysadmin;
grant role analyst_jm66111 to user "JM66111@JETBLUE.COM";

-- analyst_csbpo_webhelpworkforce
create role if not exists analyst_csbpo_webhelpworkforce;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_csbpo_webhelpworkforce') }}
{% endif %}
-- analytics.webhelp
grant usage on database analytics to role analyst_csbpo_webhelpworkforce;
grant select on all tables in schema analytics.concentrix to role analyst_csbpo_webhelpworkforce;
grant select on all views in schema analytics.concentrix to role analyst_csbpo_webhelpworkforce;
grant usage on schema analytics.concentrix to role analyst_csbpo_webhelpworkforce;
grant select on future tables in schema analytics.concentrix to role analyst_csbpo_webhelpworkforce;
grant select on future views in schema analytics.concentrix to role analyst_csbpo_webhelpworkforce;
grant usage on database raw to role analyst_csbpo_webhelpworkforce;
grant usage on schema raw.concentrix to role analyst_csbpo_webhelpworkforce;
grant select on all tables in schema raw.concentrix to role analyst_csbpo_webhelpworkforce;
grant select on all views in schema raw.concentrix to role analyst_csbpo_webhelpworkforce;
grant select on future tables in schema raw.concentrix to role analyst_csbpo_webhelpworkforce;
grant select on future views in schema raw.concentrix to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__concentrix__employees to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_first_name to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_last_name to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary__agent_name to role analyst_csbpo_webhelpworkforce;         
grant role sensitive_analytics_prd__stg_concentrix__employees to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__stg_concentrix__employees__full_name to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__stg_concentrix__employees__supervisor to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__stg_concentrix__employees__manager to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__stg_concentrix__employees__crewmember_name to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__stg_concentrix__employees__jetblue_email to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__stg_concentrix__employees__user_name to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents to role analyst_csbpo_webhelpworkforce; 		
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_first_name to role analyst_csbpo_webhelpworkforce; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_last_name to role analyst_csbpo_webhelpworkforce; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_username to role analyst_csbpo_webhelpworkforce; 	
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_mobile to role analyst_csbpo_webhelpworkforce; 
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary__first_name to role analyst_csbpo_webhelpworkforce;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary__last_name to role analyst_csbpo_webhelpworkforce;
grant usage, operate on warehouse reporting_prd_xs_wh to role analyst_csbpo_webhelpworkforce;
grant read on stage raw.concentrix.employees_stage to role analyst_csbpo_webhelpworkforce;
grant write on stage raw.concentrix.employees_stage to role analyst_csbpo_webhelpworkforce;
grant role analyst_csbpo_webhelpworkforce to role sysadmin;
grant role analyst_csbpo_webhelpworkforce to role "CSBPO - WEBHELPWORKFORCE";

-- analyst_dm96940 (Diana Montalbano)
create role if not exists analyst_dm96940;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_dm96940') }}
{% endif %}
grant role analyst to role analyst_dm96940;
grant role "FLIGHT OPS TEAM" to role analyst_dm96940;
grant role cbacrewdata to role analyst_dm96940;
grant role flightopsdata to role analyst_dm96940;
-- ANALYTICS
grant usage on schema analytics.crew_pay to role analyst_dm96940;
grant select on table analytics.crew_pay.crew_data_history to role analyst_dm96940;
grant usage on schema analytics.cass to role analyst_dm96940;
grant select on table analytics.cass.request_log to role analyst_dm96940;
-- BYOD
grant usage on database byod to role analyst_dm96940;
-- BYOD.CREW_ANALYTICS
grant usage on schema byod.crew_analytics to role analyst_dm96940;
grant select on table byod.crew_analytics.pilot_address to role analyst_dm96940;
grant select on table byod.crew_analytics.premium_cpadaily_timestamp to role analyst_dm96940;
grant select on view byod.crew_analytics.pilot_absences_addresses to role analyst_dm96940;
-- BYOD.ENTERPRISE_PLANNING
grant usage on schema byod.enterprise_planning to role analyst_dm96940;
grant select on view byod.enterprise_planning.vw_pilot_inflight_removals to role analyst_dm96940;
-- RAW
grant usage on database raw to role analyst_dm96940;
-- RAW.RAINMAKER
grant usage on schema raw.rainmaker to role analyst_dm96940;
grant select on table raw.rainmaker.FactCrewManDayStatsActivity to role analyst_dm96940;
grant select on table raw.rainmaker.vEmployee to role analyst_dm96940;
grant select on table raw.rainmaker.DimActivityCode to role analyst_dm96940;
grant select on table raw.rainmaker.DimManDay to role analyst_dm96940;
grant select on table raw.rainmaker.vDate to role analyst_dm96940;
grant select on table raw.rainmaker.DimRosterLineType to role analyst_dm96940;
grant select on table raw.rainmaker.vpairinginstance to role analyst_dm96940;
grant select on table raw.rainmaker.factactivity to role analyst_dm96940;
grant select on table raw.rainmaker.vcity to role analyst_dm96940;
grant select on table raw.rainmaker.vrosterperiod to role analyst_dm96940;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__flightkeys__flight_plan_header__author_name to role analyst_dm96940;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header__author_name to role analyst_dm96940;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header__author_name to role analyst_dm96940;
grant role sensitive_analytics_prd__cass__request_log to role analyst_dm96940;
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging to role analyst_dm96940;
grant role analyst_dm96940 to role sysadmin;
grant role analyst_dm96940 to user "DM96940@JETBLUE.COM";

-- analyst_ad83828 (Donaldson Alvin)
create role if not exists analyst_ad83828;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ad83828') }}
{% endif %}
grant role analyst to role analyst_ad83828;
grant role LOYALTYTECHSUPPORT to role analyst_ad83828;
-- pii roles
grant role sensitive_analytics_prd__loyalty to role analyst_ad83828;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_ad83828;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_ad83828;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_ad83828;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_ad83828;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_ad83828;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_ad83828;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_ad83828;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_ad83828;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_ad83828;
-- analytics.stg_loyalty
grant role analytics_stg_loyalty_read to role analyst_ad83828;
-- analytics.stg_loyalty_rt
grant role analytics_stg_loyalty_rt_read to role analyst_ad83828;
-- byod.blueloyalty
grant role byod_blueloyalty_read to role analyst_ad83828;
grant role analyst_ad83828 to role sysadmin;
grant role analyst_ad83828 to user "AD83828@JETBLUE.COM";

-- analyst_ddishman (Dishman, David)
create role if not exists analyst_ddishman;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ddishman') }}
{% endif %}
grant role analyst to role analyst_ddishman;
grant role cnstdistro to role analyst_ddishman;
grant role cnst_tableau_viewers to role analyst_ddishman;
grant role usr_sysplanninganalysisro to role analyst_ddishman;
grant role "BLUE OPS ENGINEERING" to role analyst_ddishman;
-- raw
grant usage on database raw to role analyst_ddishman;
grant usage on schema raw.flightkeys to role analyst_ddishman;
grant select on table raw.flightkeys.analytics_report to role analyst_ddishman;
grant role analyst_ddishman to role sysadmin;
grant role analyst_ddishman to user "DDISHMAN@JETBLUE.COM";

-- analyst_ds82768 (David Sanmartin)
create role if not exists analyst_ds82768;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ds82768') }}
{% endif %}
grant role analyst to role analyst_ds82768;
-- analytics.stg_trax
grant usage on schema analytics.stg_trax to role analyst_ds82768;
grant select on view analytics.stg_trax.planning to role analyst_ds82768;
grant select on view analytics.stg_trax.defect_report to role analyst_ds82768;
grant select on view analytics.stg_trax.work_order to role analyst_ds82768;
grant select on view analytics.stg_trax.work_order_task_card to role analyst_ds82768;
-- analytics.training
grant usage on schema analytics.training to role analyst_ds82768;
grant select on all tables in schema analytics.training to role analyst_ds82768;
grant select on all views in schema analytics.training to role analyst_ds82768;
grant select on future tables in schema analytics.training to role analyst_ds82768;
grant select on future views in schema analytics.training to role analyst_ds82768;
--sensitive role
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging__message to role analyst_ds82768;
grant role sensitive_analytics_prd__training to role analyst_ds82768;
--other roles
grant role analytics_flight_operations_read to role analyst_ds82768;
grant role bluetechops to role analyst_ds82768;
grant role "BLUEMX JFK" to role analyst_ds82768;
grant role "JFK MX" to role analyst_ds82768;
grant role analyst_ds82768 to role sysadmin;
grant role analyst_ds82768 to user "DS82768@JETBLUE.COM";

-- analyst_ds97658(David Shargorodsky)
create role if not exists analyst_ds97658;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ds97658') }}
{% endif %}
grant role analyst to role analyst_ds97658;
grant role JTP_TECH_DATA_SNOWFLAKE to role analyst_ds97658;
grant role SNOWFLAKEANALYST to role analyst_ds97658;
grant role byod_blueloyalty_read to role analyst_ds97658;
grant role analyst_ds97658 to role sysadmin;
grant role analyst_ds97658 to user "DS97658@JETBLUE.COM";

-- analyst_de06576 (Daniele Evans Scott)
create role if not exists analyst_de06576;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_de06576') }}
{% endif %}
grant role analyst to role analyst_de06576;
grant role "IT CEX TECH PRODUCTS" to role analyst_de06576;
grant role IT_SELF_BOARDING to role analyst_de06576;
grant role "IT MANAGE YOUR BOOKING" to role analyst_de06576;
grant role IT_SELF_SERVICE to role analyst_de06576;
grant usage on database analytics_qa to role analyst_de06576;
grant usage on schema analytics_qa.collins_aerospace to role analyst_de06576;
grant select on all tables in schema analytics_qa.collins_aerospace to role analyst_de06576;
grant select on future tables in schema analytics_qa.collins_aerospace to role analyst_de06576;
grant select on all views in schema analytics_qa.collins_aerospace to role analyst_de06576;
grant select on future views in schema analytics_qa.collins_aerospace to role analyst_de06576;
grant usage on schema analytics_qa.intermediary to role analyst_de06576;
grant select on table analytics_qa.intermediary.inter_collins_aerospace__boarding_events to role analyst_de06576;
grant select on table analytics_qa.intermediary.inter_collins_aerospace__boarding_gate_reader_events to role analyst_de06576;
grant select on table analytics_qa.intermediary.inter_collins_aerospace__mformat_events to role analyst_de06576;
grant select on table analytics_qa.intermediary.inter_collins_aerospace__unboarding_events to role analyst_de06576;
grant usage on schema analytics_qa.stg_collins_aerospace to role analyst_de06576;
grant select on all views in schema analytics_qa.stg_collins_aerospace to role analyst_de06576;
grant usage on database raw_qa to role analyst_de06576;
grant usage on schema raw_qa.collins_aerospace to role analyst_de06576;
grant select on all tables in schema raw_qa.collins_aerospace to role analyst_de06576;
grant role analyst_de06576 to role sysadmin;
grant role analyst_de06576 to user "DE06576@JETBLUE.COM";

-- analyst_ddelarocha (David de la Rocha)
create role if not exists analyst_ddelarocha;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ddelarocha') }}
{% endif %}
grant role analyst to role analyst_ddelarocha;
grant role "IT OPERATIONS PRODUCT SUPPORT TECHOPS" to role analyst_ddelarocha;
grant role BLUETECHOPS to role analyst_ddelarocha;
grant role BLUETECHOPSLSC to role analyst_ddelarocha;
grant role analytics_trax_read to role analyst_ddelarocha;
grant role analytics_aircraft_maintenance_read to role analyst_ddelarocha;
grant role raw_trax_read to role analyst_ddelarocha;
grant role analyst_ddelarocha to role sysadmin;
grant role analyst_ddelarocha to user "DDELAROCHA@JETBLUE.COM";

-- analyst_dkilari (Deepika Kilari)
create role if not exists analyst_dkilari;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_dkilari') }}
{% endif %}
grant role analyst to role analyst_dkilari;
grant role "CUSTOMERANALYTICS-SNOWFLAKE" to role analyst_dkilari;
grant role "TCS DATA SCIENCE" to role analyst_dkilari;
grant role CUSTOMER360 to role analyst_dkilari;
grant role byod_trackddb_read to role analyst_dkilari;
grant role analyst_dkilari to role sysadmin;
grant role analyst_dkilari to user "DKILARI@JETBLUE.COM";

-- analyst_dr57708 (Dave Reynolds)
create role if not exists analyst_dr57708;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_dr57708') }}
{% endif %}
grant role analyst to role analyst_dr57708;
grant role "APS-ACTIVE-USERS" to role analyst_dr57708;
grant role "BLUE OPS ENGINEERING" to role analyst_dr57708;
grant role JBUDISP to role analyst_dr57708;
-- analytics_qa.flightkeys 
grant usage on schema analytics_qa.flightkeys to role analyst_dr57708;
grant select on all tables in schema analytics_qa.flightkeys to role analyst_dr57708;
grant select on all views in schema analytics_qa.flightkeys to role analyst_dr57708;
grant select on future tables in schema analytics_qa.flightkeys to role analyst_dr57708;
grant select on future views in schema analytics_qa.flightkeys to role analyst_dr57708;
--Masflight shared database access
grant imported privileges on database masflight to role analyst_dr57708;
grant role analyst_dr57708 to role sysadmin;
grant role analyst_dr57708 to user "DR57708@JETBLUE.COM";

-- analyst_drathi (Dhruvesh Rathi)
create role if not exists analyst_drathi;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_drathi') }}
{% endif %}
grant role analyst to role analyst_drathi;
grant role "IT ENTERPRISE QUALITY ASSURANCE" to role analyst_drathi;
grant role "ITDATAQA-NONPROD" to role analyst_drathi;
grant role "ITDATAQA-PROD" to role analyst_drathi;
grant select on view analytics.stg_sabre_intelligence_exchange.use_case_booking_monitor to role analyst_drathi;
-- ANALYTICS.FLIGHT_SCHEDULES_OAL
--grant usage on schema analytics_qa.flight_schedules_oal to role analyst_drathi;
--grant select on all tables in schema analytics_qa.flight_schedules_oal to role analyst_drathi;
--grant select on all views in schema analytics_qa.flight_schedules_oal to role analyst_drathi;
--grant select on future tables in schema analytics_qa.flight_schedules_oal to role analyst_drathi;
--grant select on future views in schema analytics_qa.flight_schedules_oal to role analyst_drathi;
--SENSITIVE ROLES
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings to role analyst_drathi;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings to role analyst_drathi;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings to role analyst_drathi;
grant role sensitive_analytics_prd__aircraft_turns__egor_crew_checkins__crewmember_name to role analyst_drathi;
grant role sensitive_analytics_prd__stg_egor__egor_crew_checkins__crewmember_name to role analyst_drathi;
grant role sensitive_analytics_prd__intermediary__inter_egor__crew_checkins__crewmember_name to role analyst_drathi;
-- RAW ROLES
grant usage on schema raw.ifsa_rt to role analyst_drathi;
grant select on table raw.ifsa_rt.mosaic_greetings to role analyst_drathi;
grant role raw_sabre_intelligence_exchange_read to role analyst_drathi;
grant usage on schema raw.egor to role analyst_drathi;
grant select on all tables in schema raw.egor to role analyst_drathi;
grant select on future tables in schema raw.egor to role analyst_drathi;
grant role analyst_drathi to role sysadmin;
grant role analyst_drathi to user "DRATHI@JETBLUE.COM";

-- analyst_dtraxler (Diane Traxler)
create role if not exists analyst_dtraxler;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_dtraxler') }}
{% endif %}
grant role analyst to role analyst_dtraxler;
--grant role "IT LOYALTY TEAM" to role analyst_dtraxler;
grant role sensitive_sabre_pnr_read to role analyst_dtraxler;
grant role sensitive_analytics_prd__tickets to role analyst_dtraxler;
grant usage on database analytics_qa to role analyst_dtraxler;
grant usage on all schemas in database analytics_qa to role analyst_dtraxler;
grant usage on future schemas in database analytics_qa to role analyst_dtraxler;
grant select on all tables in database analytics_qa to role analyst_dtraxler;
grant select on all views in database analytics_qa to role analyst_dtraxler;
grant select on future tables in database analytics_qa to role analyst_dtraxler;
grant select on future views in database analytics_qa to role analyst_dtraxler;
grant role analyst_dtraxler to role sysadmin;
grant role analyst_dtraxler to user "DTRAXLER@JETBLUE.COM";

-- analyst_dw80402 (Dean Williams)
create role if not exists analyst_dw80402;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_dw80402') }}
{% endif %}
grant role "JFK MX" to role analyst_dw80402;
grant role sensitive_analytics_prd__comply365 to role analyst_dw80402;
-- ANALYTICS.CREW
grant usage on schema analytics.crew to role analyst_dw80402;
grant select on view analytics.crew.crewmember_badges_sap to role analyst_dw80402;
-- ANALYTICS.STG_SAP_REPORTS 
grant usage on schema analytics.stg_sap_reports to role analyst_dw80402;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_dw80402;
-- RAW.SAP_REPORTS 
grant usage on schema raw.sap_reports to role analyst_dw80402;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_dw80402;
-- ANALYTICS.TRAINING
grant usage on schema analytics.training to role analyst_dw80402;
grant select on all tables in schema analytics.training to role analyst_dw80402;
grant select on all views in schema analytics.training to role analyst_dw80402;
grant select on future tables in schema analytics.training to role analyst_dw80402;
grant select on future views in schema analytics.training to role analyst_dw80402;
grant role sensitive_analytics_prd__training__tech_ops_qualification to role analyst_dw80402;
grant role sensitive_analytics_prd__training__training_history__firstname to role analyst_dw80402;
grant role sensitive_analytics_prd__training__training_history__lastname to role analyst_dw80402;
grant usage on schema analytics.trax to role analyst_dw80402;
grant select on all tables in schema analytics.trax to role analyst_dw80402;
grant select on all views in schema analytics.trax to role analyst_dw80402;
grant select on future tables in schema analytics.trax to role analyst_dw80402;
grant select on future views in schema analytics.trax to role analyst_dw80402;
grant usage on schema analytics.stg_trax to role analyst_dw80402;
grant select on view analytics.stg_trax.planning to role analyst_dw80402;
grant usage on schema analytics.stg_sap_reports to role analyst_dw80402;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_dw80402;
grant usage on database raw to role analyst_dw80402;
grant usage on schema raw.sap_reports to role analyst_dw80402;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_dw80402;
--sensitive roles
grant role sensitive_analytics_prd__flight_operations__flight_deck_messaging__message to role analyst_dw80402;
grant role analyst_dw80402 to role sysadmin;
grant role analyst_dw80402 to user "DW80402@JETBLUE.COM";

-- analyst_dwarner (Danika Warner)
create role if not exists analyst_dwarner;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_dwarner') }}
{% endif %}
grant role analyst to role analyst_dwarner;
grant role "CS PLANNING & PRODUCTS" to role analyst_dwarner;
grant role ANALYST_QUEUESCREW to role analyst_dwarner;
grant role SNOWFLAKEANALYST to role analyst_dwarner;
grant role TABLEAUONLINECREATOR to role analyst_dwarner;
grant role analyst_dwarner to role sysadmin;
grant role analyst_dwarner to user "DWARNER@JETBLUE.COM";

-- analyst_dp46423 (Patterson, DaQuon)
create role if not exists analyst_dp46423;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_dp46423') }}
{% endif %}
grant role analyst to role analyst_dp46423;
grant role LOYALTYTECHSUPPORT to role analyst_dp46423;
-- pii roles
grant role sensitive_analytics_prd__loyalty to role analyst_dp46423;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_dp46423;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_dp46423;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_dp46423;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_dp46423;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_dp46423;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_dp46423;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_dp46423;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_dp46423;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_dp46423;
-- analytics.stg_loyalty
grant role analytics_stg_loyalty_read to role analyst_dp46423;
-- analytics.stg_loyalty_rt
grant role analytics_stg_loyalty_rt_read to role analyst_dp46423;
-- byod.blueloyalty
grant role byod_blueloyalty_read to role analyst_dp46423;
grant role analyst_dp46423 to role sysadmin;
grant role analyst_dp46423 to user "DP46423@JETBLUE.COM";

-- analyst_edark (ethan dark)
create role if not exists analyst_edark;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_edark') }}
{% endif %}
grant role analyst to role analyst_edark;
grant role itdataengineeringcrew to role analyst_edark;
grant role raw_flightkeys_read to role analyst_edark;
-- raw.fuel
grant usage on database raw to role analyst_edark;
grant usage on schema raw.fuel to role analyst_edark;
grant monitor on task raw.fuel.task__fuel__qt_tickets to role analyst_edark;
-- other roles
grant role analyst_edark to role sysadmin;
grant role analyst_edark to user "EDARK@JETBLUE.COM";

-- analyst_ejacobowitz (Eric Jacobowitz)
create role if not exists analyst_ejacobowitz;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ejacobowitz') }}
{% endif %}
grant role analyst to role analyst_ejacobowitz;
grant role itsocentadmin to role analyst_ejacobowitz;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__crewqual__pilot_time to role analyst_ejacobowitz;
grant role sensitive_analytics_prd__crewqual__med_data to role analyst_ejacobowitz;
grant role analyst_ejacobowitz to role sysadmin;
grant role analyst_ejacobowitz to user "EJACOBOWITZ@JETBLUE.COM";

-- analyst_em05415 (Elena Mitrakova)
create role if not exists analyst_em05415;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_em05415') }}
{% endif %}
grant role analyst to role analyst_em05415;
grant role "ITDATAQA-NONPROD" to role analyst_em05415;
grant role crew_domain to role analyst_em05415;
-- raw
grant usage on database raw to role analyst_em05415;
-- raw.flightkeys
grant usage on schema raw.flightkeys to role analyst_em05415;
grant select on table raw.flightkeys.arinc633 to role analyst_em05415;
-- sensitive roles
grant role SENSITIVE_ANALYTICS_QA__FLIGHTKEYS__FLIGHT_INFO to role analyst_em05415;
grant role SENSITIVE_ANALYTICS_QA__STG_FLIGHTKEYS__FLIGHT_INFO to role analyst_em05415;
grant role SENSITIVE_ANALYTICS_QA__FLIGHTKEYS__FLIGHT_PLAN_HEADER to role analyst_em05415;
grant role SENSITIVE_ANALYTICS_QA__INTERMEDIARY__INTER_FLIGHTKEYS__FLIGHT_PLAN_HEADER to role analyst_em05415;
grant role SENSITIVE_ANALYTICS_QA__STG_FLIGHTKEYS__FLIGHT_PLAN_HEADER to role analyst_em05415;
grant role SENSITIVE_ANALYTICS_QA__FLIGHTKEYS__FLIGHT_INFO_CREW_LIST to role analyst_em05415;
grant role SENSITIVE_ANALYTICS_QA__INTERMEDIARY__INTER_FLIGHTKEYS__FLIGHT_INFO_CREW_LIST to role analyst_em05415;
grant role SENSITIVE_ANALYTICS_QA__STG_FLIGHTKEYS__FLIGHT_INFO_CREW_LIST to role analyst_em05415;
grant role analyst_em05415 to role sysadmin;
grant role analyst_em05415 to user "EM05415@JETBLUE.COM";

-- analyst_ew59108 (Angie Woodruff)
create role if not exists analyst_ew59108;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ew59108') }}
{% endif %}
grant role analyst to role analyst_ew59108;
grant role "IT DIRECTORS" to role analyst_ew59108;
grant role bluedirector_only to role analyst_ew59108;
grant role analyst_ew59108 to role sysadmin;
grant role analyst_ew59108 to user "EW59108@JETBLUE.COM";

-- analyst_ey00998 (Emre Yurtbay)
create role if not exists analyst_ey00998;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ey00998') }}
{% endif %}
grant role analyst to role analyst_ey00998;
--sensitive roles
grant role sensitive_analytics_prd__customers_rt__postal_addresses__postal_address_postal_code to role analyst_ey00998;
--other roles
grant role ITDATASCIENCECREW to role analyst_ey00998;
grant role REVENUE_FORECAST_ITDS to role analyst_ey00998;
grant role analyst_ey00998 to role sysadmin;
grant role analyst_ey00998 to user "EY00998@JETBLUE.COM";

-- analyst_ee57572 (Emily Ellis)
create role if not exists analyst_ee57572;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ee57572') }}
{% endif %}
grant role analyst to role analyst_ee57572;
--analytics roles
grant usage on schema analytics.safety to role analyst_ee57572;
grant select on all tables in schema analytics.safety to role analyst_ee57572;
grant select on all views in schema analytics.safety to role analyst_ee57572;
grant select on future tables in schema analytics.safety to role analyst_ee57572;
grant select on future views in schema analytics.safety to role analyst_ee57572;
grant usage on schema analytics.stg_sabre_crewtrac to role analyst_ee57572;
grant select on all tables in schema analytics.stg_sabre_crewtrac to role analyst_ee57572;
grant select on all views in schema analytics.stg_sabre_crewtrac to role analyst_ee57572;
grant select on future tables in schema analytics.stg_sabre_crewtrac to role analyst_ee57572;
grant select on future views in schema analytics.stg_sabre_crewtrac to role analyst_ee57572;
--sensitive roles
grant role sensitive_analytics_prd__safety to role analyst_ee57572;
grant role sensitive_analytics_prd__crew_rt to role analyst_ee57572;
grant role sensitive_analytics_prd__crew__crewmember_address to role analyst_ee57572;
grant role sensitive_analytics_prd__crew__crewmember_master to role analyst_ee57572;
grant role sensitive_analytics_prd__crew__master_pairing to role analyst_ee57572;
grant role sensitive_analytics_prd__crew__crewmember_passport to role analyst_ee57572;
grant role sensitive_analytics_prd__crew__crewmember_phone to role analyst_ee57572;
grant role sensitive_analytics_prd__crew__crewmember_visa to role analyst_ee57572;
grant role sensitive_analytics_prd__crew__crew_pay_credit to role analyst_ee57572;
grant role sensitive_analytics_prd__crew__crew_pay_daily_utilization to role analyst_ee57572;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_ee57572;
grant role sensitive_analytics_prd__flight_operations__flight_approaches to role analyst_ee57572;
--other roles
grant role TABLEAUONLINECREATOR to role analyst_ee57572;
grant role analyst_ee57572 to role sysadmin;
grant role analyst_ee57572 to user "EE57572@JETBLUE.COM";

-- analyst_enortiz (Enrique Ortiz)
create role if not exists analyst_enortiz;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_enortiz') }}
{% endif %}
grant role analyst to role analyst_enortiz;
grant role "ITDATAQA-NONPROD" to role analyst_enortiz;
--ANALYTICS.DATA_EXPORTS
grant usage on database analytics to role analyst_enortiz; 
grant usage on schema analytics.data_exports to role analyst_enortiz; 
-- ANALYTICS.CREW
grant usage on schema analytics.crew to role analyst_enortiz;
grant select on view analytics.crew.crewmember_badges_sap to role analyst_enortiz;
-- ANALYTICS.CREW_PAY
grant usage on schema analytics.crew_pay to role analyst_enortiz;
grant select on table analytics.crew_pay.crew_man_day_stats_activity to role analyst_enortiz;
grant select on table analytics.crew_pay.man_day to role analyst_enortiz;
-- ANALYTICS.SOLUTION_TEK
grant select on all tables in schema analytics.solution_tek to role analyst_enortiz;
grant select on future tables in schema analytics.solution_tek to role analyst_enortiz;
-- ANALYTICS.STG_SAP_REPORTS
grant usage on schema analytics.stg_sap_reports to role analyst_enortiz;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_enortiz;
-- ANALYTICS_QA.ANALYTICS
grant usage on schema analytics_qa.analytics to role analyst_enortiz;
grant select on table analytics_qa.analytics.crew_fact to role analyst_enortiz;
--ANALYTICS_QA.CREW
grant usage on schema analytics_qa.crew to role analyst_enortiz;
grant select on view analytics_qa.crew.crewmember_badges_sap to role analyst_enortiz;
--ANALYTICS_QA.STG_SAP_REPORTS
grant usage on schema analytics_qa.stg_sap_reports to role analyst_enortiz;
grant select on view analytics_qa.stg_sap_reports.crewmember_badges_sap to role analyst_enortiz;
-- ANALYTICS_CLONE.REFERENCE
grant usage on database analytics_clone to role analyst_enortiz;
grant usage on schema analytics_clone.reference to role analyst_enortiz;
grant select on all tables in schema analytics_clone.reference to role analyst_enortiz;
grant select on all views in schema analytics_clone.reference to role analyst_enortiz;
grant select on future views in schema analytics_clone.reference to role analyst_enortiz;
grant select on future tables in schema analytics_clone.reference to role analyst_enortiz;
grant usage on schema analytics_clone.analytics to role analyst_enortiz;
grant usage on schema analytics_clone.bookings_rt to role analyst_enortiz;
grant usage on schema analytics_clone.flights_rt to role analyst_enortiz;
grant usage on schema Analytics_clone.tickets_rt to role analyst_enortiz;
grant select on view analytics_clone.bookings_rt.pnr to role analyst_enortiz;
grant select on view analytics_clone.bookings_rt.cross_reference to role analyst_enortiz;
grant select on view analytics_clone.bookings_rt.itinerary_air_segment to role analyst_enortiz;
grant select on view analytics_clone.bookings_rt.pre_reserved_seat to role analyst_enortiz;
grant select on view analytics_clone.tickets_rt.coupon to role analyst_enortiz;
grant select on table analytics_clone.tickets_rt.ticket_coupon_detail to role analyst_enortiz;
-- RAW
grant usage on database raw to role analyst_enortiz;
grant role raw_solution_tek_read to role analyst_enortiz;
-- RAW.IFSA_RT
grant usage on schema raw.ifsa_rt to role analyst_enortiz;
grant select on table raw.ifsa_rt.mosaic_greetings to role analyst_enortiz;
-- RAW.REFERENCE
grant role raw_reference_read to role analyst_enortiz;
-- RAW.SAP_REPORTS
grant usage on schema raw.sap_reports to role analyst_enortiz;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_enortiz;
-- RAW_QA.SAP_REPORTS
grant usage on schema raw_qa.sap_reports to role analyst_enortiz;
grant select on table raw_qa.sap_reports.crewmember_badge_profiles_jbu to role analyst_enortiz;
--RAW_SABRE_ACS_RT
grant role raw_sabre_acs_rt_read to role analyst_enortiz;
-- ANALYTICS.SOLUTION_TEK
grant select on all tables in schema analytics.solution_tek to role analyst_enortiz;
grant select on all views in schema analytics.solution_tek to role analyst_enortiz;
grant select on future tables in schema analytics.solution_tek to role analyst_enortiz;
grant select on future views  in schema analytics.solution_tek to role analyst_enortiz;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__analytics__crew_fact to role analyst_enortiz;
grant role sensitive_analytics_prd__bookings to role analyst_enortiz;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_enortiz;
grant role sensitive_analytics_prd__crew_pay__crew_man_day_stats_activity to role analyst_enortiz;
grant role sensitive_analytics_prd__data_exports to role analyst_enortiz;
grant role sensitive_analytics_prd__inflight_bluebucks to role analyst_enortiz;
grant role sensitive_analytics_prd__inflight_bluebucks to role analyst_enortiz;
grant role sensitive_analytics_prd__inflight_bluebucks__reliability_score to role analyst_enortiz;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings to role analyst_enortiz;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings to role analyst_enortiz;
grant role sensitive_analytics_prd__reference to role analyst_enortiz;
grant role sensitive_analytics_prd__solution_tek__apr_commit_history to role analyst_enortiz;
grant role sensitive_analytics_prd__solution_tek__disrupted_pnr_passenger to role analyst_enortiz;
grant role sensitive_analytics_prd__solution_tek__disrupted_pnr_passenger_ssr to role analyst_enortiz;
grant role sensitive_analytics_prd__solution_tek__impacted_pnr_passenger to role analyst_enortiz;
grant role sensitive_analytics_prd__solution_tek__impacted_pnr_passenger_ssr to role analyst_enortiz;
grant role sensitive_analytics_prd__solution_tek__kickout_pnr_passenger to role analyst_enortiz;
grant role sensitive_analytics_prd__solution_tek__kickout_pnr_passenger_ssr to role analyst_enortiz;
grant role sensitive_analytics_prd__solution_tek__reaccommodated_stranded_pnrs to role analyst_enortiz;
grant role sensitive_analytics_prd__stg_crew_pay__crew_man_day_stats_activity to role analyst_enortiz;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings to role analyst_enortiz;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_enortiz;
grant role sensitive_analytics_prd__ticket_audits to role analyst_enortiz;
grant role sensitive_analytics_qa__analytics__crew_fact to role analyst_enortiz;
grant role sensitive_analytics_qa__analytics__travelers_fact to role analyst_enortiz;
grant role sensitive_analytics_qa__bookings_rt__passenger to role analyst_enortiz;
grant role sensitive_analytics_qa__check_ins_rt__passengers to role analyst_enortiz;
grant role sensitive_analytics_qa__intermediary__inter_acs_rt__acs_passenger_records to role analyst_enortiz;
grant role sensitive_analytics_qa__intermediary__inter_analytics__travelers_fact to role analyst_enortiz;
grant role sensitive_analytics_qa__intermediary__inter_pnr_rt__pnr_passenger to role analyst_enortiz;
grant role sensitive_analytics_qa__stg_sabre_acs_rt__passengers to role analyst_enortiz;
grant role sensitive_analytics_qa__stg_sabre_pnr_rt__passenger_snowflake to role analyst_enortiz;
grant role sensitive_analytics_qa__stg_sabre_pnr_rt__travelers_fact to role analyst_enortiz;
grant role sensitive_analytics_qa__crew__crewmember_badges_sap to role analyst_enortiz;
grant role sensitive_analytics_qa__stg_sap_reports__crewmember_badges_sap to role analyst_enortiz;
grant role sensitive_analytics_prd__surveys to role analyst_enortiz;
grant role sensitive_analytics_qa__reference to role analyst_enortiz;
grant role sensitive_analytics_prd__analytics__travelers_fact to role analyst_enortiz;
grant role sensitive_analytics_prd__bookings_rt__passenger to role analyst_enortiz;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_enortiz;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_enortiz;
grant role sensitive_analytics_prd__intermediary__inter_analytics__travelers_fact to role analyst_enortiz;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_enortiz;
grant role sensitive_analytics_prd__loyalty to role analyst_enortiz;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_enortiz;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_snowflake to role analyst_enortiz;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__travelers_fact to role analyst_enortiz;
grant role sensitive_analytics_prd__bookings_rt__passenger_travel_document to role analyst_enortiz;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_enortiz;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_travel_document_snowflake to role analyst_enortiz;
grant role sensitive_analytics_prd__tickets_rt__passenger to role analyst_enortiz;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_enortiz;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger_snowflake to role analyst_enortiz;
grant role analyst_enortiz to role sysadmin;
grant role analyst_enortiz to user "ENORTIZ@JETBLUE.COM";

-- analyst_elohernandez (Eloisa Hernandez Fierro)
create role if not exists analyst_elohernandez;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_elohernandez') }}
{% endif %}
grant role analyst to role analyst_elohernandez;
grant role "ITDATAQA-NONPROD" to role analyst_elohernandez;
grant role "ITDATAQA-PROD" to role analyst_elohernandez;
grant role ITQUALITYASSURANCEDW to role analyst_elohernandez;
-- qa PII Roles
grant role sensitive_analytics_qa__safety to role analyst_elohernandez;
grant role sensitive_analytics_qa__stg_safety to role analyst_elohernandez;
grant role sensitive_analytics_qa__intermediary__inspection_feeds to role analyst_elohernandez;
grant role sensitive_analytics_qa__intermediary__user_feeds to role analyst_elohernandez;
-- ANALYTICS_QA.SAFETY
grant usage on schema analytics_qa.safety to role analyst_elohernandez;
grant select on all tables in schema analytics_qa.safety to role analyst_elohernandez;
grant select on future tables in schema analytics_qa.safety to role analyst_elohernandez;
grant select on all views in schema analytics_qa.safety to role analyst_elohernandez;
grant select on future views in schema analytics_qa.safety to role analyst_elohernandez;
-- analytics_qa.stg_safety
grant role analytics_qa_stg_safety_read to role analyst_elohernandez;
-- ANALYTICS_QA.STG_VISTAIR
grant usage on schema analytics_qa.stg_vistair to role analyst_elohernandez;
grant select on all views in schema analytics_qa.stg_vistair to role analyst_elohernandez;
grant select on future views in schema analytics_qa.stg_vistair to role analyst_elohernandez;
-- raw roles
grant role raw_viasat_read to role analyst_elohernandez;
-- raw_qa.safety
grant usage on database raw_qa to role analyst_elohernandez;
grant usage on schema raw_qa.safety to role analyst_elohernandez;
grant select on all tables in schema raw_qa.safety to role analyst_elohernandez;
grant usage on schema analytics_clone.bookings_rt to role analyst_elohernandez;
grant usage on schema analytics_clone.flights_rt to role analyst_elohernandez;
grant usage on schema Analytics_clone.tickets_rt to role analyst_elohernandez;
grant select on view analytics_clone.bookings_rt.pnr to role analyst_elohernandez;
grant select on view analytics_clone.bookings_rt.cross_reference to role analyst_elohernandez;
grant select on view analytics_clone.bookings_rt.itinerary_air_segment to role analyst_elohernandez;
grant select on view analytics_clone.bookings_rt.pre_reserved_seat to role analyst_elohernandez;
grant select on view analytics_clone.tickets_rt.coupon to role analyst_elohernandez;
grant select on table analytics_clone.tickets_rt.ticket_coupon_detail to role analyst_elohernandez;
-- ANALYTICS_CLONE.ANALYTICS
grant usage on database analytics_clone to role analyst_elohernandez;
grant usage on schema analytics_clone.analytics to role analyst_elohernandez;
-- analytics_qa.travelers_fact
grant role SENSITIVE_ANALYTICS_QA__ANALYTICS__TRAVELERS_FACT to role analyst_elohernandez;
grant role SENSITIVE_ANALYTICS_QA__INTERMEDIARY__INTER_ANALYTICS__TRAVELERS_FACT to role analyst_elohernandez;
grant role SENSITIVE_ANALYTICS_QA__STG_SABRE_PNR_RT__TRAVELERS_FACT to role analyst_elohernandez;
grant role sensitive_analytics_prd__analytics__travelers_fact to role analyst_elohernandez;
grant role sensitive_analytics_prd__bookings_rt__passenger to role analyst_elohernandez;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_elohernandez;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_elohernandez;
grant role sensitive_analytics_prd__intermediary__inter_analytics__travelers_fact to role analyst_elohernandez;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_elohernandez;
grant role sensitive_analytics_prd__loyalty to role analyst_elohernandez;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_elohernandez;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_snowflake to role analyst_elohernandez;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__travelers_fact to role analyst_elohernandez;
grant role sensitive_analytics_prd__bookings_rt__passenger_travel_document to role analyst_elohernandez;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_elohernandez;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_travel_document_snowflake to role analyst_elohernandez;
grant role sensitive_analytics_prd__tickets_rt__passenger to role analyst_elohernandez;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_elohernandez;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger_snowflake to role analyst_elohernandez;
grant role sensitive_analytics_prd__data_exports__webpos_dominican_republic_tax_details to role analyst_elohernandez;
grant role sensitive_analytics_prd__bookings__passenger_emails__email_address to role analyst_elohernandez;
grant role sensitive_analytics_prd__tickets__documents__customer_full_name to role analyst_elohernandez;
grant role sensitive_analytics_prd__data_exports__webpos_dominican_republic_tax_audit to role analyst_elohernandez;
grant role sensitive_analytics_prd__stg_international_tax_exports__webpos_dominican_republic_tax_audit to role analyst_elohernandez;
grant usage on schema analytics.stg_international_tax_exports to role analyst_elohernandez;
grant select on all views in schema analytics.stg_international_tax_exports to role analyst_elohernandez;
grant select on future views in schema analytics.stg_international_tax_exports to role analyst_elohernandez;
grant select on all tables in schema analytics.stg_international_tax_exports to role analyst_elohernandez;
grant select on future tables in schema analytics.stg_international_tax_exports to role analyst_elohernandez;
grant usage on database raw to role analyst_elohernandez;
grant usage on schema raw.international_tax_exports to role analyst_elohernandez;
grant select on all views in schema raw.international_tax_exports to role analyst_elohernandez;
grant select on all tables in schema raw.international_tax_exports to role analyst_elohernandez;
grant select on future tables in schema raw.international_tax_exports to role analyst_elohernandez;
grant role sensitive_analytics_prd__data_exports__webpos_dominican_republic_tax_audit to role analyst_elohernandez;
grant role sensitive_analytics_prd__stg_international_tax_exports__webpos_dominican_republic_tax_audit to role analyst_elohernandez;
grant role analyst_elohernandez to role sysadmin;
grant role analyst_elohernandez to user "ELOHERNANDEZ@JETBLUE.COM";
grant role sensitive_analytics_prd__analytics__ancillaries_fact to role analyst_elohernandez;
grant role sensitive_analytics_prd__data_exports__edicom_dominican_republic_tax_details to role analyst_elohernandez;
grant role sensitive_analytics_prd__tickets__documents to role analyst_elohernandez;
grant role sensitive_analytics_prd__data_exports__edicom_dominican_republic_tax_audit to role analyst_elohernandez;
grant role sensitive_analytics_prd__stg_international_tax_exports__edicom_dominican_republic_tax_audit to role analyst_elohernandez;
grant role sensitive_analytics_prd__bookings__passenger_emails to role analyst_elohernandez;
grant usage on schema analytics.stg_international_tax_exports to role analyst_elohernandez;
grant select on view analytics.stg_international_tax_exports.edicom_dominican_republic_tax_audit to role analyst_elohernandez;

-- analyst_emalone(Esther Malone)
create role if not exists analyst_emalone;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_emalone') }}
{% endif %}
grant role analyst to role analyst_emalone;
grant role LOYALTYTECHSUPPORT to role analyst_emalone;
grant role TABLEAUONLINECREATOR to role analyst_emalone;
grant role sensitive_analytics_prd__loyalty to role analyst_emalone;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_emalone;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_emalone;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_emalone;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_emalone;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_emalone;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_emalone;
grant role analytics_stg_loyalty_rt_read to role analyst_emalone;
grant role analyst_emalone to role sysadmin;
grant role analyst_emalone to user "EMALONE@JETBLUE.COM";

-- analyst_es82291 ( Einan Sauerhaft )
create role if not exists analyst_es82291;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_es82291') }}
{% endif %}
grant role analyst to role analyst_es82291;
grant role sensitive_analytics_prd__safety to role analyst_es82291;
grant usage on schema analytics.safety to role analyst_es82291;
grant select on all tables in schema analytics.safety to role analyst_es82291;
grant select on all views in schema analytics.safety to role analyst_es82291;
grant select on future tables in schema analytics.safety to role analyst_es82291;
grant select on future views in schema analytics.safety to role analyst_es82291;
grant usage on schema analytics.stg_sabre_crewtrac to role analyst_es82291;
grant select on all tables in schema analytics.stg_sabre_crewtrac to role analyst_es82291;
grant select on all views in schema analytics.stg_sabre_crewtrac to role analyst_es82291;
grant select on future tables in schema analytics.stg_sabre_crewtrac to role analyst_es82291;
grant select on future views in schema analytics.stg_sabre_crewtrac to role analyst_es82291;
grant role sensitive_analytics_prd__crew_rt to role analyst_es82291;
grant role sensitive_analytics_prd__crew__crewmember_address to role analyst_es82291;
grant role sensitive_analytics_prd__crew__crewmember_master to role analyst_es82291;
grant role sensitive_analytics_prd__crew__master_pairing to role analyst_es82291;
grant role sensitive_analytics_prd__crew__crewmember_passport to role analyst_es82291;
grant role sensitive_analytics_prd__crew__crewmember_phone to role analyst_es82291;
grant role sensitive_analytics_prd__crew__crewmember_visa to role analyst_es82291;
grant role sensitive_analytics_prd__crew__crew_pay_credit to role analyst_es82291;
grant role sensitive_analytics_prd__crew__crew_pay_daily_utilization to role analyst_es82291;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_es82291;
grant role analyst_es82291 to role sysadmin;
grant role analyst_es82291 to user "ES82291@JETBLUE.COM";

-- analyst_et50724 (Eric M Townsend)
create role if not exists analyst_et50724;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_et50724') }}
{% endif %}
grant role analyst to role analyst_et50724;
grant role crewstaffingdl to role analyst_et50724;
grant role analyst_et50724 to role sysadmin;
grant role analyst_et50724 to user "ET50724@JETBLUE.COM";

-- analyst_et01831 (Eyerusalem Tegene)
create role if not exists analyst_et01831;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_et01831') }}
{% endif %}
grant role analyst to role analyst_et01831;
grant role "IT EQA GLOBAL TEAM" to role analyst_et01831;
grant role "ITDATAQA-NONPROD" to role analyst_et01831;
grant role crew_domain to role analyst_et01831;
-- RAW_QA
grant usage on database raw_qa to role analyst_et01831;
-- RAW_QA.CREWQUAL
grant usage on schema raw_qa.crewqual to role analyst_et01831;
grant select on table raw_qa.crewqual.med_data to role analyst_et01831;
grant select on table raw_qa.crewqual.pilot_time to role analyst_et01831;
-- SENSITIVE ROLES
grant role sensitive_analytics_qa__crewqual__med_data to role analyst_et01831;
grant role sensitive_analytics_qa__crewqual__pilot_time to role analyst_et01831;
grant role analyst_et01831 to role sysadmin;
grant role analyst_et01831 to user "ET01831@JETBLUE.COM";

--analyst_fh40316 (Fernando Hernandez)
create role if not exists analyst_fh40316;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_fh40316') }}
{% endif %}
grant role analyst to role analyst_fh40316;
grant role "FLIGHT OPS TEAM" to role analyst_fh40316;
grant role "FUEL OPTIMIZATION TEAM" to role analyst_fh40316;
grant usage on schema byod.opa to role analyst_fh40316;
grant usage on database byod to role analyst_fh40316;
grant usage on schema byod.opa to role analyst_fh40316;
grant select on view byod.opa.vw_flightkeys_flight_plans to role  analyst_fh40316;
grant role analyst_fh40316 to role sysadmin;
grant role analyst_fh40316 to user "FH40316@JETBLUE.COM";

-- analyst_FDattani (Forum Dattani)
create role if not exists analyst_fdattani;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_fdattani') }}
{% endif %}
grant role analyst_tissi to role analyst_fdattani;
grant role analyst_fdattani to role sysadmin;
grant role analyst_fdattani to user "FDATTANI@JETBLUE.COM";

--analyst_fo53488(Frank Orlando)
create role if not exists analyst_fo53488;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_fo53488') }}
{% endif %}
grant role analyst to role analyst_fo53488;
-- BYOD.BLUERM
grant usage on database byod to role analyst_fo53488;
grant usage on schema byod.bluerm to role analyst_fo53488;
grant select on table byod.bluerm.currency_convert_ra to role analyst_fo53488;
grant select on table byod.bluerm.currencyconvert to role analyst_fo53488;
grant role analyst_fo53488 to role sysadmin;
grant role analyst_fo53488 to user "FO53488@JETBLUE.COM";

-- analyst_fflores (Francisco Flores)
create role if not exists analyst_fflores;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_fflores') }}
{% endif %}
grant role analyst to role analyst_fflores;
grant role TABLEAUONLINECREATOR to role analyst_fflores;
grant role analyst_fflores to role sysadmin;
grant role analyst_fflores to user "FFLORES@JETBLUE.COM";

-- analyst_fuelalert (FUELALERT)
create role if not exists analyst_fuelalert;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_fuelalert') }}
{% endif %}
grant role analyst to role analyst_fuelalert;
grant role byod_fuelalert to role analyst_fuelalert;
grant role byod_fuelalert_read to role analyst_fuelalert;
grant role analyst_fuelalert to role sysadmin;
grant role analyst_fuelalert to role FUELALERT;

-- analyst_gk73966(Georgina Koulouri Navarro)
create role if not exists analyst_gk73966;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_gk73966') }}
{% endif %}
grant role analyst to role analyst_gk73966;
grant role "IT DIGITAL OPERATIONS" to role analyst_gk73966;
grant role "IT MANAGE YOUR BOOKING" to role analyst_gk73966;
grant role sensitive_analytics_prd__bookings__remarks_history__remark_text to role analyst_gk73966;
grant role analyst_gk73966 to role sysadmin;
grant role analyst_gk73966 to user "GK73966@JETBLUE.COM";

-- analyst_gc94403 (Giovanni Claus)
create role if not exists analyst_gc94403;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_gc94403') }}
{% endif %}
grant role analyst to role analyst_gc94403;
grant role analytics_bookings_read to role analyst_gc94403;
grant role analytics_bookings_rt_read to role analyst_gc94403;
grant role "CEX ANALYTICS" to role analyst_gc94403;
grant role TABLEAUONLINECREATOR to role analyst_gc94403;
grant role analyst_gc94403 to role sysadmin;
grant role analyst_gc94403 to user "GC94403@JETBLUE.COM";

-- analyst_gm35083 (Gregory Masters)
create role if not exists analyst_gm35083;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_gm35083') }}
{% endif %}
grant role analyst to role analyst_gm35083;
grant role FRMSSUPPORT to role analyst_gm35083;
grant role TABLEAUONLINECREATOR to role analyst_gm35083;
grant usage on schema analytics.safety to role analyst_gm35083;
grant select on view analytics.safety.call_outs to role analyst_gm35083;
grant usage on schema analytics.stg_safety to role analyst_gm35083;
grant select on view analytics.stg_safety.call_outs to role analyst_gm35083;
grant usage on database raw to role analyst_gm35083; 
grant usage on schema raw.safety to role analyst_gm35083;
grant select on table raw.safety.call_outs to role analyst_gm35083;
-- byod
grant usage on database byod to role analyst_gm35083;
-- byod.opa
grant usage on schema byod.opa to role analyst_gm35083;
grant select on table byod.opa.prg_crew_base to role analyst_gm35083;
grant select on table byod.opa.prg_duty to role analyst_gm35083;
grant select on table byod.opa.prg_far117_a to role analyst_gm35083;
grant select on table byod.opa.prg_file to role analyst_gm35083;
grant select on table byod.opa.prg_pairing to role analyst_gm35083;
grant select on table byod.opa.prg_segment to role analyst_gm35083;
grant select on table byod.opa.prg_special_qualifications to role analyst_gm35083;
grant select on view byod.opa.prg_processed_segment to role analyst_gm35083;
grant select on table byod.opa.prg_crew_base_v2_beta to role analyst_gm35083;
grant select on table byod.opa.prg_far117_b to role analyst_gm35083;
grant select on table byod.opa.prg_far117_c to role analyst_gm35083;
grant select on table byod.opa.prg_mcct to role analyst_gm35083;
grant select on table byod.opa.prg_pre_clearance to role analyst_gm35083;
grant select on view byod.opa.vw_prg_published_duty to role analyst_gm35083;
grant select on view byod.opa.vw_prg_published_pairing to role analyst_gm35083;
grant select on view byod.opa.vw_prg_published_processed_segment to role analyst_gm35083;
grant select on view byod.opa.vw_prg_published_segment to role analyst_gm35083;
grant role analyst_gm35083 to role sysadmin;
grant role analyst_gm35083 to user "GM35083@JETBLUE.COM";

-- analyst_gn96113 (Gurjot Nijjar)
create role if not exists analyst_gn96113;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_gn96113') }}
{% endif %}
grant role analyst to role analyst_gn96113;
grant role "FINANCIAL SYSTEMS CONTROLLER GROUP" to role analyst_gn96113;
grant role BLUELOYALTY to role analyst_gn96113;
grant role LOYALTYANALYSIS to role analyst_gn96113;
-- analytics.cybersource_payments
grant usage on schema analytics.cybersource_payments to role analyst_gn96113;
grant select on table analytics.cybersource_payments.jetblue_transaction_requests to role analyst_gn96113;
--SENSITIVE ROLES
grant role sensitive_analytics_prd__cybersource_payments__jetblue_transaction_requests__bill_to_state to role analyst_gn96113;
grant role sensitive_analytics_prd__cybersource_payments__jetblue_transaction_requests__bill_to_zip to role analyst_gn96113;
grant role sensitive_analytics_prd__cybersource_payments__jetblue_transaction_requests__bill_to_city to role analyst_gn96113;
grant role analyst_gn96113 to role sysadmin;
grant role analyst_gn96113 to user "GN96113@JETBLUE.COM";

-- analyst_gs83589 (Gurwinder Singh)
create role if not exists analyst_gs83589;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_gs83589') }}
{% endif %}
grant role analyst to role analyst_gs83589;
grant role bluerevforecasting to role analyst_gs83589;
grant role bluerm to role analyst_gs83589;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__reporting__mint_studio_fact to role analyst_gs83589;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_gs83589;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_gs83589;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_gs83589;
-- analytics.stg_sap_reports
grant usage on schema analytics.stg_sap_reports to role analyst_gs83589;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_gs83589;
grant role analyst_gs83589 to role sysadmin;
grant role analyst_gs83589 to user "GS83589@JETBLUE.COM";

-- analyst_gabinaya (G Abinaya)
create role if not exists analyst_gabinaya;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_gabinaya') }}
{% endif %}
grant role analyst to role analyst_gabinaya;
grant role analytics_bluebucks_read to role analyst_gabinaya;
grant role TCSDATAENGINEERING to role analyst_gabinaya;
-- raw roles
grant role raw_aircom_read to role analyst_gabinaya;
grant role raw_aqd_read to role analyst_gabinaya;
grant role raw_comarch_bi_prod_dbo_read to role analyst_gabinaya;
grant role raw_comarch_dbo_read to role analyst_gabinaya;
grant role raw_credit_card_sales_read to role analyst_gabinaya;
grant role raw_notification_manager_read to role analyst_gabinaya;
grant role raw_sabre_ticket_rt_read to role analyst_gabinaya;
grant role raw_sap_s4_hana_read to role analyst_gabinaya;
grant role raw_task_audit_read to role analyst_gabinaya;
grant role raw_travelbank_read to role analyst_gabinaya;
grant role raw_barclays_read to role analyst_gabinaya;
-- raw.sap_reports
grant usage on schema raw.sap_reports to role analyst_gabinaya;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_gabinaya;
-- raw.sabre_ticket_batch
grant usage on schema raw.sabre_ticket_batch to role analyst_gabinaya;
grant select on table raw.sabre_ticket_batch.ticket_coupon_emd to role analyst_gabinaya;
-- raw.sabre_intelligence_exchange
grant usage on schema raw.sabre_intelligence_exchange to role analyst_gabinaya;
grant select on table raw.sabre_intelligence_exchange.use_case_booking_monitor to role analyst_gabinaya;
--raw.invoiceworks
grant role raw_invoiceworks_read to role analyst_gabinaya; 
-- raw.ifsa_rt
grant usage on schema raw.ifsa_rt to role analyst_gabinaya;
grant select on table raw.ifsa_rt.mosaic_greetings to role analyst_gabinaya;
-- raw.sabre_acs_rt
grant role raw_sabre_acs_rt_read to role analyst_gabinaya;
-- RAW.TIPHAUS
grant usage on schema raw.tiphaus to role analyst_gabinaya;
grant select on all tables in schema raw.tiphaus to role analyst_gabinaya;
grant select on future tables in schema raw.tiphaus to role analyst_gabinaya;
-- analytics.bcus_transactions
grant usage on schema analytics.bcus_transactions to role analyst_gabinaya;
grant select on table analytics.bcus_transactions.barclays_card_transactions to role analyst_gabinaya;
-- analytics.crew_pay
grant usage on schema analytics.crew_pay to role analyst_gabinaya;
grant select on all tables in schema analytics.crew_pay to role analyst_gabinaya;
grant select on future tables in schema analytics.crew_pay to role analyst_gabinaya;
grant select on all views in schema analytics.crew_pay to role analyst_gabinaya;
grant select on future views in schema analytics.crew_pay to role analyst_gabinaya;
-- analytics.intermediary
grant usage on schema analytics.intermediary to role analyst_gabinaya;
grant select on table analytics.intermediary.inter_sabre_intelligence_exchange__use_case_booking_monitor to role analyst_gabinaya;
-- analytics.invoiceworks
grant role analytics_invoiceworks_read to role analyst_gabinaya;
-- analytics_onboard_experience
grant role analytics_onboard_experience_read to role analyst_gabinaya;
-- analytics.stg_ifsa_rt.mosaic_greetings
grant usage on schema analytics.stg_ifsa_rt to role analyst_gabinaya;
grant select on table analytics.stg_ifsa_rt.mosaic_greetings to role analyst_gabinaya;
-- analytics.stg_inflight_entertainment
grant usage on schema analytics.stg_inflight_entertainment to role analyst_gabinaya;
grant select on all tables in schema analytics.stg_inflight_entertainment to role analyst_gabinaya;
grant select on all views in schema analytics.stg_inflight_entertainment to role analyst_gabinaya;
grant select on future views in schema analytics.stg_inflight_entertainment to role analyst_gabinaya;
grant select on future tables in schema analytics.stg_inflight_entertainment to role analyst_gabinaya;
-- analytics.sabre_intelligence_exchange
grant usage on schema analytics.sabre_intelligence_exchange to role analyst_gabinaya;
grant select on view analytics.sabre_intelligence_exchange.use_case_booking_monitor to role analyst_gabinaya;
-- analytics.stg_sabre_intelligence_exchange
grant usage on schema analytics.stg_sabre_intelligence_exchange to role analyst_gabinaya;
grant select on view analytics.stg_sabre_intelligence_exchange.use_case_booking_monitor to role analyst_gabinaya;
-- analytics.stg_sap_reports
grant usage on schema analytics.stg_sap_reports to role analyst_gabinaya;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_gabinaya;
-- analytics.stg_metar
grant usage on schema analytics.stg_metar to role analyst_gabinaya;
grant select on all views in schema analytics.stg_metar to role analyst_gabinaya;
grant select on future views in schema analytics.stg_metar to role analyst_gabinaya;
grant select on all tables in schema analytics.stg_metar to role analyst_gabinaya;
grant select on future tables in schema analytics.stg_metar to role analyst_gabinaya;
-- analytics_qa.bluebucks
grant role analytics_qa_bluebucks_read to role analyst_gabinaya;
grant role sensitive_analytics_qa__bluebucks to role analyst_gabinaya;
-- analytics_qa.stg_inflight_entertainment
grant usage on schema analytics_qa.stg_inflight_entertainment to role analyst_gabinaya;
grant select on all views in schema analytics_qa.stg_inflight_entertainment to role analyst_gabinaya;
grant select on future views in schema analytics_qa.stg_inflight_entertainment to role analyst_gabinaya;
grant select on all tables in schema analytics_qa.stg_inflight_entertainment to role analyst_gabinaya;
grant select on future tables in schema analytics_qa.stg_inflight_entertainment to role analyst_gabinaya;
-- analytics_qa.sabre_intelligence_exchange
grant usage on schema analytics_qa.sabre_intelligence_exchange to role analyst_gabinaya;
grant select on all tables in schema analytics_qa.sabre_intelligence_exchange to role analyst_gabinaya;
grant select on all views in schema analytics_qa.sabre_intelligence_exchange to role analyst_gabinaya;
grant select on future tables in schema analytics_qa.sabre_intelligence_exchange to role analyst_gabinaya;
grant select on future views in schema analytics_qa.sabre_intelligence_exchange to role analyst_gabinaya;
-- analytics_qa.stg_sabre_intelligence_exchange
grant usage on schema analytics_qa.stg_sabre_intelligence_exchange to role analyst_gabinaya;
grant select on all tables in schema analytics_qa.stg_sabre_intelligence_exchange to role analyst_gabinaya;
grant select on all views in schema analytics_qa.stg_sabre_intelligence_exchange to role analyst_gabinaya;
grant select on future tables in schema analytics_qa.stg_sabre_intelligence_exchange to role analyst_gabinaya;
grant select on future views in schema analytics_qa.stg_sabre_intelligence_exchange to role analyst_gabinaya;
grant usage on schema raw.metar to role analyst_gabinaya;
grant role raw_metar_read to role analyst_gabinaya;
grant role raw_inflight_entertainment_read to role analyst_gabinaya;
grant role raw_comarch_bi_prod_rep_read to role analyst_gabinaya;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bookings__passengers to role analyst_gabinaya;
grant role sensitive_analytics_prd__bluebucks__clean_customer_compliments to role analyst_gabinaya;
grant role sensitive_analytics_prd__crew to role analyst_gabinaya;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_gabinaya;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings to role analyst_gabinaya;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_gabinaya;
grant role sensitive_analytics_prd__invoiceworks to role analyst_gabinaya;
grant role sensitive_analytics_prd__loyalty__non_air_tile_transactions to role analyst_gabinaya;
grant role sensitive_analytics_prd__loyalty__reversal_tile_transactions to role analyst_gabinaya;
grant role sensitive_analytics_prd__notification_manager to role analyst_gabinaya;
grant role sensitive_analytics_prd__onboard_experience to role analyst_gabinaya;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_gabinaya;
grant role sensitive_analytics_prd__stg_barclays to role analyst_gabinaya;
grant role sensitive_analytics_prd__stg_barclays__barclays_loyalty_cobrand_business_accounts to role analyst_gabinaya;
grant role sensitive_analytics_prd__stg_barclays__barclays_loyalty_cobrand_consumer_accounts to role analyst_gabinaya;
grant role sensitive_analytics_prd__stg_barclays__credit_card_promo_code to role analyst_gabinaya;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings to role analyst_gabinaya;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_gabinaya;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_gabinaya;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_incentive_payout_history to role analyst_gabinaya;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_seats_ancillary_report to role analyst_gabinaya;
grant role sensitive_responsys_read to role analyst_gabinaya;
grant role analyst_gabinaya to role sysadmin;
grant role analyst_gabinaya to user "GABINAYA@JETBLUE.COM";

-- analyst_gm83723 (Gabriella Mencio)
create role if not exists analyst_gm83723;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_gm83723') }}
{% endif %}
grant role analyst to role analyst_gm83723;
grant role sensitive_sabre_acs_read to role analyst_gm83723;
grant role sensitive_analytics_prd__check_ins_rt__travel_documents__travel_document_passenger_date_of_birth to role analyst_gm83723;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents__travel_document_passenger_date_of_birth to role analyst_gm83723;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__travel_documents__travel_document_passenger_date_of_birth to role analyst_gm83723;
grant role sensitive_analytics_prd__bluebucks__customer_compliments__feedback_comment to role analyst_gm83723;
grant role sensitive_analytics_prd__surveys__diagnostic_2021__m_recipient_email to role analyst_gm83723;
grant role sensitive_analytics_prd__surveys__legacy_diagnostic__m_recipient_email to role analyst_gm83723;
grant role sensitive_analytics_prd__surveys__short_form__m_recipient_email to role analyst_gm83723;
grant role itdatasciencecrew to role analyst_gm83723;
-- byod.customer_insights
grant role byod_customer_insights to role analyst_gm83723;
grant usage on schema byod.bluerevforecasting to role analyst_gm83723;
grant select on table byod.bluerevforecasting.iata to role analyst_gm83723;
grant role analyst_gm83723 to role sysadmin;
grant role analyst_gm83723 to user "GM83723@JETBLUE.COM";

-- analyst_gtran (Gwen Tran)
create role if not exists analyst_gtran;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_gtran') }}
{% endif %}
grant role analyst to role analyst_gtran;
grant role ITDATASCIENCEBP to role analyst_gtran;
grant role TABLEAUONLINECREATOR to role analyst_gtran;
grant role byod_bcg_gamma to role analyst_gtran;
grant role byod_bluerm to role analyst_gtran;
grant role byod_bluerm_read to role analyst_gtran;
grant role analyst_gtran to role sysadmin;
grant role analyst_gtran to user "GTRAN@JETBLUE.COM";

-- analyst_hb53190 (Heather Berndt)
create role if not exists analyst_hb53190;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_hb53190') }}
{% endif %}
grant role analyst to role analyst_hb53190;
grant role "WPA LEADERSHIP" to role analyst_hb53190;
grant role "WPA TEAM" to role analyst_hb53190;
grant role J5PRODKBANALYST to role analyst_hb53190;
grant role TABLEAUONLINECREATOR to role analyst_hb53190;
-- analytics roles
grant role analytics_stg_sabre_acs_rt_read to role analyst_hb53190;
grant role analytics_stg_sabre_pnr_rt_read to role analyst_hb53190;
grant role analytics_stg_sabre_ticket_rt_read to role analyst_hb53190;
-- sensitive roles
grant role sensitive_analytics_prd__bookings to role analyst_hb53190;
grant role sensitive_analytics_prd__bookings_rt to role analyst_hb53190;
grant role sensitive_analytics_prd__check_ins to role analyst_hb53190;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_hb53190;
grant role sensitive_analytics_prd__crew__deadhead_messages__birth_date to role analyst_hb53190;
grant role sensitive_analytics_prd__crew__deadhead_messages__first_name to role analyst_hb53190;
grant role sensitive_analytics_prd__crew__deadhead_messages__last_name to role analyst_hb53190;
grant role sensitive_analytics_prd__crew__deadhead_messages__legal_first_name to role analyst_hb53190;
grant role sensitive_analytics_prd__crew__deadhead_messages__middle_name to role analyst_hb53190;
grant role sensitive_analytics_prd__crew__performance_stats_queues_crew to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_hb53190;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark to role analyst_hb53190;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_hb53190;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_hb53190;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_hb53190;
grant role sensitive_analytics_prd__tickets to role analyst_hb53190;
grant role sensitive_analytics_prd__tickets_rt to role analyst_hb53190;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_hb53190;
-- other roles
grant role analyst_hb53190 to role sysadmin;
grant role analyst_hb53190 to user "HB53190@JETBLUE.COM";

-- analyst_he78777 (Helenie Gonzalez Galarza)
create role if not exists analyst_he78777;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_he78777') }}
{% endif %}
grant role analyst to role analyst_he78777;
grant role analyst_itdigitaloperations to role analyst_he78777;
grant role byod_cex_analytics to role analyst_he78777;
grant role byod_cex_analytics_read to role analyst_he78777;
grant role "WPA TEAM" to role analyst_he78777;
grant role j5prodkbanalyst to role analyst_he78777;
-- ANALYTICS.SAFETY
grant usage on schema analytics.safety to role analyst_he78777;
grant select on view analytics.safety.occurrence_events to role analyst_he78777;
grant select on view analytics.safety.event_descriptors to role analyst_he78777;
grant select on view analytics.safety.occurrences to role analyst_he78777;
grant select on view analytics.safety.occurrence_type_classifications to role analyst_he78777;
grant select on view analytics.safety.occurrence_add_ons to role analyst_he78777;
-- ANALYTICS.STG_AQD
grant usage on schema analytics.stg_aqd to role analyst_he78777;
grant select on view analytics.stg_aqd.event_descriptors to role analyst_he78777;
grant select on view analytics.stg_aqd.occurrences to role analyst_he78777;
grant select on view analytics.stg_aqd.occurrence_events to role analyst_he78777;
grant select on view analytics.stg_aqd.occurrence_type_classifications to role analyst_he78777;
grant select on view analytics.stg_aqd.occurrence_add_ons to role analyst_he78777;
-- ANALYTICS_CLONE
grant usage on database analytics_clone to role analyst_he78777;
-- ANALYTICS_CLONE.SOLUTION_TEK
grant usage on schema analytics_clone.solution_tek to role analyst_he78777;
grant select on all tables in schema analytics_clone.solution_tek to role analyst_he78777;
grant select on future tables in schema analytics_clone.solution_tek to role analyst_he78777;
grant select on all views in schema analytics_clone.solution_tek to role analyst_he78777;
grant select on future views in schema analytics_clone.solution_tek to role analyst_he78777;
-- ANALYTICS_DEV
grant usage on database analytics_dev to role analyst_he78777;
-- ANALYTICS_DEV.MINT_CUSTOMER_DISRUPTION
grant usage on schema analytics_dev.mint_customer_disruption to role analyst_he78777;
grant select on all tables in schema analytics_dev.mint_customer_disruption to role analyst_he78777;
grant select on future tables in schema analytics_dev.mint_customer_disruption to role analyst_he78777;
grant select on all views in schema analytics_dev.mint_customer_disruption to role analyst_he78777;
grant select on future views in schema analytics_dev.mint_customer_disruption to role analyst_he78777;
-- ANALYTICS_DEV.IROPS_REACCOM
grant usage on schema analytics_dev.irops_reaccom to role analyst_he78777;
grant select on table analytics_dev.irops_reaccom.real_time_recovery_current to role analyst_he78777;
grant select on table analytics_dev.irops_reaccom.real_time_recovery_history to role analyst_he78777;
-- analytics_qa
grant usage on database analytics_qa to role analyst_he78777;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_he78777;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_he78777;
grant select on view analytics_qa.credit_issuing_tool.passenger_request to role analyst_he78777;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_he78777;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_he78777;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_he78777;
grant usage on schema analytics_qa.intermediary to role analyst_he78777;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_he78777;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__passenger_request to role analyst_he78777;
-- BYOD
grant usage on database byod to role analyst_he78777;
-- BYOD.AIRPORT_STANDARDS
grant usage on schema byod.airport_standards to role analyst_he78777;
grant select on table byod.airport_standards.dpax_data to role analyst_he78777;
-- RAW ROLES
grant usage on database raw to role analyst_he78777;
grant usage on schema raw.aqd to role analyst_he78777;
grant select on table raw.aqd.event_descriptors to role analyst_he78777;
grant select on table raw.aqd.occurrences to role analyst_he78777;
grant select on table raw.aqd.occurrence_type_classifications to role analyst_he78777;
grant select on table raw.aqd.occurrence_events to role analyst_he78777;
grant select on table raw.aqd.occurrence_add_ons to role analyst_he78777;
-- RAW READ ROLES
grant role raw_irops_reaccom_read to role analyst_he78777;
grant role raw_loyalty_rt_read to role analyst_he78777;
grant role raw_sabre_acs_rt_read to role analyst_he78777;
grant role raw_sabre_pnr_rt_read to role analyst_he78777;
grant role raw_sabre_ticket_rt_read to role analyst_he78777;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__analytics__ancillaries_fact to role analyst_he78777;
grant role sensitive_analytics_prd__analytics__beta_ancillaries_fact to role analyst_he78777;
grant role sensitive_analytics_prd__analytics__beta_change_fees_fact to role analyst_he78777;
grant role sensitive_analytics_prd__analytics__beta_customers_fact to role analyst_he78777;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_he78777;
grant role sensitive_analytics_prd__analytics__loyalty_fact to role analyst_he78777;
grant role sensitive_analytics_prd__api_global_hotels__dpax_accounting_report to role analyst_he78777;
grant role sensitive_analytics_prd__bookings to role analyst_he78777;
grant role sensitive_analytics_prd__bookings_rt to role analyst_he78777;
grant role sensitive_analytics_prd__check_ins to role analyst_he78777;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_he78777;
grant role sensitive_analytics_prd__crew__deadhead_messages__birth_date to role analyst_he78777;
grant role sensitive_analytics_prd__crew__deadhead_messages__first_name to role analyst_he78777;
grant role sensitive_analytics_prd__crew__deadhead_messages__last_name to role analyst_he78777;
grant role sensitive_analytics_prd__crew__deadhead_messages__legal_first_name to role analyst_he78777;
grant role sensitive_analytics_prd__crew__deadhead_messages__middle_name to role analyst_he78777;
grant role sensitive_analytics_prd__crew__performance_stats_queues_crew to role analyst_he78777;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_he78777;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_he78777;
grant role sensitive_analytics_prd__crew__organization_hierarchy_vertical to role analyst_he78777;
grant role sensitive_analytics_prd__employee_profile_record to role analyst_he78777;
grant role sensitive_analytics_prd__fees to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers__additional_comments to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers__issuing_crewmember_id to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers__issuing_crewmember_name to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_irops_reaccom__impacted_pnrs to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_irops_reaccom__solution_pnrs to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_he78777;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark to role analyst_he78777;
grant role sensitive_analytics_prd__irops_reaccom to role analyst_he78777;
grant role sensitive_analytics_prd__loyalty to role analyst_he78777;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_he78777;
grant role sensitive_analytics_prd__mint_customer_disruption to role analyst_he78777;
grant role sensitive_analytics_prd__mint_customer_disruption__pnr_equipment_swap_current to role analyst_he78777;
grant role sensitive_analytics_prd__mint_customer_disruption__pnr_equipment_swap_history to role analyst_he78777;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_he78777;
grant role sensitive_analytics_prd__safety to role analyst_he78777;
grant role sensitive_analytics_prd__solution_tek__apr_commit_history__user_name to role analyst_he78777;
grant role sensitive_analytics_prd__solution_tek__impacted_pnr_passenger to role analyst_he78777;
grant role sensitive_analytics_prd__solution_tek__kickout_pnr_passenger to role analyst_he78777;
grant role sensitive_analytics_prd__solution_tek__reaccommodated_stranded_pnrs to role analyst_he78777;
grant role sensitive_analytics_prd__stg_aqd__occurrence_add_ons to role analyst_he78777;
grant role sensitive_analytics_prd__stg_aqd__occurrences to role analyst_he78777;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers to role analyst_he78777;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers to role analyst_he78777;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__additional_comments to role analyst_he78777;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__issuing_crewmember_id to role analyst_he78777;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__issuing_crewmember_name to role analyst_he78777;
grant role sensitive_analytics_prd__stg_irops_reaccom to role analyst_he78777;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_he78777;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_he78777;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_he78777;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_he78777;
grant role sensitive_analytics_prd__tickets to role analyst_he78777;
grant role sensitive_analytics_prd__tickets_rt to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__additional_comments to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__issuing_crewmember_id to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__issuing_crewmember_name to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__additional_comments to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__issuing_crewmember_id to role analyst_he78777;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__issuing_crewmember_name to role analyst_he78777;
grant role sensitive_raw_prd__aqd__occurrence_add_ons to role analyst_he78777;
grant role sensitive_raw_prd__aqd__occurrences to role analyst_he78777;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_he78777;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_he78777;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_he78777;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_he78777;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_he78777;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_he78777;
grant role analyst_he78777 to role sysadmin;
grant role analyst_he78777 to user "HE78777@JETBLUE.COM";

-- analyst_hlinares (Henry Linares)
create role if not exists analyst_hlinares;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_hlinares') }}
{% endif %}
grant role analyst to role analyst_hlinares;
grant role TABLEAUONLINECREATOR to role analyst_hlinares;
grant role analyst_hlinares to role sysadmin;
grant role analyst_hlinares to user "HLINARES@JETBLUE.COM";

-- analyst_hrathi (Harish Rathi)
create role if not exists analyst_hrathi;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_hrathi') }}
{% endif %}
grant role analyst to role analyst_hrathi;
grant role tcsdataengineering to role analyst_hrathi;
grant role transformer_qa to role analyst_hrathi;
-- analytics.stg_sharepoint_airport_applications 
grant usage on schema analytics.stg_sharepoint_airport_applications to role analyst_hrathi;
grant select on all views in schema analytics.stg_sharepoint_airport_applications to role analyst_hrathi;
grant select on future views in schema analytics.stg_sharepoint_airport_applications to role analyst_hrathi;
-- analytics_sharepoint_airport_applications
grant role analytics_sharepoint_airport_applications_read to role analyst_hrathi;
-- ANALYTICS_QA ROLES
grant role analytics_qa_flight_schedules_oal_read to role analyst_hrathi;
grant role analytics_qa_stg_flight_schedules_oal_read to role analyst_hrathi;
-- RAW ROLES
grant role raw_flight_rt_read to role analyst_hrathi;
grant role raw_sabre_pnr_rt_read to role analyst_hrathi;
grant role raw_sabre_ticket_rt_read to role analyst_hrathi;
grant role raw_trax_read to role analyst_hrathi;
-- RAW SHAREPOINT_CEX
grant usage on schema raw.sharepoint_cex to role analyst_hrathi;
grant select on all tables in schema raw.sharepoint_cex to role analyst_hrathi;
grant select on future tables in schema raw.sharepoint_cex to role analyst_hrathi;
-- RAW roles
grant role raw_servicenow_read to role analyst_hrathi;
grant usage on schema raw.reference to role analyst_hrathi;
grant usage on schema raw.reference_archive to role analyst_hrathi;
grant usage on schema raw.sharepoint_airport_applications to role analyst_hrathi;
grant select on all tables in schema raw.sharepoint_airport_applications to role analyst_hrathi;
grant select on table raw.reference.aircraft_config_type to role analyst_hrathi;
grant select on table raw.reference_archive.aircraft_config_type to role analyst_hrathi;
grant select on future tables in schema raw.sharepoint_airport_applications to role analyst_hrathi;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_hrathi;
grant role sensitive_analytics_prd__crew__crewmember_profiles to role analyst_hrathi;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_hrathi;
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_hrathi;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_hrathi;
grant role analyst_hrathi to role sysadmin;
grant role analyst_hrathi to user "HRATHI@JETBLUE.COM";

-- analyst_hr72107 (Hemasri Rajendran)
create role if not exists analyst_hr72107;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_hr72107') }}
{% endif %}
grant role analyst to role analyst_hr72107;
grant role itbusinessintelligencecrew to role analyst_hr72107;
grant role tcsbusinessintelligence to role analyst_hr72107;
grant role analyst_svc_tableau_pii to role analyst_hr72107;
--analytics
grant usage on database analytics to role analyst_hr72107;
grant usage on schema analytics.notification_manager to role analyst_hr72107;
grant select on all tables in schema analytics.notification_manager to role analyst_hr72107;
grant select on all views in schema analytics.notification_manager to role analyst_hr72107;
grant select on future tables in schema analytics.notification_manager to role analyst_hr72107;
grant select on future views in schema analytics.notification_manager to role analyst_hr72107;
--sensitive roles
grant role sensitive_analytics_prd__notification_manager__bso_reflight_regid to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__bso_unload_regid to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__cc_reassigned_guardian_to_old to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__close_to_mosaic to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__cobrand_anniversary to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__delivery_channel to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__family_pooling_invite_accepted_inviter to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__itinerary_receipt_email_confirmation to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__messages to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__mosaic_20k_benefit to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__notification_recipient to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__responsys_itinerary_emails to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__responsys_marketing_emails to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__trueblue_activate_password_terms_conditions to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__trueblue_child_registration to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__trueblue_password_reset to role analyst_hr72107;
grant role sensitive_analytics_prd__notification_manager__trueblue_password_reset_confirmation to role analyst_hr72107;
--other roles
grant role analyst_hr72107 to role sysadmin;
grant role analyst_hr72107 to user "HR72107@JETBLUE.COM";

-- analyst_hs73562(Hunaina Sattar)
create role if not exists analyst_hs73562;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_hs73562') }}
{% endif %}
grant role analyst to role analyst_hs73562;
grant role "WPA TEAM" to role analyst_hs73562;
grant role J5PRODKBANALYST to role analyst_hs73562;
grant role TABLEAUONLINECREATOR to role analyst_hs73562;
-- analytics_qa
grant usage on database analytics_qa to role analyst_hs73562;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_hs73562;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_hs73562;
grant select on view analytics_qa.credit_issuing_tool.passenger_request to role analyst_hs73562;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_hs73562;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_hs73562;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_hs73562;
grant usage on schema analytics_qa.intermediary to role analyst_hs73562;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_hs73562;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__passenger_request to role analyst_hs73562;
-- BYOD
grant role byod_cex_analytics_read to role analyst_hs73562;
grant role byod_cex_analytics to role analyst_hs73562;
grant select, insert, update, delete on table byod.cex_analytics.dpax to role analyst_hs73562;
grant select, insert, update, delete on table byod.cex_analytics.digital_pay_2025 to role analyst_hs73562;
-- sensitive
grant role sensitive_analytics_prd__bookings__passengers to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings__passenger_phone_numbers to role analyst_hs73562;
grant role sensitive_analytics_prd__analytics__loyalty_fact to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings to role analyst_hs73562;
grant role sensitive_analytics_prd__check_ins to role analyst_hs73562;
grant role sensitive_analytics_prd__crew to role analyst_hs73562;
grant role sensitive_analytics_prd__tickets to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__crew_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_hs73562;
grant role sensitive_analytics_prd__crew to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_tops_crew to role analyst_hs73562;
grant role sensitive_analytics_prd__tickets_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_hs73562;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_hs73562;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_hs73562;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_hs73562;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_hs73562;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_hs73562;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings__hotel_bookings to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings__remarks to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings__remarks_history to role analyst_hs73562;
grant role sensitive_analytics_prd__check_ins__passengers to role analyst_hs73562;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__deadhead_messages to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__organization_hierarchy_vertical to role analyst_hs73562;
grant role sensitive_analytics_prd__employee_profile_record__header__agent_full_name to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_hs73562;
grant role sensitive_analytics_prd__tickets__documents to role analyst_hs73562;
grant role sensitive_analytics_prd__tickets_rt__ticket_summary to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings__passenger_documents to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings__passenger_emails to role analyst_hs73562;
grant role sensitive_analytics_prd__check_ins_rt__travel_documents to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__travel_documents to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_hs73562;
grant select on all views in schema analytics.stg_sabre_acs_rt to role analyst_hs73562;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings to role analyst_hs73562;
grant role sensitive_analytics_prd__bookings_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__check_ins to role analyst_hs73562;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__deadhead_messages__birth_date to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__deadhead_messages__first_name to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__deadhead_messages__last_name to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__deadhead_messages__legal_first_name to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__deadhead_messages__middle_name to role analyst_hs73562;
grant role sensitive_analytics_prd__crew__performance_stats_queues_crew to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_hs73562;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__tickets to role analyst_hs73562;
grant role sensitive_analytics_prd__tickets_rt to role analyst_hs73562;
grant role analytics_stg_sabre_acs_rt_read to role analyst_hs73562;
grant role analytics_stg_sabre_pnr_rt_read to role analyst_hs73562;
grant role analytics_stg_sabre_ticket_rt_read to role analyst_hs73562;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__crew to role analyst_hs73562;
grant role sensitive_analytics_prd__crew_rt to role analyst_hs73562;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_hs73562;
grant role analytics_stg_sabre_crewtrac_read to role analyst_hs73562;
grant role analyst_hs73562 to role sysadmin;
grant role analyst_hs73562 to user "HS73562@JETBLUE.COM";

-- analyst_ic46822 (Irene Columna)
create role if not exists analyst_ic46822;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ic46822') }}
{% endif %}
grant role analyst to role analyst_ic46822;
grant role "JET PATHWAY ASSOCIATES" to role analyst_ic46822;
grant role cnstdistro to role analyst_ic46822;
grant role cnstechnicalprograms to role analyst_ic46822;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__cass__request_log to role analyst_ic46822;
grant role analyst_ic46822 to role sysadmin;
grant role analyst_ic46822 to user "IC46822@JETBLUE.COM";

-- analyst_ih42121 (Isabella Horstmann)
create role if not exists analyst_ih42121;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ih42121') }}
{% endif %}
grant role analyst to role analyst_ih42121;
grant role SUSTAINABILITYESG_TEAM to role analyst_ih42121;
grant role byod_sales_read to role analyst_ih42121;
grant role analyst_ih42121 to role sysadmin;
grant role analyst_ih42121 to user "IH42121@JETBLUE.COM";

-- analyst_ah22540 (Aniqa Hatem)
create role if not exists analyst_ah22540;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ah22540') }}
{% endif %}
grant role analyst to role analyst_ah22540;
grant role "PEOPLE DATA INSIGHTS" to role analyst_ah22540;
grant role sensitive_analytics_dev__sap_s4_hana to role analyst_ah22540;
grant role analyst_ah22540 to role sysadmin;
grant role analyst_ah22540 to user "AH22540@JETBLUE.COM";

-- analyst_ig97038 (Isabela Guedes De Sousa)
create role if not exists analyst_ig97038;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ig97038') }}
{% endif %}
grant role analyst to role analyst_ig97038;
grant role "BLUE MARKETING ALL" to role analyst_ig97038;
-- byod.bluemktanalytics
grant role byod_bluemktanalytics_read to role analyst_ig97038;
grant role analyst_ig97038 to role sysadmin;
grant role analyst_ig97038 to user "IG97038@JETBLUE.COM";

-- analyst_ip43007 (padua ismael)
create role if not exists analyst_ip43007;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ip43007') }}
{% endif %}
grant role analyst to role analyst_ip43007;
grant role airportprogramssupport to role analyst_ip43007;
grant role sensitive_analytics_prd__employee_profile_record__header__agent_full_name to role analyst_ip43007; 
grant role analyst_ip43007 to role sysadmin;
grant role analyst_ip43007 to user "IP43007@JETBLUE.COM";

--analyst_is92251 (Isabel Chery)
create role if not exists analyst_is92251; 
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_is92251') }}
{% endif %}
grant role analyst to role analyst_is92251;
grant role "TECHNOLOGY FINANCE AND PORTFOLIO MANAGEMENT" to role analyst_is92251;
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_is92251;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_is92251;
grant usage on schema analytics.stg_servicenow to role analyst_is92251;
grant select on view analytics.stg_servicenow.business_partners_onboard_tsa to role analyst_is92251;
grant usage on database raw to role analyst_is92251;
grant usage on schema raw.servicenow to role analyst_is92251;
grant select on table raw.servicenow.u_bp_onboarding_tsa to role analyst_is92251;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_is92251;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_is92251;
grant role sensitive_analytics_prd__crew__crewmember_profiles to role analyst_is92251;
grant role sensitive_analytics_prd__comply365__crewmember to role analyst_is92251;
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_is92251;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_is92251;
grant role sensitive_analytics_prd__crew__crew_and_business_partners to role analyst_is92251;
grant role analyst_is92251 to role sysadmin;
grant role analyst_is92251 to user "IS92251@JETBLUE.COM";

-- analyst_itsecuritycrew
create role if not exists analyst_itsecuritycrew;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itsecuritycrew') }}
{% endif %}
grant role analyst to role analyst_itsecuritycrew;
grant usage on schema analytics.stg_loyalty_rt to role analyst_itsecuritycrew;
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__antifraud to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__employee_profile_record__header to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__tickets__documents to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__bookings_rt__passenger_travel_document to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_itsecuritycrew;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_travel_document_snowflake to role analyst_itsecuritycrew;
grant role analyst_itsecuritycrew to role sysadmin;
grant role analyst_itsecuritycrew to role "IT SECURITY CREW";

-- analyst_jm10391 (Jaedin Marbury)
create role if not exists analyst_jm10391;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jm10391') }}
{% endif %}
grant role analyst to role analyst_jm10391;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_seats_ancillary_report to role analyst_jm10391;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_incentive_payout_history to role analyst_jm10391;
grant role analyst_jm10391 to role sysadmin;
grant role analyst_jm10391 to user "JM10391@JETBLUE.COM";

-- analyst_jcai (Ji cai)
create role if not exists analyst_jcai;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jcai') }}
{% endif %}
grant role analyst to role analyst_jcai;
grant role jetboardsupport to role analyst_jcai;
-- ANALYTICS_DEV
grant usage on database analytics_dev to role analyst_jcai;
grant role analytics_qa_crew_read to role analyst_jcai;
grant role analyst_jcai to role sysadmin;
grant role analyst_jcai to user "JCAI@JETBLUE.COM";

-- analyst_jchavez (Jennifer Guevara-Chavez)
create role if not exists analyst_jchavez;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jchavez') }}
{% endif %}
grant role analyst to role analyst_jchavez;
grant role "APS-ACTIVE-USERS" to role analyst_jchavez;
grant role RPAREPORTING to role analyst_jchavez;
-- analytics.stg_ifsa_rt
grant usage on schema analytics.stg_ifsa_rt to role analyst_jchavez;
grant select on view analytics.stg_ifsa_rt.vouchers to role analyst_jchavez;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers to role analyst_jchavez; 
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers to role analyst_jchavez; 
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers to role analyst_jchavez;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history to role analyst_jchavez;
grant role analyst_jchavez to role sysadmin;
grant role analyst_jchavez to user "JCHAVEZ@JETBLUE.COM";

-- analyst_jl22864(Jessica Lee)
create role if not exists analyst_jl22864;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jl22864') }}
{% endif %}
grant role analyst to role analyst_jl22864;
grant role "JTPCC ANALYTICS & PLANNING" to role analyst_jl22864;
grant role "VACATIONS ANALYTICS & PLANNING" to role analyst_jl22864;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state to role analyst_jl22864;
-- BYOD
grant role byod_wpa_read to role analyst_jl22864;
grant role analyst_jl22864 to role sysadmin;
grant role analyst_jl22864 to user "JL22864@JETBLUE.COM";

-- analyst_jr92840(Jonathan Ramos)
create role if not exists analyst_jr92840;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jr92840') }}
{% endif %}
grant role analyst to role analyst_jr92840;
grant role QMS to role analyst_jr92840;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__safety to role analyst_jr92840;
grant role sensitive_analytics_prd__stg_aqd  to role analyst_jr92840;
grant role sensitive_raw_prd__aqd  to role analyst_jr92840;
grant role analyst_jr92840 to role sysadmin;
grant role analyst_jr92840 to user "JR92840@JETBLUE.COM";

-- analyst_jh82693 (Julius Hemingway)
create role if not exists analyst_jh82693;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jh82693') }}
{% endif %}
grant role analyst to role analyst_jh82693;
grant usage on schema analytics.bookings to role analyst_jh82693;
grant role sensitive_analytics_prd__bookings__remarks to role analyst_jh82693;
grant role "WPA TEAM" to role analyst_jh82693;
grant role J5PRODKBANALYST to role analyst_jh82693;
grant role TABLEAUONLINECREATOR to role analyst_jh82693;
-- analytics_qa
grant usage on database analytics_qa to role analyst_jh82693;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_jh82693;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_jh82693;
grant select on view analytics_qa.credit_issuing_tool.passenger_request to role analyst_jh82693;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_jh82693;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_jh82693;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_jh82693;
grant usage on schema analytics_qa.intermediary to role analyst_jh82693;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_jh82693;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__passenger_request to role analyst_jh82693;
-- BYOD
grant role byod_cex_analytics_read to role analyst_jh82693;
grant select, insert, update, delete on table byod.cex_analytics.dpax to role analyst_jh82693;
grant select, insert, update, delete on table byod.cex_analytics.digital_pay_2025 to role analyst_jh82693;
-- sensitive
grant role sensitive_analytics_prd__tickets_rt__ticket_summary to role analyst_jh82693;
grant role sensitive_analytics_prd__bookings to role analyst_jh82693;
grant role sensitive_analytics_prd__bookings_rt to role analyst_jh82693;
grant role sensitive_analytics_prd__check_ins to role analyst_jh82693;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_jh82693;
grant role sensitive_analytics_prd__crew__deadhead_messages__birth_date to role analyst_jh82693;
grant role sensitive_analytics_prd__crew__deadhead_messages__first_name to role analyst_jh82693;
grant role sensitive_analytics_prd__crew__deadhead_messages__last_name to role analyst_jh82693;
grant role sensitive_analytics_prd__crew__deadhead_messages__legal_first_name to role analyst_jh82693;
grant role sensitive_analytics_prd__crew__deadhead_messages__middle_name to role analyst_jh82693;
grant role sensitive_analytics_prd__crew__performance_stats_queues_crew to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_jh82693;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark to role analyst_jh82693;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_jh82693;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_jh82693;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_jh82693;
grant role sensitive_analytics_prd__tickets to role analyst_jh82693;
grant role sensitive_analytics_prd__tickets_rt to role analyst_jh82693;
grant role analytics_stg_sabre_acs_rt_read to role analyst_jh82693;
grant role analytics_stg_sabre_pnr_rt_read to role analyst_jh82693;
grant role analytics_stg_sabre_ticket_rt_read to role analyst_jh82693;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_jh82693;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_jh82693;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_jh82693;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_jh82693;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_jh82693;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_jh82693;
-- byod.cex_analytics
grant role byod_cex_analytics to role analyst_jh82693;
grant role byod_cex_analytics_read to role analyst_jh82693;
grant role analyst_jh82693 to role sysadmin;
grant role analyst_jh82693 to user "JH82693@JETBLUE.COM";

-- analyst_jg43839(Justin Gibson-Faber)
create role if not exists analyst_jg43839;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jg43839') }}
{% endif %}
grant role analyst to role analyst_jg43839;
grant role "JTPCC ANALYTICS & PLANNING" to role analyst_jg43839;
grant role TABLEAUONLINECREATOR to role analyst_jg43839;
-- BYOD
grant role byod_wpa_read to role analyst_jg43839;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state to role analyst_jg43839;
grant role analyst_jg43839 to role sysadmin;
grant role analyst_jg43839 to user "JG43839@JETBLUE.COM";

-- analyst_jk21463 (Jacob Kriegler)
create role if not exists analyst_jk21463;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jk21463') }}
{% endif %}
grant role analyst to role analyst_jk21463;
grant role "APS-ACTIVE-USERS" to role analyst_jk21463;
grant role BLUETLB_DR to role analyst_jk21463;
grant role IXCORETEAM to role analyst_jk21463;
--ANALYTICS_QA ROLES
grant role analytics_qa_flight_inventory_read to role analyst_jk21463;
--SENSITIVE ROLES
grant role sensitive_analytics_qa__analytics__ancillaries_fact to role analyst_jk21463;
grant role sensitive_analytics_qa__agent_sales_reports to role analyst_jk21463;
grant role sensitive_analytics_qa__aircraft_turns to role analyst_jk21463;
grant role sensitive_analytics_qa__airports_hospitality to role analyst_jk21463;
grant role sensitive_analytics_qa__airports_security to role analyst_jk21463;
grant role sensitive_analytics_qa__analytics to role analyst_jk21463;
grant role sensitive_analytics_qa__baggage to role analyst_jk21463;
grant role sensitive_analytics_qa__bookings to role analyst_jk21463;
grant role sensitive_analytics_qa__bookings_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__check_ins to role analyst_jk21463;
grant role sensitive_analytics_qa__check_ins_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__cobrand to role analyst_jk21463;
grant role sensitive_analytics_qa__cobrand_audit to role analyst_jk21463;
grant role sensitive_analytics_qa__comply365 to role analyst_jk21463;
grant role sensitive_analytics_qa__crew to role analyst_jk21463;
grant role sensitive_analytics_qa__crew_delta to role analyst_jk21463;
grant role sensitive_analytics_qa__crew_lambda to role analyst_jk21463;
grant role sensitive_analytics_qa__crew_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__customers_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__customer_compensation to role analyst_jk21463;
grant role sensitive_analytics_qa__customer_support to role analyst_jk21463;
grant role sensitive_analytics_qa__data_exports to role analyst_jk21463;
grant role sensitive_analytics_qa__email_marketing to role analyst_jk21463;
grant role sensitive_analytics_qa__employee_profile_record to role analyst_jk21463;
grant role sensitive_analytics_qa__fees to role analyst_jk21463;
grant role sensitive_analytics_qa__flight_plan_manager to role analyst_jk21463;
grant role sensitive_analytics_qa__intermediary to role analyst_jk21463;
grant role sensitive_analytics_qa__irops_reaccom to role analyst_jk21463;
grant role sensitive_analytics_qa__loyalty to role analyst_jk21463;
grant role sensitive_analytics_qa__loyalty_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__missing_baggage to role analyst_jk21463;
grant role sensitive_analytics_qa__notification_manager to role analyst_jk21463;
grant role sensitive_analytics_qa__reference to role analyst_jk21463;
grant role sensitive_analytics_qa__reference_legacy to role analyst_jk21463;
grant role sensitive_analytics_qa__s3c_credit to role analyst_jk21463;
grant role sensitive_analytics_qa__sabre_open_system_payfields to role analyst_jk21463;
grant role sensitive_analytics_qa__sabre_travel_bank to role analyst_jk21463;
grant role sensitive_analytics_qa__safety to role analyst_jk21463;
grant role sensitive_analytics_qa__servicenow to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_accelya_mis to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_airports_hospitality to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_airports_security to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_aqd to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_baggage to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_billing_information to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_bill_of_rights to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_cashstar to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_cass to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_ccure to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_cobrand_audit to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_comarch to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_complimentary_travel_manager to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_comply365 to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_crew to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_crew_services to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_customers_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_customer_compensation to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_customer_support to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_egor to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_flight_plan_manager to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_ifsa_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_irops_reaccom to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_kiosk to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_loyalty to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_loyalty_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_market_regions to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_navblue to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_nettracer to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_notification_manager to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_peoplefluent to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_qualtrics to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_responsys to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_s3c_credit to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_accb to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_acs_batch to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_acs_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_asr_batch to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_crewtrac to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_crewtrac_lambda to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_csa to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_emd_batch to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_epr to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_fee_override to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_open_system_payfields to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_pnr_batch to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_pnr_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_tcn to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_ticket_batch to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_ticket_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_travel_bank to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sabre_vcr_flown to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_sap_reports to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_servicenow to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_success_factors to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_surveys to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_web_analytics to role analyst_jk21463;
grant role sensitive_analytics_qa__stg_wheelchair to role analyst_jk21463;
grant role sensitive_analytics_qa__surveys to role analyst_jk21463;
grant role sensitive_analytics_qa__talent_acquisition to role analyst_jk21463;
grant role sensitive_analytics_qa__tickets to role analyst_jk21463;
grant role sensitive_analytics_qa__tickets_rt to role analyst_jk21463;
grant role sensitive_analytics_qa__ticket_accounting to role analyst_jk21463;
grant role sensitive_analytics_qa__ticket_audits to role analyst_jk21463;
grant role sensitive_analytics_qa__vouchers to role analyst_jk21463;
grant role sensitive_analytics_qa__web_analytics to role analyst_jk21463;
grant role sensitive_analytics_qa__wheelchair to role analyst_jk21463;
grant role analyst_jk21463 to role sysadmin;
grant role analyst_jk21463 to user "JK21463@JETBLUE.COM";

-- analyst_jd60910 (John Dato)
create role if not exists analyst_jd60910;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jd60910') }}
{% endif %}
grant role "JFK MX" to role analyst_jd60910;
grant usage on schema analytics.trax to role analyst_jd60910;
grant select on all tables in schema analytics.trax to role analyst_jd60910;
grant select on all views in schema analytics.trax to role analyst_jd60910;
grant select on future tables in schema analytics.trax to role analyst_jd60910;
grant select on future views in schema analytics.trax to role analyst_jd60910;
grant role analyst_jd60910 to user "JD60910@JETBLUE.COM";

-- analyst_jp57406 (Parker, Juliette)
create role if not exists analyst_jp57406;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jp57406') }}
{% endif %}
grant role analyst to role analyst_jp57406;
grant role "AIRLINE OPTIMIZATION" to role analyst_jp57406;
grant role "APS-ACTIVE-USERS" to role analyst_jp57406;
grant role BLUEDIRECTOR_ONLY to role analyst_jp57406;
grant role RAW_EGOR_READ to role analyst_jp57406;
grant role RAW_SABRE_ACS_RT_READ to role analyst_jp57406;
grant role USR_SYSPLANNINGANALYSISRO to role analyst_jp57406;
grant role analyst_jp57406 to role sysadmin;
grant role analyst_jp57406 to user "JP57406@JETBLUE.COM";

-- analyst_jl85859 (Jeremy Legge)
create role if not exists analyst_jl85859;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jl85859') }}
{% endif %}
grant role analyst to role analyst_jl85859;
grant role bluerm to role analyst_jl85859;
grant role bluermsystems to role analyst_jl85859;
grant role itdatasciencecrew to role analyst_jl85859;
grant role analyst_svc_rmo to role analyst_jl85859;
grant role analyst_jl85859 to role sysadmin;
grant role analyst_jl85859 to user "JL85859@JETBLUE.COM";

-- analyst_js22943
create role if not exists analyst_js22943;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_js22943') }}
{% endif %}
grant role analyst to role analyst_js22943;
grant role "WPA AA" to role analyst_js22943;
grant role "WPA LEADERSHIP" to role analyst_js22943;
grant role "WPA TEAM" to role analyst_js22943;
grant role J5PRODKBANALYST to role analyst_js22943;
-- PII analytics.call_management.aspect_wfm_employees
grant role sensitive_analytics_prd__call_management__aspect_wfm_employees to role analyst_js22943;
grant role sensitive_analytics_prd__stg_aspect_workforce_management__employees to role analyst_js22943;
grant role sensitive_analytics_prd__intermediary__inter_star_call_management__aspect_wfm_employees to role analyst_js22943;
-- analytics.stg_aspect_workforce_management
grant usage on schema analytics.stg_aspect_workforce_management to role analyst_js22943;
grant select on view analytics.stg_aspect_workforce_management.employees to role analyst_js22943;
grant role analyst_js22943 to role sysadmin;
grant role analyst_js22943 to user "JS22943@JETBLUE.COM";

-- analyst_js81738 (John Serrano)
create role if not exists analyst_js81738;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_js81738') }}
{% endif %}
grant role analyst to role analyst_js81738;
grant role "BLUE DIGITAL & CUSTOMER PRODUCTS" to role analyst_js81738;
grant role "IT DIGITAL OPERATIONS" to role analyst_js81738;
grant role J5PRODKBANALYST to role analyst_js81738; 
-- analytics.stg_sabre_pnr_rt
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_js81738; 
grant select on view analytics.stg_sabre_pnr_rt.remark to role analyst_js81738;
grant select on view analytics.stg_sabre_pnr_rt.remark_snowflake to role analyst_js81738;
grant select on table analytics.stg_sabre_pnr_rt.remark_aps to role analyst_js81738;
grant usage on schema raw.sabre_pnr_rt to role analyst_js81738; 
grant select on table raw.sabre_pnr_rt.pnr_remark to role analyst_js81738; 
grant select on table raw.sabre_pnr_rt.pnr to role analyst_js81738;
-- pii roles
grant role sensitive_analytics_prd__bookings_rt__remark_history to role analyst_js81738; 
grant role sensitive_analytics_prd__bookings__passenger_emails to role analyst_js81738;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark to role analyst_js81738; 
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_aps to role analyst_js81738; 
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_snowflake to role analyst_js81738;
grant role analyst_js81738 to role sysadmin;
grant role analyst_js81738 to user "JS81738@JETBLUE.COM";

-- analyst_jm04295 (Jyothi Muraleedharan Nair)
create role if not exists analyst_jm04295;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jm04295') }}
{% endif %}
grant role analyst to role analyst_jm04295;
grant role "IT ENTERPRISE QUALITY ASSURANCE" to role analyst_jm04295;
grant role "IT QUALITYCOE" to role analyst_jm04295;
grant role "ITDATAQA-NONPROD" to role analyst_jm04295;
grant role "ITDATAQA-PROD" to role analyst_jm04295;
grant role "ITDATATESTING-SG" to role analyst_jm04295;
grant role "SQLTESTER-SG" to role analyst_jm04295;
grant role itqualityassurancedw to role analyst_jm04295;
grant role itreferencedomain to role analyst_jm04295;
-- analytics.stg_sabre_intelligence_exchange
grant usage on schema analytics.stg_sabre_intelligence_exchange to role analyst_jm04295;
grant select on view analytics.stg_sabre_intelligence_exchange.use_case_booking_monitor to role analyst_jm04295;
-- ANALYTICS_DEV
grant usage on database analytics_dev to role analyst_jm04295;
-- ANALYTICS_DEV.CORPORATE_RECOGNITION
grant usage on schema analytics_dev.corporate_recognition to role analyst_jm04295;
grant select on table analytics_dev.corporate_recognition.benefits to role analyst_jm04295;
-- ANALYTICS_DEV.DATA_EXPORTS
grant usage on schema analytics_dev.data_exports to role analyst_jm04295;
grant select on table analytics_dev.data_exports.corporate_recognition_benefits to role analyst_jm04295;
-- ANALYTICS_DEV.STG_CORPORATE_RECOGNITION
grant usage on schema analytics_dev.stg_corporate_recognition to role analyst_jm04295;
grant select on view analytics_dev.stg_corporate_recognition.benefits to role analyst_jm04295;
-- analytics_qa.safety
grant usage on database analytics_qa to role analyst_jm04295;
grant usage on schema analytics_qa.safety to role analyst_jm04295;
grant select on all tables in schema analytics_qa.safety to role analyst_jm04295;
grant select on future tables in schema analytics_qa.safety to role analyst_jm04295;
grant select on all views in schema analytics_qa.safety to role analyst_jm04295;
grant select on future views in schema analytics_qa.safety to role analyst_jm04295;
grant usage on schema analytics_qa.stg_aqd to role analyst_jm04295;
grant select on all views in schema analytics_qa.stg_aqd to role analyst_jm04295;
grant select on future views in schema analytics_qa.stg_aqd to role analyst_jm04295;
grant usage on schema analytics_qa.stg_vistair to role analyst_jm04295;
grant select on all views in schema analytics_qa.stg_vistair to role analyst_jm04295;
grant select on future views in schema analytics_qa.stg_vistair to role analyst_jm04295;
grant usage on schema raw_qa.aqd to role analyst_jm04295;
grant select on all tables in schema raw_qa.aqd to role analyst_jm04295;
grant usage on schema raw_qa.vistair to role analyst_jm04295;
grant select on all tables in schema raw_qa.vistair to role analyst_jm04295;
-- analytics_qa.data_exports.bluebucks_bcss
grant usage on schema analytics_qa.data_exports to role analyst_jm04295;
grant select on view analytics_qa.data_exports.bluebucks_bcss to role analyst_jm04295;
-- RAW
grant role raw_crewqual_read to role analyst_jm04295;
-- RAW.SALESFORCE_POC
grant usage on schema raw.salesforce_poc to role analyst_jm04295;
grant select on table raw.salesforce_poc.corporate_recognition_c to role analyst_jm04295;
-- RAW.SABRE_INTELLIGENCE_EXCHANGE
grant role raw_sabre_intelligence_exchange_read to role analyst_jm04295;
-- RAW_QA
grant usage on database raw_qa to role analyst_jm04295;
-- RAW_QA.CREWQUAL
grant usage on schema raw_qa.crewqual to role analyst_jm04295;
grant select on table raw_qa.crewqual.med_data to role analyst_jm04295;
grant select on table raw_qa.crewqual.pilot_time to role analyst_jm04295;
-- RAW_QA.SALESFORCE_POC
grant usage on schema raw_qa.salesforce_poc to role analyst_jm04295;
grant select on table raw_qa.salesforce_poc.account to role analyst_jm04295;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__airports_incentives__airports_commission_seats_ancillary_report to role analyst_jm04295;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_incentive_payout_history to role analyst_jm04295;
grant role sensitive_analytics_prd__bluebucks__bluebucks_customer_compliments_payment_history to role analyst_jm04295;
grant role sensitive_analytics_prd__bluebucks__bluebucks_mosaic_greeting_payment_history to role analyst_jm04295;
grant role sensitive_analytics_prd__bluebucks__clean_customer_compliments to role analyst_jm04295;
grant role sensitive_analytics_prd__bluebucks__customer_compliments to role analyst_jm04295;
grant role sensitive_analytics_prd__crew__bluebucks_on_time_performance_history to role analyst_jm04295;
grant role sensitive_analytics_prd__employee_profile_record__header to role analyst_jm04295;
grant role sensitive_analytics_prd__data_exports__airports_commission_incentive_payout to role analyst_jm04295;
grant role sensitive_analytics_prd__data_exports__bluebucks_bcss__concat_value to role analyst_jm04295;
grant role sensitive_analytics_prd__data_exports__bluebucks_on_time_performance_header to role analyst_jm04295;
grant role sensitive_analytics_prd__inflight_bluebucks__reliability_score to role analyst_jm04295;
grant role sensitive_analytics_prd__loyalty__barclays_card_cash_earnings to role analyst_jm04295;
grant role sensitive_analytics_prd__crewqual__med_data to role analyst_jm04295;
grant role sensitive_analytics_prd__crewqual__pilot_employee to role analyst_jm04295;
grant role sensitive_analytics_prd__crewqual__pilot_entry to role analyst_jm04295;
grant role sensitive_analytics_prd__crewqual__pilot_time to role analyst_jm04295;
grant role sensitive_analytics_qa__bluebucks__bluebucks_customer_compliments_payment_history to role analyst_jm04295;
grant role sensitive_analytics_qa__bluebucks__bluebucks_mosaic_greeting_payment_history to role analyst_jm04295;
grant role sensitive_analytics_qa__bluebucks__clean_customer_compliments to role analyst_jm04295;
grant role sensitive_analytics_qa__crew__bluebucks_on_time_performance_history to role analyst_jm04295;
grant role sensitive_analytics_qa__crewqual__med_data to role analyst_jm04295;
grant role sensitive_analytics_qa__crewqual__pilot_time to role analyst_jm04295;
grant role sensitive_analytics_qa__data_exports__bluebucks_bcss__concat_value to role analyst_jm04295;
grant role sensitive_analytics_qa__data_exports__bluebucks_on_time_performance_header to role analyst_jm04295;
grant role sensitive_analytics_qa__inflight_bluebucks__reliability_score to role analyst_jm04295;
grant role sensitive_analytics_qa__loyalty__barclays_card_cash_earnings to role analyst_jm04295;
grant role sensitive_raw_qa__aqd to role analyst_jm04295;
grant role sensitive_analytics_qa__stg_aqd to role analyst_jm04295;
grant role sensitive_analytics_qa__stg_vistair to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__actions to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__findings_acceptance_responses to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__findings to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_do_office to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_environmental_assessments to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_flight_standards to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_international_operations to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_international_system_operations to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_operations_engineer to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_foqa_gatekeeper_contacts to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_generic_investigations to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_airports to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_cnst to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_dispatch_standards to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_dispatch_support to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_fatigue_risk_management to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_flight_standards to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_safety_investigations to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_core to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_crewmember_details to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_cro_reports to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_denied_boarding to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_fuel_chemical_spill to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_medical_injury to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_risk_assessments to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_do_office to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_operations_engineer to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__mitigations to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__risks to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_lost_or_found_items to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_tech_ops_qa_investigation to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_airports to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_tech_operations to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_environmental_assessment to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_international_operations to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_tech_operations to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_voluntary_disclosure_reports to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_person_details to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__audit_plannings to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_flight_operations_risk_assessment to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_inadmissible_customer to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_safety_analysis to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_system_operations_international to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_ground_support_equipment_details to role analyst_jm04295;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_wildlife_strike to role analyst_jm04295;
grant role sensitive_analytics_qa__safety to role analyst_jm04295;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_jm04295;
grant role sensitive_analytics_prd__reference__market_regions to role analyst_jm04295;
grant role sensitive_analytics_prd__analytics__ancillaries_fact to role analyst_jm04295;
grant role sensitive_analytics_prd__customers_rt__customers to role analyst_jm04295;
grant role sensitive_analytics_prd__stg_customers_rt__customers to role analyst_jm04295;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__customers to role analyst_jm04295;
grant role sensitive_analytics_prd__customers_rt__email_addresses to role analyst_jm04295;
grant role sensitive_analytics_prd__stg_customers_rt__email_addresses to role analyst_jm04295;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_jm04295;
grant role sensitive_analytics_prd__customers_rt__phone_numbers to role analyst_jm04295;
grant role sensitive_analytics_prd__stg_customers_rt__phone_numbers to role analyst_jm04295;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_jm04295;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_jm04295;
grant role sensitive_analytics_prd__cobrand__cobrand_customers to role analyst_jm04295;
grant role analyst_jm04295 to role sysadmin;
grant role analyst_jm04295 to user "JM04295@JETBLUE.COM";

-- analyst_jm09405 (Joshua Margul)
create role if not exists analyst_jm09405;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jm09405') }}
{% endif %}
grant role analyst to role analyst_jm09405;
grant role "SUSTAINABILITYESGDIVERSITYINCLUSION" to role analyst_jm09405;
grant role byod_sales_read to role analyst_jm09405;
grant role sensitive_analytics_read to role analyst_jm09405;
grant role sensitive_flight_plan_manager_read to role analyst_jm09405;
grant role analyst_jm09405 to user "JM09405@JETBLUE.COM";

-- analyst_ca79600 (Cindy Alvarado)
create role if not exists analyst_ca79600;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ca79600') }}
{% endif %}
grant role analyst to role analyst_ca79600;
grant usage on database raw to role analyst_ca79600;
grant usage on schema raw.surveys to role analyst_ca79600;
grant select on table raw.surveys.airport_crewmembers_feedback to role analyst_ca79600;
grant role BLUECITYSUPPORTCMX to role analyst_ca79600;
grant role analyst_ca79600 to role sysadmin;
grant role analyst_ca79600 to user "CA79600@JETBLUE.COM";

-- analyst_jr08957 (Jonah Rosen)
create role if not exists analyst_jr08957;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jr08957') }}
{% endif %}
grant role analyst to role analyst_jr08957;
grant role BLUELOYALTY to role analyst_jr08957;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings to role analyst_jr08957;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings to role analyst_jr08957;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings to role analyst_jr08957;
grant usage on schema analytics.stg_ifsa_rt to role analyst_jr08957;
grant select on view analytics.stg_ifsa_rt.mosaic_greetings to role analyst_jr08957;
--BYOD roles
grant role byod_bluerevforecasting_read to role analyst_jr08957;
grant role analyst_jr08957 to role sysadmin;
grant role analyst_jr08957 to user "JR08957@JETBLUE.COM";

-- analyst_js47252 (Johnny R Santana)
create role if not exists analyst_js47252;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_js47252') }}
{% endif %}
grant role analyst to role analyst_js47252;
--analytics roles
grant usage on schema analytics.stg_loyalty_rt to role analyst_js47252;
grant usage on schema analytics.stg_asapp to role analyst_js47252;
grant usage on schema analytics.credit_issuing_tool to role analyst_js47252;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_js47252;
grant select on all tables in schema analytics.stg_asapp to role analyst_js47252;
grant select on all views in schema analytics.stg_asapp to role analyst_js47252;
grant select on future tables in schema analytics.stg_asapp to role analyst_js47252;
grant select on future views in schema analytics.stg_asapp to role analyst_js47252;
grant select on all tables in schema analytics.flight_inventory to role analyst_js47252;
grant select on all views in schema analytics.flight_inventory to role analyst_js47252;
grant select on future tables in schema analytics.flight_inventory to role analyst_js47252;
grant select on future views in schema analytics.flight_inventory to role analyst_js47252;
grant select on view analytics.stg_loyalty_rt.member_transaction to role analyst_js47252;
grant select on view analytics.bookings_rt.vw_passenger_documents to role analyst_js47252;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_js47252;
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_js47252;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_js47252;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_js47252;
-- analytics_clone
grant usage on database analytics_clone to role analyst_js47252;
grant usage on schema analytics_clone.aircraft_maintenance  to role analyst_js47252;
grant select on all tables in schema analytics_clone.aircraft_maintenance to role analyst_js47252 ;
grant select on all views in schema analytics_clone.aircraft_maintenance to role analyst_js47252 ;
grant select on future tables in schema analytics_clone.aircraft_maintenance to role analyst_js47252;
grant select on future views in schema analytics_clone.aircraft_maintenance to role analyst_js47252;
-- analytics_qa
grant select on all tables in schema analytics_qa.flight_inventory to role analyst_js47252;
grant select on all views in schema analytics_qa.flight_inventory to role analyst_js47252;
grant select on future tables in schema analytics_qa.flight_inventory to role analyst_js47252;
grant select on future views in schema analytics_qa.flight_inventory to role analyst_js47252;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_js47252;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_js47252;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_js47252;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_js47252;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_js47252;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_js47252;
-- analytics_qa.intermediary
grant usage on schema analytics_qa.intermediary to role analyst_js47252;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__alternate_names to role analyst_js47252;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__customers to role analyst_js47252;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__email_addresses to role analyst_js47252;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__identifications to role analyst_js47252;
grant select on table analytics_qa.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_js47252;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__phone_numbers to role analyst_js47252;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__postal_addresses to role analyst_js47252;
-- analytics.stg_customers_rt
grant usage on schema analytics.stg_customers_rt to role analyst_js47252;
grant select on all tables in schema analytics.stg_customers_rt to role analyst_js47252;
grant select on future tables in schema analytics.stg_customers_rt to role analyst_js47252;
grant select on all views in schema analytics.stg_customers_rt to role analyst_js47252;
grant select on future views in schema analytics.stg_customers_rt to role analyst_js47252;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_js47252;
grant select on view analytics.stg_sabre_acs_rt.passengers to role analyst_js47252;
--analytics_clone.stg_customers_t
grant usage on database analytics_clone to role analyst_js47252;
grant usage on schema analytics_clone.stg_customers_rt to role analyst_js47252;
grant select on all tables in schema analytics_clone.stg_customers_rt to role analyst_js47252; 
grant select on future tables in schema analytics_clone.stg_customers_rt to role analyst_js47252;
grant select on all views in schema analytics_clone.stg_customers_rt to role analyst_js47252;
grant select on future views in schema analytics_clone.stg_customers_rt to role analyst_js47252;
-- analytics_clone.customers_rt
grant usage on schema analytics_clone.customers_rt to role analyst_js47252;
grant select on all tables in schema analytics_clone.customers_rt to role analyst_js47252;
grant select on future tables in schema analytics_clone.customers_rt to role analyst_js47252;
grant select on all views in schema analytics_clone.customers_rt to role analyst_js47252;
grant select on future views in schema analytics_clone.customers_rt to role analyst_js47252;
-- analytics_clone.intermediary.inter_customers_rt_tables
grant usage on schema analytics_clone.intermediary to role analyst_js47252; 
grant select on table analytics_clone.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_js47252;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__alternate_names to role analyst_js47252;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__customers to role analyst_js47252;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__email_addresses to role analyst_js47252;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__identifications to role analyst_js47252;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__phone_numbers to role analyst_js47252;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__postal_addresses to role analyst_js47252;
-- pii roles customers_rt
grant role sensitive_analytics_prd__informatica_customers_rt to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__alternate_names to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__customers to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__identifications to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__postal_addresses to role analyst_js47252;
-- pii role stg_customers_rt
grant role sensitive_analytics_prd__stg_informatica_customers_rt to role analyst_js47252;
-- sensitive roles
grant role sensitive_analytics_prd__agent_sales_reports to role analyst_js47252;
grant role sensitive_analytics_prd__bookings to role analyst_js47252;
grant role sensitive_analytics_prd__bookings_rt__passenger to role analyst_js47252;
grant role sensitive_analytics_prd__bookings_rt__passenger_travel_document to role analyst_js47252;
grant role sensitive_analytics_prd__check_ins to role analyst_js47252;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_js47252;
grant role sensitive_analytics_prd__check_ins_rt__special_service_requests to role analyst_js47252;
grant role sensitive_analytics_prd__check_ins_rt__travel_documents to role analyst_js47252;
grant role sensitive_analytics_prd__customer_support to role analyst_js47252;
grant role sensitive_analytics_prd__customers_rt__email_addresses to role analyst_js47252;		
grant role sensitive_analytics_prd__customers_rt__email_addresses_history to role analyst_js47252;		
grant role sensitive_analytics_prd__customers_rt__identifications to role analyst_js47252;
grant role sensitive_analytics_prd__customers_rt__identifications_history to role analyst_js47252;
grant role sensitive_analytics_prd__customers_rt__phone_numbers to role analyst_js47252;	
grant role sensitive_analytics_prd__customers_rt__phone_numbers_history to role analyst_js47252;	
grant role sensitive_analytics_prd__fees to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__identifications to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_js47252;  
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_js47252;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles to role analyst_js47252;
grant role sensitive_analytics_prd__loyalty_rt__member_transactions to role analyst_js47252;
grant role sensitive_analytics_prd__reference to role analyst_js47252;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_js47252;
grant role sensitive_analytics_prd__stg_customers_rt__email_addresses to role analyst_js47252;
grant role sensitive_analytics_prd__stg_customers_rt__identifications to role analyst_js47252;
grant role sensitive_analytics_prd__stg_customers_rt__initial_email_addresses to role analyst_js47252;
grant role sensitive_analytics_prd__stg_customers_rt__initial_identifications to role analyst_js47252;
grant role sensitive_analytics_prd__stg_customers_rt__initial_phone_numbers to role analyst_js47252;
grant role sensitive_analytics_prd__stg_customers_rt__phone_numbers to role analyst_js47252;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_js47252;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_js47252;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_js47252;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_snowflake to role analyst_js47252;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__passenger_travel_document_snowflake to role analyst_js47252;
grant role sensitive_analytics_prd__ticket_audits to role analyst_js47252;
grant role sensitive_analytics_prd__tickets to role analyst_js47252;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_js47252;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_js47252;
grant role sensitive_analytics_qa__agent_sales_reports to role analyst_js47252;
grant role sensitive_analytics_qa__bookings to role analyst_js47252;
grant role sensitive_analytics_qa__check_ins to role analyst_js47252;
grant role sensitive_analytics_qa__fees to role analyst_js47252;
grant role sensitive_analytics_qa__sabre_travel_bank to role analyst_js47252;
grant role sensitive_analytics_qa__ticket_audits to role analyst_js47252;
grant role sensitive_analytics_qa__tickets to role analyst_js47252;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_js47252;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_js47252;
-- sensitive
grant role sensitive_customers_rt_read_qa to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__alternate_names to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__customers to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__identifications to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__postal_addresses to role analyst_js47252;
--raw roles
grant usage on database raw to role analyst_js47252;
grant usage on schema raw.loyalty_rt to role analyst_js47252;
grant select on table raw.loyalty_rt.member_transaction to role analyst_js47252;
grant select on table raw.sabre_pnr_rt.pnr to role analyst_js47252;
grant select on table raw.flight_in_trouble.acs_rt_offit to role analyst_js47252;
grant select on table raw.sabre_acs_rt.passenger to role analyst_js47252;
grant usage on schema raw.c3po_audit_logs to role analyst_js47252;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_js47252;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_js47252;
-- raw_qa roles
grant usage on database raw_qa to role analyst_js47252;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_js47252;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_js47252;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_js47252;
-- raw_qa.customers_rt
grant usage on database raw_qa to role analyst_js47252;
grant usage on schema raw_qa.customers_rt to role analyst_js47252;
grant select on all tables in schema raw_qa.customers_rt to role analyst_js47252;
-- raw_qa.informatica_customers_rt
grant usage on database raw_qa to role analyst_js47252;
grant usage on schema raw_qa.informatica_customers_rt to role analyst_js47252;
grant select on all tables in schema raw_qa.informatica_customers_rt to role analyst_js47252;
grant select on future tables in schema raw_qa.informatica_customers_rt to role analyst_js47252;
grant role analytics_qa_informatica_customers_rt_read to role analyst_js47252;
grant role analytics_qa_stg_informatica_customers_rt_read to role analyst_js47252;
grant role sensitive_analytics_qa__informatica_customers_rt to role analyst_js47252;
grant role sensitive_analytics_qa__stg_informatica_customers_rt to role analyst_js47252;
-- raw read roles
grant role raw_asapp_read to role analyst_js47252;
grant role raw_informatica_customers_rt_read to role analyst_js47252;
grant role raw_sabre_acs_rt_read to role analyst_js47252;
grant role raw_reference_read to role analyst_js47252;
grant role raw_trax_read to role analyst_js47252;
grant usage on database analytics_qa to role analyst_js47252;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_js47252;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_js47252;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_js47252;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_js47252;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_js47252; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_js47252;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_js47252;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_js47252;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_js47252;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_js47252;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_js47252;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_js47252;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_js47252;
grant usage on database raw_qa to role analyst_js47252;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_js47252;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_js47252;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_js47252;
grant usage on database raw to role analyst_js47252;
grant usage on schema raw.c3po_audit_logs to role analyst_js47252;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_js47252;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_js47252;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_js47252;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_js47252;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_js47252;
--other roles
grant role analyst_js47252 to role sysadmin;
grant role analyst_js47252 to user "JS47252@JETBLUE.COM";

-- analyst_jt49924 (Justin Thompson)
create role if not exists analyst_jt49924;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jt49924') }}
{% endif %}
grant role analyst to role analyst_jt49924;
grant role "APS-ACTIVE-USERS" to role analyst_jt49924;
grant role BLUEDIRECTOR_ONLY to role analyst_jt49924;
grant role CUSTOMERSURVEYDATA to role analyst_jt49924;
grant role J5PRODKBANALYST to role analyst_jt49924;
grant role "WPA LEADERSHIP" to role analyst_jt49924;
grant role "WPA TEAM" to role analyst_jt49924;
grant role byod_bluerm_read to role analyst_jt49924;
grant role byod_it_data_engineering to role analyst_jt49924;
grant role analyst_jt49924 to role sysadmin;
grant role analyst_jt49924 to user "JT49924@JETBLUE.COM";
--Masflight shared database access
grant imported privileges on database masflight to role analyst_jt49924;

-- analyst_jthacker (Julianna Merrill)
create role if not exists analyst_jthacker;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jthacker') }}
{% endif %}
--analytics
grant select on view analytics.stg_sabre_acs_rt.other_documents to role analyst_jthacker;
grant select on view analytics.stg_sabre_acs_rt.passengers to role analyst_jthacker;
grant select on table analytics.intermediary.inter_acs_rt__acs_passenger_records to role analyst_jthacker;
grant select on table analytics.intermediary.inter_acs_rt__acs_passenger_other_documents to role analyst_jthacker;
--sensitive roles
grant role sensitive_analytics_prd__analytics__beta_ancillaries_fact__customer_full_name to role analyst_jthacker;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__first_name to role analyst_jthacker;
grant role sensitive_analytics_prd__analytics__beta_customers_fact__last_name to role analyst_jthacker;
grant role sensitive_analytics_prd__bookings to role analyst_jthacker;
grant role sensitive_analytics_prd__check_ins to role analyst_jthacker;
grant role sensitive_analytics_prd__bookings_rt to role analyst_jthacker;
grant role sensitive_analytics_prd__bookings_rt__remark to role analyst_jthacker;
grant role sensitive_analytics_prd__check_ins_rt__other_documents to role analyst_jthacker;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_jthacker;
grant role sensitive_analytics_prd__check_ins_rt__passengers_history to role analyst_jthacker;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_jthacker;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__remark_snowflake__remark_text to role analyst_jthacker;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_jthacker;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_jthacker;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_jthacker;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__other_documents to role analyst_jthacker;
grant role sensitive_analytics_prd__tickets to role analyst_jthacker;
grant role sensitive_analytics_prd__tickets_rt to role analyst_jthacker;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger__first_name to role analyst_jthacker;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger__last_name to role analyst_jthacker;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger__first_name to role analyst_jthacker;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger__last_name to role analyst_jthacker;
grant role sensitive_analytics_qa__check_ins__passenger_histories to role analyst_jthacker;
--raw roles
grant select on table raw.sabre_acs_rt.passenger to role analyst_jthacker;
grant select on table raw.sabre_pnr_rt.pnr_remark to role analyst_jthacker;
grant select on table raw.sabre_pnr_rt.pnr to role analyst_jthacker;
--other roles
grant role analyst to role analyst_jthacker;
grant role "AIRPORT TECH SUPPORT" to role analyst_jthacker;
grant role "AIRPORT TECHNOLOGY" to role analyst_jthacker;
grant role "ITCEXCMSYSTEMS_SG" to role analyst_jthacker;
grant role analyst_jthacker to role sysadmin;
grant role analyst_jthacker to user "JTHACKER@JETBLUE.COM";

-- analyst_ka89421 (keith anderson)
create role if not exists analyst_ka89421;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ka89421') }}
{% endif %}
grant role "IT SECURITY CREW" to role analyst_ka89421;
grant role bluevp_only to role analyst_ka89421;
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list__first_name to role analyst_ka89421;
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list__last_name to role analyst_ka89421;
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list__passport to role analyst_ka89421;
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list__email to role analyst_ka89421;
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list__date_of_birth to role analyst_ka89421;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list__first_name to role analyst_ka89421;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list__last_name to role analyst_ka89421;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list__date_of_birth to role analyst_ka89421;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list__email to role analyst_ka89421;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list__passport to role analyst_ka89421;
grant role analyst_ka89421 to role sysadmin;
grant role analyst_ka89421 to user "KA89421@JETBLUE.COM";

-- analyst_ka03340 (Karam Ahluwalia)
create role if not exists analyst_ka03340;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ka03340') }}
{% endif %}
grant role analyst to role analyst_ka03340;
grant role blueemailmktdev to role analyst_ka03340;
grant role bluepersonalization to role analyst_ka03340;
grant role sensitive_analytics_prd__email_marketing to role analyst_ka03340;
grant role sensitive_analytics_prd__bookings__passenger_documents to role analyst_ka03340;
grant role sensitive_analytics_prd__bookings__passenger_emails to role analyst_ka03340;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_ka03340;
grant role analyst_ka03340 to role sysadmin;
grant role analyst_ka03340 to user "KA03340@JETBLUE.COM";

-- analyst_kc46970
create role if not exists analyst_kc46970;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kc46970') }}
{% endif %}
grant role analyst to role analyst_kc46970;
grant role "SAP-BI" to role analyst_kc46970;
grant role sensitive_analytics_prd__sap_reports__fieldglass_business_partner to role analyst_kc46970;
grant role analyst_kc46970 to role sysadmin;
grant role analyst_kc46970 to user "KC46970@JETBLUE.COM";

-- analyst_kc99774 (carpenter, kimberly)
create role if not exists analyst_kc99774;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kc99774') }}
{% endif %}
grant role analyst to role analyst_kc99774;
grant role blueloyalty to role analyst_kc99774;
grant role cobrandloyaltyteam to role analyst_kc99774;
grant role csspworkingteam to role analyst_kc99774;
grant role sensitive_analytics_prd__cobrand_audit__manual_remediation_details to role analyst_kc99774;
grant role sensitive_analytics_prd__cobrand_audit__customer_audit_details to role analyst_kc99774;
grant role sensitive_analytics_prd__cobrand__cobrand_customers to role analyst_kc99774;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles to role analyst_kc99774;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_kc99774;
grant usage on schema analytics.stg_loyalty_rt to role analyst_kc99774; 
grant select on view analytics.stg_loyalty_rt.member_profile to role analyst_kc99774;
grant select on view analytics.stg_loyalty_rt.cobrand_card to role analyst_kc99774;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_kc99774;
grant role analyst_kc99774 to role sysadmin;
grant role analyst_kc99774 to user "KC99774@JETBLUE.COM";

-- analyst_kchandarana (Kruti Chandarana)
create role if not exists analyst_kchandarana;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kchandarana') }}
{% endif %}
grant role analyst to role analyst_kchandarana;
grant role "IT COBRAND & EMAIL" to role analyst_kchandarana;
grant role "LOUNGES.TECH" to role analyst_kchandarana;
grant role loyaltytechnology to role analyst_kchandarana;
-- BYOD.BLUELOYALTY
grant role byod_blueloyalty_read to role analyst_jday;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_jday;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_jday;
grant role sensitive_analytics_prd__loyalty to role analyst_jday;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_jday;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_jday;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_jday;
grant role analyst_kchandarana to role sysadmin;
grant role analyst_kchandarana to user "KCHANDARANA@JETBLUE.COM";

-- analyst_kl93556(Kevric Lewis)
create role if not exists analyst_kl93556;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kl93556') }}
{% endif %}
grant role analyst to role analyst_kl93556;
grant role "IT CEX CREWMEMBER PRODUCTS" to role analyst_kl93556;
grant role "IT PROGRAMS TEAM" to role analyst_kl93556;
grant role ITCEXCMSYSTEMS_SG to role analyst_kl93556;
-- analytics.stg
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_kl93556;
grant select on view analytics.stg_sabre_acs_rt.passengers to role analyst_kl93556;
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_kl93556;
grant select on view analytics.stg_sabre_pnr_rt.email_snowflake to role analyst_kl93556;
-- sensitive roles
grant role sensitive_analytics_prd__check_ins_rt__passengers__passenger_first_name to role analyst_kl93556;
grant role sensitive_analytics_prd__check_ins_rt__passengers__passenger_last_name to role analyst_kl93556;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_kl93556;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_kl93556;
grant role sensitive_analytics_prd__bookings_rt__email__pnr_email_address to role analyst_kl93556;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_kl93556;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__email_snowflake to role analyst_kl93556;
grant role analyst_kl93556 to role sysadmin;
grant role analyst_kl93556 to user "KL93556@JETBLUE.COM";

-- analyst_kp98597 (Kimberley Pence)
create role if not exists analyst_kp98597;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kp98597') }}
{% endif %}
grant role analyst to role analyst_kp98597;
-- byod roles
grant role byod_cex_analytics_read to role analyst_kp98597;
--other roles
grant role "CEX ANALYTICS" to role analyst_kp98597;
grant role "IT SABRE CSS BAU SUPPORT" to role analyst_kp98597;
grant role ITCEXCMSYSTEMS_SG to role analyst_kp98597;
grant usage on database analytics_qa to role analyst_kp98597;
grant usage on schema analytics_qa.customers_rt to role analyst_kp98597;
grant select on view analytics_qa.customers_rt.jetblue_accounts to role analyst_kp98597;
grant select on view analytics_qa.customers_rt.jetblue_accounts_history to role analyst_kp98597;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_kp98597;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_kp98597;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_kp98597;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_kp98597;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__passenger_request to role analyst_kp98597;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_kp98597;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_kp98597;
grant select on view analytics_qa.credit_issuing_tool.passenger_request to role analyst_kp98597;
-- analyst_kp98597
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_kp98597;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_kp98597;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_kp98597;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_kp98597;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_kp98597; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_kp98597;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_kp98597;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_kp98597;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_kp98597;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_kp98597;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_kp98597;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_kp98597;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_kp98597;
grant usage on database raw_qa to role analyst_kp98597;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_kp98597;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_kp98597;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_kp98597;
grant usage on database raw to role analyst_kp98597;
grant usage on schema raw.c3po_audit_logs to role analyst_kp98597;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_kp98597;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_kp98597;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_kp98597;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_kp98597;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_kp98597;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_kp98597;
-- analytics roles
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_kp98597;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_kp98597;
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_kp98597;
-- sensitive roles
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_kp98597;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_kp98597;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_kp98597;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles to role analyst_kp98597;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_kp98597;
grant role sensitive_analytics_prd__customers_rt__jetblue_accounts to role analyst_kp98597;
grant role sensitive_analytics_prd__stg_customers_rt__jetblue_accounts to role analyst_kp98597;
grant role sensitive_analytics_prd__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_kp98597;
grant role sensitive_analytics_prd__customers_rt__jetblue_accounts_history to role analyst_kp98597;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts to role analyst_kp98597;
grant role sensitive_analytics_qa__stg_customers_rt__jetblue_accounts to role analyst_kp98597;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_kp98597;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts_history to role analyst_kp98597;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_kp98597;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_kp98597;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_kp98597;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_kp98597;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_kp98597;
grant role analyst_kp98597 to role sysadmin;
grant role analyst_kp98597 to user "KP98597@JETBLUE.COM";

-- analyst_kc19803 (Kudzai Chimunda)
create role if not exists analyst_kc19803;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kc19803') }}
{% endif %}
grant role analyst to role analyst_kc19803;
grant role itbusinessintelligencecrew to role analyst_kc19803;
grant select on view byod.crew_analytics.vw_premiumdashboard_daily to role analyst_kc19803;
grant select on table analytics.crew_pay.crewpay_rates to role analyst_kc19803;
grant select on view byod.crew_analytics.vw_premiumpay_daily to role analyst_kc19803;
grant select on view byod.crew_analytics.vw_blockhrs to role analyst_kc19803;
grant select on view byod.crew_analytics.vw_bsq to role analyst_kc19803;
grant usage on schema analytics.aircraft_turns to role analyst_kc19803;
grant select on table analytics.aircraft_turns.egor_crew_checkins to role analyst_kc19803;
------analytics.stg_reference_legacy
grant usage on schema analytics.stg_reference_legacy to role analyst_kc19803;
grant select on view analytics.stg_reference_legacy.dim_locations to role analyst_kc19803;
-------analytics.reference_legacy
grant usage on schema analytics.reference_legacy to role analyst_kc19803;
grant select on table analytics.reference_legacy.origin_destination_pairs to role analyst_kc19803;
--------raw.egor.egor_rt_messages
grant usage on database raw to role analyst_kc19803;
grant usage on schema raw.egor to role analyst_kc19803;
grant select on table raw.egor.egor_rt_messages to role analyst_kc19803;
grant usage on schema raw.reference_legacy to role analyst_kc19803;
grant select on table raw.reference_legacy.dim_locations to role analyst_kc19803;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__crewmember_org_details to role analyst_kc19803;
grant role sensitive_analytics_prd__servicenow__system_users__first_name to role analyst_kc19803;
grant role sensitive_analytics_prd__servicenow__system_users__last_name to role analyst_kc19803;
grant role sensitive_analytics_prd__servicenow__system_users__employee_number to role analyst_kc19803;
grant role sensitive_analytics_prd__servicenow__system_users__name to role analyst_kc19803;
grant role sensitive_analytics_prd__servicenow__system_users__title to role analyst_kc19803;
grant role sensitive_analytics_prd__servicenow__system_users__user_name to role analyst_kc19803;
grant role sensitive_analytics_prd__stg_egor__egor_rt to role analyst_kc19803;
grant role sensitive_analytics_prd__aircraft_turns__gate_operations_reports_history to role analyst_kc19803;
grant role sensitive_analytics_prd__aircraft_turns__gate_operations_reports to role analyst_kc19803;
grant role analyst_kc19803 to role sysadmin;
grant role analyst_kc19803 to user "KC19803@JETBLUE.COM";

-- analyst_khegarty (Karen Hegarty)
create role if not exists analyst_khegarty;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_khegarty') }}
{% endif %}
grant role analyst to role analyst_khegarty;
grant role DISPATCHSNOWFLAKE to role analyst_khegarty;
--analytics_qa
grant usage on database analytics_qa to role analyst_khegarty;
-- analytics_qa.flightkeys
grant usage on schema analytics_qa.flightkeys to role analyst_khegarty;
grant select on all tables in schema analytics_qa.flightkeys to role analyst_khegarty;
grant select on all views in schema analytics_qa.flightkeys to role analyst_khegarty;
grant select on future tables in schema analytics_qa.flightkeys to role analyst_khegarty;
grant select on future views in schema analytics_qa.flightkeys to role analyst_khegarty; 
grant role analytics_qa_read to role analyst_khegarty;
grant role analyst_khegarty to role sysadmin;
grant role analyst_khegarty to user "KHEGARTY@JETBLUE.COM";

--analyst_ks06481(Kanwar Singh)
create role if not exists analyst_ks06481;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ks06481') }}
{% endif %}
grant role analyst to role analyst_ks06481;
grant role "IT ENTERPRISE ARCHITECTURE CM" to role analyst_ks06481;
grant role raw_baggage_read to role analyst_ks06481;
grant role raw_barclays_read to role analyst_ks06481;
grant role raw_comarch_read to role analyst_ks06481;
grant role raw_comarch_dbo_read to role analyst_ks06481;
grant role raw_crew_read to role analyst_ks06481;
grant role raw_customers_rt_read to role analyst_ks06481;
grant role raw_flight_rt_read to role analyst_ks06481;
grant role raw_loyalty_read to role analyst_ks06481;
grant role raw_loyalty_rt_read to role analyst_ks06481;
grant role raw_mparticle_read to role analyst_ks06481;
grant role raw_notification_manager_read to role analyst_ks06481;
grant role raw_sabre_acs_batch_read to role analyst_ks06481;
grant role raw_sabre_acs_rt_read to role analyst_ks06481;
grant role raw_sabre_emd_batch_read to role analyst_ks06481;
grant role raw_sabre_pnr_batch_read to role analyst_ks06481;
grant role raw_sabre_pnr_rt_read to role analyst_ks06481;
grant role raw_sabre_ticket_batch_read to role analyst_ks06481;
grant role raw_sabre_ticket_rt_read to role analyst_ks06481;
grant role raw_travelbank_read to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_ks06481;
grant role sensitive_analytics_prd__loyalty__users to role analyst_ks06481;
grant role sensitive_analytics_prd__notification_manager to role analyst_ks06481;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_ks06481;
grant role sensitive_sabre_pnr_read to role analyst_ks06481;
grant role sensitive_sabre_acs_read to role analyst_ks06481;
grant role sensitive_cobrand_read to role analyst_ks06481;
grant role sensitive_crew_read to role analyst_ks06481;
grant role sensitive_customers_rt_read to role analyst_ks06481;
grant role sensitive_responsys_read to role analyst_ks06481;
grant role sensitive_sabre_ticket_read to role analyst_ks06481;
grant role analyst_ks06481 to user "KS06481@JETBLUE.COM";

-- analyst_ktall (Kate Wiggins)
create role if not exists analyst_ktall;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ktall') }}
{% endif %}
grant role analyst to role analyst_ktall;
grant role "APS-ACTIVE-USERS" to role analyst_ktall;
grant role "BLUE MARKETING ALL" to role analyst_ktall;
grant role customerintel to role analyst_ktall;
grant role customersurveydata  to role analyst_ktall;
--BYOD
grant usage on schema byod.opa to role analyst_ktall;
grant select on table byod.opa.regions to role analyst_ktall;
--ANALYTICS.ANALYTICS
grant select on table analytics.analytics.beta_passengers_fact to role analyst_ktall;
-- ANALYTICS_CLONE
grant usage on database analytics_clone to role analyst_ktall;
-- ANALYTICS_CLONE.DATA_EXPORTS
grant usage on schema analytics_clone.data_exports to role analyst_ktall; 
grant select on all tables in schema analytics_clone.data_exports to role analyst_ktall;
grant select on future tables in schema analytics_clone.data_exports to role analyst_ktall;
grant select on all views in schema analytics_clone.data_exports to role analyst_ktall;
grant select on future views in schema analytics_clone.data_exports to role analyst_ktall;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact__document_birth_date to role analyst_ktall;
grant role analyst_ktall to role sysadmin;
grant role analyst_ktall to user "KTALL@JETBLUE.COM";

-- analyst_kwright (Karen Wright)
create role if not exists analyst_kwright;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kwright') }}
{% endif %}
grant role sensitive_analytics_prd__tickets_rt__ticket_summary__first_name to role analyst_kwright;
grant role sensitive_analytics_prd__tickets_rt__ticket_summary__last_name to role analyst_kwright;
grant role analyst_kwright to role sysadmin;
grant role analyst_kwright to user "KWRIGHT@JETBLUE.COM";

-- analyst_kb68950 (Kevin Berardi)
create role if not exists analyst_kb68950;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kb68950') }}
{% endif %}
grant role analyst to role analyst_kb68950;
grant role j5prodkbanalyst to role analyst_kb68950;
grant role "WPA TEAM" to role analyst_kb68950;
grant role raw_servicenow_read to role analyst_kb68950;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__concentrix__employees to role analyst_kb68950;
grant role sensitive_analytics_prd__stg_concentrix__employees to role analyst_kb68950;
grant role sensitive_analytics_prd__employee_profile_record__header__agent_full_name to role analyst_kb68950;
grant role sensitive_analytics_prd__bookings_rt__passenger_history to role analyst_kb68950;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_kb68950;
grant role sensitive_analytics_prd__bookings__passenger_documents to role analyst_kb68950;
--jetblue_share_dev
grant usage on database jetblue_share_dev to role analyst_kb68950;
grant usage on schema jetblue_share_dev.cci to role analyst_kb68950;
grant select on all views in schema jetblue_share_dev.cci to role analyst_kb68950;
grant select on future views in schema jetblue_share_dev.cci to role analyst_kb68950;
grant role analyst_kb68950 to role sysadmin;
grant role analyst_kb68950 to user "KB68950@JETBLUE.COM";

-- analyst_kd90944 (Donovan, Kevin)
create role if not exists analyst_kd90944;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kd90944') }}
{% endif %}
grant role analyst to role analyst_kd90944;
grant role "AIRLINE OPTIMIZATION" to role analyst_kd90944;
grant role analyst_kd90944 to role sysadmin;
grant role analyst_kd90944 to user "KD90944@JETBLUE.COM";

-- analyst_km53986 (Karuppusamy Murugasamy)
create role if not exists analyst_km53986;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_km53986') }}
{% endif %}
grant role analyst to role analyst_km53986;
grant role "IT PRODUCT ENGINEERING DOMAINS" to role analyst_km53986;
grant role raw_sabre_acs_rt_read to role analyst_km53986;
grant role raw_sabre_pnr_rt_read to role analyst_km53986;
grant role analyst_km53986 to role sysadmin;
grant role analyst_km53986 to user "KM53986@JETBLUE.COM";

-- analyst_itopspsto(ITOpsProductSupportTO)
create role if not exists analyst_itopspsto;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_itopspsto') }}
{% endif %}
grant role analyst to role analyst_itopspsto;
grant role raw_trax_read to role analyst_itopspsto;
grant role analyst_itopspsto to role sysadmin;
grant role analyst_itopspsto to role "IT OPERATIONS PRODUCT SUPPORT TECHOPS";

-- analyst_kk66715 (Kevin Kivlehan)
create role if not exists analyst_kk66715;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kk66715') }}
{% endif %}
grant role analyst to role analyst_kk66715;
grant role "SEC_BLUEWATCH" to role analyst_kk66715;
grant role analyst_rpareporting to role analyst_kk66715;
grant role sensitive_analytics_prd__employee_profile_record to role analyst_kk66715;
grant role analyst_kk66715 to role sysadmin;
grant role analyst_kk66715 to user "KK66715@JETBLUE.COM";

-- analyst_jf73971 (Jason Ford)
create role if not exists analyst_jf73971;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jf73971') }}
{% endif %}
grant role analyst to role analyst_jf73971;
grant role dispatchdeskassignmentadmin to role analyst_jf73971;
grant role dispatchsnowflake to role analyst_jf73971;
grant role jbudisp to role analyst_jf73971;
grant role sensitive_analytics_prd__flightkeys__flight_plan_header to role analyst_jf73971;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header to role analyst_jf73971;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header to role analyst_jf73971;
grant role analyst_jf73971 to role sysadmin;
grant role analyst_jf73971 to user "JF73971@JETBLUE.COM";

-- analyst_kg82548 (Kristin Garcia)
create role if not exists analyst_kg82548;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kg82548') }}
{% endif %}
grant role analyst to role analyst_kg82548;
grant role rpareporting to role analyst_kg82548;
grant role analyst_kg82548 to role sysadmin;
grant role analyst_kg82548 to user "KG82548@JETBLUE.COM";

-- analyst_kr38802 (Kyle Rooney)
create role if not exists analyst_kr38802;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kr38802') }}
{% endif %}
grant role analyst to role analyst_kr38802;
--byod role
grant usage on database byod to role analyst_kr38802;
grant usage on schema byod.finance to role analyst_kr38802;
grant role byod_finance_read to role analyst_kr38802;
--other role
grant role "REVENUE ACCOUNTING" to role analyst_kr38802;
grant role analyst_kr38802 to role sysadmin;
grant role analyst_kr38802 to user "KR38802@JETBLUE.COM";

-- analyst_kramnarine (Kumar Ramnarine)
create role if not exists analyst_kramnarine;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kramnarine') }}
{% endif %}
grant role analyst to role analyst_kramnarine;
grant role "IT OPERATIONS PRODUCT SUPPORT TECHOPS" to role analyst_kramnarine;
grant role TECHSTANDARDS to role analyst_kramnarine;
grant role analytics_trax_read to role analyst_kramnarine;
grant role analytics_aircraft_maintenance_read to role analyst_kramnarine;
grant role raw_trax_read to role analyst_kramnarine;
grant role analyst_kramnarine to role sysadmin;
grant role analyst_kramnarine to user "KRAMNARINE@JETBLUE.COM";

---- analyst_bmazur (Brian Mazur[2])
create role if not exists analyst_bmazur;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bmazur')}}
{% endif %}
grant role analyst to role analyst_bmazur;
grant role sensitive_analytics_prd__email_marketing to role analyst_bmazur;
grant role analyst_bmazur to role sysadmin;
grant role analyst_bmazur to user "BMAZUR@JETBLUE.COM";

-- analyst_ld00912 (Lauren Dragun)
create role if not exists analyst_ld00912;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ld00912') }}
{% endif %}
grant role analyst to role analyst_ld00912;
grant role "BLUE MARKETING ALL" to role analyst_ld00912;
grant role bluemarcomm to role analyst_ld00912;
grant role bluepersonalization to role analyst_ld00912;
grant role sensitive_analytics_prd__email_marketing__clicked_marketing__email_address to role analyst_ld00912;
grant role sensitive_analytics_prd__email_marketing__bounced_marketing__email_address to role analyst_ld00912;
grant role sensitive_analytics_prd__email_marketing__opened_marketing__email_address to role analyst_ld00912;
grant role sensitive_analytics_prd__email_marketing__sent_marketing__email_address to role analyst_ld00912;
grant role analyst_ld00912 to role sysadmin;
grant role analyst_ld00912 to user "LD00912@JETBLUE.COM";

-- analyst_le51297 (Lance Edwards)
create role if not exists analyst_le51297;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_le51297') }}
{% endif %}
grant role analyst to role analyst_le51297;
grant role "DIGB DEVELOPERS" to role analyst_le51297;
grant role analytics_stg_web_logs_rt_read to role analyst_le51297;
grant role raw_web_logs_rt_read to role analyst_le51297;
grant role analyst_le51297 to role sysadmin;
grant role analyst_le51297 to user "LE51297@JETBLUE.COM";
grant usage on database raw_dev to role "DIGB DEVELOPERS";
grant usage on schema raw_dev.web_logs_rt to role "DIGB DEVELOPERS";
grant select on all tables in schema raw_dev.web_logs_rt to role "DIGB DEVELOPERS";

-- analyst_lk32169 (Lauren Rabin) 
create role if not exists analyst_lk32169;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_lk32169') }}
{% endif %}  
grant role analyst to role analyst_lk32169;
grant role "OPS PLANNING" to role analyst_lk32169;
grant role "TRAINING PLANNING" to role analyst_lk32169;
grant role CBACREWDATA to role analyst_lk32169;
grant role CREWANALYTICS to role analyst_lk32169;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers__passenger_first_name to role analyst_lk32169;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers__passenger_last_name to role analyst_lk32169;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records__passenger_first_name to role analyst_lk32169;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records__passenger_last_name to role analyst_lk32169;
grant role sensitive_analytics_prd__check_ins_rt__passengers__passenger_first_name to role analyst_lk32169;
grant role sensitive_analytics_prd__check_ins_rt__passengers__passenger_last_name to role analyst_lk32169;
grant select on table analytics.crew.master_history to role analyst_lk32169;
grant usage on database raw to role analyst_lk32169;
grant usage on schema raw.sabre_acs_rt to role analyst_lk32169;
grant select on table raw.sabre_acs_rt.passenger to role analyst_lk32169;
-- analytics
grant usage on database analytics_clone to role analyst_lk32169;
-- analytics_clone.crew
grant usage on schema analytics_clone.crew to role analyst_lk32169; 
grant select on all tables in schema analytics_clone.crew to role analyst_lk32169;
grant select on all views in schema analytics_clone.crew to role analyst_lk32169;
grant select on future tables in schema analytics_clone.crew to role analyst_lk32169;
grant select on future views  in schema analytics_clone.crew to role analyst_lk32169;
-- analytics_clone.crew_pay
grant usage on schema analytics_clone.crew_pay to role analyst_lk32169; 
grant select on all tables in schema analytics_clone.crew_pay to role analyst_lk32169;
grant select on all views in schema analytics_clone.crew_pay to role analyst_lk32169;
grant select on future tables in schema analytics_clone.crew_pay to role analyst_lk32169;
grant select on future views  in schema analytics_clone.crew_pay to role analyst_lk32169;
-- analytics_clone.stg_sabre_crewtrac
grant usage on schema analytics_clone.stg_sabre_crewtrac to role analyst_lk32169; 
grant select on all tables in schema analytics_clone.stg_sabre_crewtrac to role analyst_lk32169;
grant select on all views in schema analytics_clone.stg_sabre_crewtrac to role analyst_lk32169;
grant select on future tables in schema analytics_clone.stg_sabre_crewtrac to role analyst_lk32169;
grant select on future views  in schema analytics_clone.stg_sabre_crewtrac to role analyst_lk32169;
grant role analyst_lk32169 to role sysadmin;
grant role analyst_lk32169 to user "LK32169@JETBLUE.COM";

-- analyst_lp13738 (Lesley Peterson)
create role if not exists analyst_lp13738;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sb91896') }}
{% endif %}
grant role analyst to role analyst_lp13738;
grant role LOYALTYTECHSUPPORT to role analyst_lp13738;
-- pii roles
grant role sensitive_analytics_prd__loyalty to role analyst_lp13738;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_lp13738;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_lp13738;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_lp13738;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_lp13738;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_lp13738;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_lp13738;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_lp13738;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_lp13738;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_lp13738;
-- analytics.stg_loyalty
grant role analytics_stg_loyalty_read to role lp13738;
-- analytics.stg_loyalty_rt
grant role analytics_stg_loyalty_rt_read to role lp13738;
-- byod.blueloyalty
grant role byod_blueloyalty_read to role lp13738;
grant role analyst_lp13738 to role sysadmin;
grant role analyst_lp13738 to user "LP13738@JETBLUE.COM";

-- analyst_ld00987 (Lev Dynkin)
create role if not exists analyst_ld00987;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ld00987') }}
{% endif %}
grant role analyst to role analyst_ld00987;
--analytics roles
grant usage on schema analytics.stg_accelya_mis to role analyst_ld00987;
grant select on view analytics.stg_accelya_mis.journal_voucher to role analyst_ld00987;
grant role analytics_stg_sabre_travel_bank_read to role analyst_ld00987;
grant role analytics_stg_invoiceworks_read to role analyst_ld00987;
grant role analytics_stg_sabre_acs_rt_read to role analyst_ld00987;
-- byod roles
grant role byod_airport_standards_read to role analyst_ld00987; 
grant role byod_finance_read to role analyst_ld00987;
grant role byod_opa_read to role analyst_ld00987;
grant role byod_wpa_read to role analyst_ld00987;
-- raw roles
grant usage on database raw to role analyst_ld00987;
grant usage on schema raw.accelya_mis to role analyst_ld00987;
grant select on table raw.accelya_mis.journal_voucher to role analyst_ld00987;
grant role raw_sabre_acs_rt_read to role analyst_ld00987;
grant role raw_concur_read to role analyst_ld00987;
grant role raw_invoiceworks_read to role analyst_ld00987;
--sensitive roles
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analyst_ld00987;
grant role sensitive_analytics_prd__analytics to role analyst_ld00987;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_ld00987;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_ld00987;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_ld00987;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_ld00987;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_ld00987;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_ld00987;
-- CCI Share database
grant imported privileges on database cci_share to role analyst_ld00987;
--other roles
grant role "BLUEFP&A" to role analyst_ld00987;
grant role CBACREWDATA to role analyst_ld00987;
grant role analyst_ld00987 to role sysadmin;
grant role analyst_ld00987 to user "LD00987@JETBLUE.COM";

-- analyst_lr92890(Lindsay Renn)
create role if not exists analyst_lr92890;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_lr92890') }}
{% endif %}
grant role analyst to role analyst_lr92890;
grant role "RM EAST" to role analyst_lr92890;
grant role BLUERM to role analyst_lr92890;
grant role analyst_lr92890 to role sysadmin;
grant role analyst_lr92890 to user "LR92890@JETBLUE.COM";

-- analyst_lp68805 (Lisa Potter)
create role if not exists analyst_lp68805;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_lp68805') }}
{% endif %}
grant role analyst to role analyst_lp68805;
grant role LOYALTYTECHSUPPORT to role analyst_lp68805;
grant role ITLOYALTYPARTNERSHIPS to role analyst_lp68805;
-- PII roles
grant role sensitive_analytics_prd__loyalty to role analyst_lp68805;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_lp68805;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_lp68805;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_lp68805;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_lp68805;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_lp68805;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_lp68805;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_lp68805;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_lp68805;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_lp68805;
-- analytics.stg_loyalty
grant role sensitive_analytics_prd__stg_barclays__credit_card_promo_code to role analyst_lp68805;
grant role analytics_stg_loyalty_read to role analyst_LP68805;
-- analytics.stg_loyalty_rt
grant role analytics_stg_loyalty_rt_read to role analyst_LP68805;
grant role analyst_LP68805 to role sysadmin;
grant role analyst_LP68805 to user "LP68805@JETBLUE.COM";
grant role analytics_stg_loyalty_read to role analyst_lp68805;
-- analytics.stg_loyalty_rt
grant role analytics_stg_loyalty_rt_read to role analyst_lp68805;
grant role analyst_lp68805 to role sysadmin;
grant role analyst_lp68805 to user "LP68805@JETBLUE.COM"; 

-- analyst_ls82392 (Louis Signorelli)
create role if not exists analyst_ls82392;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ls82392') }}
{% endif %}
grant role analyst to role analyst_ls82392;
grant role "FINANCIAL SYSTEMS CONTROLLER GROUP" to role analyst_ls82392;
grant role "REVENUE ACCOUNTING" to role analyst_ls82392;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__onboard_experience to role analyst_ls82392;
grant role analyst_ls82392 to role sysadmin;
grant role analyst_ls82392 to user "LS82392@JETBLUE.COM";

-- analyst_mt14218 (Mark Thornton)
create role if not exists analyst_mt14218;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mt14218') }}
{% endif %}
grant role analyst to role analyst_mt14218;
grant role COFSTANDARDS to role analyst_mt14218;
grant role byod_cofstandards to role analyst_mt14218;
grant role byod_jbu_ame to role analyst_mt14218;
grant role analyst_jbu_ame to role analyst_mt14218;
grant role analyst_mt14218 to role sysadmin;
grant role analyst_mt14218 to user "MT14218@JETBLUE.COM";

-- analyst_ma14937 (Mary Arato)
create role if not exists analyst_ma14937;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ma14937') }}
{% endif %}
grant role analyst to role analyst_ma14937;
grant role "IT SERVICE MANAGEMENT" to role analyst_ma14937;
-- RAW.SERVICENOW
grant role raw_servicenow_read to role analyst_ma14937;
grant role analyst_ma14937 to role sysadmin;
grant role analyst_ma14937 to user "MA14937@JETBLUE.COM";

--analyst_mc24261 (Melissa Collado)
create role if not exists analyst_mc24261;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mc24261') }}
{% endif %}
grant role analyst to role analyst_mc24261;
grant role "SOC PROGRAMS TECHNOLOGY & STRATEGY" to role analyst_mc24261;
-- byod.navigation_database
grant usage on schema byod.navigation_database to role analyst_mc24261;
grant select on table byod.navigation_database.mexico_fir_distances_km to role analyst_mc24261;
grant role analyst_mc24261 to role sysadmin;
grant role analyst_mc24261 to user "MC24261@JETBLUE.COM";

-- analyst_mc93765 (Matthew Chaus)
create role if not exists analyst_mc93765;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mc93765') }}
{% endif %}
grant role analyst to role analyst_mc93765;
grant role itdataengineeringcrew to role analyst_mc93765;
grant role itdataproductscrew to role analyst_mc93765;
grant role analytics_stg_surveys_read to role analyst_mc93765;
grant role raw_surveys_read to role analyst_mc93765;
grant role analyst_mc93765 to role sysadmin;
grant role analyst_mc93765 to user "MC93765@JETBLUE.COM";

-- analyst_mknott (Martha Knott)
create role if not exists analyst_mknott;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mknott') }}
{% endif %}
grant role analyst to role analyst_mknott;
grant role "APS-ACTIVE-USERS" to role analyst_mknott;
grant role RPAREPORTING to role analyst_mknott;
grant usage on schema analytics.stg_ifsa_rt to role analyst_mknott;
grant select on view analytics.stg_ifsa_rt.vouchers to role analyst_mknott;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers to role analyst_mknott;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history to role analyst_mknott; 
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers to role analyst_mknott; 
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers to role analyst_mknott;
grant role analyst_mknott to role sysadmin;
grant role analyst_mknott to user "MKNOTT@JETBLUE.COM";

-- analyst_mj60051(Mary Johnson)
create role if not exists analyst_mj60051;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mj60051') }}
{% endif %}
grant role analyst to role analyst_mj60051;
grant role CSPRODUCTS to role analyst_mj60051;
grant role J5PRODKBANALYST to role analyst_mj60051;
grant role TABLEAUONLINECREATOR to role analyst_mj60051;
grant role sensitive_analytics_prd__call_management to role analyst_mj60051;
-- BYOD
grant role byod_wpa to role analyst_mj60051;
grant select, insert, update, delete on table byod.wpa.bluebot_daily_prompts to role analyst_mj60051;
grant select, insert, update, delete on table byod.wpa.bluebot_poc_members to role analyst_mj60051;
grant role analyst_mj60051 to role sysadmin;
grant role analyst_mj60051 to user "MJ60051@JETBLUE.COM";

--analyst_mn64989(Michael Neal)
create role if not exists analyst_mn64989;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mn64989') }}
{% endif %}
grant role analyst to role analyst_mn64989;
grant role TABLEAUONLINECREATOR to role analyst_mn64989;
grant role "WPA TEAM" to role analyst_mn64989;  
-- BYOD ROLES
grant role byod_cex_analytics_read to role analyst_mn64989;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bookings_rt__special_service_request_history__special_service_request_free_text to role analyst_mn64989;
grant role sensitive_analytics_prd__bookings_rt__special_service_request_history__special_service_request_full_text to role analyst_mn64989;
grant role sensitive_analytics_prd__bookings_rt__pnr_ssr_segment to role analyst_mn64989;
grant role sensitive_analytics_prd__bookings_rt__email_history to role analyst_mn64989;
grant role analyst_mn64989 to role sysadmin;
grant role analyst_mn64989 to user "MN64989@JETBLUE.COM";

-- analyst_md31595 (Mohnish Das)
create role if not exists analyst_md31595;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_md31595') }}
{% endif %}
grant role analyst to role analyst_md31595;
grant role "FLIGHT OPS LOGS" to role analyst_md31595;
grant role "FLIGHT OPS TEAM" to role analyst_md31595;
grant role cnstdistro to role analyst_md31595;
grant role cnstechnicalprograms to role analyst_md31595;
grant role cnst_tableau_viewers to role analyst_md31595;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__cass__request_log to role analyst_md31595;
grant role analyst_md31595 to role sysadmin;
grant role analyst_md31595 to user "MD31595@JETBLUE.COM";

-- analyst_md43957 (DeJesus Melanie)
create role if not exists analyst_md43957;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_md43957') }}
{% endif %}
grant role analyst to role analyst_md43957;
grant role analyst_socprogramstechnology_strategy to role analyst_md43957;
--analytics
grant usage on schema analytics.sap_reports to role analyst_md43957;
grant select on table analytics.sap_reports.fieldglass_business_partner to role analyst_md43957;
grant role sensitive_analytics_prd__sap_reports__fieldglass_business_partner to role analyst_md43957;
grant usage on schema analytics.stg_ccure to role analyst_md43957;
grant select on all tables in schema analytics.stg_ccure to role analyst_md43957;
grant select on all views in schema analytics.stg_ccure to role analyst_md43957;
grant select on future tables in schema analytics.stg_ccure to role analyst_md43957;
grant select on future views in schema analytics.stg_ccure to role analyst_md43957;
grant usage on schema analytics.stg_sap_reports to role analyst_md43957;
grant select on all tables in schema analytics.stg_sap_reports to role analyst_md43957;
grant select on all views in schema analytics.stg_sap_reports to role analyst_md43957;
grant select on future tables in schema analytics.stg_sap_reports to role analyst_md43957;
grant select on future views in schema analytics.stg_sap_reports to role analyst_md43957;
--byod
grant usage on database byod to role analyst_md43957;
grant role byod_opa_read to role analyst_md43957;
grant usage on schema byod.flight_schedules to role analyst_md43957;
grant select on table byod.flight_schedules.processed_low_backup to role analyst_md43957;
grant select on view byod.flight_schedules.vw_finalized_schedules to role analyst_md43957;
--Masflight shared database access
grant imported privileges on database masflight to role analyst_md43957;
--sensitive roles
grant role sensitive_analytics_prd__crew to role analyst_md43957;
grant role sensitive_analytics_prd__stg_ccure to role analyst_md43957;
grant role sensitive_analytics_prd__stg_sap_reports to role analyst_md43957;
grant role sensitive_analytics_prd__crew__crew_and_business_partners to role analyst_md43957;
grant role sensitive_analytics_prd__comply365__crewmember to role analyst_md43957;
grant role sensitive_analytics_prd__stg_servicenow__business_partners_onboard_tsa to role analyst_md43957;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_md43957;
--raw
grant role raw_ccure_read to role analyst_md43957;
grant role raw_sap_reports_read to role analyst_md43957;
--other roles
grant role analyst_md43957 to role sysadmin;
grant role analyst_md43957 to user "MD43957@JETBLUE.COM";

-- analyst_MD23055 (Megha Deshmukh Ingole)
create role if not exists analyst_MD23055;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_MD23055') }}
{% endif %}
grant role analyst to role analyst_MD23055;
grant role "IT ENTERPRISE ARCHITECTURE CM" to role analyst_MD23055;
grant role raw_sabre_acs_rt_read to role analyst_MD23055;
grant role raw_flight_rt_read to role analyst_MD23055; 
grant role raw_sabre_pnr_rt_read to role analyst_MD23055; 
grant role raw_sabre_ticket_rt_read to role analyst_MD23055;
grant role sensitive_analytics_prd__bookings_rt to role analyst_MD23055; 
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_MD23055;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_MD23055;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_MD23055; 
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_MD23055;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_MD23055;
grant role sensitive_analytics_prd__cobrand to role analyst_MD23055; 
grant role sensitive_analytics_prd__crew_rt to role analyst_MD23055;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_MD23055;
grant role sensitive_analytics_prd__customers_rt to role analyst_MD23055; 
grant role sensitive_analytics_qa__intermediary__inter_customers_rt__phone_numbers to role analyst_MD23055;
grant role sensitive_analytics_prd__stg_customers_rt__customers to role analyst_MD23055;
grant role sensitive_analytics_prd__email_marketing to role analyst_MD23055; 
grant role sensitive_analytics_prd__flight_plan_manager to role analyst_MD23055;
grant role sensitive_analytics_prd__loyalty to role analyst_MD23055; 
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__corporate to role analyst_MD23055;
grant role sensitive_analytics_prd__stg_loyalty_rt__corporate to role analyst_MD23055;
grant role sensitive_analytics_prd__tickets_rt to role analyst_MD23055; 
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_MD23055;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger_contact_snowflake to role analyst_MD23055;
grant role analyst_MD23055 to role sysadmin;
grant role analyst_MD23055 to user "MD23055@JETBLUE.COM";

-- analyst_md72748 (Manikantha Subrahmanyam Dronamraju)
create role if not exists analyst_md72748;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_md72748') }}
{% endif %}
grant role analyst to role analyst_md72748;
grant role "IT PRODUCT ENGINEERING DOMAINS" to role analyst_md72748;
-- raw roles
grant role raw_salesforce_poc_read to role analyst_md72748;
grant role raw_salesforce_read to role analyst_md72748;
grant role raw_sabre_pnr_rt_read to role analyst_md72748;
-- other roles
grant role analyst_md72748 to role sysadmin;
grant role analyst_md72748 to user "MD72748@JETBLUE.COM";

-- analyst_md31595 (Mohnish Das)
create role if not exists analyst_md31595;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_md31595') }}
{% endif %}
grant role analyst to role analyst_md31595;
grant role "FLIGHT OPS LOGS" to role analyst_md31595;
grant role "FLIGHT OPS TEAM" to role analyst_md31595;
grant role CNSTDISTRO to role analyst_md31595;
grant role CNST_TABLEAU_VIEWERS to role analyst_md31595;
-- byod.navigation_database
grant role byod_navigation_database_read to role analyst_md31595;
-- raw database
grant usage on database raw to role analyst_md31595;
-- raw.flightkeys
grant usage on schema raw.flightkeys to role analyst_md31595;
grant select on table raw.flightkeys.arinc633 to role analyst_md31595; 
grant select on future tables in schema raw.flightkeys to role analyst_md31595;
grant role analyst_md31595 to role sysadmin;
grant role analyst_md31595 to user "MD31595@JETBLUE.COM";

-- analyst_md77316 (Maryanne Dao)
create role if not exists analyst_md77316;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_md77316') }}
{% endif %}
grant role analyst to role analyst_md77316;
grant role "ONBOARD EXPERIENCE" to role analyst_md77316;
grant role bluesourcingteam to role analyst_md77316;
-- RAW
grant usage on database raw to role analyst_md77316;
-- RAW.ONBOARD_EXPERIENCE 
grant usage on schema raw.onboard_experience to role analyst_md77316;
grant select on table raw.onboard_experience.electronic_point_of_sale to role analyst_md77316;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__analytics__crew_fact__legal_first_name to role analyst_md77316;
grant role sensitive_analytics_prd__analytics__crew_fact__last_name to role analyst_md77316;
grant role analyst_md77316 to role sysadmin;
grant role analyst_md77316 to user "MD77316@JETBLUE.COM";

-- analyst_mg12305(Marc Garcia Diaz)
create role if not exists analyst_mg12305;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mg12305') }}
{% endif %}
grant role analyst to role analyst_mg12305;
grant role CNSTDISTRO to role analyst_mg12305;
grant role CNS_NAVDB to role analyst_mg12305;
grant role analyst_mg12305 to role sysadmin;
grant role analyst_mg12305 to user "MG12305@JETBLUE.COM";

-- analyst_mg47041 (Megan Gibson)
create role if not exists analyst_mg47041;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mg47041') }}
{% endif %}
grant role analyst to role analyst_mg47041;
grant usage on schema analytics.loyalty to role analyst_mg47041;
grant usage on schema analytics.cobrand to role analyst_mg47041;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__cobrand__cobrand_customers to role analyst_mg47041;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_mg47041;
grant role sensitive_analytics_prd__loyalty__barclays_loyalty_cobrand_business_accounts to role analyst_mg47041;
grant role sensitive_analytics_prd__loyalty__barclays_loyalty_cobrand_consumer_accounts to role analyst_mg47041;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_mg47041;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_mg47041;
grant role sensitive_analytics_prd__cobrand_audit__manual_remediation_details to role analyst_mg47041;
grant role sensitive_analytics_prd__cobrand_audit__customer_audit_details to role analyst_mg47041;
grant role sensitive_analytics_prd__cobrand__cobrand_customers to role analyst_mg47041;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles to role analyst_mg47041;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_mg47041;
grant usage on schema analytics.stg_loyalty_rt to role analyst_mg47041; 
grant select on view analytics.stg_loyalty_rt.member_profile to role analyst_mg47041;
grant select on view analytics.stg_loyalty_rt.cobrand_card to role analyst_mg47041;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_mg47041;
grant role analyst_mg47041 to role sysadmin;
grant role analyst_mg47041 to user "MG47041@JETBLUE.COM";

-- analyst_mg87575 (Gubenko, Matthew)
create role if not exists analyst_mg87575;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mg87575') }}
{% endif %}
grant role analyst to role analyst_mg87575;
grant role "AIRLINE OPTIMIZATION" to role analyst_mg87575;
grant role analyst_mg87575 to role sysadmin;
grant role analyst_mg87575 to user "MG87575@JETBLUE.COM";

-- analyst_mg79009 (Gedosev, Maja [2])
create role if not exists analyst_mg79009;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mg79009') }}
{% endif %}
grant role analyst to role analyst_mg79009;
grant role BLUETATLSALES to role analyst_mg79009;
-- byod
grant usage on database byod to role analyst_mg79009;
-- byod.bluerevforecasting
grant usage on schema byod.bluerevforecasting to role analyst_mg79009;
grant select on table byod.bluerevforecasting.tatl_data to role analyst_mg79009;
grant role analyst_mg79009 to role sysadmin;
grant role analyst_mg79009 to user "MG79009@JETBLUE.COM";

-- analyst_mg01653 (Malena Gomez)
create role if not exists analyst_mg01653;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mg01653') }}
{% endif %}
grant role analyst to role analyst_mg01653;
grant role "BLUEFP&A" to role analyst_mg01653;
-- byod roles
grant usage on schema byod.bluerevforecasting to role analyst_mg01653;
grant select on table byod.bluerevforecasting.cplf to role analyst_mg01653;
grant role byod_blueloyalty_read to role analyst_mg01653;
-- byod
grant usage on database byod to role analyst_mg01653;
grant usage on schema byod.route_planning to role analyst_mg01653;
grant select on table byod.route_planning.metros to role analyst_mg01653;
-- byod.opa
grant usage on schema byod.opa to role analyst_mg01653;
grant select on table byod.opa.prg_crew_base to role analyst_mg01653;
grant select on table byod.opa.prg_crew_base_v2_beta to role analyst_mg01653;
grant select on table byod.opa.prg_duty to role analyst_mg01653;
grant select on table byod.opa.prg_far117_a to role analyst_mg01653;
grant select on table byod.opa.prg_far117_b to role analyst_mg01653;
grant select on table byod.opa.prg_far117_c to role analyst_mg01653;
grant select on table byod.opa.prg_file to role analyst_mg01653;
grant select on table byod.opa.prg_mcct to role analyst_mg01653;
grant select on table byod.opa.prg_pairing to role analyst_mg01653;
grant select on table byod.opa.prg_pre_clearance to role analyst_mg01653;
grant select on table byod.opa.prg_segment to role analyst_mg01653;
grant select on table byod.opa.prg_special_qualifications to role analyst_mg01653;
grant select on view byod.opa.prg_processed_segment to role analyst_mg01653;
grant select on view byod.opa.vw_prg_published_pairing to role analyst_mg01653;
-- raw.rainmaker
grant usage on database raw to role analyst_mg01653;
grant usage on schema raw.rainmaker to role analyst_mg01653;
grant select on table raw.rainmaker.factactivity to role analyst_mg01653;
grant select on table raw.rainmaker.vEmployee to role analyst_mg01653;
grant select on table raw.rainmaker.vCity to role analyst_mg01653;
grant select on table raw.rainmaker.dimActivityCode to role analyst_mg01653;
grant select on table raw.rainmaker.vDate to role analyst_mg01653;
grant select on table raw.rainmaker.dimFlight to role analyst_mg01653;
grant role analyst_mg01653 to role sysadmin;
grant role analyst_mg01653 to user "MG01653@JETBLUE.COM";

-- analyst_ML86518 (Metodi Lazarov)
create role if not exists analyst_ml86518;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ml86518') }}
{% endif %}
grant role analyst to role analyst_ml86518;
grant role "IT MANAGE YOUR BOOKING" to role analyst_ml86518;
grant role "SPOTFIRE_ INTERNAL_REVFORECAST_USERS" to role analyst_ml86518;
grant usage on database analytics to role analyst_ml86518;
grant usage on schema analytics.bookings to role analyst_ml86518;
grant select on all tables in schema analytics.bookings to role analyst_ml86518;
grant select on all views in schema analytics.bookings to role analyst_ml86518;
grant select on future tables in schema analytics.bookings to role analyst_ml86518;
grant select on future views in schema analytics.bookings to role analyst_ml86518;
grant usage on schema analytics.bookings_rt to role analyst_ml86518;
grant select on all tables in schema analytics.bookings_rt to role analyst_ml86518;
grant select on all views in schema analytics.bookings_rt to role analyst_ml86518;
grant select on future tables in schema analytics.bookings_rt to role analyst_ml86518;
grant select on future views in schema analytics.bookings_rt to role analyst_ml86518;
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_ml86518;
grant select on all tables in schema analytics.stg_sabre_pnr_rt to role analyst_ml86518;
grant select on all views in schema analytics.stg_sabre_pnr_rt to role analyst_ml86518;
grant select on future tables in schema analytics.stg_sabre_pnr_rt to role analyst_ml86518;
grant select on future views in schema analytics.stg_sabre_pnr_rt to role analyst_ml86518;
grant role sensitive_analytics_prd__bookings_rt to role analyst_ml86518;
grant role sensitive_analytics_prd__bookings to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_ml86518;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_ml86518;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_ml86518;
grant role raw_sabre_pnr_rt_read to role analyst_ml86518;
grant role analyst_ml86518 to user "ML86518@JETBLUE.COM";

-- analyst_ml05532(Min Luo)
create role if not exists analyst_ml05532;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ml05532') }}
{% endif %}
grant role analyst to role analyst_ml05532;
grant role ADMITDATASCIENCECREW to role analyst_ml05532;
grant role ITDATASCIENCECREW to role analyst_ml05532;
grant role TABLEAUONLINECREATOR to role analyst_ml05532;
-- sensitive roles
grant role sensitive_analytics_prd__cobrand__spend to role analyst_ml05532;
grant role analyst_ml05532 to role sysadmin;
grant role analyst_ml05532 to user "ML05532@JETBLUE.COM";

-- analyst_ms02358 (Sharifova Mohiniso)
create role if not exists analyst_ms02358;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ms02358') }}
{% endif %}
grant role analyst to role analyst_ms02358;
grant role "ITDATAQA-NONPROD" to role analyst_ms02358;
grant role "ITDATAQA-PROD" to role analyst_ms02358;
-- ANALYTICS.STG_CORPORATE_RECOGNITION
grant usage on schema analytics.stg_corporate_recognition to role analyst_ms02358;
grant select on view analytics.stg_corporate_recognition.benefits to role analyst_ms02358;
-- ANALYTICS_DEV
grant usage on database analytics_dev to role analyst_ms02358;
-- ANALYTICS_DEV.STG_CORPORATE_RECOGNITION
grant usage on schema analytics_dev.stg_corporate_recognition to role analyst_ms02358;
grant select on view analytics_dev.stg_corporate_recognition.benefits to role analyst_ms02358;
-- ANALYTICS_DEV.CORPORATE_RECOGNITION
grant usage on schema analytics_dev.corporate_recognition to role analyst_ms02358;
grant select on table analytics_dev.corporate_recognition.benefits to role analyst_ms02358;
-- ANALYTICS_DEV.DATA_EXPORTS
grant usage on schema analytics_dev.data_exports to role analyst_ms02358;
grant select on table analytics_dev.data_exports.corporate_recognition_benefits to role analyst_ms02358;
-- ANALYTICS_QA
grant usage on database analytics_qa to role analyst_ms02358;
-- ANALYTICS_QA.STG_CORPORATE_RECOGNITION
grant usage on schema analytics_qa.stg_corporate_recognition to role analyst_ms02358;
grant select on view analytics_qa.stg_corporate_recognition.benefits to role analyst_ms02358;
-- ANALYTICS_QA.CORPORATE_RECOGNITION
grant usage on schema analytics_qa.corporate_recognition to role analyst_ms02358;
grant select on table analytics_qa.corporate_recognition.benefits to role analyst_ms02358;
-- ANALYTICS_QA.DATA_EXPORTS
grant usage on schema analytics_qa.data_exports to role analyst_ms02358;
grant select on view analytics_qa.data_exports.corporate_recognition_benefits to role analyst_ms02358;
-- RAW ROLES
grant role raw_salesforce_poc_read to role analyst_ms02358;
grant role raw_crewqual_read to role analyst_ms02358;
-- RAW.PACE
grant usage on schema raw.pace to role analyst_ms02358;
grant select on table raw.pace.post_flight_reports to role analyst_ms02358;
grant usage on schema raw.collins_acms_plus to role analyst_ms02358;
grant select on table raw.collins_acms_plus.turn_management_gate_arrivals to role analyst_ms02358;
-- RAW_DEV
grant usage on database raw_dev to role analyst_ms02358;
-- RAW_QA 
grant usage on database raw_qa to role analyst_ms02358;
-- RAW_QA.CREWQUAL
grant usage on schema raw_qa.crewqual to role analyst_ms02358;
grant select on table raw_qa.crewqual.med_data to role analyst_ms02358;
grant select on table raw_qa.crewqual.pilot_time to role analyst_ms02358;
grant select on table raw_qa.crewqual.pilot_entry to role analyst_ms02358;
grant select on table raw_qa.crewqual.pilot_employee to role analyst_ms02358;
-- RAW_QA.SALESFORCE_POC
grant usage on schema raw_qa.salesforce_poc to role analyst_ms02358;
grant select on table raw_qa.salesforce_poc.corporate_recognition_c to role analyst_ms02358;
--SENSITIVE ROLES
grant role sensitive_analytics_qa__crewqual__med_data to role analyst_ms02358;
grant role sensitive_analytics_qa__crewqual__pilot_time to role analyst_ms02358;
grant role sensitive_analytics_qa__crewqual__pilot_employee to role analyst_ms02358;
grant role sensitive_analytics_qa__crewqual__pilot_entry to role analyst_ms02358;
grant role sensitive_analytics_prd__crewqual__med_data to role analyst_ms02358;
grant role sensitive_analytics_prd__crewqual__pilot_employee to role analyst_ms02358;
grant role sensitive_analytics_prd__crewqual__pilot_entry to role analyst_ms02358;
grant role sensitive_analytics_prd__crewqual__pilot_time to role analyst_ms02358;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_ms02358;
grant role sensitive_analytics_prd__reference__market_regions to role analyst_ms02358;
grant role sensitive_analytics_prd__analytics__ancillaries_fact to role analyst_ms02358;
grant role sensitive_analytics_prd__customers_rt__customers to role analyst_ms02358;
grant role sensitive_analytics_prd__stg_customers_rt__customers to role analyst_ms02358;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__customers to role analyst_ms02358;
grant role sensitive_analytics_prd__customers_rt__email_addresses to role analyst_ms02358;
grant role sensitive_analytics_prd__stg_customers_rt__email_addresses to role analyst_ms02358;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_ms02358;
grant role sensitive_analytics_prd__customers_rt__phone_numbers to role analyst_ms02358;
grant role sensitive_analytics_prd__stg_customers_rt__phone_numbers to role analyst_ms02358;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_ms02358;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_ms02358;
grant role sensitive_analytics_prd__cobrand__cobrand_customers to role analyst_ms02358;
grant role analyst_ms02358 to role sysadmin;
grant role analyst_ms02358 to user "MS02358@JETBLUE.COM";

-- analyst_mt51005 (Megan Tvetenstrand)
create role if not exists analyst_mt51005;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mt51005') }}
{% endif %}
grant role analyst to role analyst_mt51005;
--byod roles
grant role byod_blueloyalty to role analyst_mt51005;
grant role byod_customer_insights to role analyst_mt51005;
grant role byod_fpa to role analyst_mt51005;
--sensitive roles
grant role sensitive_analytics_prd__customers_rt__postal_addresses__postal_address_postal_code to role analyst_mt51005;
grant role sensitive_analytics_prd__customers_rt__postal_addresses__postal_address_postal_code to role analyst_mt51005;
grant role sensitive_analytics_prd__customers_rt__postal_addresses__postal_state_province_name to role analyst_mt51005;
grant role sensitive_analytics_prd__customers_rt__postal_addresses_history__postal_address_postal_code to role analyst_mt51005;
grant role sensitive_analytics_prd__customers_rt__postal_addresses_history__postal_state_province_name to role analyst_mt51005;
grant role sensitive_analytics_prd__cybersource_payments__jetblue_transaction_requests__bill_to_zip to role analyst_mt51005;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__postal_addresses__postal_address_postal_code to role analyst_mt51005;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__postal_addresses__postal_address_postal_code to role analyst_mt51005;
grant role sensitive_analytics_prd__intermediary__inter_customers_rt__postal_addresses__postal_state_province_name to role analyst_mt51005;
grant role sensitive_analytics_prd__notification_manager__responsys_itinerary_emails__pnr_contact_email to role analyst_mt51005;
grant role sensitive_analytics_prd__stg_customers_rt__customer_postal_addresses__postal_address_postal_code to role analyst_mt51005;
grant role sensitive_analytics_prd__stg_customers_rt__customer_postal_addresses__postal_address_postal_code to role analyst_mt51005;
grant role sensitive_analytics_prd__stg_customers_rt__customer_postal_addresses__postal_state_province_name to role analyst_mt51005;
--other roles
grant role itdatasciencecrew to role analyst_mt51005;
grant role analyst_mt51005 to role sysadmin;
grant role analyst_mt51005 to user "MT51005@JETBLUE.COM";

-- analyst_mt33006 (Malak Taha)
create role if not exists analyst_mt33006;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mt33006') }}
{% endif %}
grant role analyst to role analyst_mt33006;
grant role AIRPORTPROGRAMSSUPPORT to role analyst_mt33006;
-- byod
grant usage on database byod to role analyst_mt33006;
grant usage on schema byod.airport_standards to role analyst_mt33006;
grant select on table byod.airport_standards.lift_data to role analyst_mt33006;
grant role analyst_mt33006 to role sysadmin;
grant role analyst_mt33006 to user "MT33006@JETBLUE.COM";

-- analyst_ml74049 (MMoshe Linfield)
create role if not exists analyst_ml74049;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ml74049') }}
{% endif %}
grant role analyst to role analyst_ml74049;
grant role itdataengineeringcrew to role analyst_ml74049;
-- RAW
grant usage on database raw to role analyst_ml74049;
grant usage on schema raw.barclays to role analyst_ml74049;
grant select on table raw.barclays.loyalty_cobrand_business_accounts to role analyst_ml74049;
grant select on table raw.barclays.loyalty_cobrand_consumer_accounts to role analyst_ml74049;
grant usage on schema raw.barclays to role analyst_ml74049;
grant select on table raw.barclays.negative_file to role analyst_ml74049;
grant role raw_comply365_feed to role analyst_ml74049;
--other roles
grant role analyst_ml74049 to role sysadmin;
grant role analyst_ml74049 to user "ML74049@JETBLUE.COM";

-- analyst_ml77891 (Melinda Landgraf)
create role if not exists analyst_ml77891;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ml77891') }}
{% endif %}
grant role analyst to role analyst_ml77891;
grant role "NORTHEAST ALLIANCE (NEA)" to role analyst_ml77891;
grant role byod_sales_read to role analyst_ml77891;
grant role analyst_ml77891 to role sysadmin;
grant role analyst_ml77891 to user "ML77891@JETBLUE.COM";

-- analyst_mr99498 (Melissa Reese)
create role if not exists analyst_mr99498;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mr99498') }}
{% endif %}
grant role analyst to role analyst_mr99498;
grant role "BLUETLB_DR" to role analyst_mr99498;
grant role sensitive_analytics_prd__bookings to role analyst_mr99498;
grant usage on database raw to role analyst_mr99498;
grant usage on schema raw.notification_manager to role analyst_mr99498;
grant select on table raw.notification_manager.notification_manager_events to role analyst_mr99498;
grant role analyst_mr99498 to role sysadmin;
grant role analyst_mr99498 to user "MR99498@JETBLUE.COM";

-- analyst_mg05580 (Matthew Goodfellow)
create role if not exists analyst_mg05580;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mg05580') }}
{% endif %}
grant role analyst to role analyst_mg05580;
grant role SAFETYINSIGHTS to role analyst_mg05580;
grant role TABLEAUONLINECREATOR to role analyst_mg05580;
grant role sensitive_analytics_prd__flight_operations__flight_approaches to role analyst_mg05580;
grant role analyst_mg05580 to role sysadmin;
grant role analyst_mg05580 to user "MG05580@JETBLUE.COM";

-- analyst_mu03179 (Matthew Urbanek)
create role if not exists analyst_mu03179;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mu03179') }}
{% endif %}
grant role analyst to role analyst_mu03179;
grant role "APS-ACTIVE-USERS" to role analyst_mu03179;
grant role "BLUE OPS ENGINEERING" to role analyst_mu03179;
grant role "INDUSTRIAL ENGINEERING TEAM" to role analyst_mu03179;
grant role BLUEDIRECTOR_ONLY to role analyst_mu03179;
grant role OPERATIONSANALYSIS to role analyst_mu03179;
grant role RAW_OAL_FLIGHT_RT_READ to role analyst_mu03179;
grant role RAW_SABRE_ACS_RT_READ to role analyst_mu03179;
grant role RAW_SABRE_FLIGHT_RT_READ to role analyst_mu03179;
grant role RAW_SABRE_PNR_BATCH_READ to role analyst_mu03179;
grant role RAW_SABRE_PNR_RT_READ to role analyst_mu03179;
grant role RAW_SABRE_TICKET_BATCH_READ to role analyst_mu03179;
grant role RAW_SABRE_TKT_RT_READ to role analyst_mu03179;
grant role RAW_TRANSTATS_READ to role analyst_mu03179;
grant role TABLEAUONLINECREATOR to role analyst_mu03179;
grant role USR_SYSPLANNINGANALYSISRO to role analyst_mu03179;
grant role analyst_mu03179 to role sysadmin;
grant role analyst_mu03179 to user "MU03179@JETBLUE.COM";

-- analyst_mu19853 (Mari Ulloa)
create role if not exists analyst_mu19853;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mu19853') }}
{% endif %}
grant role analyst to role analyst_mu19853;
grant role ITDATAENGINEERINGCREW to role analyst_mu19853;
--raw roles
grant usage on database raw to role analyst_mu19853;
-- raw stages
grant usage on all stages in database raw to role analyst_mu19853;
--usage on raw schemas
grant usage on schema raw.accelya_mis to role analyst_mu19853;
grant usage on schema raw.aerodata to role analyst_mu19853;
grant usage on schema raw.airbus to role analyst_mu19853;
grant usage on schema raw.aircom to role analyst_mu19853;
grant usage on schema raw.airports_hospitality to role analyst_mu19853;
grant usage on schema raw.airports_security to role analyst_mu19853;
grant usage on schema raw.airtable_vip_customer_list_appqkqixpyihccqvi to role analyst_mu19853;
grant usage on schema raw.apis to role analyst_mu19853;
grant usage on schema raw.aqd to role analyst_mu19853;
grant usage on schema raw.arc to role analyst_mu19853;
grant usage on schema raw.asapp to role analyst_mu19853;
grant usage on schema raw.astute to role analyst_mu19853;
grant usage on schema raw.atpco to role analyst_mu19853;
grant usage on schema raw.avaya_cms to role analyst_mu19853;
grant usage on schema raw.b6_low to role analyst_mu19853;
grant usage on schema raw.b6_ssim to role analyst_mu19853;
grant usage on schema raw.baggage to role analyst_mu19853;
grant usage on schema raw.barclays to role analyst_mu19853;
grant usage on schema raw.billing_information to role analyst_mu19853;
grant usage on schema raw.bill_of_rights to role analyst_mu19853;
grant usage on schema raw.bp_contracts to role analyst_mu19853;
grant usage on schema raw.bp_mart to role analyst_mu19853;
grant usage on schema raw.cardinal_commerce to role analyst_mu19853;
grant usage on schema raw.carousel to role analyst_mu19853;
grant usage on schema raw.cashstar to role analyst_mu19853;
grant usage on schema raw.cass to role analyst_mu19853;
grant usage on schema raw.ccure to role analyst_mu19853;
grant usage on schema raw.cobrand_audit to role analyst_mu19853;
grant usage on schema raw.cobrand_audit_legacy to role analyst_mu19853;
grant usage on schema raw.collins_aerospace to role analyst_mu19853;
grant usage on schema raw.comarch to role analyst_mu19853;
grant usage on schema raw.comarch_bi_prod_dbo to role analyst_mu19853;
grant usage on schema raw.comarch_bi_prod_rep to role analyst_mu19853;
grant usage on schema raw.comarch_dbo to role analyst_mu19853;
grant usage on schema raw.comarch_xml_audit to role analyst_mu19853;
grant usage on schema raw.complimentary_travel_manager to role analyst_mu19853;
grant usage on schema raw.comply365 to role analyst_mu19853;
grant usage on schema raw.concur to role analyst_mu19853;
grant usage on schema raw.contact_analyzer to role analyst_mu19853;
grant usage on schema raw.credit_card_sales to role analyst_mu19853;
grant usage on schema raw.crew to role analyst_mu19853;
grant usage on schema raw.crew_services to role analyst_mu19853;
grant usage on schema raw.customers_rt to role analyst_mu19853;
grant usage on schema raw.customer_compensation to role analyst_mu19853;
grant usage on schema raw.customer_support to role analyst_mu19853;
grant usage on schema raw.cybersource_payments to role analyst_mu19853;
grant usage on schema raw.dbt to role analyst_mu19853;
grant usage on schema raw.egor to role analyst_mu19853;
grant usage on schema raw.egor_aps to role analyst_mu19853;
grant usage on schema raw.egor_legacy to role analyst_mu19853;
grant usage on schema raw.email_alerts to role analyst_mu19853;
grant usage on schema raw.federal_aviation to role analyst_mu19853;
grant usage on schema raw.fivetran_cornball_impresses_staging to role analyst_mu19853;
grant usage on schema raw.flica to role analyst_mu19853;
grant usage on schema raw.flightkeys to role analyst_mu19853;
grant usage on schema raw.flight_goals_bpmart to role analyst_mu19853;
grant usage on schema raw.flight_in_trouble to role analyst_mu19853;
grant usage on schema raw.flight_in_trouble_lookup to role analyst_mu19853;
grant usage on schema raw.flight_link to role analyst_mu19853;
grant usage on schema raw.flight_oal_rt to role analyst_mu19853;
grant usage on schema raw.flight_rt to role analyst_mu19853;
grant usage on schema raw.flight_rt_aps to role analyst_mu19853;
grant usage on schema raw.flight_rt_bpmart to role analyst_mu19853;
grant usage on schema raw.flight_schedules_bpmart to role analyst_mu19853;
grant usage on schema raw.formation to role analyst_mu19853;
grant usage on schema raw.github to role analyst_mu19853;
grant usage on schema raw.ground_service_equipment to role analyst_mu19853;
grant usage on schema raw.ifsa_rt to role analyst_mu19853;
grant usage on schema raw.infare to role analyst_mu19853;
grant usage on schema raw.inflight_entertainment to role analyst_mu19853;
grant usage on schema raw.inflight_survey to role analyst_mu19853;
grant usage on schema raw.interactions_rt to role analyst_mu19853;
grant usage on schema raw.irops_reaccom to role analyst_mu19853;
grant usage on schema raw.itdatascience to role analyst_mu19853;
grant usage on schema raw.jbu to role analyst_mu19853;
grant usage on schema raw.jira to role analyst_mu19853;
grant usage on schema raw.kiosk to role analyst_mu19853;
grant usage on schema raw.lift to role analyst_mu19853;
grant usage on schema raw.loyalty to role analyst_mu19853;
grant usage on schema raw.loyalty_rt to role analyst_mu19853;
grant usage on schema raw.market_regions to role analyst_mu19853;
grant usage on schema raw.message_recon to role analyst_mu19853;
grant usage on schema raw.metar to role analyst_mu19853;
grant usage on schema raw.mparticle to role analyst_mu19853;
grant usage on schema raw.nas_freshness_detection to role analyst_mu19853;
grant usage on schema raw.navblue to role analyst_mu19853;
grant usage on schema raw.navigation to role analyst_mu19853;
grant usage on schema raw.nettracer to role analyst_mu19853;
grant usage on schema raw.notam to role analyst_mu19853;
grant usage on schema raw.notification_manager to role analyst_mu19853;
grant usage on schema raw.okta to role analyst_mu19853;
grant usage on schema raw.omniture to role analyst_mu19853;
grant usage on schema raw.onboard_experience to role analyst_mu19853;
grant usage on schema raw.on_time_performance to role analyst_mu19853;
grant usage on schema raw.open_weather_map to role analyst_mu19853;
grant usage on schema raw.other_airlines to role analyst_mu19853;
grant usage on schema raw.peoplefluent to role analyst_mu19853;
grant usage on schema raw.peoplefluent_google_analytics to role analyst_mu19853;
grant usage on schema raw.planitas to role analyst_mu19853;
grant usage on schema raw.pricing_3victors to role analyst_mu19853;
grant usage on schema raw.private to role analyst_mu19853;
grant usage on schema raw.qualtrics to role analyst_mu19853;
grant usage on schema raw.query_audit to role analyst_mu19853;
grant usage on schema raw.rainmaker to role analyst_mu19853;
grant usage on schema raw.reconciliation_rt to role analyst_mu19853;
grant usage on schema raw.reference to role analyst_mu19853;
grant usage on schema raw.reference_legacy to role analyst_mu19853;
grant usage on schema raw.responsys to role analyst_mu19853;
grant usage on schema raw.s3c_credit to role analyst_mu19853;
grant usage on schema raw.s3c_credit_aps to role analyst_mu19853;
grant usage on schema raw.sabre_accb to role analyst_mu19853;
grant usage on schema raw.sabre_acs_batch to role analyst_mu19853;
grant usage on schema raw.sabre_acs_rt to role analyst_mu19853;
grant usage on schema raw.sabre_asr_batch to role analyst_mu19853;
grant usage on schema raw.sabre_csa to role analyst_mu19853;
grant usage on schema raw.sabre_emd_batch to role analyst_mu19853;
grant usage on schema raw.sabre_epr to role analyst_mu19853;
grant usage on schema raw.sabre_excess_baggage to role analyst_mu19853;
grant usage on schema raw.sabre_fee_collect to role analyst_mu19853;
grant usage on schema raw.sabre_fee_override to role analyst_mu19853;
grant usage on schema raw.sabre_flight_plan_manager to role analyst_mu19853;
grant usage on schema raw.sabre_flight_plan_manager_legacy to role analyst_mu19853;
grant usage on schema raw.sabre_flight_rt to role analyst_mu19853;
grant usage on schema raw.sabre_ind to role analyst_mu19853;
grant usage on schema raw.sabre_open_system_payfields to role analyst_mu19853;
grant usage on schema raw.sabre_pnr_batch to role analyst_mu19853;
grant usage on schema raw.sabre_pnr_rt to role analyst_mu19853;
grant usage on schema raw.sabre_pnr_rt_aps to role analyst_mu19853;
grant usage on schema raw.sabre_queue to role analyst_mu19853;
grant usage on schema raw.sabre_revenue_integrity to role analyst_mu19853;
grant usage on schema raw.sabre_revenue_optimizer to role analyst_mu19853;
grant usage on schema raw.sabre_ssi to role analyst_mu19853;
grant usage on schema raw.sabre_tcn to role analyst_mu19853;
grant usage on schema raw.sabre_ticket_batch to role analyst_mu19853;
grant usage on schema raw.sabre_ticket_rt to role analyst_mu19853;
grant usage on schema raw.sabre_ticket_rt_aps to role analyst_mu19853;
grant usage on schema raw.sabre_travel_bank to role analyst_mu19853;
grant usage on schema raw.sabre_vcr_flown to role analyst_mu19853;
grant usage on schema raw.safety to role analyst_mu19853;
grant usage on schema raw.salesforce to role analyst_mu19853;
grant usage on schema raw.salesforce_poc to role analyst_mu19853;
grant usage on schema raw.sap_bpc to role analyst_mu19853;
grant usage on schema raw.sap_reports to role analyst_mu19853;
grant usage on schema raw.sap_s4_hana to role analyst_mu19853;
grant usage on schema raw.sap_s4_hana_erp to role analyst_mu19853;
grant usage on schema raw.sap_s4_hana_old to role analyst_mu19853;
grant usage on schema raw.servicenow to role analyst_mu19853;
grant usage on schema raw.servicenow_dev to role analyst_mu19853;
grant usage on schema raw.spotfire_log to role analyst_mu19853;
grant usage on schema raw.success_factors to role analyst_mu19853;
grant usage on schema raw.surveys to role analyst_mu19853;
grant usage on schema raw.surveys_test to role analyst_mu19853;
grant usage on schema raw.system_operations to role analyst_mu19853;
grant usage on schema raw.task_audit to role analyst_mu19853;
grant usage on schema raw.tomorrow_io to role analyst_mu19853;
grant usage on schema raw.tomorrow_io_weather to role analyst_mu19853;
grant usage on schema raw.transtats to role analyst_mu19853;
grant usage on schema raw.trax to role analyst_mu19853;
grant usage on schema raw.twitter to role analyst_mu19853;
grant usage on schema raw.vendor_spend to role analyst_mu19853;
grant usage on schema raw.verizon_enterprise_reports to role analyst_mu19853;
grant usage on schema raw.wheelchair to role analyst_mu19853;
grant usage on schema raw.wheelchair_legacy to role analyst_mu19853;
grant role raw__schemas_rt__stages_read to role analyst_mu19853;
--sensitive roles
grant role SENSITIVE_ANALYTICS_PRD__NOTIFICATION_MANAGER__MESSAGES to role analyst_mu19853;
--other roles
grant role analyst_mu19853 to role sysadmin;
grant role analyst_mu19853 to user "MU19853@JETBLUE.COM";

-- analyst_mu40876 (Michael Urban)
create role if not exists analyst_mu40876;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mu40876') }}
{% endif %}
grant role analyst to role analyst_mu40876;
grant role "RM EAST" to role analyst_mu40876;
grant role blueloyalty to role analyst_mu40876;
grant role bluerevforecasting to role analyst_mu40876;
--byod roles
grant role byod_wpa to role analyst_mu40876;
-- raw
grant usage on database raw to role analyst_mu40876;
-- raw.avaya_cms
grant usage on schema raw.avaya_cms to role analyst_mu40876;
grant select on table raw.avaya_cms.dagent to role analyst_mu40876;
-- sensitive
grant role sensitive_analytics_prd__call_management__amazon_connect_contact_trace_records__user_name to role analyst_mu40876;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents__agent_username to role analyst_mu40876;
grant role analyst_mu40876 to role sysadmin;
grant role analyst_mu40876 to user "MU40876@JETBLUE.COM";

-- analyst_mw94662 (Miesha Williams)
create role if not exists analyst_mw94662;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mw94662') }}
{% endif %}
grant role analyst to role analyst_mw94662;
grant role "IT COBRAND & EMAIL" to role analyst_mw94662;
grant role sensitive_analytics_prd__cobrand to role analyst_mw94662;
grant role sensitive_analytics_prd__loyalty to role analyst_mw94662;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_mw94662;
grant role sensitive_analytics_prd__notification_manager to role analyst_mw94662;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_mw94662;
grant role analyst_mw94662 to role sysadmin;
grant role analyst_mw94662 to user "MW94662@JETBLUE.COM";

-- analyst_ms96850 (Max Shapiro)
create role if not exists analyst_ms96850;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ms96850') }}
{% endif %}
grant role analyst to role analyst_ms96850;
grant role "AIRLINE OPTIMIZATION" to role analyst_ms96850;
grant role OPERATIONSANALYSIS to role analyst_ms96850;
grant role OPERATIONSSTRATEGYANDENGINEERING to role analyst_ms96850;
grant role TABLEAUONLINECREATOR to role analyst_ms96850;
grant role USR_SYSPLANNINGANALYSISRO to role analyst_ms96850;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__flightkeys__flight_plan_header__author_name to role analyst_ms96850;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header__author_name to role analyst_ms96850;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header__author_name to role analyst_ms96850;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_ms96850;
grant role analyst_ms96850 to role sysadmin;
grant role analyst_ms96850 to user "MS96850@JETBLUE.COM";

-- analyst_na43805 (Nestor Acha)
create role if not exists analyst_na43805;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_na43805') }}
{% endif %}
grant role analyst to role analyst_na43805;
grant usage on database analytics to role analyst_na43805;
grant usage on all schemas in database analytics to role analyst_na43805;
grant select on all tables in database analytics to role analyst_na43805;
grant select on future tables in database analytics to role analyst_na43805;
grant select on all views in database analytics to role analyst_na43805;
grant select on future views in database analytics to role analyst_na43805;
--analytics_qa roles
grant role analytics_qa_read to role analyst_na43805;
-- raw
grant role raw_qa_read to role analyst_na43805;
grant usage on database raw to role analyst_na43805;
grant usage on all schemas in database raw to role analyst_na43805;
grant select on all tables in database raw to role analyst_na43805;
grant select on future tables in database raw to role analyst_na43805;
grant select on all views in database raw to role analyst_na43805;
grant select on future views in database raw to role analyst_na43805;
--sentitive roles
grant role sensitive_analytics_prd__bookings_rt__remark__remark_text to role analyst_na43805;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark__remark_text to role analyst_na43805;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_snowflake to role analyst_na43805;
grant role sensitive_analytics_prd__bookings_rt__remark_history__remark_text to role analyst_na43805;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__remark to role analyst_na43805;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__remark_aps__remark_text to role analyst_na43805;
grant role sensitive_analytics_prd__flightkeys to role analyst_na43805;
grant role sensitive_analytics_prd__flight_plan_manager to role analyst_na43805;
grant role sensitive_analytics_prd__stg_flight_plan_manager to role analyst_na43805;
grant role sensitive_analytics_prd__intermediary__inter_analytics__flight_plans_flightkeys to role analyst_na43805;
grant role sensitive_analytics_prd__bookings to role analyst_na43805;
grant role sensitive_analytics_prd__bookings_rt to role analyst_na43805;
grant role sensitive_analytics_prd__tickets to role analyst_na43805;
grant role sensitive_analytics_prd__tickets_rt to role analyst_na43805;
grant role sensitive_analytics_prd__check_ins to role analyst_na43805;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_na43805;
grant role sensitive_analytics_prd__reference to role analyst_na43805;
grant role sensitive_analytics_prd__notification_manager to role analyst_na43805;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_na43805;
grant role sensitive_analytics_prd__crew to role analyst_na43805;
grant role sensitive_analytics_prd__stg_crew to role analyst_na43805;
grant role sensitive_analytics_prd__loyalty to role analyst_na43805;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_na43805;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_na43805;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_na43805;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_na43805;
--other roles
grant role analyst_na43805 to role sysadmin;
grant role analyst_na43805 to user "NA43805@JETBLUE.COM";

-- analyst_na44710 (Naomi Ali)
create role if not exists analyst_na44710;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_na44710') }}
{% endif %}
grant role analyst to role analyst_na44710;
grant role DISPATCHSNOWFLAKE to role analyst_na44710;
grant role JBUDISP to role analyst_na44710;
--analytics
grant usage on database analytics to role analyst_na44710;
grant usage on schema analytics.flightkeys to role analyst_na44710;
grant select on all tables in schema analytics.flightkeys to role analyst_na44710;
grant select on all views in schema analytics.flightkeys to role analyst_na44710;
grant select on future tables in schema analytics.flightkeys to role analyst_na44710;
grant select on future views in schema analytics.flightkeys to role analyst_na44710;
-- analytics_qa.flightkeys
grant usage on database analytics_qa to role analyst_na44710;
grant usage on schema analytics_qa.flightkeys to role analyst_na44710;
grant select on all tables in schema analytics_qa.flightkeys to role analyst_na44710;
grant select on all views in schema analytics_qa.flightkeys to role analyst_na44710;
grant select on future tables in schema analytics_qa.flightkeys to role analyst_na44710;
grant select on future views in schema analytics_qa.flightkeys to role analyst_na44710;
--sensitive roles
grant role sensitive_analytics_prd__flightkeys__flight_info__captain_name to role analyst_na44710;
grant role sensitive_analytics_prd__stg_flightkeys__flight_info__captain_name to role analyst_na44710;
grant role sensitive_analytics_qa__flightkeys__flight_info__captain_name to role analyst_na44710;
grant role sensitive_analytics_qa__stg_flightkeys__flight_info__captain_name to role analyst_na44710;
grant role sensitive_analytics_prd__flightkeys__flight_plan_header to role analyst_na44710;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header to role analyst_na44710;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header to role analyst_na44710;
grant role sensitive_analytics_qa__flightkeys__flight_plan_header to role analyst_na44710;
grant role sensitive_analytics_qa__intermediary__inter_flightkeys__flight_plan_header to role analyst_na44710;
grant role sensitive_analytics_qa__stg_flightkeys__flight_plan_header to role analyst_na44710;
--raw roles
grant usage on database raw to role analyst_na44710;
grant usage on schema raw.flightkeys to role analyst_na44710;
grant select on table raw.flightkeys.arinc633 to role analyst_na44710;
--other roles
grant role analyst_na44710 to role sysadmin;
grant role analyst_na44710 to user "NA44710@JETBLUE.COM";

--analyst_NC03158(Ngai Tik Chung)
create role if not exists analyst_nc03158;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nc03158') }}
{% endif %}
grant role "IT SECURITY CREW" to role analyst_nc03158;
grant role TABLEAUONLINECREATOR to role analyst_nc03158;
grant role analytics_antifraud_read to role analyst_nc03158;
-- analytics_clone
grant usage on database analytics_clone to role analyst_nc03158;
grant usage on schema analytics_clone.antifraud to role analyst_nc03158;
grant select on all tables in schema analytics_clone.antifraud to role analyst_nc03158;
grant select on future tables in schema analytics_clone.antifraud to role analyst_nc03158;
grant select on all views in schema analytics_clone.antifraud to role analyst_nc03158;
grant select on future views in schema analytics_clone.antifraud to role analyst_nc03158;
grant role analyst_nc03158 to role sysadmin;
grant role analyst_nc03158 to user "NC03158@JETBLUE.COM";

-- analyst_nl68301(Natanielle Lloyd)
create role if not exists analyst_nl68301;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nl68301') }}
{% endif %}
grant role analyst to role analyst_nl68301;
grant role "RM EAST" to role analyst_nl68301;
grant role BLUERM to role analyst_nl68301;
grant role analyst_nl68301 to role sysadmin;
grant role analyst_nl68301 to user "NL68301@JETBLUE.COM";

--analyst_ntiwari(Neha Tiwari)
create role if not exists analyst_ntiwari;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ntiwari') }}
{% endif %}
grant role analyst to role analyst_ntiwari;
grant usage on database analytics_clone to role analyst_ntiwari;
grant usage on schema analytics_clone.stg_customers_rt to role analyst_ntiwari;
grant select on all views in schema analytics_clone.stg_customers_rt to role analyst_ntiwari;
grant usage on schema analytics_clone.intermediary to role analyst_ntiwari;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__alternate_names to role analyst_ntiwari;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__customers to role analyst_ntiwari;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__email_addresses to role analyst_ntiwari;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__identifications to role analyst_ntiwari;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__phone_numbers to role analyst_ntiwari;
grant select on table analytics_clone.intermediary.inter_informatica_customers_rt__postal_addresses to role analyst_ntiwari;
grant role analytics_customers_rt_read to role analyst_ntiwari;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__customers_rt to role analyst_ntiwari;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__alternate_names to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__customers to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__identifications to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__postal_addresses to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__customer_reference_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__customer_reference to role analyst_ntiwari;
grant role sensitive_analytics_prd__customers_rt to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__email_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__email to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__free_form_address_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__free_form_address to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__groups to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__group_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__lined_address_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__lined_address to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__other_supplementary_information_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__other_supplementary_information to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__passenger_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__passenger_travel_document_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__passenger_travel_document to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__passenger to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__phone_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__phone to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__pnr_ssr_segment to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__pnr_ticket_association to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__remark_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__remark to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__special_service_request_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__special_service_request to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__structured_address_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__structured_address to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__ticket_information_history to role analyst_ntiwari;
grant role sensitive_analytics_prd__bookings_rt__ticket_information to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_irops_reaccom__impacted_pnrs__passenger_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_irops_reaccom__solution_pnrs__passenger_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_issued_amenities__passenger_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference__first_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference__last_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email__pnr_email_address to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email__pnr_email_comment to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group__group_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address__pnr_address_line_1 to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address__pnr_address_line_2 to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address__pnr_address_line_3 to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address__pnr_address_line_4 to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address__pnr_address_line_5 to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information__other_supplementary_information_free_text to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document__date_of_birth to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document__first_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document__last_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document__middle_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document__passenger_travel_document_free_text to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document__travel_document_number to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger__first_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger__last_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger__title to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone__pnr_phone_contact_name_text to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone__pnr_phone_free_text to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone__pnr_phone_number to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark__remark_text to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request__passenger_date_of_birth to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request__special_service_request_free_text to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request__special_service_request_full_text to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address__pnr_address_contact_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address__pnr_address_number_and_street_1 to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address__pnr_address_number_and_street_2 to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information__passenger_partial_name to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information__ticketing_free_text to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger__pnr_name_field to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_ntiwari;
grant role sensitive_analytics_prd__cobrand_audit__customer_audit_details to role analyst_ntiwari;
grant role sensitive_analytics_prd__cobrand_audit__partner_account_summary to role analyst_ntiwari;
grant role sensitive_analytics_prd__cobrand__cobrand_customers to role analyst_ntiwari;
grant role sensitive_analytics_prd__cobrand__cobrand_customer_addresses to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__account_merge to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__card_move to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__redemption to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_ntiwari;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_ntiwari;
-- analytics_dev customers_rt data access
grant usage on database analytics_dev to role analyst_ntiwari;
grant usage on schema analytics_dev.customers_rt to role analyst_ntiwari;
grant select on all tables in schema analytics_dev.customers_rt to role analyst_ntiwari;
grant select on all views in schema analytics_dev.customers_rt to role analyst_ntiwari;
grant select on future tables in schema analytics_dev.customers_rt to role analyst_ntiwari;
grant select on future views in schema analytics_dev.customers_rt to role analyst_ntiwari;
grant usage on schema analytics_dev.stg_customers_rt to role analyst_ntiwari;
grant select on all tables in schema analytics_dev.stg_customers_rt to role analyst_ntiwari;
grant select on all views in schema analytics_dev.stg_customers_rt to role analyst_ntiwari;
grant select on future tables in schema analytics_dev.stg_customers_rt to role analyst_ntiwari;
grant select on future views in schema analytics_dev.stg_customers_rt to role analyst_ntiwari;
grant usage on schema analytics_dev.intermediary to role analyst_ntiwari;
grant role sensitive_analytics_dev__customers_rt to role analyst_ntiwari;
grant role sensitive_analytics_dev__stg_customers_rt to role analyst_ntiwari;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__customers__first_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__customers__last_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__customers__middle_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__customers__prefix_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__customers__suffix_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__identifications__customer_identification_value to role analyst_ntiwari;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__email_addresses__email_address_text to role analyst_ntiwari;
grant role sensitive_analytics_qa__intermediary__inter_informatica_customers_rt__phone_numbers__telephone_number to role analyst_ntiwari;
-- analytics_qa.stg_customers_rt
grant usage on schema analytics_qa.stg_customers_rt to role analyst_ntiwari;
grant select on view analytics_qa.stg_customers_rt.customers to role analyst_ntiwari;
grant select on view analytics_qa.stg_customers_rt.identifications to role analyst_ntiwari;
grant select on view analytics_qa.stg_customers_rt.phone_numbers to role analyst_ntiwari;
grant select on view analytics_qa.stg_customers_rt.email_addresses to role analyst_ntiwari;
grant role sensitive_analytics_qa__stg_customers_rt__customers__first_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__stg_customers_rt__customers__last_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__stg_customers_rt__customers__middle_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__stg_customers_rt__customers__prefix_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__stg_customers_rt__customers__suffix_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__stg_customers_rt__customer_identifications__customer_identification_value to role analyst_ntiwari;
grant role sensitive_analytics_qa__stg_customers_rt__email_addresses__email_address_text to role analyst_ntiwari;
grant role sensitive_analytics_qa__stg_customers_rt__phone_numbers__telephone_number to role analyst_ntiwari;
grant role sensitive_analytics_qa__customers_rt__customers__first_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__customers_rt__customers__last_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__customers_rt__customers__middle_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__customers_rt__customers__prefix_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__customers_rt__customers__suffix_name to role analyst_ntiwari;
grant role sensitive_analytics_qa__customers_rt__email_addresses__email_address_text to role analyst_ntiwari;
grant role sensitive_analytics_qa__customers_rt__phone_numbers__telephone_number to role analyst_ntiwari;
grant role sensitive_analytics_qa__customers_rt__identifications__customer_identification_value to role analyst_ntiwari;
grant role analytics_qa_customers_rt_read to role analyst_ntiwari;
grant usage on schema analytics_qa.intermediary to role analyst_ntiwari;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__customers to role analyst_ntiwari;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__email_addresses to role analyst_ntiwari;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__identifications to role analyst_ntiwari;
grant select on table analytics_qa.intermediary.inter_informatica_customers_rt__phone_numbers to role analyst_ntiwari;
grant role analyst_ntiwari to role sysadmin;
grant role analyst_ntiwari to user "NTIWARI@JETBLUE.COM";

-- analyst_nm43182 (Nicholas Mirza)
create role if not exists analyst_nm43182;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nm43182') }}
{% endif %}
grant role analyst to role analyst_nm43182;
grant role byod_itdatascience to role analyst_nm43182;
grant role byod_bluerm to role analyst_nm43182;
grant usage on schema byod.bluerm to role analyst_nm43182;
grant select on all tables in schema byod.bluerm to role analyst_nm43182;
grant select on future tables in schema byod.bluerm to role analyst_nm43182;
grant select on all views in schema byod.bluerm to role analyst_nm43182;
grant select on future views in schema byod.bluerm to role analyst_nm43182;
grant usage on schema analytics.safety to role analyst_nm43182;
grant select on all tables in schema analytics.safety to role analyst_nm43182;
grant select on all views in schema analytics.safety to role analyst_nm43182;
grant select on future tables in schema analytics.safety to role analyst_nm43182;
grant select on future views in schema analytics.safety to role analyst_nm43182;
grant select on view analytics.safety.ap_dbr_ereports to role analyst_nm43182;
-- ownership
grant ownership on byod.bluerm.cp_atpco_filed_fares_needed_dates_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_atpco_filed_fares_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_b6_schedule_density_working_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_schedule_density_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_schedule_density_working_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_schedules_processed_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_oa_schedule_density_working_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_competitive_fares_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_competitive_fares_processed_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_competitive_fares_needed_dates_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_dml_main_table_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_booking_aggregates_needed_dates_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_booking_aggregates_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_booking_aggregates_processed_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_gross_bookings_needed_dates_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_gross_bookings_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_gross_bookings_processed_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_lvff_table_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_reference_lvff_needed_dates_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_reference_fares_needed_dates_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_reference_fares_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_dml_main_table_needed_dates_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_dml_main_table_working_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_dml_main_table_nm to role analyst_bluerm;
grant ownership on byod.bluerm.cp_flight_segments_nm to role analyst_bluerm;
grant ownership on byod.bluerm.CP_FLIGHT_SEGMENTS_PROCESSED_NM to role analyst_bluerm;
grant ownership on byod.bluerm.cp_flight_segments_needed_process_dates_nm to role analyst_bluerm;
-- raw
grant role raw_sabre_pnr_batch_read to role analyst_nm43182;
-- raw.omniture
grant role raw_omniture_read to role analyst_nm43182;
grant role analyst_svc_rmo to role analyst_nm43182;
grant role analyst_bluerm to role analyst_nm43182;
grant role analyst_nm43182 to role sysadmin;
grant role analyst_nm43182 to user "NM43182@JETBLUE.COM";

-- analyst_na18369 (Nancy Andonaire)
create role if not exists analyst_na18369;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_na18369') }}
{% endif %}
grant role analyst to role analyst_na18369;
grant role "BLUEFP&A" to role analyst_na18369;
grant role byod_opa_read to role analyst_na18369;
grant role analyst_na18369 to role sysadmin;
grant role analyst_na18369 to user "NA18369@JETBLUE.COM";

-- analyst_nm98412 (Neeraj Mahadoo)
create role if not exists analyst_nm98412;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nm98412') }}
{% endif %}
grant role analyst to role analyst_nm98412;
grant role "IT SECURITY CREW" to role analyst_nm98412;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_nm98412;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_nm98412;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_nm98412;
grant role analyst_nm98412 to role sysadmin;
grant role analyst_nm98412 to user "NM98412@JETBLUE.COM";

-- analyst_ng86464 (Nina Orellana)
create role if not exists analyst_ng86464;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ng86464') }}
{% endif %}
grant role analyst to role analyst_ng86464;
grant role "APS-ACTIVE-USERS" to role analyst_ng86464;
grant role BLUETLB_DR to role analyst_ng86464;
grant role IXCORETEAM to role analyst_ng86464;
-- analytics_qa
grant usage on database analytics_qa to role analyst_ng86464;
-- analytics_qa.bookings
grant usage on schema analytics_qa.bookings to role analyst_ng86464;
grant select on all tables in schema analytics_qa.bookings to role analyst_ng86464;
grant select on all views in schema analytics_qa.bookings to role analyst_ng86464;
grant select on future tables in schema analytics_qa.bookings to role analyst_ng86464;
grant select on future views in schema analytics_qa.bookings to role analyst_ng86464;
-- analytics_qa.flights
grant usage on schema analytics_qa.flights to role analyst_ng86464;
grant select on all tables in schema analytics_qa.flights to role analyst_ng86464;
grant select on all views in schema analytics_qa.flights to role analyst_ng86464;
grant select on future tables in schema analytics_qa.flights to role analyst_ng86464;
grant select on future views in schema analytics_qa.flights to role analyst_ng86464;
grant role analyst_ng86464 to role sysadmin;
grant role analyst_ng86464 to user "NG86464@JETBLUE.COM";

-- analyst_nr38837 (Nicholas Rizzotto)
create role if not exists analyst_nr38837;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nr38837') }}
{% endif %}
grant role analyst to role analyst_nr38837;
grant role "CORPORATE AUDIT" to role analyst_nr38837;
-- analytics.stg_ifsa_rt
grant usage on schema analytics.stg_ifsa_rt to role analyst_nr38837;
grant select on view analytics.stg_ifsa_rt.vouchers to role analyst_nr38837;
-- analytics PII access
grant role sensitive_analytics_prd__bookings__remarks__remark_text to role analyst_nr38837;
grant role sensitive_analytics_prd__bookings__remarks_history__remark_text to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact__first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact__last_name to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact__legal_first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact__middle_name to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact_rt__first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact_rt__last_name to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact_rt__middle_name to role analyst_nr38837;
grant role sensitive_analytics_prd__analytics__crew_fact_rt__legal_first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__comply365__crewmember__current_position_description to role analyst_nr38837;
grant role sensitive_analytics_prd__comply365__crewmember__employment_status_description to role analyst_nr38837;
grant role sensitive_analytics_prd__comply365__crewmember__first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__comply365__crewmember__last_name to role analyst_nr38837;
grant role sensitive_analytics_prd__check_ins__passenger_histories__passenger_first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__check_ins__passenger_histories__passenger_last_name to role analyst_nr38837; 
grant role sensitive_analytics_prd__check_ins__passengers__passenger_first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__check_ins__passengers__passenger_last_name to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__passenger_email to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__passenger_first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__passenger_last_name to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__additional_comments to role analyst_nr38837; 
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__issuing_crewmember_id to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers__issuing_crewmember_name to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__additional_comments to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__issuing_crewmember_id to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__issuing_crewmember_name to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__passenger_email to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__passenger_first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history__passenger_last_name to role analyst_nr38837;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__passenger_email to role analyst_nr38837;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__passenger_first_name to role analyst_nr38837;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__passenger_last_name to role analyst_nr38837;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__additional_comments to role analyst_nr38837;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__issuing_crewmember_id to role analyst_nr38837;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers__issuing_crewmember_name to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__unique_ifsa_vouchers__additional_comments to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__unique_ifsa_vouchers__issuing_crewmember_id to role analyst_nr38837;
grant role sensitive_analytics_prd__vouchers__unique_ifsa_vouchers__issuing_crewmember_name to role analyst_nr38837;
-- byod
grant usage on database byod to role analyst_nr38837;
-- byod.airport_standards
grant usage on schema byod.airport_standards to role analyst_nr38837;
grant select on table byod.airport_standards.lyft_data to role analyst_nr38837;
grant select on table byod.airport_standards.dpax_data to role analyst_nr38837;
grant select on table byod.airport_standards.uber_transactions to role analyst_nr38837;
grant role analyst_nr38837 to role sysadmin;
grant role analyst_nr38837 to user "NR38837@JETBLUE.COM";

-- analyst_nv94435 (Nikolas Vedder)
create role if not exists analyst_nv94435;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nv94435') }}
{% endif %}
grant role analyst to role analyst_nv94435;
grant role blueloyalty to role analyst_nv94435;
-- ANALYTICS.BCUS_TRANSACTIONS
grant usage on schema ANALYTICS.BCUS_TRANSACTIONS to role analyst_nv94435;
grant select on table ANALYTICS.BCUS_TRANSACTIONS.BARCLAYS_CARD_TRANSACTIONS to role analyst_nv94435;
grant role analyst_nv94435 to role sysadmin;
grant role analyst_nv94435 to user "NV94435@JETBLUE.COM";

--ANALYST_NW93225 (Nicholas Wibert)
create role if not exists analyst_nw93225;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nw93225')}}
{% endif %}
grant role analyst to role analyst_nw93225;
grant role itbusinessintelligencecrew to role analyst_nw93225;
grant usage on database analytics_clone to role analyst_nw93225;
grant usage on schema analytics_clone.bookings_rt to role analyst_nw93225;
grant select on view analytics_clone.bookings_rt.travel_arrangers to role analyst_nw93225;
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_nw93225;
grant select on view analytics.stg_sabre_pnr_rt.travel_arrangers to role analyst_nw93225;
grant role analyst_nw93225 to role sysadmin;
grant role analyst_nw93225 to user "NW93225@JETBLUE.COM";
 
-- analyst_olee (Olivia Lee)
create role if not exists analyst_olee;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_olee') }}
{% endif %}
grant role analyst to role analyst_olee;
grant role "BLUE DIGITAL & CUSTOMER PRODUCTS" to role analyst_olee;
grant role "IT DIGITAL OPERATIONS" to role analyst_olee;
grant role blueloyalty to role analyst_olee;
-- ANALYTICS ROLES
grant usage on schema analytics.bcus_transactions to role analyst_olee;
grant select on table analytics.bcus_transactions.barclays_card_transactions to role analyst_olee;
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_olee; 
grant select on view analytics.stg_sabre_pnr_rt.remark to role analyst_olee;
grant select on view analytics.stg_sabre_pnr_rt.remark_snowflake to role analyst_olee;
grant select on table analytics.stg_sabre_pnr_rt.remark_aps to role analyst_olee;
-- ANALYTICS_CLONE
grant usage on database analytics_clone to role analyst_olee;
grant usage on schema analytics_clone.web_logs_rt to role analyst_olee;
grant select on all tables in schema analytics_clone.web_logs_rt to role analyst_olee;
grant select on future tables in schema analytics_clone.web_logs_rt to role analyst_olee;
grant select on all views in schema analytics_clone.web_logs_rt to role analyst_olee;
grant select on future views in schema analytics_clone.web_logs_rt to role analyst_olee;
grant select on all dynamic tables in schema analytics_clone.web_logs_rt to role analyst_olee;
grant select on future dynamic tables in schema analytics_clone.web_logs_rt to role analyst_olee;
-- ANALYTICS_QA ROLES 
grant usage on database analytics_qa to role analyst_olee;
grant usage on all schemas in database analytics_qa to role analyst_olee;
grant select on all tables in database analytics_qa to role analyst_olee;
grant select on future tables in database analytics_qa to role analyst_olee;
grant select on all views in database analytics_qa to role analyst_olee;
grant select on future views in database analytics_qa to role analyst_olee;
-- ANALYTICS_DEV
grant usage on database analytics_dev to role analyst_olee;
grant usage on schema analytics_dev.web_logs_rt to role analyst_olee;
grant select on all tables in schema analytics_dev.web_logs_rt to role analyst_olee;
grant select on future tables in schema analytics_dev.web_logs_rt to role analyst_olee;
grant select on all dynamic tables in schema analytics_dev.web_logs_rt to role analyst_olee;
-- BYOD ROLES
grant usage on database byod to role analyst_olee;
grant usage on schema byod.blueloyalty to role analyst_olee;
grant usage on schema byod.itdigitaloperations to role analyst_olee;
grant select on table byod.blueloyalty.jbc_acquisitions to role analyst_olee;
grant select on table byod.itdigitaloperations.intent_product_map to role analyst_olee;
grant select on table byod.itdigitaloperations.aggregate_web_log_sessions_v1_1 to role analyst_olee;
-- RAW ROLES
grant usage on schema raw.sabre_pnr_rt to role analyst_olee; 
grant select on table raw.sabre_pnr_rt.pnr_remark to role analyst_olee; 
grant select on table raw.sabre_pnr_rt.pnr to role analyst_olee;
-- Sensitive roles
grant role sensitive_analytics_prd__check_ins to role analyst_olee;
grant role sensitive_analytics_prd__bookings_rt__remark_history to role analyst_olee; 
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark to role analyst_olee; 
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_aps to role analyst_olee; 
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_snowflake to role analyst_olee; 
grant role analyst_olee to role sysadmin;
grant role analyst_olee to user "OLEE@JETBLUE.COM";

-- analyst_os09593 (Orlando Sanchez)
create role if not exists analyst_os09593;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_os09593') }}
{% endif %}
grant role analyst to role analyst_os09593;
grant role ITBUSINESSINTELLIGENCECREW to role analyst_os09593;
grant role analytics_clone_read to role analyst_os09593;
grant role sensitive_analytics_prd__datacamp to role analyst_os09593;
grant role sensitive_analytics_prd__stg_datacamp to role analyst_os09593;
grant role analyst_os09593 to role sysadmin;
grant role analyst_os09593 to user "OS09593@JETBLUE.COM";

-- analyst_osingh (Opinderpal Singh)
create role if not exists analyst_osingh;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_osingh') }}
{% endif %}
grant role analyst to role analyst_osingh;
grant role "IT COBRAND & EMAIL" to role analyst_osingh;
grant role sensitive_analytics_prd__notification_manager to role analyst_osingh;
grant role analyst_osingh to user "OSINGH@JETBLUE.COM";

-- ose_fuel
create role if not exists ose_fuel;
{% if revoke_first %}
{{ revoke_roles_from_role('ose_fuel') }}
{% endif %}
grant role usr_sysplanninganalysisro to role ose_fuel;
grant role ose_fuel to role analyst_yo03736;
grant role ose_fuel to role analyst_jp57406;
-- sensitive roles
grant role sensitive_analytics_prd__aircraft_sensors__ems_flight_primary_key__flight_departure_date to role ose_fuel;
grant role sensitive_analytics_prd__aircraft_sensors__ems_flight_primary_key__flight_number to role ose_fuel;
grant role sensitive_analytics_prd__aircraft_sensors__ems_flight_primary_key__tail_number to role ose_fuel;
grant role sensitive_analytics_prd__aircraft_sensors__ems_flight_primary_key__flight_record to role ose_fuel;
grant role ose_fuel to role sysadmin;

-- analyst_kp06178 (Palacios Vizcarrondo, Kevin)
create role if not exists analyst_kp06178;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kp06178') }}
{% endif %}
grant role analyst to role analyst_kp06178;
grant role "WPA TEAM" to role analyst_kp06178;
grant role "QACUSTOMERSUPPORT" to role analyst_kp06178;
grant role "TABLEAUONLINECREATOR" to role analyst_kp06178;
-- BYOD
grant role byod_cex_analytics_read to role analyst_kp06178;
grant select, insert, update, delete on table byod.cex_analytics.dpax to role analyst_kp06178;
grant select, insert, update, delete on table byod.cex_analytics.digital_pay_2025 to role analyst_kp06178;
--sensitive roles
grant role sensitive_analytics_prd__mint_customer_disruption to role analyst_kp06178;
grant role sensitive_analytics_prd__mint_customer_disruption__pnr_equipment_swap_current to role analyst_kp06178;
grant role sensitive_analytics_prd__mint_customer_disruption__pnr_equipment_swap_history to role analyst_kp06178;
grant role sensitive_analytics_prd__bookings__hotel_bookings to role analyst_kp06178;
grant role sensitive_analytics_prd__bookings__remarks to role analyst_kp06178;
grant role sensitive_analytics_prd__bookings__remarks_history to role analyst_kp06178;
grant role sensitive_analytics_prd__check_ins__passengers to role analyst_kp06178;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__deadhead_messages to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__organization_hierarchy_vertical to role analyst_kp06178;
grant role sensitive_analytics_prd__employee_profile_record__header__agent_full_name to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_kp06178;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_kp06178;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_kp06178;
grant role sensitive_analytics_prd__tickets__documents to role analyst_kp06178;
grant role sensitive_analytics_prd__tickets_rt__ticket_summary to role analyst_kp06178;
grant role sensitive_analytics_prd__bookings__passenger_documents to role analyst_kp06178;
grant role sensitive_analytics_prd__bookings__passenger_emails to role analyst_kp06178;
grant role sensitive_analytics_prd__check_ins_rt__travel_documents to role analyst_kp06178;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__travel_documents to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_kp06178;
grant select on all views in schema analytics.stg_sabre_acs_rt to role analyst_kp06178;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__bookings to role analyst_kp06178;
grant role sensitive_analytics_prd__bookings_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__check_ins to role analyst_kp06178;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__deadhead_messages__birth_date to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__deadhead_messages__first_name to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__deadhead_messages__last_name to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__deadhead_messages__legal_first_name to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__deadhead_messages__middle_name to role analyst_kp06178;
grant role sensitive_analytics_prd__crew__performance_stats_queues_crew to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_addresses to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_other_documents to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_special_service_requests to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_customer_reference to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_email to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_group to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_lined_address to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_phone to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_special_service_request to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_structured_address to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_ticket_information to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_credit_card_payment to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_cross_reference to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_contact to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger_form_of_identification to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_payment to role analyst_kp06178;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_remark to role analyst_kp06178;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__tickets to role analyst_kp06178;
grant role sensitive_analytics_prd__tickets_rt to role analyst_kp06178;
grant role analytics_stg_sabre_acs_rt_read to role analyst_kp06178;
grant role analytics_stg_sabre_pnr_rt_read to role analyst_kp06178;
grant role analytics_stg_sabre_ticket_rt_read to role analyst_kp06178;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__crew to role analyst_kp06178;
grant role sensitive_analytics_prd__crew_rt to role analyst_kp06178;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_kp06178;
grant role analytics_stg_sabre_crewtrac_read to role analyst_kp06178;
-- byod.cex_analytics
grant role byod_cex_analytics to role analyst_kp06178;
grant role byod_cex_analytics_read to role analyst_kp06178;
grant role analyst_kp06178 to role sysadmin;
grant role analyst_kp06178 to user "KP06178@JETBLUE.COM";

-- analyst_pm06857 (Paresh Majethia)
create role if not exists analyst_pm06857;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_pm06857') }}
{% endif %}
grant role analyst to role analyst_pm06857;
grant role LOYALTYTECHSUPPORT to role analyst_pm06857;
-- pii roles
grant role sensitive_analytics_prd__loyalty to role analyst_pm06857;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_pm06857;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_pm06857;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_pm06857;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_pm06857;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_pm06857;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_pm06857;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_pm06857;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_pm06857;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_pm06857;
-- analytics.stg_loyalty
grant role analytics_stg_loyalty_read to role analyst_pm06857;
-- analytics.stg_loyalty_rt
grant role analytics_stg_loyalty_rt_read to role analyst_pm06857;
-- byod.blueloyalty
grant role byod_blueloyalty_read to role analyst_pm06857;
grant role analyst_pm06857 to role sysadmin;
grant role analyst_pm06857 to user "PM06857@JETBLUE.COM";

-- analyst_PP10152
create role if not exists analyst_PP10152;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_PP10152') }}
{% endif %}
grant role analyst to role analyst_PP10152;
grant role INFLIGHTDUTYMANAGERS to role analyst_PP10152; 
grant role inflightanalysts to role analyst_PP10152;
-- ANALYTICS.CREW_PAY
grant usage on schema analytics.crew_pay to role analyst_PP10152;
grant select on all tables in schema analytics.crew_pay to role analyst_PP10152;
grant select on all views in schema analytics.crew_pay to role analyst_PP10152;
grant select on future tables in schema analytics.crew_pay to role analyst_PP10152;
grant select on future views in schema analytics.crew_pay to role analyst_PP10152;
-- sensitive roles
grant role sensitive_analytics_prd__crew_pay to role analyst_PP10152;
grant role analyst_PP10152 to role sysadmin;
grant role analyst_PP10152 to user "PP10152@JETBLUE.COM";

-- analyst_pw94091 (Pesach Weinstock)
create role if not exists analyst_pw94091;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_pw94091') }}
{% endif %}
grant role analyst to role analyst_pw94091;
grant role "JTP_TECH_DATA_SNOWFLAKE" to role analyst_pw94091;
-- BYOD ROLES
grant role byod_blueloyalty_read to role analyst_pw94091;
-- SENSITIVE Roles
grant role sensitive_analytics_prd__call_management__amazon_connect_agents to role analyst_pw94091;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_pw94091;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_pw94091;
grant role sensitive_analytics_prd__email_marketing__opt_out_marketing to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__address_line_1 to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__address_line_2 to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__address_line_3 to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__city_name to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__date_of_birth to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__email_address to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__first_name to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__last_name to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__middle_name to role analyst_pw94091;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles__postal_code to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__address_line_1 to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__address_line_2 to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__address_line_3 to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__city_name to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__date_of_birth to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__email_address to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__first_name to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__last_name to role analyst_pw94091;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile__middle_name to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__first_name to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__last_name to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__middle_name to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__email_address to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__address_line_1 to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__address_line_2 to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__address_line_3 to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__city_name to role analyst_pw94091;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile__date_of_birth to role analyst_pw94091;
-- analyst.stg_loyalty_rt
grant usage on schema analytics.stg_loyalty_rt to role analyst_pw94091;
grant select on view analytics.stg_loyalty_rt.member_profile to role analyst_pw94091;
-- raw
grant usage on database raw to role analyst_pw94091;
-- raw.loyalty_rt
grant usage on schema raw.loyalty_rt to role analyst_pw94091;
grant select on table raw.loyalty_rt.member_profile to role analyst_pw94091;
grant role analyst_pw94091 to role sysadmin;
grant role analyst_pw94091 to user "PW94091@JETBLUE.COM";

-- analyst_rdronadula(Rambabu Dronadula)
create role if not exists analyst_rdronadula;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rdronadula') }}
{% endif %}
grant role analyst to role analyst_rdronadula;
grant role "IT ENTERPRISE QUALITY ASSURANCE" to role analyst_rdronadula;
grant role "IT EQA GLOBAL TEAM" to role analyst_rdronadula;
-- analytics_qa
grant usage on database analytics_qa to role analyst_rdronadula;
grant usage on schema analytics_qa.customers_rt to role analyst_rdronadula;
grant select on view analytics_qa.customers_rt.jetblue_accounts to role analyst_rdronadula;
grant usage on schema analytics_qa.stg_customers_rt to role analyst_rdronadula;
grant select on view analytics_qa.stg_customers_rt.jetblue_accounts to role analyst_rdronadula;
grant usage on schema analytics_qa.intermediary to role analyst_rdronadula;
grant select on table analytics_qa.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_rdronadula;
grant select on view analytics_qa.customers_rt.jetblue_accounts_history to role analyst_rdronadula;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_rdronadula;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_rdronadula;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_rdronadula;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_rdronadula;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_rdronadula;
-- raw_qa
grant usage on database raw_qa to role analyst_rdronadula;
grant usage on schema raw_qa.credit_profiles_rt to role analyst_rdronadula;
grant select on table raw_qa.credit_profiles_rt.jetblue_accounts to role analyst_rdronadula;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_rdronadula;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_rdronadula;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_rdronadula;
-- sensitive
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts to role analyst_rdronadula;
grant role sensitive_analytics_qa__stg_customers_rt__jetblue_accounts to role analyst_rdronadula;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_rdronadula;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts_history to role analyst_rdronadula;
grant usage on database analytics_qa to role analyst_rdronadula;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_rdronadula;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_rdronadula;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_rdronadula;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_rdronadula;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_rdronadula; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_rdronadula;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_rdronadula;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_rdronadula;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_rdronadula;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_rdronadula;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_rdronadula;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_rdronadula;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_rdronadula;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_rdronadula;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_rdronadula;
grant usage on database raw_qa to role analyst_rdronadula;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_rdronadula;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_rdronadula;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_rdronadula;
grant usage on database raw to role analyst_rdronadula;
grant usage on schema raw.c3po_audit_logs to role analyst_rdronadula;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_rdronadula;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_rdronadula;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_rdronadula;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_rdronadula;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_rdronadula;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_rdronadula;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_rdronadula;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_rdronadula;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_rdronadula;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_rdronadula;
grant role analyst_rdronadula to role sysadmin;
grant role analyst_rdronadula to user "RDRONADULA@JETBLUE.COM";

--analyst_rali (Randall Ali)
create role if not exists analyst_rali;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rali') }}
{% endif %}
grant role analyst to role analyst_rali;
grant usage on schema analytics.safety to role analyst_rali;
grant select on all tables in schema analytics.safety to role analyst_rali;
grant select on all views in schema analytics.safety to role analyst_rali;
grant select on future tables in schema analytics.safety to role analyst_rali;
grant select on future views in schema analytics.safety to role analyst_rali;
grant role analyst_rali to user "RALI@JETBLUE.COM";

-- analyst_rc56174 (Rebecca Coles)
create role if not exists analyst_rc56174;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rc56174') }}
{% endif %}
grant role analyst to role analyst_rc56174;
grant role blueloyalty to role analyst_rc56174;
-- ANALYTICS.BCUS_TRANSACTIONS
grant usage on schema analytics.bcus_transactions to role analyst_rc56174;
grant usage on schema analytics.loyalty to role analyst_rc56174;
grant select on table analytics.bcus_transactions.barclays_card_transactions to role analyst_rc56174;
grant role cobrandcustomersupport to role analyst_rc56174;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__loyalty__barclays_loyalty_cobrand_business_accounts to role analyst_rc56174;
grant role sensitive_analytics_prd__loyalty__barclays_loyalty_cobrand_consumer_accounts to role analyst_rc56174;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_rc56174;
grant role sensitive_analytics_prd__loyalty to role analyst_rc56174;
grant role sensitive_analytics_prd__cobrand_audit to role analyst_rc56174;
grant role sensitive_analytics_prd__cobrand to role analyst_rc56174;
grant role sensitive_analytics_prd__loyalty__barclays_loyalty_cobrand_consumer_accounts to role analyst_rc56174;
grant role sensitive_analytics_prd__loyalty_rt__member_profile_history to role analyst_rc56174;
grant role analyst_rc56174 to role sysadmin;
grant role analyst_rc56174 to user "RC56174@JETBLUE.COM";

-- analyst_radas (Rajosree Das)
create role if not exists analyst_radas;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_radas') }}
{% endif %}
grant role analyst to role analyst_radas;
grant role tcsdataengineering to role analyst_radas;
grant imported privileges on database viasat to role analyst_radas;
-- RAW
--RAW.COMARCH_BI_PROD_DBO
grant select on table raw.comarch_bi_prod_dbo.fctx_perkavailable to role analyst_radas;
grant role analyst_radas to role sysadmin;
grant role analyst_radas to user "RADAS@JETBLUE.COM";

-- analyst_remiles (Rebecca Miles)
create role if not exists analyst_remiles;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_remiles') }}
{% endif %}
grant role analyst to role analyst_remiles;
grant role "IT CEX CM BAU SUPPORT" to role analyst_remiles;
grant role itcexcmsystems_sg to role analyst_remiles;
-- analytics.stg_sabre_pnr_rt
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_remiles;
grant select on view analytics.stg_sabre_pnr_rt.other_supplementary_information to role analyst_remiles;
grant select on view analytics.stg_sabre_pnr_rt.other_supplementary_information_snowflake to role analyst_remiles;
grant select on table analytics.stg_sabre_pnr_rt.other_supplementary_information_aps to role analyst_remiles;
-- Sensitive roles
grant role sensitive_analytics_prd__bookings_rt__other_supplementary_information__other_supplementary_information_free_text to role analyst_remiles;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_other_supplementary_information__other_supplementary_information_free_text to role analyst_remiles;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__other_supplementary_information__other_supplementary_information_free_text to role analyst_remiles;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__other_supplementary_information_aps__other_supplementary_information_free_text to role analyst_remiles;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__other_supplementary_information_snowflake__other_supplementary_information_free_text to role analyst_remiles;
-- raw db
grant usage on database raw to role analyst_remiles;
-- raw.sabre_pnr_rt
grant usage on schema raw.sabre_pnr_rt to role analyst_remiles;
grant select on table raw.sabre_pnr_rt.pnr_osi to role analyst_remiles;
grant select on table raw.sabre_pnr_rt.pnr to role analyst_remiles;
grant role analyst_remiles to role sysadmin;
grant role analyst_remiles to user "REMILES@JETBLUE.COM";

-- analyst_rfitzgerald (Ryan Fitzgerald)
create role if not exists analyst_rfitzgerald;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rfitzgerald') }}
{% endif %}
grant role analyst_tissi to role analyst_rfitzgerald;
grant role analyst_rfitzgerald to role sysadmin;
grant role analyst_rfitzgerald to user "RFITZGERALD@JETBLUE.COM";

-- analyst_rg84137 (Rishi Gupta)
create role if not exists analyst_rg84137;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rg84137') }}
{% endif %}
grant role analyst to role analyst_rg84137;
grant role "INFRASTRUCTURE ARCHITECTURE AUTOMATION" to role analyst_rg84137;
grant role analyst_rg84137 to role sysadmin;
grant role analyst_rg84137 to user "RG84137@JETBLUE.COM";

-- analyst_ro17906 (Robert Ohare)
create role if not exists analyst_ro17906;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ro17906') }}
{% endif %}
grant role analyst to role analyst_ro17906;
grant role "CEXSNOWFLAKEDATA" to role analyst_ro17906;
grant role analyst_cexsnowflakedata to role analyst_ro17906;
-- analytics.stg_sharepoint_airport_applications
grant usage on schema analytics.stg_sharepoint_airport_applications to role analyst_ro17906;
grant select on view analytics.stg_sharepoint_airport_applications.cs_100_reports_v2 to role analyst_ro17906;
-- raw.sharepoint_airport_applications
grant usage on database raw to role analyst_ro17906;
grant usage on schema raw.sharepoint_airport_applications to role analyst_ro17906;
grant select on table raw.sharepoint_airport_applications.cs100_reports_v2 to role analyst_ro17906; 
-- sensitive roles
grant role sensitive_analytics_prd__api_global_hotels__dpax_accounting_report to role analyst_ro17906;
grant role sensitive_analytics_prd__api_global_hotels__dpax_detailed_report to role analyst_ro17906;
grant role sensitive_analytics_prd__check_ins__passengers to role analyst_ro17906;
grant role sensitive_analytics_prd__sharepoint_airport_applications__cs_100_reports_v2 to role analyst_ro17906;
grant role sensitive_analytics_prd__stg_sharepoint_airport_applications__cs_100_reports_v2 to role analyst_ro17906;
grant role sensitive_analytics_prd__sharepoint_airport_applications__ecs_101_main_report to role analyst_ro17906;
-- other roles
grant role analyst_ro17906 to role sysadmin;
grant role analyst_ro17906 to user "RO17906@JETBLUE.COM";

-- analyst_rm82558 (Rowena Ma)
create role if not exists analyst_rm82558;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rm82558') }}
{% endif %}
grant role analyst to role analyst_rm82558;
grant role "BLUE MARKETING ALL" to role analyst_rm82558;
grant role BLUEMARKETING to role analyst_rm82558;
grant role analyst_rm82558 to role sysadmin;
grant role analyst_rm82558 to user "RM82558@JETBLUE.COM";

-- analyst_re02175 (Ronald Ecoff)
create role if not exists analyst_re02175;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_re02175') }}
{% endif %}
grant role analyst to role analyst_re02175;
grant role "BLUEFP&A" to role analyst_re02175;
grant role raw_concur_read to role analyst_re02175;
grant role analyst_re02175 to role sysadmin;
grant role analyst_re02175 to user "RE02175@JETBLUE.COM";

-- analyst_rsmith2
create role if not exists analyst_rsmith2;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rsmith2') }}
{% endif %}
grant role analyst to role analyst_rsmith2;
grant role analyst_enterprise_architecture to role analyst_rsmith2;
grant role sensitive_analytics_prd__analytics__ancillaries_fact to role analyst_rsmith2;
grant role sensitive_analytics_prd__analytics__beta_ancillaries_fact to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty__users to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__account_merges to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__account_merge_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__card_moves to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__card_move_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__corporate to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__corporate_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__member_profile_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__redemptions to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty_rt__redemption_history to role analyst_rsmith2;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__account_merge to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__card_move to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__corporate to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__redemption to role analyst_rsmith2;
grant role sensitive_analytics_prd__stg_loyalty_rt__account_merge to role analyst_rsmith2;
grant role sensitive_analytics_prd__stg_loyalty_rt__card_move to role analyst_rsmith2;
grant role sensitive_analytics_prd__stg_loyalty_rt__corporate to role analyst_rsmith2;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_rsmith2;
grant role sensitive_analytics_prd__stg_loyalty_rt__redemption to role analyst_rsmith2;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_prd__loyalty to role analyst_rsmith2;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_rsmith2;
grant role analytics_stg_loyalty_rt_read to role analyst_rsmith2;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_rsmith2;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_rsmith2;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_rsmith2;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_rsmith2;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_rsmith2; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_rsmith2;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_rsmith2;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_rsmith2;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_rsmith2;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_rsmith2;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant usage on database raw_qa to role analyst_rsmith2;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_rsmith2;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_rsmith2;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_rsmith2;
grant usage on database raw to role analyst_rsmith2;
grant usage on schema raw.c3po_audit_logs to role analyst_rsmith2;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_rsmith2;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_rsmith2;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_rsmith2;
--analytics.clone
grant usage on database analytics_clone to role analyst_rsmith2;
grant usage on all schemas in database analytics_clone to role analyst_rsmith2;
grant select on all tables in database analytics_clone to role analyst_rsmith2;
grant select on all views in database analytics_clone to role analyst_rsmith2;
grant select on future tables in database analytics_clone to role analyst_rsmith2;
grant select on future views in database analytics_clone to role analyst_rsmith2;
-- analytics_qa
grant usage on database analytics_qa to role analyst_rsmith2;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_rsmith2;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_rsmith2;
grant select on view analytics_qa.credit_issuing_tool.passenger_request to role analyst_rsmith2;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_rsmith2;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_rsmith2;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_rsmith2;
grant usage on schema analytics_qa.intermediary to role analyst_rsmith2;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_rsmith2;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__passenger_request to role analyst_rsmith2;
grant role analytics_qa_s3c_credit_read to role analyst_rsmith2;
--raw
grant role raw_sabre_ticket_rt_read to role analyst_rsmith2;
grant role raw_sabre_pnr_rt_read to role analyst_rsmith2;
grant role raw_sabre_acs_rt_read to role analyst_rsmith2;
grant role raw_sabre_pnr_batch_read to role analyst_rsmith2;
grant role raw_sabre_ticket_batch_read to role analyst_rsmith2;
grant role raw_sabre_acs_batch_read to role analyst_rsmith2;
-- raw.loyalty_rt
grant role raw_loyalty_rt_read to role analyst_rsmith2;
-- raw.salesforce_poc
grant role raw_salesforce_poc_read to role analyst_rsmith2;
--BYOD.CEX_ANALYTICS
grant role byod_cex_analytics_read to role analyst_rsmith2;
grant role byod_cex_analytics to role analyst_rsmith2;
-- raw.salesforce
grant role raw_salesforce_read to role analyst_rsmith2;
-- Sensitive roles
grant role sensitive_raw_qa__sabre_acs_batch to role analyst_rsmith2;
grant role sensitive_raw_prd__sabre_acs_batch to role analyst_rsmith2;
grant role sensitive_analytics_qa__analytics__ancillaries_fact to role analyst_rsmith2;
grant role sensitive_analytics_prd__check_ins to role analyst_rsmith2;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_rsmith2;
grant role sensitive_analytics_prd__agent_sales_reports to role analyst_rsmith2;
grant role sensitive_analytics_prd__s3c_credit to role analyst_rsmith2;
grant role sensitive_analytics_qa__agent_sales_reports to role analyst_rsmith2;
grant role sensitive_analytics_qa__aircraft_turns to role analyst_rsmith2;
grant role sensitive_analytics_qa__airports_hospitality to role analyst_rsmith2;
grant role sensitive_analytics_qa__airports_security to role analyst_rsmith2;
grant role sensitive_analytics_qa__analytics to role analyst_rsmith2;
grant role sensitive_analytics_qa__baggage to role analyst_rsmith2;
grant role sensitive_analytics_qa__bookings to role analyst_rsmith2;
grant role sensitive_analytics_qa__bookings_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__check_ins to role analyst_rsmith2;
grant role sensitive_analytics_qa__check_ins_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__cobrand to role analyst_rsmith2;
grant role sensitive_analytics_qa__cobrand_audit to role analyst_rsmith2;
grant role sensitive_analytics_qa__comply365 to role analyst_rsmith2;
grant role sensitive_analytics_qa__crew to role analyst_rsmith2;
grant role sensitive_analytics_qa__crew_delta to role analyst_rsmith2;
grant role sensitive_analytics_qa__crew_lambda to role analyst_rsmith2;
grant role sensitive_analytics_qa__crew_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__customers_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__customer_compensation to role analyst_rsmith2;
grant role sensitive_analytics_qa__customer_support to role analyst_rsmith2;
grant role sensitive_analytics_qa__data_exports to role analyst_rsmith2;
grant role sensitive_analytics_qa__email_marketing to role analyst_rsmith2;
grant role sensitive_analytics_qa__employee_profile_record to role analyst_rsmith2;
grant role sensitive_analytics_qa__fees to role analyst_rsmith2;
grant role sensitive_analytics_qa__flight_plan_manager to role analyst_rsmith2;
grant role sensitive_analytics_qa__intermediary to role analyst_rsmith2;
grant role sensitive_analytics_qa__irops_reaccom to role analyst_rsmith2;
grant role sensitive_analytics_qa__loyalty to role analyst_rsmith2;
grant role sensitive_analytics_qa__loyalty_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__missing_baggage to role analyst_rsmith2;
grant role sensitive_analytics_qa__notification_manager to role analyst_rsmith2;
grant role sensitive_analytics_qa__reference to role analyst_rsmith2;
grant role sensitive_analytics_qa__reference_legacy to role analyst_rsmith2;
grant role sensitive_analytics_qa__s3c_credit to role analyst_rsmith2;
grant role sensitive_analytics_qa__sabre_open_system_payfields to role analyst_rsmith2;
grant role sensitive_analytics_qa__sabre_travel_bank to role analyst_rsmith2;
grant role sensitive_analytics_qa__safety to role analyst_rsmith2;
grant role sensitive_analytics_qa__servicenow to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_accelya_mis to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_airports_hospitality to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_airports_security to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_aqd to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_baggage to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_billing_information to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_bill_of_rights to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_cashstar to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_cass to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_ccure to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_cobrand_audit to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_comarch to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_complimentary_travel_manager to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_comply365 to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_crew to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_crew_services to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_customers_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_customer_compensation to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_customer_support to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_egor to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_flight_plan_manager to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_ifsa_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_irops_reaccom to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_kiosk to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_loyalty to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_loyalty_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_market_regions to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_navblue to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_nettracer to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_notification_manager to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_peoplefluent to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_qualtrics to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_responsys to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_s3c_credit to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_accb to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_acs_batch to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_acs_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_asr_batch to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_crewtrac to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_crewtrac_lambda to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_csa to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_emd_batch to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_epr to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_fee_override to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_open_system_payfields to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_pnr_batch to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_pnr_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_tcn to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_ticket_batch to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_ticket_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_travel_bank to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sabre_vcr_flown to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_sap_reports to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_servicenow to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_success_factors to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_surveys to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_web_analytics to role analyst_rsmith2;
grant role sensitive_analytics_qa__stg_wheelchair to role analyst_rsmith2;
grant role sensitive_analytics_qa__surveys to role analyst_rsmith2;
grant role sensitive_analytics_qa__talent_acquisition to role analyst_rsmith2;
grant role sensitive_analytics_qa__tickets to role analyst_rsmith2;
grant role sensitive_analytics_qa__tickets_rt to role analyst_rsmith2;
grant role sensitive_analytics_qa__ticket_accounting to role analyst_rsmith2;
grant role sensitive_analytics_qa__ticket_audits to role analyst_rsmith2;
grant role sensitive_analytics_qa__vouchers to role analyst_rsmith2;
grant role sensitive_analytics_qa__web_analytics to role analyst_rsmith2;
grant role sensitive_analytics_qa__wheelchair to role analyst_rsmith2;
grant role sensitive_sabre_acs_read to role analyst_rsmith2;
grant role sensitive_sabre_epr_read to role analyst_rsmith2;
grant role sensitive_sabre_pnr_read to role analyst_rsmith2;
grant role sensitive_sabre_tcn_read to role analyst_rsmith2;
grant role sensitive_sabre_tcn_read_qa to role analyst_rsmith2;
grant role sensitive_sabre_ticket_read to role analyst_rsmith2;
grant role analyst_rsmith2 to user "RSMITH2@JETBLUE.COM";

--analyst_rp97577 (Nikolas Puno)
create role if not exists analyst_rp97577; 
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rp97577') }}
{% endif %}
grant role analyst to role analyst_rp97577;
grant role BLUECORPSALES to role analyst_rp97577;
grant role BLUESALES to role analyst_rp97577;
grant role BLUESALESOPS to role analyst_rp97577;
grant monitor on task byod.sales.task__contractcompliance_add to role analyst_rp97577;
grant role analyst_rp97577 to role sysadmin;
grant role analyst_rp97577 to user "RP97577@JETBLUE.COM";

-- analyst_rsoudagar
create role if not exists analyst_rsoudagar;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rsoudagar') }}
{% endif %}
grant role analyst to role analyst_rsoudagar;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_rsoudagar;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger_travel_document to role analyst_rsoudagar;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_passenger to role analyst_rsoudagar;
grant role sensitive_analytics_prd__loyalty_rt__member_profiles to role analyst_rsoudagar;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_rsoudagar;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt__member_profile to role analyst_rsoudagar;
grant role sensitive_analytics_prd__bookings_rt__passenger to role analyst_rsoudagar;
grant role sensitive_analytics_prd__bookings_rt__passenger_travel_document to role analyst_rsoudagar;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_rsoudagar;
--analytics_clone roles 
grant usage on database analytics_clone to role analyst_rsoudagar;
grant usage on schema analytics_clone.loyalty_rt to role analyst_rsoudagar;
grant select on view analytics_clone.loyalty_rt.member_profiles to role analyst_rsoudagar;
grant usage on schema analytics_clone.stg_loyalty_rt to role analyst_rsoudagar;
grant select on view analytics_clone.stg_loyalty_rt.member_profile to role analyst_rsoudagar;
grant select on table analytics_clone.intermediary.inter_loyalty_rt__member_profile to role analyst_rsoudagar;
-- RAW
grant usage on database raw to role analyst_rsoudagar;
grant usage on schema raw.credit_profiles_rt to role analyst_rsoudagar;
grant select on table raw.credit_profiles_rt.jetblue_accounts to role analyst_rsoudagar;
grant usage on schema raw.c3po_audit_logs to role analyst_rsoudagar;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_rsoudagar;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_rsoudagar;
grant role raw_sabre_acs_rt_read to role analyst_rsoudagar;
-- RAW_QA
grant usage on database raw_qa to role analyst_rsoudagar;
grant usage on schema raw_qa.credit_profiles_rt to role analyst_rsoudagar;
grant select on table raw_qa.credit_profiles_rt.jetblue_accounts to role analyst_rsoudagar;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_rsoudagar;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_rsoudagar;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_rsoudagar;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_rsoudagar;
grant select on view analytics.stg_sabre_acs_rt.passengers to role analyst_rsoudagar;
-- ANALYTICS
grant usage on database analytics to role analyst_rsoudagar;
grant usage on schema analytics.customers_rt to role analyst_rsoudagar;
grant select on view analytics.customers_rt.jetblue_accounts to role analyst_rsoudagar;
grant usage on schema analytics.stg_customers_rt to role analyst_rsoudagar;
grant select on view analytics.stg_customers_rt.jetblue_accounts to role analyst_rsoudagar;
grant usage on schema analytics.intermediary to role analyst_rsoudagar;
grant select on table analytics.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_rsoudagar;
grant select on view analytics.customers_rt.jetblue_accounts_history to role analyst_rsoudagar;
grant usage on schema analytics.credit_issuing_tool to role analyst_rsoudagar;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_rsoudagar;
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_rsoudagar;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_rsoudagar;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__customers_rt__jetblue_accounts to role analyst_rsoudagar;
grant role sensitive_analytics_prd__stg_customers_rt__jetblue_accounts to role analyst_rsoudagar;
grant role sensitive_analytics_prd__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_rsoudagar;
grant role sensitive_analytics_prd__customers_rt__jetblue_accounts_history to role analyst_rsoudagar;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_rsoudagar;
-- ANALYTICS_QA
grant usage on database analytics_qa to role analyst_rsoudagar;
grant usage on schema analytics_qa.customers_rt to role analyst_rsoudagar;
grant select on view analytics_qa.customers_rt.jetblue_accounts to role analyst_rsoudagar;
grant usage on schema analytics_qa.stg_customers_rt to role analyst_rsoudagar;
grant select on view analytics_qa.stg_customers_rt.jetblue_accounts to role analyst_rsoudagar;
grant usage on schema analytics_qa.intermediary to role analyst_rsoudagar;
grant select on table analytics_qa.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_rsoudagar;
grant select on view analytics_qa.customers_rt.jetblue_accounts_history to role analyst_rsoudagar;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_rsoudagar;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_rsoudagar;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_rsoudagar;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_rsoudagar;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts to role analyst_rsoudagar;
grant role sensitive_analytics_qa__stg_customers_rt__jetblue_accounts to role analyst_rsoudagar;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_rsoudagar;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts_history to role analyst_rsoudagar;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant usage on database analytics_qa to role analyst_rsoudagar;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_rsoudagar;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_rsoudagar;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_rsoudagar;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_rsoudagar;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_rsoudagar; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_rsoudagar;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_rsoudagar;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_rsoudagar;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_rsoudagar;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_rsoudagar;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant usage on database raw_qa to role analyst_rsoudagar;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_rsoudagar;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_rsoudagar;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_rsoudagar;
grant usage on database raw to role analyst_rsoudagar;
grant usage on schema raw.c3po_audit_logs to role analyst_rsoudagar;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_rsoudagar;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_rsoudagar;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_rsoudagar;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_rsoudagar;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_rsoudagar;
grant select on all views in schema analytics_qa.customers_rt to role analyst_rsoudagar;
grant select on future views in schema analytics_qa.customers_rt to role analyst_rsoudagar;
--other roles
grant role analyst_rsoudagar to role sysadmin;
grant role analyst_rsoudagar to user "RSOUDAGAR@JETBLUE.COM";

-- analyst_rv60325
create role if not exists analyst_rv60325;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rv60325') }}
{% endif %}
grant role analyst to role analyst_rv60325;
grant role itdataengineeringcrew to role analyst_rv60325;
grant role itdatasciencecrew to role analyst_rv60325;
grant role loader_prd to role analyst_rv60325;
grant role onprem to role analyst_rv60325;
grant role transformer_prd to role analyst_rv60325;
-- NETWORK RULES
grant create network rule on schema analytics_dev.dev_ramg to role analyst_rv60325;
-- INTEGRATION RULES
grant create integration on account to role analyst_rv60325;
grant role analyst_rv60325 to role sysadmin;
grant role analyst_rv60325 to user "RV60325@JETBLUE.COM";

-- analyst_rw12190 (Russell Wong)
create role if not exists analyst_rw12190;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rw12190') }}
{% endif %}
grant role analyst to role analyst_rw12190;
grant role bluetechops to role analyst_rw12190;
grant usage on database analytics_clone to role analyst_rw12190;
grant role analyst_rw12190 to role sysadmin;
grant role analyst_rw12190 to user "RW12190@JETBLUE.COM";

-- analyst_rz18813 (Ruslan Zhurba)
create role if not exists analyst_rz18813;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_rz18813') }}
{% endif %}
grant role analyst to role analyst_rz18813;
grant usage on database raw to role analyst_rz18813;
grant usage on schema raw.sabre_pnr_rt to role analyst_rz18813;
grant select on table raw.sabre_pnr_rt.pnr to role analyst_rz18813;
grant select on table raw.sabre_pnr_rt.pnr_ancillary_services to role analyst_rz18813;
grant select on table raw.sabre_pnr_rt.pnr_contact to role analyst_rz18813;
grant select on table raw.sabre_pnr_rt.pnr_osi to role analyst_rz18813;
grant select on table raw.sabre_pnr_rt.pnr_queue_ticket_info to role analyst_rz18813;
grant select on table raw.sabre_pnr_rt.pnr_remark to role analyst_rz18813;
grant select on table raw.sabre_pnr_rt.pnr_ssr to role analyst_rz18813;
grant role analyst_rz18813 to role sysadmin;
grant role analyst_rz18813 to user "RZ18813@JETBLUE.COM";

-- analyst_sb32665
create role if not exists analyst_sb32665;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sb32665') }}
{% endif %}
grant role analyst to role analyst_sb32665;
grant role "IT DIGITAL OPERATIONS" to role analyst_sb32665;
grant role it_selfservicecheckin to role analyst_sb32665;
grant role it_self_service to role analyst_sb32665;
grant usage on database byod to role analyst_sb32665;
grant usage on schema byod.itdigitaloperations to role analyst_sb32665;
grant select on table byod.itdigitaloperations.intent_product_map to role analyst_sb32665;
grant role analyst_sb32665 to role sysadmin;
grant role analyst_sb32665 to user "SB32665@JETBLUE.COM";

create role if not exists analyst_spalaniappan;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_spalaniappan') }}
{% endif %}
grant role tcsdataengineering to role analyst_spalaniappan;
grant usage on schema analytics.safety to role analyst_spalaniappan;
grant select on table analytics.safety.payroll_safety_hours to role analyst_spalaniappan;
grant usage on schema analytics.stg_safety to role analyst_spalaniappan;
grant select on view analytics.stg_safety.payroll_safety_hours to role analyst_spalaniappan;
grant role analytics_stg_customers_rt_read to role analyst_spalaniappan;
grant select on all views in schema analytics.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on future views in schema analytics.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on all tables in schema analytics.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on future tables in schema analytics.stg_credit_issuing_tool to role analyst_spalaniappan;
-- analytic_stg_credit_issuing_tool
grant select on all views in schema analytics.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on future views in schema analytics.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on all tables in schema analytics.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on future tables in schema analytics.stg_credit_issuing_tool to role analyst_spalaniappan;
-- raw_c3po_audit_logs
grant select on all views in schema raw.c3po_audit_logs to role analyst_spalaniappan;
grant select on future views in schema raw.c3po_audit_logs to role analyst_spalaniappan;
grant select on all tables in schema raw.c3po_audit_logs to role analyst_spalaniappan;
grant select on future tables in schema raw.c3po_audit_logs to role analyst_spalaniappan;
-- analytic_stg_credit_issuing_tool
grant usage on database analytics_qa to role analyst_spalaniappan;
grant select on all views in schema analytics_qa.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on future views in schema analytics_qa.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on all tables in schema analytics_qa.stg_credit_issuing_tool to role analyst_spalaniappan;
grant select on future tables in schema analytics_qa.stg_credit_issuing_tool to role analyst_spalaniappan;
-- analytics_qa
grant usage on schema analytics_qa.stg_customers_rt to role analyst_spalaniappan;
grant role analytics_qa_stg_customers_rt_read to role analyst_spalaniappan;
-- raw
grant usage on schema raw_qa.informatica_customers_rt to role analyst_spalaniappan;
grant select on table raw_qa.informatica_customers_rt.customers to role analyst_spalaniappan;
grant usage on schema raw_qa.credit_profiles_rt to role analyst_spalaniappan;
grant select on table raw_qa.credit_profiles_rt.jetblue_accounts to role analyst_spalaniappan;
-- raw_qa_c3po_audit_logs
grant usage on database raw_qa to role analyst_spalaniappan;
grant select on all views in schema raw_qa.c3po_audit_logs to role analyst_spalaniappan;
grant select on future views in schema raw_qa.c3po_audit_logs to role analyst_spalaniappan;
grant select on all tables in schema raw_qa.c3po_audit_logs to role analyst_spalaniappan;
grant select on future tables in schema raw_qa.c3po_audit_logs to role analyst_spalaniappan;
grant role analyst_spalaniappan to role sysadmin;
grant role analyst_spalaniappan to user "SPALANIAPPAN@JETBLUE.COM";

-- analyst_sp38730 (Sandip Patil)
create role if not exists analyst_sp38730;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sp38730') }}
{% endif %}
grant role analyst to role analyst_sp38730;
--analytics roles
grant usage on database analytics to role analyst_sp38730;
grant usage on schema analytics.flights_rt to role analyst_sp38730;
grant select on all tables in schema analytics.flights_rt to role analyst_sp38730;
grant select on all views in schema analytics.flights_rt to role analyst_sp38730;
grant select on future tables in schema analytics.flights_rt to role analyst_sp38730;
grant select on future views in schema analytics.flights_rt to role analyst_sp38730;
--analytics_qa roles
grant role analytics_qa_read to role analyst_sp38730;
--raw roles
grant usage on database raw to role analyst_sp38730;
grant role raw_flight_rt_read to role analyst_sp38730;
grant role raw_sabre_pnr_rt_read to role analyst_sp38730;
grant role raw_sabre_ticket_rt_read to role analyst_sp38730;
grant role raw_sabre_acs_rt_read to role analyst_sp38730;
grant role raw_customers_rt_read to role analyst_sp38730;
grant role raw_loyalty_rt_read to role analyst_sp38730;
grant role raw_baggage_read to role analyst_sp38730;
grant role raw_salesforce_poc_read to role analyst_sp38730;
grant role raw_salesforce_read to role analyst_sp38730;
-- check_ins_rt
grant usage on database analytics to role analyst_sp38730;
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_sp38730;
grant select on view analytics.stg_sabre_acs_rt.passengers to role analyst_sp38730;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_sp38730;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_sp38730;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_sp38730;
--sentitive roles
grant role sensitive_analytics_prd__flightkeys to role analyst_sp38730;
grant role sensitive_analytics_prd__flight_plan_manager to role analyst_sp38730;
grant role sensitive_analytics_prd__stg_flight_plan_manager to role analyst_sp38730;
grant role sensitive_analytics_prd__intermediary__inter_analytics__flight_plans_flightkeys to role analyst_sp38730;
grant role sensitive_analytics_prd__bookings to role analyst_sp38730;
grant role sensitive_analytics_prd__bookings_rt to role analyst_sp38730;
grant role sensitive_analytics_prd__tickets to role analyst_sp38730;
grant role sensitive_analytics_prd__tickets_rt to role analyst_sp38730;
grant role sensitive_analytics_prd__check_ins to role analyst_sp38730;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_sp38730;
grant role sensitive_analytics_prd__reference to role analyst_sp38730;
grant role sensitive_analytics_prd__notification_manager to role analyst_sp38730;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_sp38730;
grant role sensitive_analytics_prd__crew to role analyst_sp38730;
grant role sensitive_analytics_prd__stg_crew to role analyst_sp38730;
grant role sensitive_analytics_prd__loyalty to role analyst_sp38730;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_sp38730;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_sp38730;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_sp38730;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_sp38730;
--other roles
grant role "IT ENTERPRISE ARCHITECTURE BP" to role analyst_sp38730;
grant role "IT ENTERPRISE ARCHITECTURE CM" to role analyst_sp38730;
grant role analyst_sp38730 to role sysadmin;
grant role analyst_sp38730 to user "SP38730@JETBLUE.COM";

-- analyst_sp53890(Samnang Peou)
create role if not exists analyst_sp53890;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sp53890') }}
{% endif %}
grant role analyst to role analyst_sp53890;
grant role itdataengineeringcrew to role analyst_sp53890;
grant role itdataproductscrew to role analyst_sp53890;
grant role laxsnowflake to role analyst_sp53890;
grant role analytics_cobrand_read to role analyst_sp53890;
grant role sensitive_analytics_prd__cobrand to role analyst_sp53890;
grant role sensitive_analytics_prd__crewqual__med_data to role analyst_sp53890;
grant role sensitive_analytics_prd__crewqual__pilot_employee to role analyst_sp53890;
grant role sensitive_analytics_prd__crewqual__pilot_entry to role analyst_sp53890;
grant role sensitive_analytics_prd__crewqual__pilot_time to role analyst_sp53890;
grant role byod_it_security_crew to role analyst_sp53890;
grant role analyst_sp53890 to role sysadmin;
grant role analyst_sp53890 to user "SP53890@JETBLUE.COM";

-- analyst_ss36482(Sarah Sargent)
create role if not exists analyst_ss36482;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ss36482') }}
{% endif %}
grant role analyst to role analyst_ss36482;
grant role "WPA TEAM" to role analyst_ss36482;
grant role sensitive_analytics_prd__analytics to role analyst_ss36482;
grant role analyst_ss36482 to role sysadmin;
grant role analyst_ss36482 to user "SS36482@JETBLUE.COM";

-- analyst_sc38888 ( Crawford, Shari )
create role if not exists analyst_sc38888;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sc38888') }}
{% endif %}
grant role analyst to role analyst_sc38888;
-- ANALYTICS_CLONE
grant usage on database analytics_clone to role analyst_sc38888;
-- ANALYTICS_CLONE.DATA_EXPORTS
grant usage on schema analytics_clone.data_exports to role analyst_sc38888;
grant select on view analytics_clone.data_exports.qualtrics_customer_enhancement to role analyst_sc38888;
-- BYOD
grant usage on database byod to role analyst_sc38888;
-- BYOD.WPA
grant usage on schema byod.wpa to role analyst_sc38888;
grant select on future tables in schema byod.wpa to role analyst_sc38888;
grant select on table byod.wpa.mnl to role analyst_sc38888;
grant select on table byod.wpa.bpo_mnl to role analyst_sc38888;
-- BYOD.OPA
grant usage on schema byod.opa to role analyst_sc38888;
grant select on table byod.opa.regions to role analyst_sc38888;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__analytics__loyalty_fact to role analyst_sc38888;
grant role sensitive_analytics_prd__crew to role analyst_sc38888;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_sc38888;
grant role sensitive_analytics_prd__stg_loyalty_rt__member_profile to role analyst_sc38888;
grant role sensitive_analytics_prd__stg_sap_reports to role analyst_sc38888;
grant role sensitive_analytics_prd__data_exports__qualtrics_flights_and_customers_joined__email_address to role analyst_sc38888;
grant role sensitive_analytics_prd__data_exports__qualtrics_flights_and_customers_joined__passenger_first_name to role analyst_sc38888;
grant role sensitive_analytics_prd__data_exports__qualtrics_flights_and_customers_joined__passenger_last_name to role analyst_sc38888;
grant role analyst_sc38888 to role sysadmin;
grant role analyst_sc38888 to user "SC38888@JETBLUE.COM";

-- analyst_sparthasarat (Sethuraman Parthasarathy)
create role if not exists analyst_sparthasarat; 
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sparthasarat') }}
{% endif %}
grant role analyst to role analyst_sparthasarat;
grant role tcsdataengineering to role analyst_sparthasarat;
-- ANALYTICS
grant role analytics_stg_aircom_read to role analyst_sparthasarat;
grant usage on schema analytics.stg_datacamp to role analyst_sparthasarat;
grant select on all tables in schema analytics.stg_datacamp to role analyst_sparthasarat;
grant select on all views in schema analytics.stg_datacamp to role analyst_sparthasarat;
grant select on future tables in schema analytics.stg_datacamp to role analyst_sparthasarat;
grant select on future views in schema analytics.stg_datacamp to role analyst_sparthasarat;
grant usage on schema analytics.stg_crewqual to role analyst_sparthasarat;
grant select on all tables in schema analytics.stg_crewqual to role analyst_sparthasarat;
grant select on all views in schema analytics.stg_crewqual to role analyst_sparthasarat;
grant select on future tables in schema analytics.stg_crewqual to role analyst_sparthasarat;
grant select on future views in schema analytics.stg_crewqual to role analyst_sparthasarat;
grant usage on schema analytics.performitiv to role analyst_sparthasarat;
grant select on table analytics.performitiv.survey_data to role analyst_sparthasarat;
-- sensitive
grant role sensitive_analytics_prd__performitiv__survey_data to role analyst_sparthasarat;
-- ANALYTICS_CLONE ROLES
grant role analytics_clone_read to role analyst_sparthasarat;
-- ANALYTICS_qa.CREWQUAL
grant role analytics_qa_crewqual_read to role analyst_sparthasarat;
-- ANALYTICS_QA.STG_CREWQUAL 
grant usage on schema analytics_qa.stg_crewqual to role analyst_sparthasarat;
grant select on all tables in schema analytics_qa.stg_crewqual to role analyst_sparthasarat;
grant select on all views in schema analytics_qa.stg_crewqual to role analyst_sparthasarat;
grant select on future tables in schema analytics_qa.stg_crewqual to role analyst_sparthasarat;
grant select on future views in schema analytics_qa.stg_crewqual to role analyst_sparthasarat;
-- raw
grant usage on schema raw.performitiv to role analyst_sparthasarat;
grant select on table raw.performitiv.survey_data to role analyst_sparthasarat;
grant monitor on task raw.performitiv.task__performitiv__survey_data to role analyst_sparthasarat;
-- RAW Roles
grant role raw_aircom_read to role analyst_sparthasarat;
grant role raw_dbt_read to role analyst_sparthasarat;
grant role raw_datacamp_read to role analyst_sparthasarat;
grant usage on schema raw.crewqual to role analyst_sparthasarat;
grant usage on database raw to role analyst_sparthasarat;
grant role analyst_sparthasarat to role sysadmin;
grant role analyst_sparthasarat to user "SPARTHASARAT@JETBLUE.COM";

-- analyst_sf64859 (Stephen Fuller)
create role if not exists analyst_sf64859;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sf64859') }}
{% endif %}
grant role analyst to role analyst_sf64859;
grant role BLUELOYALTY to role analyst_sf64859;
grant role COBRANDLOYALTYTEAM to role analyst_sf64859;
-- ANALYTICS.BCUS_TRANSACTIONS
grant role analytics_bcus_transactions_read to role analyst_sf64859;
-- ANALYTICS_CLONE.BCUS_TRANSACTIONS
grant usage on database analytics_clone to role analyst_sf64859;
grant usage on schema analytics_clone.bcus_transactions to role analyst_sf64859;
grant select on all tables in schema analytics_clone.bcus_transactions to role analyst_sf64859;
grant select on all views in schema analytics_clone.bcus_transactions to role analyst_sf64859;
grant select on future tables in schema analytics_clone.bcus_transactions to role analyst_sf64859;
grant select on future views in schema analytics_clone.bcus_transactions to role analyst_sf64859;
grant select on table analytics_clone.bcus_transactions.barclays_card_transactions to role analyst_sf64859;
-- CCI_SHARE
grant imported privileges on database cci_share to role analyst_sf64859;
-- sensitive roles
grant role sensitive_analytics_prd__cybersource_payments to role analyst_sf64859;
grant role sensitive_analytics_prd__cobrand to role analyst_sf64859;
-- byod
grant usage on database byod to role analyst_sf64859;
-- byod.bluerevforecasting
grant role byod_bluerevforecasting_read to role analyst_sf64859;
-- byod.bluemktanalytics
grant role "BYOD_BLUEMKTANALYTICS_READ" to role analyst_sf64859;
-- byod.itdatascience
grant usage on schema byod.itdatascience to role analyst_sf64859;
grant select on table byod.itdatascience.mdm_homezip_lookup to role analyst_sf64859;
-- shared database SIMON_DATA_SHARE
grant role simon_data_share_read to role analyst_sf64859;
-- raw database
grant usage on database raw to role analyst_sf64859;
-- raw.avaya_cms
grant usage on schema raw.avaya_cms to role analyst_sf64859;
grant select on table raw.avaya_cms.dsplit to role analyst_sf64859;
grant role analyst_sf64859 to role sysadmin;
grant role analyst_sf64859 to user "SF64859@JETBLUE.COM";

--analyst_sguntuku (Sangeetha Guntuku)
create role if not exists analyst_sguntuku; 
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sguntuku') }}
{% endif %}
grant role analyst to role analyst_sguntuku;
grant role "IT PRODUCT ENGINEERING DOMAINS" to role analyst_sguntuku;
grant role analyst_sguntuku to role sysadmin;
grant role analyst_sguntuku to user "SGUNTUKU@JETBLUE.COM";

-- analyst_sgupta (Suyash Gupta)
create role if not exists analyst_sgupta;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sgupta') }}
{% endif %}
grant role analyst to role analyst_sgupta;
grant role analyst_qa to role analyst_sgupta;
grant role "IT OPS PRODUCTS SOC MODERNIZATION" to role analyst_sgupta;
grant role analyst_sgupta to role sysadmin;
grant role analyst_sgupta to user "SGUPTA@JETBLUE.COM";

-- analyst_shakhan (Shahid Khan)
create role if not exists analyst_shakhan;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_shakhan') }}
{% endif %}
grant role analyst to role analyst_shakhan;
grant role EWRLeadership to role analyst_shakhan;
grant role analyst_shakhan to role sysadmin;
grant role analyst_shakhan to user "SHAKHAN@JETBLUE.COM";

--analyst_SK01964(Saif Karim)
create role if not exists analyst_sk01964;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sk01964') }}
{% endif %}
grant role analyst to role analyst_sk01964;
grant role tableauonlinecreator to role analyst_sk01964;
grant role "BLUE MARKETING ALL" to role analyst_sk01964; 
grant role blueloyalty to role analyst_sk01964;
grant role COBRANDLOYALTYTEAM to role analyst_sk01964;
grant role sensitive_analytics_prd__cobrand__spend to role analyst_sk01964;
grant role analyst_sk01964 to role sysadmin;
grant role analyst_sk01964 to user "SK01964@JETBLUE.COM";

-- analyst_sm60415 (Shamirk Mella)
create role if not exists analyst_sm60415;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sm60415') }}
{% endif %}
grant role analyst to role analyst_sm60415;
grant role CREWPLANNINGDL to role analyst_sm60415;
grant role CREWPLANNING_PAIRINGS to role analyst_sm60415;
grant role SNOWFLAKEANALYST to role analyst_sm60415;
-- BYOD
grant usage on database byod to role analyst_sm60415;
--BYOD.OPA
grant usage on schema byod.opa to role analyst_sm60415;
grant select on table byod.opa.PRG_crew_base to role analyst_sm60415;
grant select on table byod.opa.PRG_duty to role analyst_sm60415;
grant select on table byod.opa.PRG_FAR117_A to role analyst_sm60415;
grant select on table byod.opa.PRG_File to role analyst_sm60415;
grant select on table byod.opa.PRG_Pairing to role analyst_sm60415;
grant select on table byod.opa.PRG_segment to role analyst_sm60415;
grant select on table byod.opa.PRG_Special_Qualifications to role analyst_sm60415;
grant select on view byod.opa.PRG_processed_segment to role analyst_sm60415;
grant role analyst_sm60415 to role sysadmin;
grant role analyst_sm60415 to user "SM60415@JETBLUE.COM";

-- analyst_smaguluri (Sreeram Maguluri)
create role if not exists analyst_smaguluri;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_smaguluri') }}
{% endif %}
grant role analyst to role analyst_smaguluri;
grant role "IT ENTERPRISE ARCHITECTURE BP" to role analyst_smaguluri;
grant role sensitive_sabre_pnr_read to role analyst_smaguluri;
grant role sensitive_sabre_acs_read to role analyst_smaguluri;
grant role sensitive_customers_rt_read to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__account_merges to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__account_merge_history to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__blue_guardian to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__blue_guardian_monte_carlo to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__card_moves to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__card_move_history to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__comarch_trueblue_accounts to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__corporate to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__corporate_history to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__member_profiles to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__member_profile_history to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__partners to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__redemptions to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_smaguluri;
grant role sensitive_analytics_prd__loyalty__users to role analyst_smaguluri;
grant role analyst_smaguluri to user "SMAGULURI@JETBLUE.COM";

-- analyst_sr71539 (Shailaja Radhakrishnan)
create role if not exists analyst_sr71539;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sr71539') }}
{% endif %}
grant role analyst to role analyst_sr71539;
grant role "IT COBRAND & EMAIL" to role analyst_sr71539;
grant role sensitive_analytics_prd__cobrand to role analyst_sr71539;
grant role sensitive_analytics_prd__loyalty to role analyst_sr71539;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_sr71539;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_sr71539;
grant role analyst_sr71539 to role sysadmin;
grant role analyst_sr71539 to user "SR71539@JETBLUE.COM";

-- analyst_sshingade (Shubham Shingade)
create role if not exists analyst_sshingade;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sshingade') }}
{% endif %}
grant role analyst to role analyst_sshingade;
grant role "ITDATAQA-NONPROD" to role analyst_sshingade;
-- ANALYTICS.STG_JBU
grant role analytics_stg_jbu_read to role analyst_sshingade;
-- ANALYTICS_DEV
grant usage on database analytics_dev to role analyst_sshingade;
-- ANALYTICS_DEV.SABRE_REVENUE_INTEGRITY
grant usage on schema analytics_dev.sabre_revenue_integrity to role analyst_sshingade;
grant select on all tables in schema analytics_dev.sabre_revenue_integrity to role analyst_sshingade;
grant select on all views in schema analytics_dev.sabre_revenue_integrity to role analyst_sshingade;
grant select on future tables in schema analytics_dev.sabre_revenue_integrity to role analyst_sshingade;
grant select on future views in schema analytics_dev.sabre_revenue_integrity to role analyst_sshingade;
-- ANALYTICS_DEV.TICKET_AUDITS_ATPCO
grant usage on schema analytics_dev.ticket_audits_atpco to role analyst_sshingade;
grant select on table analytics_dev.ticket_audits_atpco.base_sales to role analyst_sshingade;
grant select on table analytics_dev.ticket_audits_atpco.coupon_tax to role analyst_sshingade;
grant select on table analytics_dev.ticket_audits_atpco.financials to role analyst_sshingade;
grant select on table analytics_dev.ticket_audits_atpco.itineraries to role analyst_sshingade;
grant select on table analytics_dev.ticket_audits_atpco.marketings to role analyst_sshingade;
-- ANALYTICS_QA
grant usage on database analytics_qa to role analyst_sshingade;
-- ANALYTICS_QA.TICKET_AUDITS_ATPCO
grant usage on schema analytics_qa.ticket_audits_atpco to role analyst_sshingade;
grant select on table analytics_qa.ticket_audits_atpco.coupon_tax to role analyst_sshingade;
grant select on table analytics_qa.ticket_audits_atpco.financials to role analyst_sshingade;
grant select on table analytics_qa.ticket_audits_atpco.itineraries to role analyst_sshingade;
grant select on table analytics_qa.ticket_audits_atpco.marketings to role analyst_sshingade;
-- ANALYTICS_QA.SABRE_REVENUE_INTEGRITY
grant usage on schema analytics_qa.sabre_revenue_integrity to role analyst_sshingade;
grant select on all tables in schema analytics_qa.sabre_revenue_integrity to role analyst_sshingade;
grant select on all views in schema analytics_qa.sabre_revenue_integrity to role analyst_sshingade;
grant select on future tables in schema analytics_qa.sabre_revenue_integrity to role analyst_sshingade;
grant select on future views in schema analytics_qa.sabre_revenue_integrity to role analyst_sshingade;
-- ANALYTICS_QA.STG_CASS
grant role analytics_qa_stg_cass_read to role analyst_sshingade;
--RAW_JBU
grant role raw_jbu_read to role analyst_sshingade;
-- RAW.ACCOMMODATIONS_PLUS_INTERNATIONAL
grant usage on schema raw.accommodations_plus_international to role analyst_sshingade;
grant select on table raw.accommodations_plus_international.crew_hotels_actuals_report to role analyst_sshingade;
-- RAW.FLIGHTKEYS
grant usage on schema raw.flightkeys to role analyst_sshingade;
grant select on table raw.flightkeys.arinc633 to role analyst_sshingade;
-- RAW ROLES
grant role raw_sabre_revenue_integrity_read to role analyst_sshingade;
-- RAW_DEV
grant usage on database raw_dev to role analyst_sshingade;
-- RAW_DEV.SABRE_REVENUE_INTEGRITY 
grant usage on schema raw_dev.sabre_revenue_integrity to role analyst_sshingade;
grant select on all tables in schema raw_dev.sabre_revenue_integrity to role analyst_sshingade;
grant select on all views in schema raw_dev.sabre_revenue_integrity to role analyst_sshingade;
grant select on future tables in schema raw_dev.sabre_revenue_integrity to role analyst_sshingade;
-- RAW_QA
grant usage on database raw_qa to role analyst_sshingade;
-- RAW_QA.SABRE_REVENUE_INTEGRITY
grant usage on schema raw_qa.sabre_revenue_integrity to role analyst_sshingade;
grant select on all tables in schema raw_qa.sabre_revenue_integrity to role analyst_sshingade;
grant select on all views in schema raw_qa.sabre_revenue_integrity to role analyst_sshingade;
grant select on future tables in schema raw_qa.sabre_revenue_integrity to role analyst_sshingade;
grant select on future views in schema raw_qa.sabre_revenue_integrity to role analyst_sshingade;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__accommodations_plus_international__crew_hotels_actuals_report to role analyst_sshingade;
grant role sensitive_analytics_prd__stg_accommodations_plus_international__crew_hotels_actuals_report to role analyst_sshingade;
grant role sensitive_analytics_prd__stg_jbu to role analyst_sshingade;
grant role sensitive_analytics_prd__training to role analyst_sshingade;
grant role sensitive_analytics_qa__flightkeys__flight_info to role analyst_sshingade;
grant role sensitive_analytics_qa__flightkeys__flight_info_crew_list to role analyst_sshingade;
grant role sensitive_analytics_qa__flightkeys__flight_plan_header to role analyst_sshingade;
grant role sensitive_analytics_qa__intermediary__inter_flightkeys__flight_info_crew_list to role analyst_sshingade;
grant role sensitive_analytics_qa__intermediary__inter_flightkeys__flight_plan_header to role analyst_sshingade;
grant role sensitive_analytics_qa__stg_atpco__base_sales__passenger_name to role analyst_sshingade;
grant role sensitive_analytics_qa__stg_flightkeys__flight_info to role analyst_sshingade;
grant role sensitive_analytics_qa__stg_flightkeys__flight_info_crew_list to role analyst_sshingade;
grant role sensitive_analytics_qa__stg_flightkeys__flight_plan_header to role analyst_sshingade;
grant role sensitive_analytics_qa__ticket_audits__base_sale__passenger_name to role analyst_sshingade;
grant role sensitive_analytics_qa__ticket_audits_atpco__base_sales__passenger_name to role analyst_sshingade;
grant role sensitive_analytics_prd__stg_cass to role analyst_sshingade;
grant role analyst_sshingade to role sysadmin;
grant role analyst_sshingade to user "SSHINGADE@JETBLUE.COM";

-- analyst_ss94053 (Stephanie Sandberg)
create role if not exists analyst_ss94053;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ss94053') }}
{% endif %}
grant role analyst to role analyst_ss94053;
--byod roles
grant usage on database byod to role analyst_ss94053;
grant usage on schema byod.opa to role analyst_ss94053;
grant select on table byod.opa.goals_station to role analyst_ss94053;
grant select on table byod.opa.mishandled_baggage to role analyst_ss94053; 
grant select on view byod.opa.vw_b6_bluestats to role analyst_ss94053;
grant select on view byod.opa.vw_station_performance_vs_goal to role analyst_ss94053;
grant select on view byod.opa.vw_controllable_cancels_delays_for_fpa to role analyst_ss94053;
grant role byod_airport_standards_read to role analyst_ss94053;
--other roles
grant role "BLUEFP&A" to role analyst_ss94053;
grant role "WPA LEADERSHIP" to role analyst_ss94053;
grant role "WPA TEAM" to role analyst_ss94053;
grant role "J5PRODKBANALYST" to role analyst_ss94053;
grant role analyst_ss94053 to role sysadmin;
grant role analyst_ss94053 to user "SS94053@JETBLUE.COM";

-- analyst_shmenon (Shankar Menon)
create role if not exists analyst_shmenon;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_shmenon') }}
{% endif %}
grant role analyst to role analyst_shmenon;
grant role analyst_itqualityassurance_nonprod to role analyst_shmenon;
grant role "ITDATAQA-PROD" to role analyst_shmenon;
grant role "IT ENTERPRISE QUALITY ASSURANCE" to role analyst_shmenon;
grant role "ITDATAQA-NONPROD" to role analyst_shmenon;
grant role sensitive_sabre_pnr_read to role analyst_shmenon;
grant role sensitive_analytics_prd__ticket_audits to role analyst_shmenon;
grant role sensitive_analytics_prd__vouchers to role analyst_shmenon;
grant role sensitive_analytics_prd__tickets to role analyst_shmenon;
grant role sensitive_analytics_prd__stg_ifsa_rt to role analyst_shmenon;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers to role analyst_shmenon;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_incentive_payout_history to role analyst_shmenon;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_seats_ancillary_report to role analyst_shmenon;
grant role sensitive_analytics_prd__data_exports__airports_commission_incentive_payout to role analyst_shmenon;
grant role sensitive_analytics_prd__employee_profile_record__header to role analyst_shmenon;
grant role sensitive_analytics_prd__analytics__ancillaries_fact to role analyst_shmenon;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_shmenon;
-- analytics.stg_ifsa_rt
grant usage on schema analytics.stg_ifsa_rt to role analyst_shmenon;
grant select on all views in schema analytics.stg_ifsa_rt to role analyst_shmenon; 
grant select on future views in schema analytics.stg_ifsa_rt to role analyst_shmenon;
grant select on all tables in schema analytics.stg_ifsa_rt to role analyst_shmenon;
grant select on future tables in schema analytics.stg_ifsa_rt to role analyst_shmenon;
-- analytics_clone
grant usage on database analytics_clone to role analyst_shmenon;
-- analytics_clone.aircraft_maintenance
grant usage on schema analytics_clone.aircraft_maintenance  to role  analyst_shmenon;
grant select on all tables in schema analytics_clone.aircraft_maintenance to role  analyst_shmenon;
grant select on all views in schema analytics_clone.aircraft_maintenance to role  analyst_shmenon;
grant select on future tables in schema analytics_clone.aircraft_maintenance  to role  analyst_shmenon;
grant select on future views in schema analytics_clone.aircraft_maintenance  to role  analyst_shmenon;
grant role raw_bill_of_rights_read to role analyst_shmenon;
-- analytics_qa.tickets PII roles
grant role analyst_shmenon to role sysadmin;
grant role analyst_shmenon to user "SHMENON@JETBLUE.COM"; 

--  analyst_sk02100 (Sean Kelly)
create role if not exists analyst_sk02100;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sk02100') }}
{% endif %}
grant role analyst to role analyst_sk02100;
grant role jbudisp to role analyst_sk02100;
-- analytics.stg_flightkeys
grant usage on schema analytics.stg_flightkeys to role analyst_sk02100;
grant select on view analytics.stg_flightkeys.flight_plan_header to role analyst_sk02100;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__flightkeys__flight_plan_header__author_name to role analyst_sk02100;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header__author_name to role analyst_sk02100;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header__author_name to role analyst_sk02100;
grant role sensitive_analytics_prd__flightkeys__flight_plan_header to role analyst_sk02100;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header to role analyst_sk02100;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header to role analyst_sk02100;
-- BYOD.OPA
grant role byod_opa_read to role analyst_sk02100;
grant role analyst_sk02100 to role sysadmin;
grant role analyst_sk02100 to user "SK02100@JETBLUE.COM";

--  analyst_sk23447 (Sofie Kizel)
create role if not exists analyst_sk23447;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sk23447') }}
{% endif %}
grant role analyst to role analyst_sk23447;
grant role BLUEMARKETING to role analyst_sk23447;
grant role byod_bluemktanalytics_read to role analyst_sk23447;
grant role simon_data_share_read to role analyst_sk23447;
grant role analyst_sk23447 to role sysadmin;
grant role analyst_sk23447 to user "SK23447@JETBLUE.COM";

-- analyst_ssundar (Shyam Sundar)
create role if not exists analyst_ssundar;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ssundar') }}
{% endif %}
grant role analyst to role analyst_ssundar;
grant role tcsdataengineering to role analyst_ssundar;
--ANALYTICS.CREW_PAY
grant usage on schema analytics.crew_pay to role analyst_ssundar;
grant select on all tables in schema analytics.crew_pay to role analyst_ssundar;
grant select on all views in schema analytics.crew_pay to role analyst_ssundar;
grant select on future tables in schema analytics.crew_pay to role analyst_ssundar;
grant select on future views in schema analytics.crew_pay to role analyst_ssundar;
-- ANALYTICS.SAFETY
grant role analytics_safety_read to role analyst_ssundar;
-- ANALYTICS.SPHERE
grant role analytics_sphere_read to role analyst_ssundar;
grant role analytics_stg_sphere_read to role analyst_ssundar;
-- raw.sphere
grant usage on schema raw.sphere to role analyst_ssundar;
grant select on all tables in schema raw.sphere to role analyst_ssundar;
-- RAW.CREW_SERVICES
grant role raw_crew_services_read to role analyst_ssundar;
-- ANALYTICS.STG_CREW_SERVICES
grant role analytics_stg_crew_services_read to role analyst_ssundar;
-- ANALYTICS_QA.STG_TOPS_CREW
grant role analytics_qa_stg_tops_crew_read to role analyst_ssundar;
-- ANALYTICS_QA.TOPS_CREW
grant role analytics_qa_tops_crew_read to role analyst_ssundar;
-- ANALYTICS.STG_FLYR
grant usage on schema analytics.stg_flyr to role analyst_ssundar;
grant select on all tables in schema analytics.stg_flyr to role analyst_ssundar;
grant select on future tables in schema analytics.stg_flyr to role analyst_ssundar;
grant select on future views in schema analytics.stg_flyr to role analyst_ssundar;
-- analytics.stg_inflight_entertainment_read
grant role analytics_stg_inflight_entertainment_read to role analyst_ssundar;
--ANALYTICS_QA.STG_VISTAIR
grant usage on schema analytics_qa.stg_vistair to role analyst_ssundar;
grant select on all views in schema analytics_qa.stg_vistair to role analyst_ssundar;
grant select on future views in schema analytics_qa.stg_vistair to role analyst_ssundar;
--ANALYTICS_QA.SAFETY
grant usage on schema analytics_qa.safety to role analyst_ssundar;
grant select on all tables in schema analytics_qa.safety to role analyst_ssundar;
grant select on future tables in schema analytics_qa.safety to role analyst_ssundar;
grant select on all views in schema analytics_qa.safety to role analyst_ssundar;
grant select on future views in schema analytics_qa.safety to role analyst_ssundar;
--raw roles
grant select on table raw.flyr.daily_metrics to role analyst_ssundar;
grant role raw_flyr_read to role analyst_ssundar;
grant role raw_rainmaker_read to role analyst_ssundar;
grant role raw_inflight_entertainment_read to role analyst_ssundar;
-- vistair shared db access
grant imported privileges on database vistair to role analyst_ssundar;
grant role analyst_ssundar to role sysadmin;
grant role analyst_ssundar to user "SSUNDAR@JETBLUE.COM";

-- analyst_sb91896 (Shawn Bankert)
create role if not exists analyst_sb91896;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sb91896') }}
{% endif %}
grant role analyst to role analyst_sb91896;
grant role LOYALTYTECHSUPPORT to role analyst_sb91896;
-- pii roles
grant role sensitive_analytics_prd__loyalty to role analyst_sb91896;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_sb91896;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_sb91896;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_sb91896;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_sb91896;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_sb91896;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_sb91896;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_sb91896;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_sb91896;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_sb91896;
-- analytics.stg_loyalty
grant role analytics_stg_loyalty_read to role analyst_sb91896;
-- analytics.stg_loyalty_rt
grant role analytics_stg_loyalty_rt_read to role analyst_sb91896;
-- byod.blueloyalty
grant role byod_blueloyalty_read to role analyst_sb91896;
grant role analyst_sb91896 to role sysadmin;
grant role analyst_sb91896 to user "SB91896@JETBLUE.COM";

-- analyst_sm15158 (Stephanie Mercurio)
create role if not exists analyst_sm15158;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sm15158') }}
{% endif %}
grant role analyst to role analyst_sm15158;
grant role analytics_stg_loyalty_read to role analyst_sm15158;
grant role analytics_stg_loyalty_rt_read to role analyst_sm15158;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_sm15158;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_sm15158;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_sm15158;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_sm15158;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_sm15158;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_sm15158;
grant role sensitive_analytics_prd__loyalty to role analyst_sm15158;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_sm15158;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_sm15158;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_sm15158;
-- byod
-- byod.blueloyalty
grant role byod_blueloyalty_read to role analyst_sm15158;
-- byod.sales
grant usage on schema byod.sales to role analyst_sm15158;
grant all on table byod.sales.loyalty_partner_transaction_detail to role analyst_sm15158;
grant all on table byod.sales.loyalty_partner_transaction_header to role analyst_sm15158;
grant all on table byod.sales.sb_tb_blocked_emails to role analyst_sm15158;
grant all on table byod.sales.sb_tb_mfa to role analyst_sm15158;
grant all on table byod.sales.tb_sb_stored_card to role analyst_sm15158;
grant role analyst_sm15158 to role sysadmin;
grant role analyst_sm15158 to user "SM15158@JETBLUE.COM";

-- analyst_spatel (Saumin Patel)
create role if not exists analyst_spatel;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_spatel') }}
{% endif %}
grant role analyst to role analyst_spatel;
grant role "IT ENTERPRISE QUALITY ASSURANCE" to role analyst_spatel;
grant role "IT EQA GLOBAL TEAM" to role analyst_spatel;
grant role "ITDATAQA-NONPROD" to role analyst_spatel;
grant role "ITDATAQA-PROD" to role analyst_spatel;
grant role crew_domain to role analyst_spatel;
grant role itqualityassurancedw to role analyst_spatel;
-- RAW_QA
grant usage on database raw_qa to role analyst_spatel;
-- raw_qa.crewqual
grant usage on database raw_qa to role analyst_spatel;
grant usage on schema raw_qa.crewqual to role analyst_spatel;
grant select on table raw_qa.crewqual.pilot_entry to role analyst_spatel;
grant select on table raw_qa.crewqual.pilot_employee to role analyst_spatel;
-- RAW_QA.CREWQUAL
grant usage on schema raw_qa.crewqual to role analyst_spatel;
grant select on table raw_qa.crewqual.med_data to role analyst_spatel;
grant select on table raw_qa.crewqual.pilot_time to role analyst_spatel;
-- SENSITIVE ROLES
grant role sensitive_analytics_qa__crewqual__med_data to role analyst_spatel;
grant role sensitive_analytics_qa__crewqual__pilot_time to role analyst_spatel;
grant role sensitive_analytics_qa__crewqual__pilot_employee to role analyst_spatel;
grant role sensitive_analytics_qa__crewqual__pilot_entry to role analyst_spatel;
grant role analyst_spatel to role sysadmin;
grant role analyst_spatel to user "SPATEL@JETBLUE.COM";

-- analyst_su00131 (Sumaiya Urboshe)
create role if not exists analyst_su00131;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_su00131') }}
{% endif %}
grant role analyst to role analyst_su00131;
grant role BLUERM to role analyst_su00131;
grant role ANALYST_BLUERM to role analyst_su00131;
grant role analyst_su00131 to role sysadmin;
grant role analyst_su00131 to user "SU00131@JETBLUE.COM";

-- analyst_skore(Suraj Kore)
create role if not exists analyst_skore;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_skore') }}
{% endif %}
grant role analyst to role analyst_skore;
grant role "IT EQA GLOBAL TEAM" to role analyst_skore;
-- analytics_qa
grant usage on database analytics_qa to role analyst_skore;
grant usage on schema analytics_qa.customers_rt to role analyst_skore;
grant select on view analytics_qa.customers_rt.jetblue_accounts to role analyst_skore;
grant usage on schema analytics_qa.stg_customers_rt to role analyst_skore;
grant select on view analytics_qa.stg_customers_rt.jetblue_accounts to role analyst_skore;
grant usage on schema analytics_qa.intermediary to role analyst_skore;
grant select on table analytics_qa.intermediary.inter_credit_profiles_rt__jetblue_accounts to role analyst_skore;
grant select on view analytics_qa.customers_rt.jetblue_accounts_history to role analyst_skore;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_skore;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_skore;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_skore;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_skore;
grant select on table analytics_qa.intermediary.inter_credit_issuing_tool__credit_request to role analyst_skore;
-- raw_qa
grant usage on database raw_qa to role analyst_skore;
grant usage on schema raw_qa.credit_profiles_rt to role analyst_skore;
grant select on table raw_qa.credit_profiles_rt.jetblue_accounts to role analyst_skore;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_skore;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_skore;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_skore;
-- sensitive
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts to role analyst_skore;
grant role sensitive_analytics_qa__stg_customers_rt__jetblue_accounts to role analyst_skore;
grant role sensitive_analytics_qa__intermediary__inter_credit_profiles_rt__jetblue_accounts to role analyst_skore;
grant role sensitive_analytics_qa__customers_rt__jetblue_accounts_history to role analyst_skore;
grant usage on database analytics_qa to role analyst_skore;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_skore;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_skore;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_skore;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_skore;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_skore; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_skore;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_skore;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_skore;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_skore;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_skore;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_skore;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_skore;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_skore;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_skore;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_skore;
grant usage on database raw_qa to role analyst_skore;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_skore;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_skore;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_skore;
grant usage on database raw to role analyst_skore;
grant usage on schema raw.c3po_audit_logs to role analyst_skore;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_skore;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_skore;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_skore;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_skore;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_skore;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_skore;
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_skore;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_skore;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_skore;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_skore;
grant role analyst_skore to role sysadmin;
grant role analyst_skore to user "SKORE@JETBLUE.COM";

-- analyst_sr67343 (susan reyes)
create role if not exists analyst_sr67343;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sr67343') }}
{% endif %}
grant role analyst to role analyst_sr67343;
grant role bluerevforecasting to role analyst_sr67343;
grant role bluerm to role analyst_sr67343;
grant role itdataengineeringcrew to role analyst_sr67343;
grant role itdataproductscrew to role analyst_sr67343;
grant role analytics_stg_planitas_read to role analyst_sr67343;
grant role raw_planitas_read to role analyst_sr67343;
grant role analyst_sr67343 to role sysadmin;
grant role analyst_sr67343 to user "SR67343@JETBLUE.COM";

-- analyst_sl08930(Sungjin Lee)
create role if not exists analyst_sl08930;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sl08930') }}
{% endif %}
grant role analyst to role analyst_sl08930;
grant role itdatasciencecrew to role analyst_sl08930;
grant usage on schema analytics.stg_customers_rt to role analyst_sl08930;
grant select on view analytics.stg_customers_rt.postal_addresses to role analyst_sl08930;
grant role sensitive_analytics_prd__customers_rt__postal_addresses to role analyst_sl08930;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__postal_addresses to role analyst_sl08930;
grant role sensitive_analytics_prd__stg_customers_rt__postal_addresses to role analyst_sl08930; 
grant role analyst_sl08930 to role sysadmin;
grant role analyst_sl08930 to user "SL08930@JETBLUE.COM";

-- analyst_sy02018 (Sutong Yao)
create role if not exists analyst_sy02018;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sy02018') }}
{% endif %}
grant role analyst to role analyst_sy02018;
grant role "JBU SCHEDULING TEAM" to role analyst_sy02018;
grant role "TRAINING PLANNING" to role analyst_sy02018;
grant role byod_flight_ops_team_read to role analyst_sy02018;
grant role analyst_sy02018 to role sysadmin;
grant role analyst_sy02018 to user "SY02018@JETBLUE.COM";

-- analyst_tl40736 (Tom Lloyd)
create role if not exists analyst_tl40736;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_tl40736') }}
{% endif %}
grant role analyst to role analyst_tl40736;
grant usage on database byod to role analyst_tl40736;
grant usage on schema byod.opa to role analyst_tl40736;
grant select on view byod.opa.vw_atc_flight_analysis to role analyst_tl40736;
grant role byod_opa_read to role analyst_tl40736;
-- masflight shared database
grant imported privileges on database masflight to role analyst_tl40736;
grant role analyst_tl40736 to role sysadmin;
grant role analyst_tl40736 to user "TL40736@JETBLUE.COM";

-- analyst_tl20909 (Tracey Langston)
create role if not exists analyst_tl20909;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_tl20909') }}
{% endif %}
grant role analyst to role analyst_tl20909;
-- byod
grant usage on database byod to role analyst_tl20909;
-- byod.cex_analytics
grant usage on schema byod.cex_analytics to role analyst_tl20909;
grant select on table byod.cex_analytics.sabre_ci_del_logs to role analyst_tl20909;
grant select on table byod.cex_analytics.sabre_ci_emails to role analyst_tl20909;
grant select on table byod.cex_analytics.sabre_ci_mstr to role analyst_tl20909;
grant select on table byod.cex_analytics.sabre_ci_multi_emails to role analyst_tl20909;
grant select on table byod.cex_analytics.sabre_ci_v2 to role analyst_tl20909;
grant select on table byod.cex_analytics.sabre_ci_v3 to role analyst_tl20909;
grant select on table byod.cex_analytics.sabre_merge_to_ffp_w_bt_20240828 to role analyst_tl20909;
grant role analyst_tl20909 to role sysadmin;
grant role analyst_tl20909 to user "TL20909@JETBLUE.COM";

-- analyst_susingh (Sunny Singh)
create role if not exists analyst_susingh;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_susingh') }}
{% endif %}
grant role analyst to role analyst_susingh;
grant role tcsdataops to role analyst_susingh;
grant role analyst_susingh to role sysadmin;
grant role analyst_susingh to user "SUSINGH@JETBLUE.COM";

-- analyst_zc94255 (Zachary Chase)
create role if not exists analyst_zc94255;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_zc94255') }}
{% endif %}
grant role analyst to role analyst_zc94255;
grant usage on database analytics_dev to role analyst_zc94255;
grant usage on database analytics_qa to role analyst_zc94255;
grant usage on schema analytics_dev.crew to role analyst_zc94255;
grant usage on schema analytics_dev.servicenow to role analyst_zc94255;
grant usage on schema analytics_qa.crew to role analyst_zc94255;
grant usage on schema analytics_qa.servicenow to role analyst_zc94255;
grant select on view analytics_dev.crew.crew_and_business_partners to role analyst_zc94255;
grant select on view analytics_qa.crew.crew_and_business_partners to role analyst_zc94255;
grant select on future views in schema analytics_dev.crew to role analyst_zc94255;
grant select on future tables in schema analytics_dev.servicenow to role analyst_zc94255;
-- sensitive roles
grant role sensitive_analytics_prd__crew__crew_and_business_partners to role analyst_zc94255;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_zc94255;
grant role sensitive_analytics_qa__crew__crew_and_business_partners to role analyst_zc94255;
grant role sensitive_analytics_qa__servicenow__system_users to role analyst_zc94255;
grant role sensitive_analytics_dev__crew__crew_and_business_partners to role analyst_zc94255;
grant role sensitive_analytics_dev__servicenow__system_users to role analyst_zc94255;
grant role analyst_zc94255 to role sysadmin;
grant role analyst_zc94255 to user "ZC94255@JETBLUE.COM";

-- analyst_svc_crewanalytics
create role if not exists analyst_svc_crewanalytics;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_crewanalytics') }}
{% endif %}
grant role crewanalytics to role analyst_svc_crewanalytics;
grant role byod_enterprise_planning to role analyst_svc_crewanalytics;
-- ANALYTICS.INTERMEDIARY
grant select on table analytics.intermediary.inter_pnr_rt__pnr_remark to role analyst_sp91352;
-- ANALYTICS.STG_SABRE_PNR_RT
grant select on view analytics.stg_sabre_pnr_rt.remark_snowflake to role analyst_sp91352;
-- ANALYTICS.STG_SABRE_PNR_RT
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_svc_crewanalytics;
grant select on view analytics.stg_sabre_pnr_rt.remark_snowflake to role analyst_svc_crewanalytics;
-- ANALYTICS.TICKETS_RT
grant select on table analytics.tickets_rt.passenger to role analyst_svc_crewanalytics;
-- BYOD
grant usage on database byod to role analyst_svc_crewanalytics;
-- BYOD.ENTERPRISE_PLANNING
grant usage on schema byod.enterprise_planning to role analyst_svc_crewanalytics;
grant select on all tables in schema byod.enterprise_planning to role analyst_svc_crewanalytics;
grant select on future tables in schema byod.enterprise_planning to role analyst_svc_crewanalytics;
grant select on all views in schema byod.enterprise_planning to role analyst_svc_crewanalytics;
grant select on future views in schema byod.enterprise_planning to role analyst_svc_crewanalytics;
-- RAW ROLES
grant usage on database raw to role analyst_svc_crewanalytics;
grant usage on schema raw.sap_reports to role analyst_svc_crewanalytics;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_svc_crewanalytics;
grant select on table raw.servicenow.kb_knowledge to role analyst_svc_crewanalytics;
grant usage on schema raw.sabre_pnr_rt to role analyst_sp91352;
grant select on table raw.sabre_pnr_rt.pnr to role analyst_sp91352;
grant select on table raw.sabre_pnr_rt.pnr_remark to role analyst_sp91352;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__bookings to role analyst_crewanalytics;
grant role sensitive_analytics_prd__bookings_rt to role analyst_crewanalytics;
grant role sensitive_analytics_prd__check_ins to role analyst_crewanalytics;
grant role sensitive_analytics_prd__check_ins_rt to role analyst_crewanalytics;
grant role sensitive_analytics_prd__tickets to role analyst_crewanalytics;
grant role sensitive_analytics_prd__tickets_rt to role analyst_crewanalytics;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark to role analyst_sp91352;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__remark_snowflake to role analyst_sp91352;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap__first_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap__last_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap__first_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap__last_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__tickets_rt__passenger__first_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__tickets_rt__passenger__last_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__tickets_rt__passenger__pnr_name_field to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger_snowflake__first_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger_snowflake__last_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__passenger_snowflake__pnr_name_field to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt__remark_snowflake__remark_text to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger__first_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger__last_name to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__intermediary__inter_tkt_rt__ticket_passenger__pnr_name_field to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__bookings_rt__remark__remark_text to role analyst_svc_crewanalytics;
grant role sensitive_analytics_prd__intermediary__inter_pnr_rt__pnr_remark__remark_text to role analyst_svc_crewanalytics;
grant role analyst_svc_crewanalytics to role sysadmin;
grant role analyst_svc_crewanalytics to user "SVC_CREWANALYTICS";

-- analyst_ta74165 (Tracy Rosas)
create role if not exists analyst_ta74165;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ta74165') }}
{% endif %}
grant role analyst to role analyst_ta74165;
grant role snowflakeanalyst to role analyst_ta74165;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__cass__request_log to role analyst_ta74165;
grant role analyst_ta74165 to role sysadmin;
grant role analyst_ta74165 to user "TA74165@JETBLUE.COM";

-- analyst_tm46277 (Tami Mahadevan)
create role if not exists analyst_tm46277;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_tm46277') }}
{% endif %}
grant role analyst to role analyst_tm46277;
grant role raw_sabre_pnr_rt_read to role analyst_tm46277;
grant role analyst_tm46277 to user "TM46277@JETBLUE.COM";

-- analyst_bc05616 (BJ Cantlupe)
create role if not exists analyst_bc05616;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bc05616') }}
{% endif %}
grant role analyst to role analyst_bc05616;
grant role "EGOR TEAM" to role analyst_bc05616;
grant role raw_sabre_pnr_rt_read to role analyst_bc05616;
grant role analyst_bc05616 to role sysadmin;
grant role analyst_bc05616 to user "BC05616@JETBLUE.COM";

-- analyst_kb14608(Kara Batson)
create role if not exists analyst_kb14608;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_kb14608') }}
{% endif %}
grant role analyst to role analyst_kb14608;
grant usage on schema byod.cex_analytics to role analyst_kb14608;
grant role byod_cex_analytics_read to role analyst_kb14608;
grant role "WPA TEAM" to role analyst_kb14608;
grant role J5PRODKBANALYST to role analyst_kb14608;
grant role TABLEAUONLINECREATOR to role analyst_kb14608;
grant role analyst_kb14608 to role sysadmin;
grant role analyst_kb14608 to user "KB14608@JETBLUE.COM";

-- analyst_tc89914 (Teresa Colunga)
create role if not exists analyst_tc89914;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_tc89914') }}
{% endif %}
grant role analyst to role analyst_tc89914;
grant role "CSS MODERNIZATION CORE TEAM" to role analyst_tc89914;
grant role "IT STRATEGIC PROGRAMS" to role analyst_tc89914;
grant role IXCORETEAM to role analyst_tc89914;
-- raw.salesforce_poc
grant role raw_salesforce_poc_read to role analyst_tc89914;
-- raw.salesforce
grant role raw_salesforce_read to role analyst_tc89914;
grant role analyst_tc89914 to role sysadmin;
grant role analyst_tc89914 to user "TC89914@JETBLUE.COM";

-- analyst_tissi (Tolga Issi)
create role if not exists analyst_tissi;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_tissi') }}
{% endif %}
grant role analyst to role analyst_tissi;
grant role "IT DIGITAL OPERATIONS" to role analyst_tissi;
grant usage on database analytics_qa to role analyst_tissi;
-- analytics.bcus_transactions
grant usage on schema analytics.bcus_transactions to role analyst_tissi;
grant select on table analytics.bcus_transactions.barclays_card_transactions to role analyst_tissi;
-- ANALYTICS_CLONE
grant usage on database analytics_clone to role analyst_tissi;
grant usage on schema analytics_clone.web_logs_rt to role analyst_tissi;
grant select on all tables in schema analytics_clone.web_logs_rt to role analyst_tissi;
grant select on future tables in schema analytics_clone.web_logs_rt to role analyst_tissi;
grant select on all views in schema analytics_clone.web_logs_rt to role analyst_tissi;
grant select on future views in schema analytics_clone.web_logs_rt to role analyst_tissi;
-- analytics_clone.intermediary
grant usage on schema analytics_clone.intermediary to role analyst_tissi;
-- Analytics_dev
grant usage on schema analytics_dev.web_logs_rt to role analyst_tissi;
grant select on all tables in schema analytics_dev.web_logs_rt to role analyst_tissi;
grant select on all views in schema analytics_dev.web_logs_rt to role analyst_tissi;
grant select on future tables in schema analytics_dev.web_logs_rt to role analyst_tissi;
grant select on future views in schema analytics_dev.web_logs_rt to role analyst_tissi;
grant select on all dynamic tables in schema analytics_dev.web_logs_rt to role analyst_tissi;
grant select on future dynamic tables in schema analytics_dev.web_logs_rt to role analyst_tissi;
-- BYOD
grant usage on database byod to role analyst_tissi;
-- BYOD.BLUELOYALTY
grant usage on schema byod.blueloyalty to role analyst_tissi;
grant select on table byod.blueloyalty.jbc_acquisitions to role analyst_tissi;
grant role blueloyalty to role analyst_tissi;
grant usage on all schemas in database analytics_qa to role analyst_tissi;
grant select on all tables in database analytics_qa to role analyst_tissi;
grant select on future tables in database analytics_qa to role analyst_tissi;
grant select on all views in database analytics_qa to role analyst_tissi;
grant select on future views in database analytics_qa to role analyst_tissi;
grant usage on schema analytics.stg_sabre_pnr_rt to role analyst_tissi; 
grant select on view analytics.stg_sabre_pnr_rt.remark to role analyst_tissi;
grant select on view analytics.stg_sabre_pnr_rt.remark_snowflake to role analyst_tissi;
grant select on table analytics.stg_sabre_pnr_rt.remark_aps to role analyst_tissi;
grant usage on schema raw.sabre_pnr_rt to role analyst_tissi; 
grant select on table raw.sabre_pnr_rt.pnr_remark to role analyst_tissi; 
grant select on table raw.sabre_pnr_rt.pnr to role analyst_tissi;
-- byod.itdigitaloperations
grant select on table byod.itdigitaloperations.intent_product_map to role analyst_tissi;
-- Sensitive roles
grant role sensitive_analytics_prd__check_ins to role analyst_tissi;
grant role sensitive_analytics_prd__bookings_rt__remark_history to role analyst_tissi; 
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark to role analyst_tissi; 
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_aps to role analyst_tissi; 
grant role sensitive_analytics_prd__stg_sabre_ticket_rt__remark_snowflake to role analyst_tissi; 
grant role analyst_tissi to role sysadmin;
grant role analyst_tissi to user "TISSI@JETBLUE.COM";

-- analyst_ts58492 (Tara Shahbazi)
create role if not exists analyst_ts58492;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ts58492') }}
{% endif %}
grant role analyst to role analyst_ts58492;
grant role ITCEXCMSYSTEMS_SG to role analyst_ts58492;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings to role analyst_ts58492; 
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings to role analyst_ts58492;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings to role analyst_ts58492;
-- analytics.stg_ifsa_rt
grant usage on schema analytics.stg_ifsa_rt to role analyst_ts58492;
grant select on view analytics.stg_ifsa_rt.mosaic_greetings to role analyst_ts58492;
grant role analyst_ts58492 to role sysadmin;
grant role analyst_ts58492 to user "TS58492@JETBLUE.COM";

-- analyst_twheelhouse(Troy Wheelhouse)
create role if not exists analyst_twheelhouse;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_twheelhouse') }}
{% endif %}
grant role analyst to role analyst_twheelhouse;
grant role "CSS MODERNIZATION CORE TEAM" to role analyst_twheelhouse;
grant role "IT ENTERPRISE ARCHITECTURE CM" to role analyst_twheelhouse;
grant role raw_mparticle_read to role analyst_twheelhouse;
grant role transformer_dev to role analyst_twheelhouse;
grant role analyst_twheelhouse to role sysadmin;
grant role analyst_twheelhouse to user "TWHEELHOUSE@JETBLUE.COM";

-- analyst_ts86446 (Tyler Stellwag)
create role if not exists analyst_ts86446;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ts86446') }}
{% endif %}
grant role analyst to role analyst_ts86446;
grant role "FLIGHT OPS TEAM" to role analyst_ts86446;
grant role cbacrewdata to role analyst_ts86446;
grant role flightopsdata to role analyst_ts86446;
-- ANALYTICS.CREW_PAY
grant usage on schema analytics.crew_pay to role analyst_ts86446;
grant select on table analytics.crew_pay.crew_data_history to role analyst_ts86446;
-- BYOD
grant usage on database byod to role analyst_ts86446;
-- BYOD.CREW_ANALYTICS
grant usage on schema byod.crew_analytics to role analyst_ts86446;
grant select on table byod.crew_analytics.pilot_address to role analyst_ts86446;
grant select on table byod.crew_analytics.premium_cpadaily_timestamp to role analyst_ts86446;
grant select on view byod.crew_analytics.pilot_absences_addresses to role analyst_ts86446;
-- BYOD.ENTERPRISE_PLANNING
grant usage on schema byod.enterprise_planning to role analyst_ts86446;
grant select on view byod.enterprise_planning.vw_pilot_inflight_removals to role analyst_ts86446;
-- RAW
grant usage on database raw to role analyst_ts86446;
-- RAW.RAINMAKER
grant usage on schema raw.rainmaker to role analyst_ts86446;
grant select on table raw.rainmaker.FactCrewManDayStatsActivity to role analyst_ts86446;
grant select on table raw.rainmaker.vEmployee to role analyst_ts86446;
grant select on table raw.rainmaker.DimActivityCode to role analyst_ts86446;
grant select on table raw.rainmaker.DimManDay to role analyst_ts86446;
grant select on table raw.rainmaker.vDate to role analyst_ts86446;
grant select on table raw.rainmaker.DimRosterLineType to role analyst_ts86446;
grant select on table raw.rainmaker.vpairinginstance to role analyst_ts86446;
grant select on table raw.rainmaker.factactivity to role analyst_ts86446;
grant select on table raw.rainmaker.vcity to role analyst_ts86446;
grant select on table raw.rainmaker.vrosterperiod to role analyst_ts86446;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__flightkeys__flight_plan_header__author_name to role analyst_ts86446;
grant role sensitive_analytics_prd__intermediary__inter_flightkeys__flight_plan_header__author_name to role analyst_ts86446;
grant role sensitive_analytics_prd__stg_flightkeys__flight_plan_header__author_name to role analyst_ts86446;
grant role sensitive_analytics_prd__cass__request_log to role analyst_ts86446;
grant role analyst_ts86446 to role sysadmin;
grant role analyst_ts86446 to user "TS86446@JETBLUE.COM";

-- analyst_ud90336 (Uriel Duran)
create role if not exists analyst_ud90336;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ud90336') }}
{% endif %}
grant role analyst to role analyst_ud90336;
-- ANALYTICS Roles
grant usage on schema analytics.stg_ifsa_rt to role analyst_ud90336; 
grant select on view analytics.stg_ifsa_rt.vouchers to role analyst_ud90336;
-- BYOD Roles
grant role byod_blueloyalty_read to role analyst_ud90336;
grant usage on schema byod.fpa to role analyst_ud90336;
grant select on table byod.fpa.cg_ap_dashboard_total_discounts to role analyst_ud90336;
grant select on table byod.fpa.cg_ap_dashboard_pcard to role analyst_ud90336;
grant select on table byod.fpa.cg_ap_dashboard_past_due_and_paid to role analyst_ud90336;
grant select on table byod.fpa.cg_ap_dashboard_audit_recovery_credits to role analyst_ud90336;
grant select on table byod.fpa.cg_ap_dashboard_spend_by_payment_terms to role analyst_ud90336;
grant select on table byod.fpa.cg_ap_dashboard_missed_discount_report to role analyst_ud90336;
grant select on table byod.fpa.cg_ap_dashboard_vcc_payments to role analyst_ud90336;
grant select on table byod.fpa.cg_ap_dashboard_us_bank_rebate to role analyst_ud90336;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers to role analyst_ud90336;
grant role sensitive_analytics_prd__intermediary__inter_ifsa_rt__vouchers to role analyst_ud90336;
grant role sensitive_analytics_prd__stg_ifsa_rt__vouchers to role analyst_ud90336;
grant role sensitive_analytics_prd__vouchers__ifsa_vouchers_history to role analyst_ud90336;
-- 
grant role sensitive_analytics_prd__intermediary__inter_trax__relation_master to role analyst_ud90336;
grant role sensitive_analytics_prd__intermediary__inter_trax__security_header to role analyst_ud90336;
grant role sensitive_analytics_prd__stg_trax to role analyst_ud90336;
grant role analytics_stg_trax_read to role analyst_ud90336;
grant role sensitive_analytics_prd__aircraft_maintenance to role analyst_ud90336; 
--SENSITIVE Invoicework
grant role sensitive_analytics_prd__invoiceworks to role analyst_ud90336;
-- RAW
grant usage on database raw to role analyst_ud90336;
grant usage on schema raw.ifsa_rt to role analyst_ud90336;
grant select on table raw.ifsa_rt.vouchers to role analyst_ud90336;
grant role raw_concur_read to role analyst_ud90336;
--other roles
grant role "FINANCIAL SYSTEMS CONTROLLER GROUP" to role analyst_ud90336;
grant role "REVENUE ACCOUNTING" to role analyst_ud90336;
grant role RPAREPORTING to role analyst_ud90336;
grant role analyst_ud90336 to role sysadmin;
grant role analyst_ud90336 to user "UD90336@JETBLUE.COM";

-- analyst_ul12398 (Lautoo, Uanona)
create role if not exists analyst_ul12398;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ul12398') }}
{% endif %}
grant role analyst to role analyst_ul12398;
grant role ITCEXCMSYSTEMS_SG to role analyst_ul12398;
grant usage on database analytics_qa to role analyst_ul12398;
grant usage on all schemas in database analytics_qa to role analyst_ul12398;
grant select on all tables in database analytics_qa to role analyst_ul12398;
grant select on future tables in database analytics_qa to role analyst_ul12398;
grant select on all views in database analytics_qa to role analyst_ul12398;
grant select on future views in database analytics_qa to role analyst_ul12398;
grant role analyst_ul12398 to role sysadmin;
grant role analyst_ul12398 to user "UL12398@JETBLUE.COM";

-- analyst_vm12587 (Venkata Sai Krishna Maddineni)
create role if not exists analyst_vm12587;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_vm12587') }}
{% endif %}
grant role analyst to role analyst_vm12587;
grant role itdatasciencecrew to role analyst_vm12587;
grant usage on database raw to role analyst_vm12587;
grant usage on schema raw.servicenow to role analyst_vm12587;
grant select on future tables in schema raw.servicenow to role analyst_vm12587;
grant select on table raw.servicenow.kb_knowledge to role analyst_vm12587;
grant select on table raw.servicenow.sys_user_group to role analyst_vm12587;
grant select on table raw.servicenow.kb_category to role analyst_vm12587;
grant select on table raw.servicenow.kb_knowledge_base to role analyst_vm12587;
grant select on table raw.servicenow.user_criteria to role analyst_vm12587;
grant select on table raw.servicenow.sys_user_role to role analyst_vm12587;
grant select on table raw.servicenow.sys_user_has_role to role analyst_vm12587;
grant select on table raw.servicenow.sys_group_has_role to role analyst_vm12587;
grant role analyst_vm12587 to user "VM12587@JETBLUE.COM";

-- analyst_vnarale (Vibhuti Narale)
create role if not exists analyst_vnarale;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_vnarale') }}
{% endif %}
grant role analyst to role analyst_vnarale;
-- ANALYTICS.STG_ATPCO
grant usage on schema analytics.stg_atpco to role analyst_vnarale;
grant select on view analytics.stg_atpco.coupon_tax to role analyst_vnarale;
-- ANALYTICS.STG_FLIGHTS_RT_TOPS
grant usage on schema analytics.stg_flights_rt_tops to role analyst_vnarale;
grant select on all views in schema analytics.stg_flights_rt_tops to role analyst_vnarale;
grant select on future views in schema analytics.stg_flights_rt_tops to role analyst_vnarale;
-- ANALYTICS_CLONE.STG_FLIGHTS_RT_TOPS
grant usage on schema analytics_clone.stg_flights_rt_tops to role analyst_vnarale;
grant select on all views in schema analytics_clone.stg_flights_rt_tops to role analyst_vnarale;
grant select on future views in schema analytics_clone.stg_flights_rt_tops to role analyst_vnarale;
--EGOR ROLES
grant usage on database egor to role analyst_vnarale;
grant usage on all schemas in database egor to role analyst_vnarale;
grant select on all tables in database egor to role analyst_vnarale;
grant select on future tables in database egor to role analyst_vnarale;
grant select on all views in database egor to role analyst_vnarale;
grant select on future views in database egor to role analyst_vnarale;
-- EGOR_V1_CLONE
grant usage on database egor_v1_clone to role analyst_vnarale;
grant usage on all schemas in database egor_v1_clone to role analyst_vnarale;
grant select on all tables in database egor_v1_clone to role analyst_vnarale;
grant select on future tables in database egor_v1_clone to role analyst_vnarale;
grant select on all dynamic tables in database egor_v1_clone to role analyst_vnarale;
grant select on future dynamic tables in database egor_v1_clone to role analyst_vnarale;
grant select on all views in database egor_v1_clone to role analyst_vnarale;
grant select on future views in database egor_v1_clone to role analyst_vnarale;
-- EGOR_V2_CLONE
grant usage on database egor_v2_clone to role analyst_vnarale;
grant usage on all schemas in database egor_v2_clone to role analyst_vnarale;
grant select on all tables in database egor_v2_clone to role analyst_vnarale;
grant select on future tables in database egor_v2_clone to role analyst_vnarale;
grant select on all dynamic tables in database egor_v2_clone to role analyst_vnarale;
grant select on future dynamic tables in database egor_v2_clone to role analyst_vnarale;
grant select on all views in database egor_v2_clone to role analyst_vnarale;
grant select on future views in database egor_v2_clone to role analyst_vnarale;
-- FLIGHTANALYTICS
grant usage on database flightanalytics to role analyst_vnarale;
grant usage on all schemas in database flightanalytics to role analyst_vnarale;
grant select on all tables in database flightanalytics to role analyst_vnarale;
grant select on future tables in database flightanalytics to role analyst_vnarale;
grant select on all dynamic tables in database flightanalytics to role analyst_vnarale;
grant select on future dynamic tables in database flightanalytics to role analyst_vnarale;
grant select on all views in database flightanalytics to role analyst_vnarale;
grant select on future views in database flightanalytics to role analyst_vnarale;
-- FLIGHTANALYTICS_CLONE
grant usage on database flightanalytics_clone to role analyst_vnarale;
grant usage on all schemas in database flightanalytics_clone to role analyst_vnarale;
grant select on all tables in database flightanalytics_clone to role analyst_vnarale;
grant select on future tables in database flightanalytics_clone to role analyst_vnarale;
grant select on all dynamic tables in database flightanalytics_clone to role analyst_vnarale;
grant select on future dynamic tables in database flightanalytics_clone to role analyst_vnarale;
grant select on all views in database flightanalytics_clone to role analyst_vnarale;
grant select on future views in database flightanalytics_clone to role analyst_vnarale;
-- RAW
-- RAW.COMARCH
grant usage on schema raw.comarch to role analyst_vnarale;
grant select on table raw.comarch.activity_card_transactions_total to role analyst_vnarale;
-- RAW.FLIGHT_RT_TOPS
grant role raw_flight_rt_read to role analyst_vnarale;
--RAW ROLES
grant role raw_atpco_read to role analyst_vnarale;
grant role raw_comply365 to role analyst_vnarale;
grant role raw_comply365_feed to role analyst_vnarale;
grant role raw_credit_card_sales_read to role analyst_vnarale;
grant role raw_egor_aps_read to role analyst_vnarale;
grant role raw_egor_read to role analyst_vnarale;
grant role raw_flightkeys_read to role analyst_vnarale;
grant role raw_sabre_ticket_batch_read to role analyst_vnarale;
grant role raw_safety_read to role analyst_vnarale;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__aircraft_turns to role analyst_vnarale;
grant role sensitive_analytics_prd__servicenow to role analyst_vnarale;
grant role sensitive_raw_prd__sabre_ticket_batch to role analyst_vnarale;
grant role analyst_vnarale to role sysadmin;
grant role analyst_vnarale to user "VNARALE@JETBLUE.COM";

-- analyst_vp68210 (Victor Phun)
create role if not exists analyst_vp68210;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_vp68210') }}
{% endif %}
grant role analyst to role analyst_vp68210;
grant role "OPS PLANNING" to role analyst_vp68210;
grant role cbacrewdata to role analyst_vp68210;
grant role crewanalytics to role analyst_vp68210;
-- ANALYTICS_DEV.CREW
grant usage on database analytics_dev to role analyst_vp68210;
grant usage on schema analytics_dev.crew to role analyst_vp68210;
grant select on table analytics_dev.crew.crewtrac_open_segments to role analyst_vp68210;
grant select on table analytics_dev.crew.crewtrac_open_time to role analyst_vp68210;
grant select on table analytics_dev.crew.crewtrac_pairing_exceptions to role analyst_vp68210;
-- ANALYTICS_QA.TOPS_CREW
grant role analytics_qa_crew_rt_read to role analyst_vp68210;
grant role analytics_qa_tops_crew_read to role analyst_vp68210;
grant role analyst_vp68210 to role sysadmin;
grant role analyst_vp68210 to user "VP68210@JETBLUE.COM";

-- analyst_vp01705 (Vikram Purbey)
create role if not exists analyst_vp01705;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_vp01705') }}
{% endif %}
grant role analyst to role analyst_vp01705;
grant role LOYALTYTECHSUPPORT to role analyst_vp01705;
-- pii roles
grant role sensitive_analytics_prd__loyalty to role analyst_vp01705;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_vp01705;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_vp01705;
grant role sensitive_analytics_prd__intermediary__inter_loyalty_rt to role analyst_vp01705;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_vp01705;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__account_merge to role analyst_vp01705;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__card_move to role analyst_vp01705;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__corporate to role analyst_vp01705;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__member_profile to role analyst_vp01705;
grant role sensitive_analytics_prd__intermediary__inter_loyalty__redemption to role analyst_vp01705;
-- analytics.stg_loyalty
grant role analytics_stg_loyalty_read to role analyst_vp01705;
-- analytics.stg_loyalty_rt
grant role analytics_stg_loyalty_rt_read to role analyst_vp01705;
-- byod.blueloyalty
grant role byod_blueloyalty_read to role analyst_vp01705; 
grant role analyst_vp01705 to role sysadmin;
grant role analyst_vp01705 to user "VP01705@JETBLUE.COM";

-- analyst_vdhanashetty (Virupakshi Dhanashetty)
create role if not exists analyst_vdhanashetty;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_vdhanashetty') }}
{% endif %}
grant role analyst to role analyst_vdhanashetty;
grant role "ITDATAQA-NONPROD" to role analyst_vdhanashetty;
--analytics.call_management
grant usage on schema analytics.call_management to role analyst_vdhanashetty;
grant select on table analytics.call_management.amazon_connect_call_recordings to role analyst_vdhanashetty;
grant select on table analytics.call_management.amazon_connect_call_recordings_interruptions to role analyst_vdhanashetty;
grant select on table analytics.call_management.amazon_connect_call_recordings_non_talk_instances to role analyst_vdhanashetty;
grant select on table analytics.call_management.amazon_connect_call_recordings_transcripts to role analyst_vdhanashetty;
grant usage on schema analytics.stg_international_tax_exports to role analyst_vdhanashetty;
grant select on view analytics.stg_international_tax_exports.webpos_dominican_republic_tax_audit to role analyst_vdhanashetty;
grant role sensitive_analytics_prd__data_exports__webpos_dominican_republic_tax_audit to role analyst_vdhanashetty;
grant role sensitive_analytics_prd__stg_international_tax_exports__webpos_dominican_republic_tax_audit to role analyst_vdhanashetty;
grant role sensitive_analytics_prd__data_exports__webpos_dominican_republic_tax_details to role analyst_vdhanashetty;
grant role sensitive_analytics_prd__bookings__passenger_emails__email_address to role analyst_vdhanashetty;
grant role sensitive_analytics_prd__tickets__documents__customer_full_name to role analyst_vdhanashetty;
-- analytics_qa.stg_security_emails
grant role analytics_qa_stg_security_emails_read to role analyst_vdhanashetty;
-- analytics.stg_security_emails
grant role analytics_stg_security_emails_read to role analyst_vdhanashetty;
-- pii roles for security_emails
grant role sensitive_analytics_prd__security__security_emails to role analyst_vdhanashetty;
grant role sensitive_analytics_prd__stg_security_emails to role analyst_vdhanashetty;
grant role sensitive_analytics_qa__security__security_emails to role analyst_vdhanashetty;
grant role sensitive_analytics_qa__stg_security_emails to role analyst_vdhanashetty;
-- analytics_qa.stg_sabre_ind_rt
grant usage on schema analytics.stg_sabre_ind_rt to role analyst_vdhanashetty;
grant select on all tables in schema analytics.stg_sabre_ind_rt to role analyst_vdhanashetty;
grant select on all views in schema analytics.stg_sabre_ind_rt to role analyst_vdhanashetty;
grant select on future tables in schema analytics.stg_sabre_ind_rt to role analyst_vdhanashetty;
grant select on future views in schema analytics.stg_sabre_ind_rt to role analyst_vdhanashetty;
-- raw.sabre_ind_rt
grant role raw_sabre_ind_rt_read to role analyst_vdhanashetty;
-- raw.security_emails
grant role raw_security_emails_read to role analyst_vdhanashetty;
-- raw.invoiceworks
grant role raw_invoiceworks_read to role analyst_vdhanashetty; 
-- raw.amazon_connect
grant usage on schema raw.amazon_connect to role analyst_vdhanashetty;
grant select on table raw.amazon_connect.call_recordings to role analyst_vdhanashetty;
grant select on table raw.amazon_connect.login_logout_state to role analyst_vdhanashetty;
-- raw.international_tax_exports
grant usage on schema raw.international_tax_exports to role analyst_vdhanashetty;
grant select on table raw.international_tax_exports.dominican_peso_conversion_rates to role analyst_vdhanashetty;
grant select on table raw.international_tax_exports.webpos_dominican_republic_tax_audit to role analyst_vdhanashetty;
-- raw_qa
grant usage on database raw_qa to role analyst_vdhanashetty;
-- raw_qa.security
grant usage on schema raw_qa.security_emails to role analyst_vdhanashetty;
grant select on all tables in schema raw_qa.security_emails to role analyst_vdhanashetty;
grant select on future tables in schema raw_qa.security_emails to role analyst_vdhanashetty;
grant role analyst_vdhanashetty to role sysadmin;
grant role analyst_vdhanashetty to user "VDHANASHETTY@JETBLUE.COM";

-- analyst_vv15183 (Vinay Vemuri)
create role if not exists analyst_vv15183;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_vv15183') }}
{% endif %}
grant role analyst to role analyst_vv15183;
grant role analytics_bluebucks_read to role analyst_vv15183;
grant role "ITDATAQA-NONPROD" to role analyst_vv15183;
grant role "ITDATAQA-PROD" to role analyst_vv15183;
-- ANALYTICS.CREW_PAY
grant usage on schema analytics.crew_pay to role analyst_vv15183;
grant select on table analytics.crew_pay.man_day to role analyst_vv15183;
grant select on table analytics.crew_pay.crew_man_day_stats_activity to role analyst_vv15183;
grant select on future tables in schema analytics.crew_pay to role analyst_vv15183;
grant select on future views in schema analytics.crew_pay to role analyst_vv15183;
-- ANALYTICS.SERVICENOW
grant usage on schema analytics.servicenow to role analyst_vv15183;
grant select on table analytics.servicenow.system_users to role analyst_vv15183;
-- ANALYTICS.STG_INFLIGHT_ENTERTAINMENT
grant usage on schema analytics.stg_inflight_entertainment to role analyst_vv15183;
grant select on view analytics.stg_inflight_entertainment.passenger to role analyst_vv15183;
-- ANALYTICS.STG_SAP_REPORTS
grant usage on schema analytics.stg_sap_reports to role analyst_vv15183;
grant select on view analytics.stg_sap_reports.crewmember_badges_sap to role analyst_vv15183;
-- RAW
grant usage on database raw to role analyst_vv15183;
grant usage on schema raw.tiphaus to role analyst_vv15183;
grant select on table raw.tiphaus.clean_customer_compliments to role analyst_vv15183;
-- RAW.SAP_REPORTS
grant usage on schema raw.sap_reports to role analyst_vv15183;
grant select on table raw.sap_reports.crewmember_badge_profiles_jbu to role analyst_vv15183;
-- ANALYTICS_DEV.CREW
grant usage on schema analytics_dev.crew to role analyst_vv15183;
grant select on view analytics_dev.crew.crewmember_badges_sap to role analyst_vv15183;
-- ANALYTICS_DEV.STG_SAP_REPORTS
grant usage on schema analytics_dev.stg_sap_reports to role analyst_vv15183;
grant select on view analytics_dev.stg_sap_reports.crewmember_badges_sap to role analyst_vv15183;
-- ANALYTICS.ANALYTICS
grant usage on schema analytics.analytics to role analyst_vv15183;
grant select on table analytics.analytics.flights_fact to role analyst_vv15183;
-- ANALYTICS.SURVEYS
grant usage on schema analytics.surveys to role analyst_vv15183;
grant select on table analytics.surveys.diagnostic_2021 to role analyst_vv15183;
-- ANALYTICS_QA
grant usage on database analytics_qa to role analyst_vv15183;
-- ANALYTICS_QA.ANALYTICS
grant usage on schema analytics_qa.analytics to role analyst_vv15183;
grant usage on schema analytics_qa.bluebucks to role analyst_vv15183;
grant usage on schema analytics_qa.email_marketing to role analyst_vv15183;
grant select on table analytics_qa.analytics.crew_fact to role analyst_vv15183;
grant select on table analytics_qa.analytics.flights_fact to role analyst_vv15183;
grant select on table analytics_qa.bluebucks.clean_customer_compliments to role analyst_vv15183;
-- analytics_qa.data_exports.bluebucks_bcss
grant usage on schema analytics_qa.data_exports to role analyst_vv15183;
grant select on view analytics_qa.data_exports.bluebucks_bcss to role analyst_vv15183;
-- RAW.COLLINS_ACMS_PLUS
grant usage on schema raw.collins_acms_plus to role analyst_vv15183;
grant select on table raw.collins_acms_plus.turn_management_gate_arrivals to role analyst_vv15183;
-- RAW.EGOR
grant usage on schema raw.egor to role analyst_vv15183;
grant select on table raw.egor.egor_rt_messages to role analyst_vv15183;
-- RAW.IFSA_RT
grant usage on schema raw.ifsa_rt to role analyst_vv15183;
grant select on table raw.ifsa_rt.mosaic_greetings to role analyst_vv15183;
-- RAW.INFLIGHT_ENTERTAINMENT
grant role raw_inflight_entertainment_read to role analyst_vv15183;
-- RAW.PACE
grant usage on schema raw.pace to role analyst_vv15183;
grant select on table raw.pace.post_flight_reports to role analyst_vv15183;
-- RAW_DEV
grant usage on database raw_dev to role analyst_vv15183;
-- RAW_DEV.SAP_REPORTS
grant usage on schema raw_dev.sap_reports to role analyst_vv15183;
grant select on table raw_dev.sap_reports.crewmember_badge_profiles_jbu to role analyst_vv15183;
-- RAW_QA.INFLIGHT_ENTERTAINMENT
grant select on table raw_qa.inflight_entertainment.pax_manifest to role analyst_vv15183;
-- analytics
grant usage on schema analytics.stg_international_tax_exports to role analyst_vv15183;
grant select on view analytics.stg_international_tax_exports.edicom_dominican_republic_tax_audit to role analyst_vv15183;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__agent_sales_reports to role analyst_vv15183;
grant role sensitive_analytics_prd__analytics__crew_fact to role analyst_vv15183;
grant role sensitive_analytics_prd__analytics__crew_fact to role analyst_vv15183;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_seats_ancillary_report to role analyst_vv15183;
grant role sensitive_analytics_prd__airports_incentives__airports_commission_incentive_payout_history to role analyst_vv15183;
grant role sensitive_analytics_prd__bluebucks__bluebucks_customer_compliments_payment_history to role analyst_vv15183;
grant role sensitive_analytics_prd__bluebucks__bluebucks_mosaic_greeting_payment_history to role analyst_vv15183;
grant role sensitive_analytics_prd__bluebucks__bluebucks_mosaic_greeting_payment_history__first_name to role analyst_vv15183;
grant role sensitive_analytics_prd__bluebucks__bluebucks_mosaic_greeting_payment_history__last_name to role analyst_vv15183;
grant role sensitive_analytics_prd__bluebucks__clean_customer_compliments to role analyst_vv15183;
grant role sensitive_analytics_prd__bluebucks__customer_compliments to role analyst_vv15183;
grant role sensitive_analytics_prd__bookings__passengers to role analyst_vv15183;
grant role sensitive_analytics_prd__bookings__pnr_ticket_links to role analyst_vv15183;
grant role sensitive_analytics_prd__bookings__remarks to role analyst_vv15183;
grant role sensitive_analytics_prd__bookings__ssr to role analyst_vv15183;
grant role sensitive_analytics_prd__crew__bluebucks_on_time_performance_history to role analyst_vv15183;
grant role sensitive_analytics_prd__crew__crewmember_badges_sap to role analyst_vv15183;
grant role sensitive_analytics_prd__crew_pay__crew_man_day_stats_activity to role analyst_vv15183;
grant role sensitive_analytics_prd__employee_profile_record__header to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__airports_commission_incentive_payout to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__bluebucks_bcss__concat_value to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__bluebucks_crewmembers_monthly to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__bluebucks_crewmembers_monthly__first_name to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__bluebucks_crewmembers_monthly__last_name to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__bluebucks_on_time_performance_header to role analyst_vv15183;
grant role sensitive_analytics_prd__email_marketing__bluebucks_pre_flight_welcome_message to role analyst_vv15183;
grant role sensitive_analytics_prd__inflight_bluebucks__reliability_score to role analyst_vv15183;
grant role sensitive_analytics_prd__inflight_bluebucks__reliability_score to role analyst_vv15183;
grant role sensitive_analytics_prd__inflight_bluebucks__reliability_score__first_name to role analyst_vv15183;
grant role sensitive_analytics_prd__inflight_bluebucks__reliability_score__last_name to role analyst_vv15183;
grant role sensitive_analytics_prd__inflight_entertainment__passenger to role analyst_vv15183;
grant role sensitive_analytics_prd__intermediary__inter__inflight_entertainment__passenger to role analyst_vv15183;
grant role sensitive_analytics_prd__intermediary__inter_onboard_experience__mosaic_greetings to role analyst_vv15183;
grant role sensitive_analytics_prd__loyalty__barclays_card_cash_earnings to role analyst_vv15183;
grant role sensitive_analytics_prd__onboard_experience__mosaic_greetings to role analyst_vv15183;
grant role sensitive_analytics_prd__sabre_open_system_payfields__ancillaries to role analyst_vv15183;
grant role sensitive_analytics_prd__sabre_open_system_payfields__payment to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_user_groups to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_user_groups__email to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__ad_cn to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__email to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__employee_number to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__first_name to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__gender to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__home_phone to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__last_name to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__mobile_phone to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__name to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__phone to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__title to role analyst_vv15183;
grant role sensitive_analytics_prd__servicenow__system_users__user_name to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_crew_pay__crew_man_day_stats_activity to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_ifsa_rt__mosaic_greetings to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_sabre_open_system_payfields__ancillaries to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_sabre_open_system_payfields__payment to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_sabre_open_system_payfields__payment_legacy to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_sabre_open_system_payfields__payment_snowflake to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_sap_reports__crewmember_badges_sap to role analyst_vv15183;
grant role sensitive_analytics_prd__surveys__diagnostic_2021 to role analyst_vv15183;
grant role sensitive_analytics_prd__ticket_audits to role analyst_vv15183;
grant role sensitive_analytics_prd__tickets__documents to role analyst_vv15183;
grant role sensitive_analytics_prd__tickets__payments to role analyst_vv15183;
grant role sensitive_analytics_qa__analytics__crew_fact to role analyst_vv15183;
grant role sensitive_analytics_qa__bluebucks__bluebucks_customer_compliments_payment_history to role analyst_vv15183;
grant role sensitive_analytics_qa__bluebucks__bluebucks_mosaic_greeting_payment_history to role analyst_vv15183;
grant role sensitive_analytics_qa__bluebucks__clean_customer_compliments to role analyst_vv15183;
grant role sensitive_analytics_qa__bluebucks__customer_compliments__feedback_comment to role analyst_vv15183;
grant role sensitive_analytics_qa__crew__bluebucks_on_time_performance_history to role analyst_vv15183;
grant role sensitive_analytics_qa__crew__crewmember_badges_sap to role analyst_vv15183;
grant role sensitive_analytics_qa__data_exports__bluebucks_bcss__concat_value to role analyst_vv15183;
grant role sensitive_analytics_qa__data_exports__bluebucks_on_time_performance_header to role analyst_vv15183;
grant role sensitive_analytics_qa__data_exports__customer_compliments_payment to role analyst_vv15183;
grant role sensitive_analytics_qa__email_marketing__bluebucks_pre_flight_welcome_message to role analyst_vv15183;
grant role sensitive_analytics_qa__inflight_bluebucks__reliability_score to role analyst_vv15183;
grant role sensitive_analytics_qa__inflight_entertainment__passenger to role analyst_vv15183;
grant role sensitive_analytics_qa__inflight_entertainment__pax_manifest to role analyst_vv15183;
grant role sensitive_analytics_qa__intermediary__inter__inflight_entertainment__pax_manifest to role analyst_vv15183;
grant role sensitive_analytics_qa__loyalty__barclays_card_cash_earnings to role analyst_vv15183;
grant role sensitive_analytics_qa__stg_inflight_entertainment__pax_manifest to role analyst_vv15183;
grant role sensitive_analytics_qa__stg_sap_reports__crewmember_badges_sap to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__customer_compliments_payment to role analyst_vv15183;
grant role sensitive_analytics_prd__bluebucks__bluebucks_customer_compliments_payment_history to role analyst_vv15183;
grant role sensitive_analytics_prd__analytics__ancillaries_fact to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__edicom_dominican_republic_tax_details to role analyst_vv15183;
grant role sensitive_analytics_prd__tickets__documents to role analyst_vv15183;
grant role sensitive_analytics_prd__data_exports__edicom_dominican_republic_tax_audit to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_international_tax_exports__edicom_dominican_republic_tax_audit to role analyst_vv15183;
grant role sensitive_analytics_prd__bookings__passenger_emails to role analyst_vv15183;
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_vv15183;
grant role sensitive_analytics_prd__reference__market_regions to role analyst_vv15183;
grant role sensitive_analytics_prd__customers_rt__customers to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_customers_rt__customers to role analyst_vv15183;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__customers to role analyst_vv15183;
grant role sensitive_analytics_prd__customers_rt__email_addresses to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_customers_rt__email_addresses to role analyst_vv15183;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_vv15183;
grant role sensitive_analytics_prd__customers_rt__phone_numbers to role analyst_vv15183;
grant role sensitive_analytics_prd__stg_customers_rt__phone_numbers to role analyst_vv15183;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_vv15183;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_vv15183;
grant role sensitive_analytics_prd__cobrand__cobrand_customers to role analyst_vv15183;
grant role analyst_vv15183 to role sysadmin;
grant role analyst_vv15183 to user "VV15183@JETBLUE.COM";

--analyst_wd51891 (William DaSilva)
create role if not exists analyst_wd51891;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_wd51891') }}
{% endif %}
grant role analyst to role analyst_wd51891;
grant role BLUEENGINEERING to role analyst_wd51891;
grant role BLUETECHOPS to role analyst_wd51891;
grant role TABLEAUONLINECREATOR to role analyst_wd51891;
grant role byod_bluereliabilityengineering_read to role analyst_wd51891; 
grant role analyst_wd51891 to role sysadmin;
grant role analyst_wd51891 to user "WD51891@JETBLUE.COM";

-- analyst_ww24185 (Wai Wu)
create role if not exists analyst_ww24185;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ww24185') }}
{% endif %}
grant role analyst to role analyst_ww24185;
grant role "IT CTS BOS" to role analyst_ww24185;
grant role "IT PROCUREMENT" to role analyst_ww24185;
grant role sensitive_analytics_prd__call_management__amazon_connect_agents to role analyst_ww24185;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_ww24185;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_summary to role analyst_ww24185;
grant role analyst_ww24185 to role sysadmin;
grant role analyst_ww24185 to user "WW24185@JETBLUE.COM";

-- analyst_zb67056(Zachary Bingham)
create role if not exists analyst_zb67056;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_zb67056') }}
{% endif %}
grant role analyst to role analyst_zb67056;
grant role "JTPCC ANALYTICS & PLANNING" to role analyst_zb67056;
grant role "VACATIONS ANALYTICS & PLANNING" to role analyst_zb67056;
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state to role analyst_zb67056;
-- BYOD
grant role byod_wpa_read to role analyst_zb67056;
grant role analyst_zb67056 to role sysadmin;
grant role analyst_zb67056 to user "ZB67056@JETBLUE.COM";

-- analyst_ZF93317 (Zachary Fowler)
create role if not exists analyst_zf93317;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_zf93317') }}
{% endif %}
grant role analyst to role analyst_zf93317;
grant role cnstdistro to role analyst_zf93317;
grant role cns_navdb to role analyst_zf93317;
grant role byod_areq_read to role analyst_zf93317;
grant role analyst_zf93317 to role sysadmin;
grant role analyst_zf93317 to user "ZF93317@JETBLUE.COM";

-- analyst_ZH60831 (ZACHARY HAMILTON)
create role if not exists analyst_zh60831;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_zh60831') }}
{% endif %}
grant role analyst to role analyst_zh60831;
grant role "WPA TEAM" to role analyst_zh60831;
grant usage on database jetblue_share to role analyst_zh60831; 
grant usage on schema jetblue_share.cci to role analyst_zh60831;
grant select on all tables in schema jetblue_share.cci to role analyst_zh60831;
grant select on future tables in schema jetblue_share.cci to role analyst_zh60831;
grant select on all views in schema jetblue_share.cci to role analyst_zh60831;
grant select on future views in schema jetblue_share.cci to role analyst_zh60831;
-- sensitive roles
grant role byod_customer_support_read to role analyst_zh60831; 
grant role byod_wpa to role analyst_zh60831;
grant role j5prodkbanalyst to role analyst_zh60831;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__tickets__documents to role analyst_zh60831;
grant role sensitive_analytics_prd__tickets__payments to role analyst_zh60831;
grant role analyst_zh60831 to role sysadmin;
grant role analyst_zh60831 to user "ZH60831@JETBLUE.COM";

-- analyst_zj56411 (Zueber Juma)
create role if not exists analyst_zj56411;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_zj56411') }}
{% endif %}
grant role analyst to role analyst_zj56411;
grant role "BLUEINVENTORY@JETBLUE.COM" to role analyst_zj56411;
grant role "PRODUCT DEVELOPMENT" to role analyst_zj56411;
grant role "SPOTFIRE_ INTERNAL_REVFORECAST_USERS" to role analyst_zj56411;
--sensitive roles
grant role sensitive_analytics_prd__onboard_experience__inflight_transactions to role analyst_zj56411;
--other roles
grant role analyst_zj56411 to role sysadmin;
grant role analyst_zj56411 to user "ZJ56411@JETBLUE.COM";

 -- analyst_zo49201 (Zoran Obradovic)
create role if not exists analyst_zo49201;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_zo49201') }}
{% endif %}
grant role analyst to role analyst_zo49201;
grant role sensitive_sabre_travel_bank_read to role analyst_zo49201;
grant role "IT ENTERPRISE ARCHITECTURE CM" to role analyst_zo49201;
grant role analyst_zo49201 to user "ZO49201@JETBLUE.COM";

-- analyst_zy10432 (Yang, Essie)
create role if not exists analyst_zy10432;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_zy10432') }}
{% endif %}
grant role analyst to role analyst_zy10432;
grant role "AIRLINE OPTIMIZATION" to role analyst_zy10432;
grant role "BYOD_OPA" to role analyst_zy10432;
grant role "ANALYST_OPA" to role analyst_zy10432;
grant role analytics_crew_pay_read to role analyst_zy10432;
grant role raw_rainmaker_read to role analyst_zy10432;
-- PII ROLES
grant role sensitive_analytics_prd__crew_pay to role analyst_zy10432;
grant role analyst_zy10432 to role sysadmin;
grant role analyst_zy10432 to user "ZY10432@JETBLUE.COM";

-- analyst_mc04004 (Malina Johnson)
create role if not exists analyst_mc04004;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_mc04004') }}
{% endif %}
grant role analyst to role analyst_mc04004;
-- Sensitive roles 
grant role SENSITIVE_ANALYTICS_QA__CREDIT_ISSUING_TOOL__CREDIT_REQUEST to role analyst_mc04004;
grant role SENSITIVE_ANALYTICS_QA__CREDIT_ISSUING_TOOL__PASSENGER_REQUEST to role analyst_mc04004;
grant role SENSITIVE_ANALYTICS_PRD__CREDIT_ISSUING_TOOL__CREDIT_REQUEST to role analyst_mc04004;
grant role SENSITIVE_ANALYTICS_PRD__CREDIT_ISSUING_TOOL__PASSENGER_REQUEST to role analyst_mc04004;
grant usage on database analytics_qa to role analyst_mc04004;
grant usage on schema analytics_qa.stg_credit_issuing_tool to role analyst_mc04004;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_mc04004;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_mc04004;
grant usage on schema analytics.stg_credit_issuing_tool to role analyst_mc04004;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_mc04004; 
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_mc04004;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_mc04004;
grant select on table analytics_qa.credit_issuing_tool.credit_request to role analyst_mc04004;
grant select on table analytics_qa.credit_issuing_tool.passenger_request to role analyst_mc04004;
grant select on table analytics.credit_issuing_tool.credit_request to role analyst_mc04004;
grant select on table analytics.credit_issuing_tool.passenger_request to role analyst_mc04004;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_mc04004;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_mc04004;
grant usage on database raw_qa to role analyst_mc04004;
grant usage on schema raw_qa.c3po_audit_logs to role analyst_mc04004;
grant select on table raw_qa.c3po_audit_logs.credit_request to role analyst_mc04004;
grant select on table raw_qa.c3po_audit_logs.passenger_request to role analyst_mc04004;
grant usage on database raw to role analyst_mc04004;
grant usage on schema raw.c3po_audit_logs to role analyst_mc04004;
grant select on table raw.c3po_audit_logs.credit_request to role analyst_mc04004;
grant select on table raw.c3po_audit_logs.passenger_request to role analyst_mc04004;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_mc04004;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_mc04004;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_mc04004;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_mc04004;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_mc04004;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_mc04004;
grant role analyst_mc04004 to role sysadmin;
grant role analyst_mc04004 to user "MC04004@JETBLUE.COM";

-- analyst_jp82628 (Jennifer Parker)
create role if not exists analyst_jp82628;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_jp82628') }}
{% endif %}
grant role analyst to role analyst_jp82628;
grant role analyst_qa to role analyst_jp82628;
grant role csproducts to role analyst_jp82628;
-- ANALYTICS
grant usage on database analytics to role analyst_jp82628;
grant usage on schema analytics.credit_issuing_tool to role analyst_jp82628;
grant select on view analytics.stg_credit_issuing_tool.credit_request to role analyst_jp82628;
grant select on view analytics.stg_credit_issuing_tool.passenger_request to role analyst_jp82628;
grant select on view analytics.credit_issuing_tool.credit_request to role analyst_jp82628;
grant select on view analytics.credit_issuing_tool.passenger_request to role analyst_jp82628;
-- ANALYTICS_QA
grant role analytics_qa_safety_read to role analyst_jp82628;
grant usage on database analytics_qa to role analyst_jp82628;
grant usage on schema analytics_qa.credit_issuing_tool to role analyst_jp82628;
grant select on view analytics_qa.stg_credit_issuing_tool.credit_request to role analyst_jp82628;
grant select on view analytics_qa.stg_credit_issuing_tool.passenger_request to role analyst_jp82628;
grant select on view analytics_qa.credit_issuing_tool.credit_request to role analyst_jp82628;
grant select on view analytics_qa.credit_issuing_tool.passenger_request to role analyst_jp82628;
grant usage on schema analytics_qa.stg_vistair to role analyst_jp82628;
grant select on all views in schema analytics_qa.stg_vistair to role analyst_jp82628;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__credit_issuing_tool__credit_request to role analyst_jp82628;
grant role sensitive_analytics_prd__credit_issuing_tool__passenger_request to role analyst_jp82628;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__credit_request to role analyst_jp82628;
grant role sensitive_analytics_prd__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_jp82628;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__credit_request to role analyst_jp82628;
grant role sensitive_analytics_prd__stg_credit_issuing_tool__passenger_request to role analyst_jp82628;
grant role sensitive_analytics_qa__credit_issuing_tool__credit_request to role analyst_jp82628;
grant role sensitive_analytics_qa__credit_issuing_tool__passenger_request to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__credit_request to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_credit_issuing_tool__passenger_request to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__actions to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__audit_plannings to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__findings to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_airports to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_do_office to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_environmental_assessments to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_flight_standards to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_international_operations to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_international_system_operations to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_operations_engineer to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_aat_tech_operations to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_foqa_gatekeeper_contacts to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_generic_investigations to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_airports to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_cnst to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_dispatch_standards to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_dispatch_support to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_do_office to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_environmental_assessment to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_fatigue_risk_management to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_flight_operations_risk_assessment to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_flight_standards to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_international_operations to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_operations_engineer to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_system_operations_international to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_ncna_tech_operations to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_safety_investigations to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__investigations_voluntary_disclosure_reports to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__mitigations to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__risks to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_core to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_crewmember_details to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_cro_reports to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_denied_boarding to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_fuel_chemical_spill to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_ground_support_equipment_details to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_inadmissible_customer to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_lost_or_found_items to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_medical_injury to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_person_details to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_safety_analysis to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_tech_ops_qa_investigation to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_reports_wildlife_strike to role analyst_jp82628;
grant role sensitive_analytics_qa__intermediary__inter_vistair__safety_risk_assessments to role analyst_jp82628;
grant role sensitive_analytics_qa__stg_vistair to role analyst_jp82628;
grant role sensitive_analytics_qa__safety to role analyst_jp82628;
grant role sensitive_analytics_qa__stg_aqd to role analyst_jp82628;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__credit_request to role analyst_jp82628;
grant role sensitive_analytics_qa__stg_credit_issuing_tool__passenger_request to role analyst_jp82628;
grant role sensitive_raw_qa__aqd to role analyst_jp82628;
grant usage on database raw_qa to role analyst_jp82628;
grant usage on schema raw_qa.vistair to role analyst_jp82628;
grant select on all tables in schema raw_qa.vistair to role analyst_jp82628;
grant select on all views in schema raw_qa.vistair to role analyst_jp82628;
grant role analyst_jp82628 to role sysadmin;
grant role analyst_jp82628 to user "JP82628@JETBLUE.COM";

-- analyst_nd06999 (Nathan Deinlein)
create role if not exists analyst_nd06999;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_nd06999') }}
{% endif %}
grant role analyst to role analyst_nd06999;
grant role itdataengineeringcrew to role analyst_nd06999;
grant role sensitive_analytics_prd__stg_responsys to role analyst_nd06999; 
grant role analytics_stg_responsys_read to role analyst_nd06999;
grant role raw_responsys_read to role analyst_nd06999;
grant role analyst_nd06999 to role sysadmin;
grant role analyst_nd06999 to user "ND06999@JETBLUE.COM";
grant role sensitive_raw_prd__responsys to role analyst_nd06999;

-- analyst_ar88255 (Andrew Roach)
create role if not exists analyst_ar88255;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_ar88255') }}
{% endif %}
grant role byod_crewanalytics_read to role analyst_ar88255;
grant role analyst to role analyst_ar88255;
grant role analyst_ar88255 to role sysadmin;
grant role analyst_ar88255 to user "AR88255@JETBLUE.COM";

-- analyst_bpag90000915 (Gulekar, Amit)
create role if not exists analyst_bpag90000915;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_bpag90000915') }}
{% endif %}
-- analytics
grant role analyst to role analyst_bpag90000915;
-- Sensitive roles
grant role sensitive_analytics_prd__analytics__beta_passengers_fact to role analyst_bpag90000915;
grant role sensitive_analytics_prd__reference__market_regions to role analyst_bpag90000915;
grant role sensitive_analytics_prd__analytics__ancillaries_fact to role analyst_bpag90000915;
grant role sensitive_analytics_prd__customers_rt__customers to role analyst_bpag90000915;
grant role sensitive_analytics_prd__stg_customers_rt__customers to role analyst_bpag90000915;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__customers to role analyst_bpag90000915;
grant role sensitive_analytics_prd__customers_rt__email_addresses to role analyst_bpag90000915;
grant role sensitive_analytics_prd__stg_customers_rt__email_addresses to role analyst_bpag90000915;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__email_addresses to role analyst_bpag90000915;
grant role sensitive_analytics_prd__customers_rt__phone_numbers to role analyst_bpag90000915;
grant role sensitive_analytics_prd__stg_customers_rt__phone_numbers to role analyst_bpag90000915;
grant role sensitive_analytics_prd__intermediary__inter_informatica_customers_rt__phone_numbers to role analyst_bpag90000915;
grant role sensitive_analytics_prd__loyalty__redemption_history to role analyst_bpag90000915;
grant role sensitive_analytics_prd__cobrand__cobrand_customers to role analyst_bpag90000915;
grant role analyst_bpag90000915 to role sysadmin;
grant role analyst_bpag90000915 to user "BPAG90000915@JETBLUE.COM";

-- analyst_sm74813 (Staci Moulton)
create role if not exists analyst_sm74813;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_sm74813') }}
{% endif %}
grant role analyst to role analyst_sm74813;
grant role analyst_jtpcc_analytics_and_planning to role analyst_sm74813;
-- BYOD
grant role byod_wpa to role analyst_sm74813;
-- sensitive roles
grant role sensitive_analytics_prd__call_management__amazon_connect_login_logout_state to role analyst_sm74813;
grant role analyst_sm74813 to role sysadmin;
grant role analyst_sm74813 to user "SM74813@JETBLUE.COM";

--byod pii role
create role if not exists sensitive_byod__bluerm__flight_leg_revenue_forecast;
{% if revoke_first %}
{{ revoke_roles_from_role('sensitive_byod__bluerm__flight_leg_revenue_forecast') }}
{% endif %}
grant role sensitive_byod__bluerm__flight_leg_revenue_forecast to role analyst_revenue_forecast_itds;

create role if not exists sensitive_byod__itdataops;
{% if revoke_first %}
{{ revoke_roles_from_role('sensitive_byod__itdataops') }}
{% endif %}
grant role sensitive_byod__itdataops to role analyst_tcsdataops;

-- CREWTRAVEL_MODIFY (analyst_crewtravelmodify)
create role if not exists analyst_crewtravelmodify;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_crewtravelmodify') }}
{% endif %}
grant role analyst to role analyst_crewtravelmodify;
grant role sensitive_analytics_prd__check_ins__passengers__passenger_first_name to role analyst_crewtravelmodify;
grant role sensitive_analytics_prd__check_ins__passengers__passenger_last_name to role analyst_crewtravelmodify;
grant role analyst_crewtravelmodify to role "CREWTRAVEL_MODIFY";

-- -- role (montecarlo)
--byod.customer_insights
grant usage on schema byod.customer_insights to role monte_carlo;
grant select on table byod.customer_insights.nps_combined_view to role monte_carlo;
grant select on table byod.customer_insights.nps_legacy_snapshot_vertical to role monte_carlo;
-- byod.flight_schedules
grant usage on schema byod.flight_schedules to role monte_carlo;
grant select on view byod.flight_schedules.vw_finalized_schedules to role monte_carlo;
grant select on table byod.flight_schedules.processed_low to role monte_carlo;
grant select on table byod.flight_schedules.processed_low_backup to role monte_carlo;
-- analytics.crew_pay
grant role analytics_crew_pay_read to role monte_carlo;
-- analytics.stg_crew_pay
grant usage on schema analytics.stg_crew_pay to role monte_carlo;
grant select on view analytics.stg_crew_pay.crew_pay_analyzer_daily to role monte_carlo;
grant select on view analytics.stg_crew_pay.crew_pay_analyzer_utilization_daily to role monte_carlo; 
grant select on view analytics.stg_crew_pay.crew_man_day_stats_activity to role monte_carlo;
grant select on view analytics.stg_crew_pay.date to role monte_carlo;
grant select on view analytics.stg_crew_pay.activity to role monte_carlo;
grant select on view analytics.stg_crew_pay.time to role monte_carlo;

-- OnPrem BP (only working on Omniture data)
grant usage on database analytics to role "ONPREM";
grant usage on schema analytics.web_analytics to role "ONPREM";
grant select on all tables in schema analytics.web_analytics to role "ONPREM";
grant select on future tables in schema analytics.web_analytics to role "ONPREM";
grant select on all views in schema analytics.web_analytics to role "ONPREM";
grant select on future views in schema analytics.web_analytics to role "ONPREM";
grant role transformer_dev to role "ONPREM";
grant role reporter_dev to role "ONPREM";
revoke role analyst from role onprem;

-- loader
grant usage on schema analytics.reference to role loader_prd;
grant select on view analytics.reference.airports to role loader_prd;
grant usage on schema analytics.reference_legacy to role loader_prd;
grant select on table analytics.reference_legacy.missing_airports to role loader_prd;
grant usage on schema  analytics.stg_reference to role loader_prd;
grant select on view analytics.stg_reference.airports to role loader_prd;

-- HVR (raw)
create role if not exists hvr;
grant all privileges on future tables in database raw to role hvr;
grant select, insert, update, delete, truncate on future tables in database raw to role hvr;
grant usage, modify, create table on all schemas in database raw to role hvr;
grant role hvr to user hvr;

-- HVR for POC (raw_qa)
create role if not exists hvr_poc;
grant all privileges on future tables in database raw_qa to role hvr_poc;
grant select, insert, update, delete, truncate on future tables in database raw_qa to role hvr_poc;
grant usage, modify, create table on all schemas in database raw_qa to role hvr_poc;
grant role hvr_poc to user hvr_poc;

-- analyst_svc_admin_ppm (POC User)
create user if not exists svc_admin_ppm;
create role if not exists analyst_svc_admin_ppm;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_admin_ppm') }}
{% endif %}
-- WAREHOUSES
grant usage, operate on warehouse reporting_dev_xs_wh to role analyst_svc_admin_ppm;
-- ANALYTICS_DEV.IT_TIMESHEETS
grant usage on database analytics_dev to role analyst_svc_admin_ppm;
grant usage on schema analytics_dev.it_timesheets to role analyst_svc_admin_ppm;
grant select on all tables in schema analytics_dev.it_timesheets to role analyst_svc_admin_ppm;
grant select on future tables in schema analytics_dev.it_timesheets to role analyst_svc_admin_ppm;
grant role analyst_svc_admin_ppm to role sysadmin;
grant role analyst_svc_admin_ppm to user svc_admin_ppm;

-- analyst_svc_bre (Blue Reliability Engineering)
create user if not exists svc_bre;
create role if not exists analyst_svc_bre;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_bre') }}
{% endif %}
grant role analyst to role analyst_svc_bre;
grant role analyst_bluereliabilityengineering to role analyst_svc_bre;
grant role analyst_svc_bre to role sysadmin;
grant role analyst_svc_bre to user svc_bre;

-- analyst_svc_data_engineering (access to analytics, analytics_dev, analytics_qa)
create user if not exists svc_data_engineering;
create role if not exists analyst_svc_data_engineering;
grant role analyst to role analyst_svc_data_engineering;
grant usage on database analytics to role analyst_svc_data_engineering;
-- ANALYTICS.STG_TOMORROW_IO_WEATHER
grant usage on schema analytics.stg_tomorrow_io_weather to role analyst_svc_data_engineering;
grant select on all tables in schema analytics.stg_tomorrow_io_weather to role analyst_svc_data_engineering;
grant select on all views in schema analytics.stg_tomorrow_io_weather to role analyst_svc_data_engineering;
grant select on future tables in schema analytics.stg_tomorrow_io_weather to role analyst_svc_data_engineering;
grant select on future views in schema analytics.stg_tomorrow_io_weather to role analyst_svc_data_engineering;
-- ANALYTICS.STG_METAR
grant usage on schema analytics.stg_metar to role analyst_svc_data_engineering;
grant select on all views in schema analytics.stg_metar to role analyst_svc_data_engineering;
grant select on future views in schema analytics.stg_metar to role analyst_svc_data_engineering;
grant select on all tables in schema analytics.stg_metar to role analyst_svc_data_engineering;
grant select on future tables in schema analytics.stg_metar to role analyst_svc_data_engineering;
grant role loader_dev to role analyst_svc_data_engineering;
grant role loader_prd to role analyst_svc_data_engineering;
grant role loader_qa to role analyst_svc_data_engineering;
grant role reporter_dev to role analyst_svc_data_engineering;
grant role reporter_prd to role analyst_svc_data_engineering;
grant role reporter_qa to role analyst_svc_data_engineering;
grant role analyst_svc_data_engineering to role sysadmin;
grant role analyst_svc_data_engineering to user svc_data_engineering;

-- ANALYST_SVC_ITBI_DATABRICKS
create user if not exists svc_itbi_databricks;
create role if not exists analyst_svc_itbi_databricks;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_itbi_databricks') }}
{% endif %}
grant role analyst to role analyst_svc_itbi_databricks;
grant role byod_itbi_read to role analyst_svc_itbi_databricks;
-- BYOD ROLES
grant role byod_itbi to role analyst_svc_itbi_databricks;
grant role byod_strategic_sourcing_read to role analyst_svc_itbi_databricks;
grant role byod_customer_support_read to role analyst_svc_itbi_databricks;
grant role analyst_svc_itbi_databricks to role sysadmin;
grant role analyst_svc_itbi_databricks to user svc_itbi_databricks;

-- analyst_svc_itde_reporting (SVC_ITDE_REPORTING)
create role if not exists analyst_svc_itde_reporting;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_itde_reporting') }}
{% endif %}
grant role analyst to role analyst_svc_itde_reporting;
grant usage on database raw to role analyst_svc_itde_reporting;
grant role analyst_svc_itde_reporting to role sysadmin;
grant role analyst_svc_itde_reporting to user SVC_ITDE_REPORTING;

-- analyst_svc_itbi_databricks_pii
create user if not exists svc_itbi_databricks_pii;
create role if not exists analyst_svc_itbi_databricks_pii;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_itbi_databricks_pii') }}
{% endif %}
grant role analyst to role analyst_svc_itbi_databricks_pii;
--analytics
grant usage on schema analytics.safety to role analyst_svc_itbi_databricks_pii;
grant select on all tables in schema analytics.safety to role analyst_svc_itbi_databricks_pii;
grant select on all views in schema analytics.safety to role analyst_svc_itbi_databricks_pii;
grant select on future tables in schema analytics.safety to role analyst_svc_itbi_databricks_pii;
grant select on future views in schema analytics.safety to role analyst_svc_itbi_databricks_pii;
grant usage on schema analytics.sharepoint_osda to role analyst_svc_itbi_databricks_pii;
grant select on view analytics.sharepoint_osda.airport_operations_status_report to role analyst_svc_itbi_databricks_pii;
-- analytics.stg_sabre_acs_rt
grant usage on schema analytics.stg_sabre_acs_rt to role analyst_svc_itbi_databricks_pii;
grant select on view analytics.stg_sabre_acs_rt.travel_documents to role analyst_svc_itbi_databricks_pii;
grant select on view analytics.stg_sabre_acs_rt.passengers to role analyst_svc_itbi_databricks_pii;
--byod roles
grant role byod_itbi to role analyst_svc_itbi_databricks_pii;
grant usage on schema byod.opa to role analyst_svc_itbi_databricks_pii;
grant role byod_itbi_read to role analyst_svc_itbi_databricks_pii;
grant role byod_safety_bi_read to role analyst_svc_itbi_databricks_pii;
grant select, insert, update, delete on table byod.itbi.crew_connection_history to role analyst_svc_itbi_databricks_pii;
grant select on table byod.opa.prg_mcct to role analyst_svc_itbi_databricks_pii;
grant select on table byod.opa.prg_pre_clearance to role analyst_svc_itbi_databricks_pii;
grant select on table byod.opa.prg_crew_base to role analyst_svc_itbi_databricks_pii;
--sensitive roles
grant role sensitive_analytics_prd__vip_customer_travel__vip_customers to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__check_ins_rt__travel_documents to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_travel_documents to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__travel_documents to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__analytics to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__crew__crewmember_master to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__crew_rt__crewmember_master to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__data_exports__delivery_channel__email_id to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__data_exports__notification_recipient__first_name to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__data_exports__notification_recipient__last_name to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__flight_plan_manager__flight_crews to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__intermediary__inter_flight_plan_manager__flight_crews to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__notification_manager__delivery_channel__email_id to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__notification_manager__notification_recipient__first_name to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__notification_manager__notification_recipient__last_name to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_flight_plan_manager to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_notification_manager__stg_delivery_channel__email_id to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_notification_manager__stg_notification_recipient__first_name to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_notification_manager__stg_notification_recipient__last_name to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_crewtrac__crewmember_master to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__agent_sales_reports to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__aircraft_turns to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__airports_hospitality to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__airports_security to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__baggage to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__bookings to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__bookings_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__cobrand to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__cobrand_audit to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__comply365 to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__crew to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__crew_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__customers_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__customer_compensation to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__customer_support to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__data_exports to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__email_marketing to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__employee_profile_record to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__fees to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__flight_plan_manager to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__intermediary to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__irops_reaccom to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__loyalty to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__missing_baggage to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__notification_manager to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__reference to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__reference_legacy to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__s3c_credit to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__sabre_open_system_payfields to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__safety to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__servicenow to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_accelya_mis to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_airports_hospitality to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_airports_security to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_aqd to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_baggage to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_billing_information to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_bill_of_rights to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_cashstar to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_cass to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_ccure to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_cobrand_audit to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_comarch to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_complimentary_travel_manager to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_comply365 to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_crew to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_crew_services to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_customer_compensation to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_customer_support to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_egor to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_ifsa_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_irops_reaccom to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_kiosk to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_market_regions to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_navblue to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_nettracer to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_peoplefluent to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_qualtrics to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_responsys to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_s3c_credit to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_accb to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_acs_batch to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_asr_batch to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_csa to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_emd_batch to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_epr to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_fee_override to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_open_system_payfields to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_pnr_batch to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_tcn to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_ticket_batch to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sabre_vcr_flown to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sap_reports to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_servicenow to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_success_factors to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_surveys to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_web_analytics to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_wheelchair to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__surveys to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__talent_acquisition to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__tickets to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__tickets_rt to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__ticket_accounting to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__ticket_audits to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__vouchers to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__web_analytics to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__wheelchair to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__stg_sharepoint_osda__airport_operations_status_report to role analyst_svc_itbi_databricks_pii;
grant role sensitive_analytics_prd__sharepoint_osda__airport_operations_status_report to role analyst_svc_itbi_databricks_pii;
-- RAW.SABRE_ACS_RT
grant usage on schema raw.sabre_acs_rt to role analyst_svc_itbi_databricks_pii;
grant select on table raw.sabre_acs_rt.passenger to role analyst_svc_itbi_databricks_pii;
-- RAW.FLIGHT_IN_TROUBLE
grant usage on schema raw.flight_in_trouble to role analyst_svc_itbi_databricks_pii;
grant select on table raw.flight_in_trouble.acs_rt_offit to role analyst_svc_itbi_databricks_pii;
--raw roles
grant role raw_crew_read to role analyst_svc_itbi_databricks_pii;
--other roles
grant role analyst_svc_itbi_databricks_pii to role sysadmin;
grant role analyst_svc_itbi_databricks_pii to user svc_itbi_databricks_pii;

-- ANALYST_SVC_ITBI_STREAMLIT
create user if not exists svc_itbi_streamlit;
create role if not exists analyst_svc_itbi_streamlit;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_itbi_streamlit') }}
{% endif %}
-- ANALYTICS_QA
grant usage on database analytics_qa to role analyst_svc_itbi_streamlit;
-- ANALYTICS_QA.TICKETS
grant usage on schema analytics_qa.tickets to role analyst_svc_itbi_streamlit;
grant select on all tables in schema analytics_qa.tickets to role analyst_svc_itbi_streamlit;
grant select on future tables in schema analytics_qa.tickets to role analyst_svc_itbi_streamlit;
grant select on all views in schema analytics_qa.tickets to role analyst_svc_itbi_streamlit;
grant select on future views in schema analytics_qa.tickets to role analyst_svc_itbi_streamlit;
-- ANALYTICS_QA.SABRE_OPEN_SYSTEM_PAYFIELDS
grant usage on schema analytics_qa.sabre_open_system_payfields to role analyst_svc_itbi_streamlit;
grant select on all tables in schema analytics_qa.sabre_open_system_payfields to role analyst_svc_itbi_streamlit;
grant select on future tables in schema analytics_qa.sabre_open_system_payfields to role analyst_svc_itbi_streamlit;
grant select on all views in schema analytics_qa.sabre_open_system_payfields to role analyst_svc_itbi_streamlit;
grant select on future views in schema analytics_qa.sabre_open_system_payfields to role analyst_svc_itbi_streamlit;
-- BYOD.ITBI
grant role BYOD_ITBI_READ to role analyst_svc_itbi_streamlit;
grant role analyst_svc_itbi_streamlit to role sysadmin;
grant role analyst_svc_itbi_streamlit to user svc_itbi_streamlit;

-- analyst_svc_jetblueiac
create user if not exists SVC_JetblueIAC;
create role if not exists analyst_svc_jetblueiac;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_jetblueiac') }}
{% endif %}
grant role analyst to role analyst_svc_jetblueiac;
grant role analyst_svc_jetblueiac to role sysadmin;
grant role analyst_svc_jetblueiac to user SVC_JetblueIAC;

-- ANALYST_SVC_LEARNINGANALYTICS (SERVICE ACCOUNT FOR LEARNING ANALYTICS)
create user if not exists svc_learninganalytics comment='creating service account for learning analytics_REQ0340919';
create role if not exists analyst_svc_learninganalytics;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_learninganalytics') }}
{% endif %}
grant role analyst to role analyst_svc_learninganalytics;
grant role "JBU AME" to role analyst_svc_learninganalytics;
grant role analyst_svc_learninganalytics to role sysadmin;
grant role analyst_svc_learninganalytics to user svc_learninganalytics;

-- SVC_OPA (Creating service account for databricks work)
create user if not exists svc_opa comment = 'creating service account for OPA team for Databricks works SNOW_REQ0341953';
create role if not exists analyst_svc_opa;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_opa') }}
{% endif %}
grant role analyst to role analyst_svc_opa;
grant role USR_SYSPLANNINGANALYSISRO to role analyst_svc_opa;
grant role analyst_svc_opa to role sysadmin;
grant role analyst_svc_opa to user svc_opa;

-- analyst_svc_rm_tableau
create role if not exists analyst_svc_rm_tableau;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_rm_tableau') }}
{% endif %}
grant role analyst to role analyst_svc_rm_tableau;
grant role bluerm to role analyst_svc_rm_tableau;
grant role byod_itdatascience_read to role analyst_svc_rm_tableau;
grant role analyst_svc_rm_tableau to role sysadmin;
grant role analyst_svc_rm_tableau to user svc_rm_tableau;

-- ANALYST_SVC_RMO (SERVICE ACCOUNT FOR RM OPTIMIZATION)
create user if not exists svc_rmo comment='creating service account for RM Optimization_REQ0341285';
create role if not exists analyst_svc_rmo;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_rmo') }}
{% endif %}
grant role analyst to role analyst_svc_rmo;
grant role BLUERM to role analyst_svc_rmo;
grant role byod_itdatascience_read to role analyst_svc_rmo;
grant usage on schema analytics.safety to role analyst_svc_rmo;
grant select on all tables in schema analytics.safety to role analyst_svc_rmo;
grant select on all views in schema analytics.safety to role analyst_svc_rmo;
grant usage on schema byod.flight_schedules to role analyst_svc_rmo;
grant select on view byod.flight_schedules.vw_finalized_schedules to role analyst_svc_rmo;
--BYOD.FLIGHT_SCHEDULES.PROCESSED_LOW
grant select on table byod.flight_schedules.processed_low to role analyst_svc_rmo;
grant role analyst_svc_rmo to role sysadmin;
grant role analyst_svc_rmo to user svc_rmo;

-- analyst_svc_simon
create user if not exists svc_simon;
create role if not exists analyst_svc_simon;
{% if revoke_first %}
{{ revoke_roles_from_role('svc_simon') }}
{% endif %}
grant role analyst to role analyst_svc_simon;
grant role "CUSTOMERANALYTICS-SNOWFLAKE" to role analyst_svc_simon;
-- SENSITIVE ROLES
grant role sensitive_analytics_prd__inflight_entertainment__passenger to role analyst_svc_simon;
grant role sensitive_analytics_prd__intermediary__inter__inflight_entertainment__passenger to role analyst_svc_simon;
grant role analyst_svc_simon to role sysadmin;
grant role analyst_svc_simon to user svc_simon;

-- ANALYST_SVC_TABLEAU
create user if not exists svc_tableau;
create role if not exists analyst_svc_tableau;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_tableau') }}
{% endif %}
grant role analyst to role analyst_svc_tableau;
-- analytics.stg_sabre_acs_batch
grant usage on schema analytics.stg_sabre_acs_batch to role analyst_svc_tableau;
grant select on view analytics.stg_sabre_acs_batch.tickets to role analyst_svc_tableau;
grant select on future views in schema analytics.stg_sabre_acs_batch to role analyst_svc_tableau;
grant role byod_customer_support_read to role analyst_svc_tableau;
grant role byod_itbi_read to role analyst_svc_tableau;
grant role byod_opa_read to role analyst_svc_tableau;
grant usage on database byod to role analyst_svc_tableau;
-- byod.it_data_engineering
grant usage on schema byod.it_data_engineering to role analyst_svc_tableau;
grant select on view byod.it_data_engineering.raw_pnr_view to role analyst_svc_tableau;
grant select on table byod.it_data_engineering.daily_booking_channel_shares to role analyst_svc_tableau;
grant usage on database raw to role analyst_svc_tableau;
-- raw.sabre_acs_batch
grant usage on schema raw.sabre_acs_batch to role analyst_svc_tableau;
grant select on table raw.sabre_acs_batch.passenger_tickets to role analyst_svc_tableau;
-- raw.sabre_pnr_rt
grant usage on schema raw.sabre_pnr_rt to role analyst_svc_tableau;
grant select on table raw.sabre_pnr_rt.pnr to role analyst_svc_tableau;
-- byod
grant role byod_bluerm_read to role analyst_svc_tableau;
grant role byod_bluerevforecasting_read to role analyst_svc_tableau;
grant role byod_opa_read to role analyst_svc_tableau;
-- byod.itbi
grant role byod_itbi to role analyst_svc_tableau;
grant usage on schema byod.itbi to role analyst_svc_tableau; 
grant select on table byod.itbi.mct to role analyst_svc_tableau;
grant select on table byod.itbi.domestic_airports to role analyst_svc_tableau;
-- sensitive
grant role sensitive_analytics_prd__servicenow__comply_form_comply_data to role analyst_svc_tableau;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_svc_tableau;
grant role analyst_svc_tableau to role sysadmin;
grant role analyst_svc_tableau to user svc_tableau;

-- analyst_svc_tableau_pii
create user if not exists svc_tableau_pii;
create role if not exists analyst_svc_tableau_pii;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_tableau_pii') }}
{% endif %}
grant role analyst to role analyst_svc_tableau_pii;
--ANALYTICS ROLES
grant usage on schema analytics.safety to role analyst_svc_tableau_pii;
grant usage on schema analytics.check_ins_rt to role analyst_svc_tableau_pii;
grant select on all tables in schema analytics.safety to role analyst_svc_tableau_pii;
grant select on all views in schema analytics.safety to role analyst_svc_tableau_pii;
grant select on future tables in schema analytics.safety to role analyst_svc_tableau_pii;
grant select on future views in schema analytics.safety to role analyst_svc_tableau_pii;
grant usage on schema analytics.stg_sabre_acs_batch to role analyst_svc_tableau_pii;
grant select on view analytics.stg_sabre_acs_batch.tickets to role analyst_svc_tableau_pii;
grant select on view analytics_qa.check_ins_rt.passengers to role analyst_svc_tableau_pii;
grant select on view analytics.check_ins_rt.passengers to role analyst_svc_tableau_pii;
--ANALYTICS_QA ROLES
grant usage on database analytics_qa to role analyst_svc_tableau_pii;
grant usage on schema analytics_qa.check_ins_rt to role analyst_svc_tableau_pii;
grant role analytics_qa_tops_crew_read to role analyst_svc_tableau_pii;
-- BYOD.ITBI
grant role byod_itbi to role analyst_svc_tableau_pii;
-- BYOD.BLUEREVFORECASTING
grant role byod_bluerevforecasting_read to role analyst_svc_tableau_pii;
-- BYOD.FINANCE
grant usage on schema byod.finance to role analyst_svc_tableau_pii;
grant select on table byod.finance.financialanalytics_ref_currencyconversion to role analyst_svc_tableau_pii;
-- byod.opa
grant usage on schema byod.opa to role analyst_svc_tableau_pii;
grant role byod_opa_read to role analyst_svc_tableau_pii;
--SENSITIVE ROLES
grant role sensitive_analytics_prd__agent_sales_reports to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__aircraft_turns to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__airports_hospitality to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__airports_security to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__analytics to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__baggage to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__bookings to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__bookings_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__call_management__amazon_connect_agent_summary to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__cobrand to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__cobrand_audit to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__comply365 to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__crew to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__crew__crewmember_master to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__crew_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__crew_rt__crewmember_master to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__customer_compensation to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__customer_support to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__customers_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__data_exports to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__data_exports__delivery_channel__email_id to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__data_exports__notification_recipient__first_name to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__data_exports__notification_recipient__last_name to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__email_marketing to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__employee_profile_record to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__fees to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__flight_plan_manager to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__flight_plan_manager__flight_crews to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__intermediary to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__intermediary__inter_flight_plan_manager__flight_crews to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__irops_reaccom to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__loyalty to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__loyalty_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__loyalty_rt__loyalty_fraud_customer_list to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__missing_baggage to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__bso_reflight_regid to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__bso_unload_regid to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__cc_reassigned_guardian_to_old to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__close_to_mosaic to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__cobrand_anniversary to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__delivery_channel to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__delivery_channel__email_id to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__family_pooling_invite_accepted_inviter to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__itinerary_receipt_email_confirmation to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__messages to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__mosaic_20k_benefit to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__notification_recipient to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__notification_recipient__first_name to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__notification_recipient__last_name to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__responsys_itinerary_emails to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__responsys_marketing_emails to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__trueblue_activate_password_terms_conditions to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__trueblue_child_registration to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__trueblue_password_reset to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__notification_manager__trueblue_password_reset_confirmation to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__reference to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__reference_legacy to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__s3c_credit to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__sabre_open_system_payfields to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__sabre_travel_bank to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__safety to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__servicenow to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__servicenow__comply_form_comply_data to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__sharepoint_osda to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__springshot__crewmember_messages to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_accelya_mis to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_airports_hospitality to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_airports_security to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_aqd to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_baggage to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_bill_of_rights to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_billing_information to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_cashstar to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_cass to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_ccure to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_cobrand_audit to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_comarch to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_complimentary_travel_manager to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_comply365 to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_crew to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_crew_services to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_customer_compensation to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_customer_support to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_customers_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_egor to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_flight_plan_manager to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_ifsa_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_irops_reaccom to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_kiosk to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_loyalty to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_loyalty_rt__loyalty_fraud_customer_list to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_market_regions to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_navblue to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_nettracer to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_notification_manager to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_notification_manager__stg_delivery_channel__email_id to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_notification_manager__stg_notification_recipient__first_name to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_notification_manager__stg_notification_recipient__last_name to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_peoplefluent to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_qualtrics to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_responsys to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_s3c_credit to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_accb to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_acs_batch to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_asr_batch to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_crewtrac__crewmember_master to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_csa to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_emd_batch to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_epr to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_fee_override to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_open_system_payfields to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_pnr_batch to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_tcn to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_ticket_batch to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_vcr_flown to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sap_reports to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_servicenow to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_success_factors to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_surveys to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_web_analytics to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_wheelchair to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__surveys to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__talent_acquisition to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__ticket_accounting to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__ticket_audits to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__tickets to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__tickets_rt to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__vouchers to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__web_analytics to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__wheelchair to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sharepoint_osda__airport_operations_status_report to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__sharepoint_osda__airport_operations_status_report to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__stg_sabre_acs_rt__passengers to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__intermediary__inter_acs_rt__acs_passenger_records to role analyst_svc_tableau_pii;
grant role sensitive_analytics_prd__check_ins_rt__passengers to role analyst_svc_tableau_pii;
grant role sensitive_analytics_qa__stg_sabre_acs_rt__passengers to role analyst_svc_tableau_pii;
grant role sensitive_analytics_qa__intermediary__inter_acs_rt__acs_passenger_records to role analyst_svc_tableau_pii;
grant role sensitive_analytics_qa__check_ins_rt__passengers to role analyst_svc_tableau_pii;
grant usage on schema byod.it_data_engineering to role analyst_svc_tableau_pii;
grant select on view byod.it_data_engineering.raw_pnr_view to role analyst_svc_tableau_pii;
grant role byod_itbi_read to role analyst_svc_tableau_pii;
-- RAW ROLES
grant usage on database raw to role analyst_svc_tableau_pii;
grant usage on schema raw.sabre_pnr_rt to role analyst_svc_tableau_pii;
grant select on table raw.sabre_pnr_rt.pnr to role analyst_svc_tableau_pii;
grant role raw_crew_read to role analyst_svc_tableau_pii;
--OTHER ROLES
grant role analyst_svc_tableau_pii to role sysadmin;
grant role analyst_svc_tableau_pii to user svc_tableau_pii;

-- analyst_svc_socacftmvt
create user if not exists svc_socacftmvt;
create role if not exists analyst_svc_socacftmvt;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_socacftmvt') }}
{% endif %}
grant role analyst to role analyst_svc_socacftmvt;
grant role analyst_svc_socacftmvt to role sysadmin;
grant role analyst_svc_socacftmvt to user svc_socacftmvt;

-- analyst_svc_airtable_snowflake (SVC_AIRTABLE_SNOWFLAKE)
create role if not exists analyst_svc_airtable_snowflake;
{% if revoke_first %}
{{ revoke_roles_from_role('analyst_svc_airtable_snowflake') }}
{% endif %}
-- Raw roles
grant role raw_servicenow_read to role analyst_svc_airtable_snowflake;
-- Analytics roles
grant usage on database analytics to role analyst_svc_airtable_snowflake;
grant usage on schema analytics.servicenow to role analyst_svc_airtable_snowflake;
grant usage on schema analytics.crew to role analyst_svc_airtable_snowflake;
grant usage on schema analytics.comply365 to role analyst_svc_airtable_snowflake;
grant select on table analytics.crew.crewmember_hierarchy to role analyst_svc_airtable_snowflake;
grant select on table analytics.crew.crewmember_profiles to role analyst_svc_airtable_snowflake;
grant select on view analytics.crew.crew_and_business_partners to role analyst_svc_airtable_snowflake;
grant select on view analytics.servicenow.business_partners_onboard_tsa to role analyst_svc_airtable_snowflake;
grant select on table analytics.servicenow.system_users to role analyst_svc_airtable_snowflake;
grant select on table analytics.comply365.crewmember to role analyst_svc_airtable_snowflake;
-- Sensitive roles
grant role sensitive_analytics_prd__stg_servicenow to role analyst_svc_airtable_snowflake;
grant role sensitive_analytics_prd__servicenow__business_partners_onboard_tsa to role analyst_svc_airtable_snowflake;
grant role sensitive_analytics_prd__servicenow__system_users to role analyst_svc_airtable_snowflake;
grant role sensitive_analytics_prd__crew__crewmember_hierarchy to role analyst_svc_airtable_snowflake;
grant role sensitive_analytics_prd__crew__crewmember_profiles to role analyst_svc_airtable_snowflake;
grant role sensitive_analytics_prd__comply365__crewmember to role analyst_svc_airtable_snowflake;
grant role sensitive_analytics_prd__crew to role analyst_svc_airtable_snowflake;
grant role sensitive_analytics_prd__servicenow to role analyst_svc_airtable_snowflake;
--other roles
grant role analyst_svc_airtable_snowflake to role sysadmin;
grant role analyst_svc_airtable_snowflake to user svc_airtable_snowflake;

-- ThoughtSpot for POC
create user if not exists svc_thoughtspot;
create role if not exists thoughtspot;
grant usage, operate on warehouse reporting_prd_xs_wh to role thoughtspot;
grant usage, operate on warehouse reporting_prd_s_wh to role thoughtspot;
grant usage, operate on warehouse reporting_prd_m_wh to role thoughtspot;
grant usage, operate on warehouse reporting_prd_l_wh to role thoughtspot;
grant usage on database analytics to role thoughtspot;
grant usage on schema analytics.analytics to role thoughtspot;
grant usage on schema analytics.flight_plan_manager to role thoughtspot;
grant select on all tables in schema analytics.flight_plan_manager to role thoughtspot;
grant role thoughtspot to user svc_thoughtspot;
grant role thoughtspot to role sysadmin;
grant role thoughtspot to role accountadmin;

-- BYOD.OPA SCHEMA READ ACCESS TO BYOD_FLIGHT_SCHEDULES_READ role
grant usage on schema byod.opa to role byod_flight_schedules_read;
grant select on table byod.opa.block_subseason_definition to role byod_flight_schedules_read;
grant select on table byod.opa.block_forecast_version_meta to role byod_flight_schedules_read;
grant select on table byod.opa.block_forecast_blocktime_history to role byod_flight_schedules_read;

-- raw_qa_read (RAW_qa Database read role)
create role if not exists raw_qa_read;
{% if revoke_first %}
{{ revoke_roles_from_role('raw_qa_read') }}
{% endif %}
grant usage on database raw_qa to role raw_qa_read;
grant usage on all schemas in database raw_qa to role raw_qa_read;
grant select on all tables in database raw_qa to role raw_qa_read;
grant select on all views in database raw_qa to role raw_qa_read;
grant select on future tables in database raw_qa to role raw_qa_read;
grant select on future views in database raw_qa to role raw_qa_read;
grant role raw_qa_read to role sysadmin;

-- raw__schemas_rt__stages_read (read role for stages in rt)
create role if not exists raw__schemas_rt__stages_read;
{% if revoke_first %}
{{ revoke_roles_from_role('raw__schemas_rt__stages_read') }}
{% endif %}
grant usage on database raw to role raw__schemas_rt__stages_read;
grant usage on schema raw.customers_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.flight_oal_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.flight_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.flight_rt_aps to role raw__schemas_rt__stages_read;
grant usage on schema raw.flight_rt_bpmart to role raw__schemas_rt__stages_read;
grant usage on schema raw.ifsa_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.interactions_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.loyalty_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.reconciliation_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.sabre_acs_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.sabre_flight_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.sabre_pnr_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.sabre_pnr_rt_aps to role raw__schemas_rt__stages_read;
grant usage on schema raw.sabre_ticket_rt to role raw__schemas_rt__stages_read;
grant usage on schema raw.sabre_ticket_rt_aps to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.customers_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.flight_oal_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.flight_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.flight_rt_aps to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.flight_rt_bpmart to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.ifsa_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.interactions_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.loyalty_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.reconciliation_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.sabre_acs_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.sabre_flight_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.sabre_pnr_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.sabre_pnr_rt_aps to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.sabre_ticket_rt to role raw__schemas_rt__stages_read;
grant read on all stages in schema raw.sabre_ticket_rt_aps to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.customers_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.flight_oal_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.flight_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.flight_rt_aps to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.flight_rt_bpmart to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.ifsa_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.interactions_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.loyalty_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.reconciliation_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.sabre_acs_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.sabre_flight_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.sabre_pnr_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.sabre_pnr_rt_aps to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.sabre_ticket_rt to role raw__schemas_rt__stages_read;
grant usage on all stages in schema raw.sabre_ticket_rt_aps to role raw__schemas_rt__stages_read;
grant role raw__schemas_rt__stages_read to role sysadmin;

-- shared database access to loader_dev , loader_qa roles
grant imported privileges on database vistair_qa to role loader_dev;
grant imported privileges on database vistair_qa to role loader_qa;
grant role byod_it_self_service to role it_self_service;

-- analytics_clone_read (analytics_clone Database read role)
create role if not exists analytics_clone_read;
{% if revoke_first %}
{{ revoke_roles_from_role('analytics_clone_read') }}
{% endif %}
grant usage on database analytics_clone to role analytics_clone_read;
grant usage on all schemas in database analytics_clone to role analytics_clone_read;
grant select on all tables in database analytics_clone to role analytics_clone_read;
grant select on all views in database analytics_clone to role analytics_clone_read;
grant select on future tables in database analytics_clone to role analytics_clone_read;
grant select on future views in database analytics_clone to role analytics_clone_read;
grant role analytics_clone_read to role sysadmin;

-- analytics_qa_read (Analytics_qa Database read role)
create role if not exists analytics_qa_read;
{% if revoke_first %}
{{ revoke_roles_from_role('analytics_qa_read') }}
{% endif %}
grant usage on database analytics_qa to role analytics_qa_read;
grant usage on all schemas in database analytics_qa to role analytics_qa_read;
grant select on all tables in database analytics_qa to role analytics_qa_read;
grant select on all views in database analytics_qa to role analytics_qa_read;
grant select on future tables in database analytics_qa to role analytics_qa_read;
grant select on future views in database analytics_qa to role analytics_qa_read;
grant role analytics_qa_read to role sysadmin;

-- creating analytics_dev PII roles
create role if not exists sensitive_analytics_dev__amazon_connect;
{% if revoke_first %}
{{ revoke_roles_from_role('sensitive_analytics_dev__amazon_connect') }}
{% endif %}
grant role sensitive_analytics_dev__amazon_connect to role analyst_wpa_team;

--notification_integration_role
create role if not exists email_notification_role__jb_notification_integration__itdataengineeringcrew;
{% if revoke_first %}
{{ revoke_roles_from_role('email_notification_role__jb_notification_integration__itdataengineeringcrew') }}
{% endif %}
grant usage on INTEGRATION JB_NOTIFICATION_INTEGRATION__ITDATAENGINEERINGCREW TO ROLE email_notification_role__jb_notification_integration__itdataengineeringcrew;

-- grant role byod_jfk_mx_read to montecarlo user to use byod tables to create alerts
grant role byod_jfk_mx_read to user SVC_MONTE_CARLO;

-- grant role byod_opa_read to montecarlo user to use byod tables to create alerts
grant role byod_opa_read to user SVC_MONTE_CARLO;

-- granting write access on byod.sales to dev azure data factory service account
grant role byod_sales to user AZURE_DATA_FACTORY_DEV;
-- granting write access on byod.sales to qa azure data factory service account
grant role byod_sales to user AZURE_DATA_FACTORY_QA;
-- granting write access on byod.sales to prd azure data factory service account
grant role byod_sales to user AZURE_DATA_FACTORY_PRD;
-- grant access on byod.sales to role reporter_dev
grant role byod_sales to role reporter_dev;
-- grant access on byod.sales to role reporter_qa
grant role byod_sales to role reporter_qa;
-- grant access on byod.sales to role reporter_prd
grant role byod_sales to role reporter_prd;

-- grant grant usage, operate on warehouse app_areq_prd_l_wh to role byod_areq
grant usage, operate on warehouse app_areq_prd_l_wh to role byod_areq;

-- grant sensitive_PII (STG_AQD and RAW_AQD) accesss to sensitive_analytics_prd__safety
grant role sensitive_analytics_prd__stg_aqd to role sensitive_analytics_prd__safety;
grant role sensitive_raw_prd__aqd to role sensitive_analytics_prd__safety;

-- analytics_prd__all_schemas_sensitive_analytics_roles (ANALYTICS DATABASE LEVEL SENSITIVE ACCESS ROLE EXCEPT 3 schemas)
create role if not exists analytics_prd__all_schemas_sensitive_analytics_roles;
{% if revoke_first %}
{{ revoke_roles_from_role('analytics_prd__all_schemas_sensitive_analytics_roles') }}
{% endif %}
grant role sensitive_analytics_prd__agent_sales_reports to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__aircraft_turns to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__airports_hospitality to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__airports_security to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__baggage to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__bookings to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__bookings_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__cobrand to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__cobrand_audit to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__comply365 to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__crew to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__crew_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__customers_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__customer_compensation to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__customer_support to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__data_exports to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__email_marketing to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__employee_profile_record to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__fees to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__flight_plan_manager to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__intermediary to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__irops_reaccom to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__loyalty to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__loyalty_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__missing_baggage to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__notification_manager to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__reference to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__reference_legacy to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__s3c_credit to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__sabre_open_system_payfields to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__sabre_travel_bank to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__safety to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__servicenow to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_accelya_mis to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_airports_hospitality to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_airports_security to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_aqd to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_baggage to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_billing_information to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_bill_of_rights to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_cashstar to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_cass to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_ccure to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_cobrand_audit to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_comarch to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_complimentary_travel_manager to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_comply365 to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_crew to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_crew_services to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_customers_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_customer_compensation to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_customer_support to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_egor to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_ifsa_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_irops_reaccom to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_kiosk to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_loyalty to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_loyalty_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_market_regions to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_navblue to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_nettracer to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_notification_manager to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_peoplefluent to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_qualtrics to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_responsys to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_s3c_credit to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_accb to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_acs_batch to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_acs_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_asr_batch to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_crewtrac to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_csa to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_emd_batch to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_epr to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_fee_override to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_open_system_payfields to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_pnr_batch to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_pnr_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_tcn to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_ticket_batch to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_ticket_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_travel_bank to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sabre_vcr_flown to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_sap_reports to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_servicenow to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_success_factors to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_web_analytics to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__stg_wheelchair to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__tickets to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__tickets_rt to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__ticket_accounting to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__ticket_audits to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__vouchers to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__web_analytics to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role sensitive_analytics_prd__wheelchair to role analytics_prd__all_schemas_sensitive_analytics_roles;
grant role analytics_prd__all_schemas_sensitive_analytics_roles to role sysadmin;

  {% endset %}

  {{ log(query, info=true) }}

  {% do run_query(query) %}

{% endmacro %}
