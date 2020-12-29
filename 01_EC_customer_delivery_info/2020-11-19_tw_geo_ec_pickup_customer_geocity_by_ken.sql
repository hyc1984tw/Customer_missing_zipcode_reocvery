create or replace table `mldata-8nkm.tw_geo.ec_pickup_customer_geocity` as

With T1 AS (
select transaction_id, address_type, address_city_district, delivery_method, store_add, substr(address_city_district, 1, 3) as store_city
from `mldata-8nkm.tw_geo.ec_pickup_delivery_all`
WHERE address_type != 'RetailStore' and store_add is not null),
T2 AS (
SELECT the_transaction_id, ctm_customer_id, the_to_type
FROM `mldata-8nkm.cdp2.taiwan_cdp_transaction_detail_current`
WHERE the_to_type = 'online' ),
T3 AS (
Select transaction_id, ctm_customer_id, address_type, address_city_district, delivery_method, store_add, store_city
From T1
LEFT JOIN T2
ON T1.transaction_id = T2.the_transaction_id),
T4 AS (select 
row_number() over (partition by ctm_customer_id order by transaction_id desc) as rank, ctm_customer_id, store_city, address_city_district
from T3)
Select ctm_customer_id, store_city as ec_city_prediction, address_city_district as ec_city_district_prediction
from T4
where rank = 1
