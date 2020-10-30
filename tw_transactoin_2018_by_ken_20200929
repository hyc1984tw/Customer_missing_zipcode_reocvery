/* 
Create Tawian transacton Table. Join Transaction Table and Sport Product Table.

Note1: sku_idr_sku in taiwan_cdp_transaction_detail_current & taiwan_cdp_sport_product are not primary key. Therefore, it is necessary to clean repeated data by scheduled queries.
Note2: In order to make automatically update on this tw_transaction table, scheduled quries needs to make periodically (quries as the code below) 

*/

---------------------------------------------------------------------------------------------------------------------

Create or replace table `mldata-8nkm.cdp_mltable.tw_transaction_2018` as

WITH T1 AS(
SELECT the_transaction_id, tdt_num_line, ctm_customer_id, tdt_date_event, but_num_business_unit, the_to_type, f_qty_item, f_to_tax_in, sku_idr_sku
FROM `mldata-8nkm.cdp2.taiwan_cdp_transaction_detail_2018`),

T2 AS (
SELECT model_code_r3, web_label, brand_name, unv_num_univers, dpt_num_department, sdp_num_sub_department, fam_num_family, category_label, CAST(sku_idr_sku as STRING) as sku_idr_sku
FROM `mldata-8nkm.cdp3.taiwan_cdp_sport_product`)

SELECT cast(tdt_date_event as timestamp) tdt_date_event, the_transaction_id, tdt_num_line, model_code_r3, web_label, brand_name, ctm_customer_id, cast(but_num_business_unit as string) as but_num_business_unit, the_to_type, f_to_tax_in, unv_num_univers, dpt_num_department, sdp_num_sub_department, fam_num_family, category_label
FROM T1
LEFT JOIN T2
ON T1.sku_idr_sku = T2.sku_idr_sku 
