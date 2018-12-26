#!/usr/bin/env bash

set -e

psql -v ON_ERROR_STOP=1 --username postgres --set USERNAME=probate_man --set PASSWORD=probate_man --set DATABASE=probate_man <<-EOSQL
  CREATE USER :USERNAME WITH PASSWORD ':PASSWORD';
  CREATE DATABASE :DATABASE WITH OWNER = :USERNAME ENCODING = 'UTF-8' CONNECTION LIMIT = -1;
  CREATE SCHEMA AUTHORIZATION probate_man;


EOSQL

psql -U probate_man -d probate_man  <<-EOSQL
  CREATE TABLE STANDING_SEARCHES_FLAT
  (
   SS_NUMBER   	varchar(11)	,
   PROBATE_NUMBER   	varchar(11)	,
   PROBATE_VERSION 	int	,
   DECEASED_ID          	bigint,
   DECEASED_FORENAMES	varchar(50)	,
   DECEASED_SURNAME	varchar(50)	,
   DATE_OF_BIRTH	date	,
   DATE_OF_DEATH1	date	,
   CCD_CASE_NO	varchar(20)	,
   ID	bigint	,
   DECEASED_ADDRESS     	varchar(500)	,
   APPLICANT_ADDRESS	varchar(500)	,
   REGISTRY_REG_LOCATION_CODE	int	,
   SS_APPLICANT_FORENAME 	varchar(30)	,
   SS_APPLICANT_SURNAME  	varchar(50)	,
   SS_APPLICANT_HONOURS	varchar(100)	,
   SS_APPLICANT_TITLE	varchar(35)	,
   SS_DATE_LAST_EXTENDED	date	,
   SS_DATE_OF_ENTRY	date	,
   SS_DATE_OF_EXPIRY	date	,
   SS_WITHDRAWN_DATE	date	,
   STANDING_SEARCH_TEXT	varchar(32000)	,
   DNM_IND	varchar(1)	,
   ALIAS_NAMES	varchar(32000)
   );

   CREATE TABLE WILLS_FLAT
   (
    RK_NUMBER   	varchar(11)	,
    PROBATE_NUMBER   	varchar(11)	,
    PROBATE_VERSION 	int	,
    DECEASED_ID	bigint,
    DECEASED_FORENAMES	varchar(50)	,
    DECEASED_SURNAME	varchar(30)	,
    DATE_OF_BIRTH	date	,
    DATE_OF_DEATH1	date	,
    ALIAS_NAMES	varchar(32000)	,
    RECORD_KEEPERS_TEXT	varchar(32000)	,
    CCD_CASE_NO	varchar(20)	,
    ID	bigint	,
    DNM_IND	varchar(1)
    );

    CREATE TABLE CAVEATS_FLAT
    (
    CAVEAT_NUMBER   	varchar(11)	,
    PROBATE_NUMBER   	varchar(11)	,
    PROBATE_VERSION 	int	,
    DECEASED_ID          	bigint,
    DECEASED_FORENAMES	varchar(50)	,
    DECEASED_SURNAME	varchar(50)	,
    DATE_OF_BIRTH	date	,
    DATE_OF_DEATH1	date	,
    ALIAS_NAMES	varchar(32000)	,
    CCD_CASE_NO	varchar(20)	,
    ID	bigint	,
    CAVEAT_TYPE          	varchar(20)     ,
    CAVEAT_DATE_OF_ENTRY       	date  	,
    CAV_DATE_LAST_EXTENDED     	date 	,
    CAV_EXPIRY_DATE            	date  	,
    CAV_WITHDRAWN_DATE         	date  	,
    CAVEATOR_TITLE         	varchar(35)     ,
    CAVEATOR_HONOURS       	varchar(100)    ,
    CAVEATOR_FORENAMES     	varchar(50)     ,
    CAVEATOR_SURNAME       	varchar(50)     ,
    CAV_SOLICITOR_NAME     	varchar(50)     ,
    CAV_SERVICE_ADDRESS     	varchar(500)	,
    CAV_DX_NUMBER              	varchar(10)     ,
    CAV_DX_EXCHANGE            	varchar(25)     ,
    CAVEAT_TEXT	varchar(32000)	,
    CAVEAT_EVENT_TEXT	varchar(32000)	,
    DNM_IND	varchar(1)
     );

    CREATE TABLE GRANT_APPLICATIONS_FLAT
    (
    PROBATE_NUMBER   	varchar(11)	,
    PROBATE_VERSION 	int	,
    DECEASED_ID          	bigint,
    DECEASED_FORENAMES	varchar(50)	,
    DECEASED_SURNAME	varchar(50)	,
    DATE_OF_BIRTH	date	,
    DATE_OF_DEATH1	date	,
    DECEASED_ADDRESS	varchar(500)	,
    DECEASED_TEXT	varchar(32000)	,
    ALIAS_NAMES	varchar(32000)	,
    GRANT_APPLICATION_TEXT	varchar(32000)	,
    APPLICATION_EVENT_TEXT	varchar(32000)	,
    OATH_TEXT 	varchar(32000)	,
    EXECUTOR_TEXT	varchar(32000)	,
    OTHER_INFORMATION_TEXT 	varchar(32000)	,
    LINKED_DECEASED_IDS	varchar(32000)	,
    CCD_CASE_NO	varchar(20)	,
    ID	bigint	,
    DNM_IND	varchar(1)	,
    DECEASED_AGE_AT_DEATH	int	,
    DECEASED_DEATH_TYPE	varchar(40)	,
    DECEASED_DOMICILE	varchar(60)	,
    DECEASED_DOMICILE_IN_WELSH	varchar(10)	,
    DECEASED_DOMICILE_WELSH	varchar(60)	,
    DECEASED_HONOURS	varchar(100)	,
    DECEASED_SEX	varchar(1)	,
    DECEASED_TITLE	varchar(35)	,
    APP_ADMIN_CLAUSE_LIMITATION	varchar(100)	,
    APP_ADMIN_CLAUSE_LIMITN_WELSH 	varchar(100)	,
    APP_CASE_TYPE	varchar(20)	,
    APP_EXECUTOR_LIMITATION 	varchar(100)	,
    APP_EXECUTOR_LIMITATION_WELSH 	varchar(100)	,
    APP_RECEIVED_DATE	date	,
    APPLICANT_ADDRESS 	varchar(500)	,
    APPLICANT_DX_EXCHANGE 	varchar(25)	,
    APPLICANT_DX_NUMBER 	varchar(10)	,
    APPLICANT_FORENAMES 	varchar(50)	,
    APPLICANT_HONOURS	varchar(100)	,
    APPLICANT_SURNAME 	varchar(50)	,
    APPLICANT_TITLE	varchar(35)	,
    GRANT_WELSH_LANGUAGE_IND 	boolean	,
    GRANT_WILL_TYPE 	varchar(200)	,
    GRANT_WILL_TYPE_WELSH	varchar(200)	,
    EXCEPTED_ESTATE_IND varchar(1),
    FILESLIP_SIGNAL boolean,
    GRANT_APPLICANT_TYPE varchar(1),
    GRANT_CONFIRMED_DATE date,
    GRANT_ISSUED_DATE date,
    GRANT_ISSUED_SIGNAL boolean,
    GRANT_LIMITATION varchar(800),
    GRANT_LIMITATION_WELSH varchar(800),
    GRANT_POWER_RESERVED varchar(1),
    GRANT_SOL_ID varchar(10),
    GRANT_TYPE varchar(3),
    GRANT_VERSION_DATE date,
    GRANTEE1_ADDRESS 	varchar(500)	,
    GRANTEE1_FORENAMES 	varchar(50)	,
    GRANTEE1_HONOURS 	varchar(100)	,
    GRANTEE1_SURNAME 	varchar(50)	,
    GRANTEE1_TITLE 	varchar(35)	,
    GRANTEE2_ADDRESS 	varchar(500)	,
    GRANTEE2_FORENAMES 	varchar(50)	,
    GRANTEE2_HONOURS 	varchar(100)	,
    GRANTEE2_SURNAME 	varchar(50)	,
    GRANTEE2_TITLE 	varchar(35)	,
    GRANTEE3_ADDRESS 	varchar(500)	,
    GRANTEE3_FORENAMES 	varchar(50)	,
    GRANTEE3_HONOURS 	varchar(100)	,
    GRANTEE3_SURNAME 	varchar(50)	,
    GRANTEE3_TITLE 	varchar(35)	,
    GRANTEE4_ADDRESS 	varchar(500)	,
    GRANTEE4_FORENAMES 	varchar(50)	,
    GRANTEE4_HONOURS 	varchar(100)	,
    GRANTEE4_SURNAME 	varchar(50)	,
    GRANTEE4_TITLE 	varchar(35)	,
    GROSS_ESTATE_VALUE	bigint	,
    NET_ESTATE_VALUE 	bigint	,
    PLACE_OF_ORIGINAL_GRANT 	varchar(60)	,
    PLACE_OF_ORIGINAL_GRANT_WELSH varchar(60),
    POWER_RESERVED_WELSH	varchar(1)	,
    RESEAL_DATE	date	,
    SOLICITOR_REFERENCE	varchar(30)
    );

    CREATE TABLE GRANT_APPLICATIONS_DERIVED_FLAT
    (
    PROBATE_NUMBER   	varchar(11)	,
    PROBATE_VERSION 	int	,
    DECEASED_ID          	bigint,
    DECEASED_FORENAMES	varchar(50)	,
    DECEASED_SURNAME	varchar(50)	,
    DATE_OF_BIRTH	date	,
    DATE_OF_DEATH1	date	,
    DECEASED_ADDRESS	varchar(500)	,
    DECEASED_TEXT	varchar(32000)	,
    ALIAS_NAMES	varchar(32000)	,
    GRANT_APPLICATION_TEXT	varchar(32000)	,
    APPLICATION_EVENT_TEXT	varchar(32000)	,
    OATH_TEXT 	varchar(32000)	,
    EXECUTOR_TEXT	varchar(32000)	,
    OTHER_INFORMATION_TEXT 	varchar(32000)	,
    LINKED_DECEASED_IDS	varchar(32000)	,
    CCD_CASE_NO	varchar(20)	,
    ID	bigint	,
    DNM_IND	varchar(1)	,
    DECEASED_AGE_AT_DEATH	int	,
    DECEASED_DEATH_TYPE	varchar(40)	,
    DECEASED_DOMICILE	varchar(60)	,
    DECEASED_DOMICILE_IN_WELSH	varchar(10)	,
    DECEASED_DOMICILE_WELSH	varchar(60)	,
    DECEASED_HONOURS	varchar(100)	,
    DECEASED_SEX	varchar(1)	,
    DECEASED_TITLE	varchar(35)	,
    APP_ADMIN_CLAUSE_LIMITATION	varchar(100)	,
    APP_ADMIN_CLAUSE_LIMITN_WELSH 	varchar(100)	,
    APP_CASE_TYPE	varchar(20)	,
    APP_EXECUTOR_LIMITATION 	varchar(100)	,
    APP_EXECUTOR_LIMITATION_WELSH 	varchar(100)	,
    APP_RECEIVED_DATE	date	,
    APPLICANT_ADDRESS 	varchar(500)	,
    APPLICANT_DX_EXCHANGE 	varchar(25)	,
    APPLICANT_DX_NUMBER 	varchar(10)	,
    APPLICANT_FORENAMES 	varchar(50)	,
    APPLICANT_HONOURS	varchar(100)	,
    APPLICANT_SURNAME 	varchar(50)	,
    APPLICANT_TITLE	varchar(35)	,
    GRANT_WELSH_LANGUAGE_IND 	boolean	,
    GRANT_WILL_TYPE 	varchar(200)	,
    GRANT_WILL_TYPE_WELSH	varchar(200)	,
    EXCEPTED_ESTATE_IND varchar(1),
    FILESLIP_SIGNAL boolean,
    GRANT_APPLICANT_TYPE varchar(1),
    GRANT_CONFIRMED_DATE date,
    GRANT_ISSUED_DATE date,
    GRANT_ISSUED_SIGNAL boolean,
    GRANT_LIMITATION varchar(800),
    GRANT_LIMITATION_WELSH varchar(800),
    GRANT_POWER_RESERVED varchar(1),
    GRANT_SOL_ID varchar(10),
    GRANT_TYPE varchar(3),
    GRANT_VERSION_DATE date,
    GRANTEE1_ADDRESS 	varchar(500)	,
    GRANTEE1_FORENAMES 	varchar(50)	,
    GRANTEE1_HONOURS 	varchar(100)	,
    GRANTEE1_SURNAME 	varchar(50)	,
    GRANTEE1_TITLE 	varchar(35)	,
    GRANTEE2_ADDRESS 	varchar(500)	,
    GRANTEE2_FORENAMES 	varchar(50)	,
    GRANTEE2_HONOURS 	varchar(100)	,
    GRANTEE2_SURNAME 	varchar(50)	,
    GRANTEE2_TITLE 	varchar(35)	,
    GRANTEE3_ADDRESS 	varchar(500)	,
    GRANTEE3_FORENAMES 	varchar(50)	,
    GRANTEE3_HONOURS 	varchar(100)	,
    GRANTEE3_SURNAME 	varchar(50)	,
    GRANTEE3_TITLE 	varchar(35)	,
    GRANTEE4_ADDRESS 	varchar(500)	,
    GRANTEE4_FORENAMES 	varchar(50)	,
    GRANTEE4_HONOURS 	varchar(100)	,
    GRANTEE4_SURNAME 	varchar(50)	,
    GRANTEE4_TITLE 	varchar(35)	,
    GROSS_ESTATE_VALUE	bigint	,
    NET_ESTATE_VALUE 	bigint	,
    PLACE_OF_ORIGINAL_GRANT 	varchar(60)	,
    PLACE_OF_ORIGINAL_GRANT_WELSH varchar(60),
    POWER_RESERVED_WELSH	varchar(1)	,
    RESEAL_DATE	date	,
    SOLICITOR_REFERENCE	varchar(30)
    );

EOSQL