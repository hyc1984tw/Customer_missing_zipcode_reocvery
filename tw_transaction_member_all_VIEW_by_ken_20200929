/*
Join tw_member and tw_transaction tables and exclude online transaction data and loyalty_card_number null data.
*/

-------------------------------------------------------------------------------------------------------------

Create or replace view `mldata-8nkm.cdp_mltable.tw_transaction_member_all` as

SELECT
loyalty_card_num,
member_age_group,
member_gender,
but_num_business_unit as store,
the_transaction_id,
f_to_tax_in as Product_turnover,
tdt_date_event,
member_district 
FROM `mldata-8nkm.cdp_mltable.tw_transaction` as T1
LEFT JOIN `mldata-8nkm.cdp_mltable.tw_member` as T2
ON T1. ctm_customer_id = T2. loyalty_card_num
WHERE the_to_type = 'offline' and
loyalty_card_num is not null


