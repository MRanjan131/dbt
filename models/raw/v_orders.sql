{{ config(
    schema= 'RAW'
    ,database= 'DBT_TRAINING_MR'
    ,materialized= 'view') }}

SELECT * FROM "DBT_TRAINING_MR"."RAW"."ORDERS"