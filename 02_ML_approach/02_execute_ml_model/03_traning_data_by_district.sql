-- PPK (北北基)

create OR REPLACE TABLE `mldata-8nkm.zipcode_ken.pridict_all_ppk` AS
SELECT * 
FROM `mldata-8nkm.zipcode_ken.predict_all_01` 
WHERE value = "PPK";


-- TCM (桃竹苗)

create OR REPLACE TABLE `mldata-8nkm.zipcode_ken.pridict_all_tcm` AS
SELECT * 
FROM `mldata-8nkm.zipcode_ken.predict_all_01` 
WHERE value = "TCM";


-- CCT (中彰投)

create OR REPLACE TABLE `mldata-8nkm.zipcode_ken.pridict_all_cct` AS
SELECT * 
FROM `mldata-8nkm.zipcode_ken.predict_all_01` 
WHERE value = "CCT";



-- YCN (雲嘉南)

create OR REPLACE TABLE `mldata-8nkm.zipcode_ken.pridict_all_ycn` AS
SELECT * 
FROM `mldata-8nkm.zipcode_ken.predict_all_01` 
WHERE value = "YCN";


-- KP (高屏)

create OR REPLACE TABLE `mldata-8nkm.zipcode_ken.pridict_all_kp` AS
SELECT * 
FROM `mldata-8nkm.zipcode_ken.predict_all_01` 
WHERE value = "KP";


-- IHT (宜花東)

create OR REPLACE TABLE `mldata-8nkm.zipcode_ken.pridict_all_iht` AS
SELECT * 
FROM `mldata-8nkm.zipcode_ken.predict_all_01` 
WHERE value = "IHT";


-- others (其他) -- table will be empty  -- not gonna commit

--create OR REPLACE TABLE `mldata-8nkm.zipcode_ken.pridict_all_others` AS
--SELECT * 
--FROM `mldata-8nkm.zipcode_ken.predict_all_01` 
--WHERE value = "others";  
