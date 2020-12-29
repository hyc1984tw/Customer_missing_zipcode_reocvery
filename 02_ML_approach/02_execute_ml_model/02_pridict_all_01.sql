Create OR replace TABLE `mldata-8nkm.zipcode_ken.predict_all_01` AS

SELECT  
      tb1.loyalty_card_num, 
      member_age_group, member_gender, 
      f_666, 
      f_871, 
      f_926, 
      f_928, 
      f_957, 
      f_988, 
      f_1222, 
      f_1223, 
      f_1229,
      f_1292, 
      f_1633, 
      f_1639, 
      f_1681, 
      f_922, 
      ab_666, 
      ab_871, 
      ab_926, 
      ab_928, 
      ab_957, 
      ab_988, 
      ab_1222, 
      ab_1223, 
      ab_1229, 
      ab_1292, 
      ab_1633, 
      ab_1639, 
      ab_1681, 
      ab_922, 
      f_weekday, 
      f_weekend,
      value
FROM  `mldata-8nkm.zipcode_ken.taiwan_zipcode_ept2`   AS tb1
LEFT JOIN  
    (SELECT  loyalty_card_num, 
           value
    FROM    (
             SELECT loyalty_card_num, 
                    row_number() over (partition by loyalty_card_num order by tables.score desc) as score, 
                    tables.value as value
             FROM `mldata-8nkm.prediction_part2_taiwan_zipc_20191014051757_2020_09_29T22_24_15_110Z.predictions` ,
             UNNEST(predicted_member_district_region) 
             )
      WHERE   score =1)  AS tb2 
ON   tb1.loyalty_card_num = tb2.loyalty_card_num
