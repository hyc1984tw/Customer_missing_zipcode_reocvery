/* Create Tawian Member Table, Making aggregation on gender, member_age, member_age_group, member_district

cdp2.taiwan_cdp_all_customer is the raw data from REDSHIFT.
cdp3.taiwan_cdp_all_customer is the cleaned data from cdp2.taiwan_cdp_all_customer.

Note1: Person_ID in cdp3.taiwan_cdp_all_customer IS PRIMARY KEY, but loyalty_card_num IS NOT a PRIMARY KEY.
Note2: In order to make automatically update on this tw_member table, scheduled quries needs to make periodically (quries as the code below) */

-----------------------------------------------------------------------------------------------------------------------------------

Create or replace view `mldata-8nkm.cdp_mltable.tw_member` as

-- T1: Create member_age from aggregating birthday data & filter out those withoutloyalty_card_number.

WITH T1 AS (
SELECT 
person_id,
loyalty_card_num,
email_md5 as email_encrypt,
loyalty_card_creation_date as member_create_date,
num_tiers_habituel as member_usual_store,
IF (gender_id = 0, 'M', 'F') as member_gender,
IF((EXTRACT(DAYOFYEAR FROM CURRENT_DATE()) < EXTRACT(DAYOFYEAR FROM birthdate)),
DATE_DIFF(current_date(), date(birthdate), year) -1, 
DATE_DIFF(current_date(), date(birthdate), year)) as member_age,
code_postal as zip_code
FROM `mldata-8nkm.cdp3.taiwan_cdp_all_customer`
WHERE loyalty_card_num != ''),

-- T2: Create member_age_group from aggregating member_age data

T2 AS (
SELECT 
person_id,
loyalty_card_num, 
email_encrypt,
member_create_date,
member_gender, member_age, member_usual_store, zip_code,
CASE 
WHEN member_age >= 0 and member_age <= 17 THEN '0-17'
WHEN member_age >= 18 and member_age <= 34 THEN '18-34'
WHEN member_age >= 35 and member_age <= 44 THEN '35-44'
WHEN member_age >= 45 and member_age <= 54 THEN '45-54'
WHEN member_age >= 55 and member_age <= 64 THEN '55-64'
WHEN member_age >= 65 THEN '65_above'
ELSE 'unknown' 
END AS member_age_group
FROM T1),

-- T3: Create temp table with taiwan city, district, zipcode data in T3

T3 AS (
SELECT DISTINCT city, district, city_district, zip_code
FROM `mldata-8nkm.tw_geo.108_tw_zipcode_population`),

-- T4: Join T2 & T3 to create member_city, member_district, member_city_district data into member table

T4 AS (
SELECT 
cast(person_id as string) person_id,
loyalty_card_num, 
email_encrypt,
member_create_date,
member_gender, member_age, member_age_group, member_usual_store, T2.zip_code,
city as member_city, district as member_district, city_district as member_city_district
FROM T2
LEFT JOIN T3
ON T2.zip_code = T3.zip_code),

-- Create temp table with member optin sport, review & event data in T5

T5 AS (
SELECT person_id, optin_sport as member_optin_sport, optin_review as member_optin_review, optin_event as member_optin_event
FROM `mldata-8nkm.cdp3.taiwan_cdp_optin`),

-- Join T4 & T5 to accomplish the entire taiwan_member_table
T6 AS (
SELECT 
T4.person_id,
loyalty_card_num, 
email_encrypt,
cast(member_create_date as datetime) member_create_date,
member_gender, cast(member_age as FLOAT64) member_age, member_age_group, member_optin_sport, member_optin_review, member_optin_event, cast(member_usual_store as string) member_usual_store, zip_code,
member_city, member_district, member_city_district
FROM T4
LEFT JOIN T5
ON T4.person_id = T5.person_id),

-- Making partition on loyalty_card_num in order to make it a primary key as loyalty_card_num is not a primary key
T7 AS (
Select
row_number() over (partition by loyalty_card_num order by member_create_date desc) as rank, loyalty_card_num, person_id, email_encrypt, member_create_date, member_gender, member_age, member_age_group, member_optin_sport, member_optin_review, member_optin_event, member_usual_store, zip_code,
member_city, member_district, member_city_district
FROM T6)

Select 
 loyalty_card_num, person_id, email_encrypt, member_create_date, member_gender, member_age, member_age_group, member_optin_sport, member_optin_review, member_optin_event, member_usual_store, zip_code,
member_city, member_district, member_city_district
FROM T7
WHERE rank = 1



