CREATE OR REPLACE TABLE `mldata-8nkm.zipcode_ken.zipcode_final_all` as

    (SELECT *        
     FROM (        
             SELECT cast(loyalty_card_num as string) as loyalty_card_num, 
                    row_number() over (partition by cast(loyalty_card_num as string) order by tables.score desc) as score, 
                    tables.value as value
             FROM `mldata-8nkm.prediction_part2_taiwan_zipc_20191016054507_2020_10_05T19_34_49_212Z.predictions` ,  --kp
             UNNEST(predicted_member_district_origin) )
     WHERE   score =1)        
    
    
     UNION DISTINCT
    
    
    (SELECT *        
     FROM (        
             SELECT cast(loyalty_card_num as string) as loyalty_card_num, 
                    row_number() over (partition by cast(loyalty_card_num as string) order by tables.score desc) as score, 
                    tables.value as value
             FROM `mldata-8nkm.prediction_part2_taiwan_zipc_20191016054256_2020_10_05T19_31_05_410Z.predictions` ,  --tcm
             UNNEST(predicted_member_district_origin) )
     WHERE   score =1)     
     
     
     UNION DISTINCT
    
    
    (SELECT *        
     FROM (        
             SELECT cast(loyalty_card_num as string) as loyalty_card_num, 
                    row_number() over (partition by cast(loyalty_card_num as string) order by tables.score desc) as score, 
                    tables.value as value
             FROM `mldata-8nkm.prediction_part2_taiwan_zipc_20191015110416_2020_10_05T19_28_26_113Z.predictions` ,  --ppk
             UNNEST(predicted_member_district_origin) )
     WHERE   score =1)    
     
     
     UNION DISTINCT
    
    
    (SELECT *        
     FROM (        
             SELECT cast(loyalty_card_num as string) as loyalty_card_num, 
                    row_number() over (partition by cast(loyalty_card_num as string) order by tables.score desc) as score, 
                    tables.value as value
             FROM `mldata-8nkm.prediction_part2_taiwan_zipc_20191015110349_2020_10_05T19_33_29_412Z.predictions` ,  --ycn
             UNNEST(predicted_member_district_origin) )
     WHERE   score =1) 
     
     
     UNION DISTINCT
    
    
    (SELECT *        
     FROM (        
             SELECT cast(loyalty_card_num as string) as loyalty_card_num, 
                    row_number() over (partition by cast(loyalty_card_num as string) order by tables.score desc) as score, 
                    tables.value as value
             FROM `mldata-8nkm.prediction_part2_taiwan_zipc_20191015110154_2020_10_05T19_35_45_115Z.predictions` ,  --iht
             UNNEST(predicted_member_district_origin) )
     WHERE   score =1) 
     
     
     UNION DISTINCT
    
    
    (SELECT *        
     FROM (        
             SELECT cast(loyalty_card_num as string) as loyalty_card_num, 
                    row_number() over (partition by cast(loyalty_card_num as string) order by tables.score desc) as score, 
                    tables.value as value
             FROM `mldata-8nkm.prediction_part2_taiwan_zipc_20191015102242_2020_10_05T19_32_25_017Z.predictions` ,  --cct
             UNNEST(predicted_member_district_origin) )
     WHERE   score =1) 
