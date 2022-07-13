{{ config(
    schema= 'STAGE'
    ,database= 'DBT_TRAINING_MR'
    ,materialized='incremental',
    unique_key='O_ORDERKEY',
    incremental_strategy='merge') }}

/*
config will overwrite the writing location from dbt_project
*/

SELECT * FROM {{ source('RAW', 'V_ORDERS') }}

{% if is_incremental() %}
where INSERTED_DATE > (select max(INSERTED_DATE) from {{ this }})
{% endif %}