{{ config(
    schema= 'STAGE'
    ,database= 'DBT_TRAINING_MR') }}
    

SELECT * FROM {{ source('RAW', 'V_LINEITEM') }}