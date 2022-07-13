{{ config(
    schema= 'PUBLISH'
    ,database = 'DBT_TRAINING_MR'
    ,materialized= 'table'
)}}

select 
    C_CUSTKEY
   ,C_NAME
   ,C_ADDRESS
   ,C_PHONE
   ,C_ACCTBAL
   ,O_ORDERKEY
   ,O_ORDERSTATUS
   ,O_TOTALPRICE
   ,O_ORDERDATE
   ,O_ORDERPRIORITY
   ,O_SHIPPRIORITY
   ,O_CLERK
from {{ ref('customer') }} c
    -- "DBT_TRAINING_MR"."STAGE"."CUSTOMER" c 
    left join {{ ref('orders') }} o
   -- "DBT_TRAINING_MR"."STAGE"."ORDERS" o 
        on c.c_custkey = o.o_custkey
order by
    C_CUSTKEY