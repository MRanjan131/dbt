{{ config(
    schema= 'STAGE'
    ,database= 'DBT_TRAINING_MR') }}

/*
config will overwrite the writing location from dbt_project
*/

SELECT * FROM {{ source('RAW', 'V_ORDERS') }}