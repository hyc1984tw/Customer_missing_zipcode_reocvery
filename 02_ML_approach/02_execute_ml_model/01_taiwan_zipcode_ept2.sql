Create OR REPLACE TABLE `mldata-8nkm.zipcode_ken.taiwan_zipcode_ept2`AS

SELECT 
      loyalty_card_num,
      member_age_group,
      member_gender,
     COUNT( DISTINCT CASE WHEN store = '666' THEN the_transaction_id ELSE NULL END)  AS f_666,
     COUNT( DISTINCT CASE WHEN store = '871' THEN the_transaction_id ELSE NULL END)  AS f_871,
     COUNT( DISTINCT CASE WHEN store = '926' THEN the_transaction_id ELSE NULL END)  AS f_926,
     COUNT( DISTINCT CASE WHEN store = '928' THEN the_transaction_id ELSE NULL END)  AS f_928,
     COUNT( DISTINCT CASE WHEN store = '957' THEN the_transaction_id ELSE NULL END)  AS f_957,
     COUNT( DISTINCT CASE WHEN store = '988' THEN the_transaction_id ELSE NULL END)  AS f_988,
     COUNT( DISTINCT CASE WHEN store = '1222' THEN the_transaction_id ELSE NULL END)  AS f_1222,
     COUNT( DISTINCT CASE WHEN store = '1223' THEN the_transaction_id ELSE NULL END)  AS f_1223,
     COUNT( DISTINCT CASE WHEN store = '1229' THEN the_transaction_id ELSE NULL END)  AS f_1229,
     COUNT( DISTINCT CASE WHEN store = '1292' THEN the_transaction_id ELSE NULL END)  AS f_1292,
     COUNT( DISTINCT CASE WHEN store = '1633' THEN the_transaction_id ELSE NULL END)  AS f_1633,
     COUNT( DISTINCT CASE WHEN store = '1639' THEN the_transaction_id ELSE NULL END)  AS f_1639,
     COUNT( DISTINCT CASE WHEN store = '1681' THEN the_transaction_id ELSE NULL END)  AS f_1681,
     COUNT( DISTINCT CASE WHEN store = '922' THEN the_transaction_id ELSE NULL END)  AS f_922,
 
 
    (round(SUM(CASE WHEN store = '666' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '666' THEN the_transaction_id ELSE NULL END))) AS ab_666,
    (round(SUM(CASE WHEN store = '871' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '871' THEN the_transaction_id ELSE NULL END))) AS ab_871,
    (round(SUM(CASE WHEN store = '926' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '926' THEN the_transaction_id ELSE NULL END))) AS ab_926,
    (round(SUM(CASE WHEN store = '928' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '928' THEN the_transaction_id ELSE NULL END))) AS ab_928,
    (round(SUM(CASE WHEN store = '957' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '957' THEN the_transaction_id ELSE NULL END))) AS ab_957,
    (round(SUM(CASE WHEN store = '988' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '988' THEN the_transaction_id ELSE NULL END))) AS ab_988,
    (round(SUM(CASE WHEN store = '1222' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '1222' THEN the_transaction_id ELSE NULL END))) AS ab_1222,
    (round(SUM(CASE WHEN store = '1223' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '1223' THEN the_transaction_id ELSE NULL END))) AS ab_1223,
    (round(SUM(CASE WHEN store = '1229' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '1229' THEN the_transaction_id ELSE NULL END))) AS ab_1229,
    (round(SUM(CASE WHEN store = '1292' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '1292' THEN the_transaction_id ELSE NULL END))) AS ab_1292,
    (round(SUM(CASE WHEN store = '1633' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '1633' THEN the_transaction_id ELSE NULL END))) AS ab_1633,
    (round(SUM(CASE WHEN store = '1639' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '1639' THEN the_transaction_id ELSE NULL END))) AS ab_1639,
    (round(SUM(CASE WHEN store = '1681' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '1681' THEN the_transaction_id ELSE NULL END))) AS ab_1681,
    (round(SUM(CASE WHEN store = '922' THEN product_turnover ELSE NULL END)/COUNT(DISTINCT CASE WHEN store = '922' THEN the_transaction_id ELSE NULL END))) AS ab_922,
 
 
    count( distinct case when EXTRACT(DAYOFWEEK from tdt_date_event) in (2,3,4,5,6) then the_transaction_id else NULL end) as f_weekday,
    count( distinct case when EXTRACT(DAYOFWEEK from tdt_date_event) in (1,7) then the_transaction_id else NULL end) as f_weekend

     
FROM `mldata-8nkm.cdp_mltable.tw_transaction_member_all` 
WHERE member_district = ''
GROUP BY loyalty_card_num,member_district, member_age_group, member_gender;
