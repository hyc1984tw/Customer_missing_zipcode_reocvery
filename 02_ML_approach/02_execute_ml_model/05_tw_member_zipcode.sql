CREATE OR REPLACE TABLE `mldata-8nkm.zipcode_ken.tw_member_ml_zipcode` AS

With table_1 AS (
SELECT
  person_id,
  t1.loyalty_card_num,
  email_encrypt,
  member_create_date,
  member_gender,
  member_age,
  member_age_group,
  member_optin_sport,
  member_optin_review,
  member_optin_event,
  member_usual_store,
  member_district,
  (t2.value) AS zip_predict,
  substr(t2.value, 1, 3) as zipcode_predict,
  member_city
FROM
  `mldata-8nkm.cdp_mltable.tw_member` AS T1
LEFT JOIN
  `mldata-8nkm.zipcode_ken.zipcode_final_all` AS t2
ON
  t1.loyalty_card_num = t2.loyalty_card_num),
  
table_2 AS (
SELECT DISTINCT city, district, city_district, zip_code
FROM `mldata-8nkm.cdp3.108_tw_zipcode_population`)

Select
  person_id,
  loyalty_card_num,
  email_encrypt,
  member_create_date,
  member_gender,
  member_age,
  member_age_group,
  member_optin_sport,
  member_optin_review,
  member_optin_event,
  member_usual_store,
  member_city,
  member_district,
  table_2.city as member_city_predict,
  table_2.district as member_district_predict,
  CASE 
  WHEN table_1.member_city is not null THEN table_1.member_city
  WHEN table_1.member_city is null THEN table_2.city
  ELSE null
  END AS member_city_all,
  CASE 
  WHEN table_1.member_district is not null THEN table_1.member_district
  WHEN table_1.member_district is null THEN table_2.district
  ELSE null
  END AS member_district_all
from table_1
LEFT JOIN table_2
ON table_1.zipcode_predict = table_2.zip_code
