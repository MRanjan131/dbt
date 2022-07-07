{{ config(
    schema= 'STAGE'
    ,database= 'DBT_TRAINING_MR') }}
    

SELECT * FROM "DBT_TRAINING_MR"."RAW"."ORDERS"